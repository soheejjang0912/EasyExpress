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
                        <h1 class="contact_page_headings">문의내용 답변하기</h1> 
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
						%>
                        <form method="post" action="customerServiceDetailManagerAnswerAction.jsp?csID=<%= csID %>"> 
                        	 
							<div class="form-group">
								<label>답변 내용</label>
								<input type="text" name ="csAnswer" placeholder="답변을 입력해 주세요" />
							</div>  
							
							<button type="submit" class="btn btn-default">저장</button>
                        </form>
                    </div>
                </div> 
            </div>
        </div>
    </section>

<%@include file="footer.jsp" %>