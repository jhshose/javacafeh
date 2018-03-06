package jdbc;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class EmpServlet DB에 저장되어있는것 보기
 */
@WebServlet("/goods/GoodsServlet")
public class GoodsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// 내장 객체
		ServletContext application = request.getServletContext();
		HttpSession session = request.getSession();
		PrintWriter out = response.getWriter();

		// 인코딩
		//response.setContentType("text/html; charset=UTF-8");
		//response.setCharacterEncoding("utf-8");

		request.setCharacterEncoding("utf-8");
		GoodsDAO goodsDAO = new GoodsDAO();
		
		
		// action에서 따라서 처리
		String action = request.getParameter("action");
		if (action == null) {
			out.println("action이 null입니다.");
		} else if (action.equals("selectOne")) {

		} else if (action.equals("selectAll")) {
			System.out.println("================"+goodsDAO.selectAll());
			request.setAttribute("datas", goodsDAO.selectAll());
			request.getRequestDispatcher("goodsList.jsp").forward(request, response);

		} else if (action.equals("insertForm")) {

		} else if (action.equals("insert")) {

		} else if (action.equals("updateForm")) {

		} else if (action.equals("update")) {

		} else if (action.equals("delete")) {

		} else {
			out.println("없는 action 입니다.");
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doGet(request, response);
	}

}
