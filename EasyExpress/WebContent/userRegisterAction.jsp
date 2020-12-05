<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="UTF-8"%>
<%@ page import="user.UserDTO" %>
<%@ page import="user.UserDAO" %>
<%@ page import="util.SHA256" %>
<%@ page import="java.io.PrintWriter" %>

<%
	request.setCharacterEncoding("UTF-8");
	String userID = null;
	if(session.getAttribute("userID") != null){
		userID = (String)session.getAttribute("userID");
	}
	String userPW = null;
	String userEmail = null;
	String userAdress = null;
	String userPhone = null;
	String userGender = null;
	String userBirthday = null;
	String userType = null;
	
	if(request.getParameter("userID") != ""){
		 userID = request.getParameter("userID");System.out.println(userID);
	}
	if(request.getParameter("userPW") != ""){
		userPW = request.getParameter("userPW");
	}
	if(request.getParameter("userType") != ""){
		userType = request.getParameter("userType");
	}
	if(request.getParameter("userEmail") != ""){
		userEmail = request.getParameter("userEmail");
	}
	if(userID == null || userPW == null || userEmail == null || userType == null){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('입력이 안 된 사항이 있습니다.');");
		script.println("history.back();");
		script.println("</script>");
		script.close();
		return;
	}
	
	UserDAO userDAO = new UserDAO();
	int result = userDAO.join(new UserDTO(userID, userPW, userType, userEmail, SHA256.getSHA256(userEmail), false));
	 
	if(result == -1){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('이미 존재하는 아이디 입니다..');");
		script.println("history.back();");
		script.println("</script>");
		script.close();
		return;
	} else{
		session.setAttribute("userID", userID);
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("location.href = 'emailSendAction.jsp'");
		script.println("</script>");
		script.close();
		return; 
	}
%>