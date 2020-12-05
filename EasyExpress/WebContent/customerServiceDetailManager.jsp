<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %> 
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.net.URLEncoder" %> 
<%@page import="customerService.CustomerServiceDAO"%>
<%@page import="customerService.CustomerServiceDTO"%> 

<%@include file="header.jsp" %>
   <!--    start contact page content-->
   <section class="contact-page-area">
       <div class="container">
           <div class="row">
               <div class="col-sm-10 col-sm-offset-1">
                   <div class="contact-form">
                       <h1 class="contact_page_headings">문의내역</h1>
                       <body>
                       	
							<%
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
							CustomerServiceDTO cs = new CustomerServiceDAO().getCsDetail(csID); 
						  %>
	                       <table border="1" bordercolor="black" width="900" height="50">
								<thread>
									<tr bgcolor="skyblue" align="center">
										<th>문의번호</th>
										<th>고객님의 성함</th> 
									</tr>
								</thread>
								<tbody>
									<tr>
										<td><%= cs.getCsID() %></td> 
										<td><%= cs.getCsUserName()%></td> 
									</tr> 
								</tbody>
							</table>
							
							<table border="0" width="100%" border="0" cellspacing="0" cellpadding="0" >
								<tr>
									<td style="padding-top: 10; padding-right: 40; padding-bottom: 30; padding-left: 20;">&nbsp</td>
								</tr>
							</table>
							
							<table border="1" bordercolor="black" width="900" height="50">
								<thread>
									<tr bgcolor="skyblue" align="center"> 
										<th>전화번호</th>
										<th>이메일</th> 
									</tr>
								</thread>
								<tbody>
									<tr> 
										<td><%= cs.getCsUserTell() %></td>
										<td><%= cs.getCsUserEmail() %></td>
									</tr> 
								</tbody>
							</table>
							
							<table border="0" width="100%" border="0" cellspacing="0" cellpadding="0" >
								<tr>
									<td style="padding-top: 10; padding-right: 40; padding-bottom: 30; padding-left: 20;">&nbsp</td>
								</tr>
							</table>
							 
							<table border="1" bordercolor="black" width="900" height="50" >
								<thread>
									<tr bgcolor="skyblue" align="center"> 
										<th>문의부서</th> 
									</tr>
								</thread>
								<tbody> 
									<tr>  
										<td><%= cs.getCsDepartment()%></td> 
									</tr> 
								</tbody>
							</table> 
							<table border="0" width="100%" border="0" cellspacing="0" cellpadding="0" >
								<tr>
									<td style="padding-top: 10; padding-right: 40; padding-bottom: 30; padding-left: 20;">&nbsp</td>
								</tr>
							</table>
							
							
							<table border="1" bordercolor="black" width="900" height="50" >
								<thread>
									<tr bgcolor="skyblue" align="center">
										<th>문의내용</th> 
									</tr>
								</thread>
								<tbody> 
									<tr>  
										<td><%= cs.getCsContents()%></td>
									</tr> 
								</tbody>
							</table>
							
							<table border="0" width="100%" border="0" cellspacing="0" cellpadding="0" >
								<tr>
									<td style="padding-top: 10; padding-right: 0; padding-bottom: 30; padding-left: 0;">&nbsp</td> 
								</tr>
							</table> 
							
							<li><a href="customerServiceDetailManagerAnswer.jsp?csID=<%= cs.getCsID() %>">관리자 답변 작성하기</a></li>
							<table border="0" width="100%" border="0" cellspacing="0" cellpadding="0" >
								<tr>
									<td style="padding-top: 10; padding-right: 0; padding-bottom: 30; padding-left: 0;">&nbsp</td> 
								</tr>
							</table>
							
							<table border="1" bordercolor="black" width="900" height="50" >
								<thread>
									<tr bgcolor="skyblue" align="center">
										<th>관리자 답변</th>  
									</tr>
								</thread>
								<tbody> 
									<tr> 
										<td><%= cs.getCsAnswer()%></td> 
									</tr> 
								</tbody>
							</table>
							
							<table border="0" width="100%" border="0" cellspacing="0" cellpadding="0" >
								<tr>
									<td style="padding-top: 10; padding-right: 40; padding-bottom: 30; padding-left: 20;">&nbsp</td>
								</tr>
							</table> 
						</body>
                   </div>
               </div> 
           </div>
       </div>
   </section>
 
	

<%@include file="footer.jsp" %>