<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="UTF-8"%>
<%@ page import="express.ExpressDAO" %>
<%@ page import="express.ExpressDTO" %>
<%@ page import="util.SHA256" %>
<%@ page import="java.io.PrintWriter" %>

<%
	request.setCharacterEncoding("UTF-8"); 
	String resUserID = null;
	String resSendName = null;
	String resSendCountry = null;
	String resSendAdress = null;
	int resSendTel = 0;
	String resSendEmail = null;
	String resRecName = null;
	String resRecCountry = null;
	String resRecAdress = null;
	int resRecTel = 0;
	String resRecEmail = null; 
	String resLugType = null;
	String resLugName = null;
	int resLugWeight = 0; 
	
	if(request.getParameter("resUserID") != ""){
		resUserID = request.getParameter("resUserID");System.out.println(resUserID);
	}
	if(request.getParameter("resSendName") != ""){
		resSendName = request.getParameter("resSendName");System.out.println(resSendName);
	}
	if(request.getParameter("resSendCountry") != ""){
		resSendCountry = request.getParameter("resSendCountry");
	}
	if(request.getParameter("resSendAdress") != ""){
		resSendAdress = request.getParameter("resSendAdress");
	}
	if(request.getParameter("resSendTel") != ""){
		try{
			resSendTel = Integer.parseInt(request.getParameter("resSendTel"));
		}catch(Exception e){
			System.out.println("전화번호 저장 오류");
		} 
	} 
	if(request.getParameter("resSendEmail") != ""){
		resSendEmail = request.getParameter("resSendEmail");
	}
	if(request.getParameter("resRecName") != ""){
		resRecName = request.getParameter("resRecName");
	}
	if(request.getParameter("resRecCountry") != ""){
		resRecCountry = request.getParameter("resRecCountry");
	}
	if(request.getParameter("resRecAdress") != ""){
		resRecAdress = request.getParameter("resRecAdress");
	}
	if(request.getParameter("resRecTel") != ""){
		try{
			resRecTel = Integer.parseInt(request.getParameter("resRecTel"));
		}catch(Exception e){
			System.out.println("전화번호 저장 오류");
		} 
	}  
	if(request.getParameter("resRecEmail") != ""){
		resRecEmail = request.getParameter("resRecEmail");
	} 
	if(request.getParameter("resLugType") != ""){
		resLugType = request.getParameter("resLugType");
	}
	if(request.getParameter("resLugName") != ""){
		resLugName = request.getParameter("resLugName");
	}
	if(request.getParameter("resLugWeight") != ""){
		try{
			resLugWeight = Integer.parseInt(request.getParameter("resLugWeight"));
		}catch(Exception e){
			System.out.println("무게 저장 오류");
		} 
	}  
	if(resSendName == null || resSendCountry == null || resSendAdress == null || resSendTel == 0 ||
			resSendEmail == null || resRecName == null || resRecCountry == null || resRecAdress == null || 
			resRecTel == 0 || resRecEmail == null || resLugType == null || resLugName == null || resLugWeight ==0){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('입력이 안 된 사항이 있습니다.');");
		script.println("history.back();");
		script.println("</script>");
		script.close();
		return;
	}
	
	ExpressDAO expressDAO = new ExpressDAO();
	int result = expressDAO.register(new ExpressDTO(0, resUserID, null, resSendName, resSendCountry, resSendAdress, 
			resSendTel, resSendEmail, resRecName, resRecCountry, resRecAdress,
			resRecTel, resRecEmail, resLugType, resLugName, resLugWeight, null, null, null, null, null, null, null, null, null, null, null, null));
	  
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