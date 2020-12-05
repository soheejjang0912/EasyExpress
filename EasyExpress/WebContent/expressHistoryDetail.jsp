<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %> 
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.net.URLEncoder" %> 
<%@page import="express.ExpressDTO"%>
<%@page import="express.ExpressDAO"%>

<%@include file="header.jsp" %>
   <!--    start contact page content-->
   <section class="contact-page-area">
       <div class="container">
           <div class="row">
               <div class="col-sm-10 col-sm-offset-1">
                   <div class="contact-form">
                       <h1 class="contact_page_headings">통운예약 내역</h1>
                       <body>
                       	
							<%
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
							ExpressDTO express = new ExpressDAO().getExpress(resID); 
						  %>
	                       <table border="1" bordercolor="black" width="900" height="50">
								<thread>
									<tr bgcolor="skyblue" align="center">
										<th>운송번호</th>
										<th>보낸날짜</th> 
									</tr>
								</thread>
								<tbody>
									<tr>
										<td><%= express.getResID() %></td>
										<td><%= express.getResSendDate() %></td>  
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
										<th>보내시는 분</th>
										<th>보내는 나라</th> 
										<th>보내는 상세주소</th> 
										<th>보내시는 분의 전화번호</th> 
									</tr>
								</thread>
								<tbody>
									<tr> 
										<td><%= express.getResSendName() %></td>
										<td><%= express.getResSendCountry() %></td>
										<td><%= express.getResSendAdress() %></td>
										<td><%= express.getResSendTel() %></td>
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
										 
										
										<th>받으시는 분</th>
										<th>받는 나라  </th> 
										<th>받는 상세주소</th> 
										<th>받으시는 분의 전화번호</th> 
										 
									</tr>
								</thread>
								<tbody> 
									<tr> 
										<td><%= express.getResRecName() %></td>
										<td><%= express.getResRecCountry() %></td>
										<td><%= express.getResRecAdress() %></td>
										<td><%= express.getResRecTel() %></td>
										 
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
										
										<th>운송유형</th>
										<th>운송품명</th>
										<th>무게</th> 
										  
									</tr>
								</thread>
								<tbody> 
									<tr>  
										<td><%= express.getResLugType() %></td>
										<td><%= express.getResLugName() %></td>
										<td><%= express.getResLugWeight() %></td>  
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
										<th>수출통관 상태</th> 
										<th>수출통관 시간</th> 
										<th>수출통관 IRREGULAR</th>
										 
									</tr>
								</thread>
								<tbody> 
									<tr> 
										<td><%= express.getResExpClear() %></td>
										<td><%= express.getResExpClearDate() %></td>
										<td><%= express.getResExpClearIrr() %></td> 
										
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
										<th>운송 상태</th>
										<th>운송 시간</th>
										<th>운송 IRREGULAR</th> 
									</tr>
								</thread>
								<tbody> 
									<tr> 
										<td><%= express.getResTransState() %></td>
										<td><%= express.getResTransStateDate() %></td>
										<td><%= express.getResTransStateIrr() %></td> 
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
										<th>수입통관 상태</th>
										<th>수입통관 시간</th>
										<th>수입통관 IRREGULAR</th> 
									</tr>
								</thread>
								<tbody> 
									<tr>  
										<td><%= express.getResImpClear() %></td>
										<td><%= express.getResImpClearDate() %></td>
										<td><%= express.getResImpClearIrr() %></td> 
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
										<th>육상운송 상태</th>
										<th>육상운송 시간</th>
										<th>육상운송 IRREGULAR</th>
									</tr>
								</thread>
								<tbody> 
									<tr>  
										<td><%= express.getResDeli() %></td>
										<td><%= express.getResDeliDate() %></td>
										<td><%= express.getResDeliIrr() %></td>
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