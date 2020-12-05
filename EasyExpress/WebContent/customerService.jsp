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
                       <h1 class="contact_page_headings">문의 내역</h1>
                       <body>
	                       <table border="1" bordercolor="black" width="1000" height="50" >
								<thread>
									<tr bgcolor="skyblue" align="center">
										<th>문의번호</th>
										<th>고객님의 성함</th>  
										<th>문의부서</th>
										<th>문의내용</th>
										<th>답변</th> 
										<th>상세보기</th>  
									</tr>
								</thread>
								<tbody>
									<%
									ArrayList<CustomerServiceDTO> csList = new ArrayList<CustomerServiceDTO>();
									String id = (String)session.getAttribute("userID");
									System.out.println(id);
									csList = new CustomerServiceDAO().getList(id);
									if(csList != null){ 
										for(int i = 0; i< csList.size(); i++){ //다음페이지로 넘어가기 위해서 6까지 가져옴
											CustomerServiceDTO cs = csList.get(i); 
									%>
									<tr> 
										<td><%= cs.getCsID() %></td> 
										<td><%= cs.getCsUserName()%></td>  
										<td><%= cs.getCsDepartment()%></td>
										<td><%= cs.getCsContents()%></td>
										<td><%= cs.getCsAnswer()%></td> 
										<td><a href="customerServiceDetail.jsp?csID=<%= cs.getCsID() %>">상세보기</a></td>
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