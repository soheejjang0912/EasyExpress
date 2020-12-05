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
	                       <table border="1" bordercolor="black" width="900" height="50" >
								<thread>
									<tr bgcolor="skyblue" align="center">
										<th>운송번호</th>
										<th>보낸날짜</th>
										<th>보내시는 분</th>
										<th>보내는 나라</th> 
										<th>운송유형</th>
										<th>운송품명</th>
										<th>무게</th> 
										<th>운송상태</th>
									</tr>
								</thread>
								<tbody>
									<%
									ArrayList<ExpressDTO> expressList = new ArrayList<ExpressDTO>(); 
									expressList = new ExpressDAO().allList();
									if(expressList != null){ 
										for(int i = 0; i< expressList.size(); i++){ //다음페이지로 넘어가기 위해서 6까지 가져옴
											ExpressDTO express = expressList.get(i);
									%>
									<tr>
										<td><%= express.getResID() %></td>
										<td><%= express.getResSendDate() %></td> 
										<td><%= express.getResSendName() %></td>
										<td><%= express.getResSendCountry() %></td>
										<td><%= express.getResLugType() %></td>
										<td><%= express.getResLugName() %></td>
										<td><%= express.getResLugWeight() %></td> 
										<td><a href="expressTransmanager.jsp?resID=<%= express.getResID() %>">운송상태 등록하기</a></td>
									</tr>
									<% 
										} 
									}
									%> 
								</tbody>
							</table>
						</body>
                   </div>
               </div> 
           </div>
       </div>
   </section>
 
	

<%@include file="footer.jsp" %>