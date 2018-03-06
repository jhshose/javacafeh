package bbs;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


/**
 * Servlet implementation class EmpServlet
 */
@WebServlet("/bbs/BBSServlet")
public class BBSServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
    public BBSServlet() {
        super();
      
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
				
		//응답페이지 인코딩
		response.setContentType("text/html; charset=UTF-8");
		response.setCharacterEncoding("utf-8");		
		
		//내장 객체
		ServletContext application = request.getServletContext();
		HttpSession session = request.getSession();
		PrintWriter out = response.getWriter();
			
		//인코딩
		response.setContentType("text/html; charset=UTF-8");
		response.setCharacterEncoding("utf-8");		
		request.setCharacterEncoding("utf-8");
						
		String action = request.getParameter("action");
    	if (action == null) { 
    	//throw new Exception("action null");
    	//print("action이 null입니다.");
    	
    	} else if(action.equals("list")) {
    		//데이터조회 (DAO)
    		List<BBS> datas = BBSDAO.selectAll();
    		request.setAttribute("datas", datas);
    		//뷰페이지로 포워드
			request.getRequestDispatcher("list.jsp").forward(request, response);
    	} else if(action.equals("insert")) {
    	 	//등록처리
    	 	if (BBSDAO.insert(bbs)) {
    	 	//목록으로 페이지 이동
    	 	response.sendRedirect("index.jsp?action=list");
    	 	} else {
    	 		out.print("<script>");
    	 		out.print("alert(등록 실패);");
    	 		out.print("history.go(-1);");
    	 		out.print("<script>");
    	 	}
    	} else if(action.equals("edit")) {
    		//수정할 데이터 한건 조회
    		bbs = BBSDAO.selectOne(bbs.getArticleNumber());
    		request.setAttribute("bbs", bbs); 
    		//수정폼으로 포워드
    		request.getRequestDispatcher("addrbook_edit_form.jsp").forward(request, response);
    	} else if(action.equals("update")) {
    		//수정 처리
    		if (BBSDAO.update(bbs.getArticleNumber())) {
    	
    		//목록으로 페이지 이동
    		response.sendRedirect("addrbook_control.jsp?action=list"); }
    	} else if(action.equals("delete")) {
    		//삭제 처리		
    		if (BBSDAO.delete(bbs.getArticleNumber())) {
    	
    		//목록으로 페이지 이동
    		response.sendRedirect("addrbook_control.jsp?action=list"); }
    	} else {
    		out.print("잘못 된 action 입니다.");
    	}     

		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
