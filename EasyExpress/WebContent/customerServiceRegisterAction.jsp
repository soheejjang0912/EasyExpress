<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="UTF-8"%>
<%@ page import="customerService.CustomerServiceDAO" %>
<%@ page import="customerService.CustomerServiceDTO" %>
<%@ page import="util.SHA256" %>
<%@ page import="java.io.PrintWriter" %>

<% 
	request.setCharacterEncoding("UTF-8");
 
	String csUserID = null;
	String csUserName = null;
	int csUserTell = 0;
	String csUserEmail = null;
	String csDepartment = null;
	String csContents = null; 
	
	if(request.getParameter("csUserID") != ""){
		csUserID = request.getParameter("csUserID"); 
	}
	if(request.getParameter("csUserName") != ""){
		csUserName = request.getParameter("csUserName");
	}
	if(request.getParameter("csUserTell") != ""){
		try{
			csUserTell = Integer.parseInt(request.getParameter("csUserTell"));
		}catch(Exception e){
			System.out.println("전화번호 저장 오류");
		} 
	}  
	if(request.getParameter("csUserEmail") != ""){
		csUserEmail = request.getParameter("csUserEmail");
	}
	if(request.getParameter("csDepartment") != ""){
		csDepartment = request.getParameter("csDepartment");
	}
	if(request.getParameter("csContents") != ""){
		csContents = request.getParameter("csContents");
	}
	if(csUserName == null || csUserTell == 0 || csUserEmail == null || csDepartment == null || csContents == null){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('입력이 안 된 사항이 있습니다.');");
		script.println("history.back();");
		script.println("</script>");
		script.close();
		return;
	}
	CustomerServiceDAO csDAO = new CustomerServiceDAO();
	int result = csDAO.csregister
			(new CustomerServiceDTO(0, csUserID, csUserName, csUserTell, csUserEmail, csDepartment, csContents, ""));
	 
	if(result == -1){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('데이터 베이스 저장에 실패하였습니다.');");
		script.println("history.back();");
		script.println("</script>");
		script.close();
		return;
	} else{ 
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("location.href = 'index.jsp'"); 
		script.println("alert('신청이 완료되었습니다.');");
		script.println("</script>");
		script.close();
		return; 
	}
%>