<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="UTF-8"%> 
<%@ page import="util.SHA256" %>
<%@ page import="java.io.PrintWriter" %> 
<%@page import="customerService.CustomerServiceDAO"%>
<%@page import="customerService.CustomerServiceDTO"%> 

<%
	request.setCharacterEncoding("UTF-8"); 
	String csAnswer = null; 
	
	if(request.getParameter("csAnswer") != ""){
		csAnswer = request.getParameter("csAnswer"); 
	}
	if(csAnswer == null){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('입력이 안 된 사항이 있습니다.');");
		script.println("history.back();");
		script.println("</script>");
		script.close();
		return;
	}
	  
	int csID = 0;  
	if (request.getParameter("csID")!=null){
		csID = Integer.parseInt(request.getParameter("csID"));
	}else{
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('오류');");
		script.println("history.back();");
		script.println("</script>");
		script.close();
	}  
	
	CustomerServiceDAO csDAO = new CustomerServiceDAO(); 
	int result = csDAO.csAnswerRegister(csID, csAnswer);
	
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
		script.println("alert('신청이 완료되었습니다.');");
		script.println("location.href = 'index.jsp'");
		script.println("</script>");
		script.close();
		return; 
	}
%>