<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="UTF-8"%>
<%@ page import="express.ExpressDAO" %>
<%@ page import="express.ExpressDTO" %>
<%@ page import="util.SHA256" %>
<%@ page import="java.io.PrintWriter" %>

<%
	request.setCharacterEncoding("UTF-8"); 
	String resExpClear = null;
	String resExpClearIrr = null; 
	
	if(request.getParameter("resExpClear") != ""){
		resExpClear = request.getParameter("resExpClear"); 
	}
	if(request.getParameter("resExpClearIrr") != ""){
		resExpClearIrr = request.getParameter("resExpClearIrr"); 
	}
	if(resExpClear == null){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('입력이 안 된 사항이 있습니다.');");
		script.println("history.back();");
		script.println("</script>");
		script.close();
		return;
	}
	  
	int resID = 0;  
	if (request.getParameter("resID")!=null){
		resID = Integer.parseInt(request.getParameter("resID")); 
	}else{
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('오류');");
		script.println("history.back();");
		script.println("</script>");
		script.close();
	}  
	
	ExpressDAO expressDAO = new ExpressDAO(); 
	int result = expressDAO.expClearRegister(resID, resExpClear, resExpClearIrr);
	
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