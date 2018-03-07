<%@page import="java.util.ArrayList"%>
<%@page import="jdbc.MembersDO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	request.setCharacterEncoding("utf-8");
%>
<jsp:useBean id="usrdo" class="jdbc.MembersDO" />
<jsp:useBean id="usrdao" class="jdbc.MembersDAO" />
<jsp:setProperty name="usrdo" property="*" />

<%
	String action = request.getParameter("action");

	MembersDO userno = (MembersDO) session.getAttribute("userno");

	if (userno == null && action != null && !action.equals("login") && !action.equals("insert")) {
		response.sendRedirect("login.jsp");
	} else {
		if (action == null) {
			System.out.println("action===" + action);
			response.sendRedirect("index.jsp");

		} else if (action.equals("list")) {
			System.out.println("action===" + action);
			ArrayList<MembersDO> usrlist = usrdao.selectAll();
			request.setAttribute("usrdo", usrlist);
			pageContext.forward("userAll.jsp");

		} else if (action.equals("find")) {

		} else if (action.equals("cart")) {
			System.out.println("action===" + action);
			

		} else if (action.equals("search")) {
			System.out.println("action===" + action);
			MembersDO data = usrdao.selectOne(usrdo.getUser_no());
			request.setAttribute("usrdo", data);
			pageContext.forward("userSearch.jsp");

		} else if (action.equals("home")) {
			System.out.println("action===" + action);
			MembersDO newusr = usrdao.selectOne(usrdo.getUser_no());
			if (newusr.getUser_no() != null) {
				request.setAttribute("usrdo", newusr);
				pageContext.forward("home.jsp");
			} else {
				response.sendRedirect("home.jsp");
			}

		} else if (action.equals("login")) {
			System.out.println("action===" + action);
			MembersDO data = null;
			data = usrdao.login(usrdo.getUser_no(), usrdo.getPassword());
			if (data != null) {
				//session setting
				session.setAttribute("userno", data);
				MembersDO abc = (MembersDO) session.getAttribute("userno");
				response.sendRedirect("memberControl.jsp?action=home&user_no=" + usrdo.getUser_no());
			} else {
				response.sendRedirect("index.jsp");
			}

		} else if (action.equals("insert")) {
			System.out.println("action===" + action);
			if (usrdao.insert(usrdo)) {
				response.sendRedirect("memberControl.jsp?action=home&user_no=" + usrdo.getUser_no());
			} else {
				out.println("login.jsp");

			}

		} else if (action.equals("select")) {
			System.out.println("action===" + action);
			ArrayList<MembersDO> usrlist = usrdao.selectAll();
			request.setAttribute("usrdo", usrlist);

			pageContext.forward("userAll.jsp");

		} else if (action.equals("logout")) {
			System.out.println("action===" + action);
			session.invalidate();
			response.sendRedirect("../index.jsp");

		} else {
			System.out.println("action===" + action);
			out.println("error action.");
		}
	}
%>