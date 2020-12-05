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
                        <h1 class="contact_page_headings">수출통관 상태 변경</h1> 
                        <%
							int resID = 0;  
							if (request.getParameter("resID")!=null){
								resID = Integer.parseInt(request.getParameter("resID")); 
							} 
						%>
                        <form method="post" action="expressExpClearRegisterAction.jsp?resID=<%= resID %>"> 
                        	
							<div class="form-group">
								<label>수출통관 상태</label><br>
								<select name="resExpClear" class="form-group" style="font-size:30px; width:500px">
										<option value="준비중" selected> 준비중 </option>
										<option value="완료"> 완료 </option> 
								</select> 
							</div> 
							<div class="form-group">
								<label>수출통관 IRREGULAR</label>
								<input type="text" value="없음" name ="resExpClearIrr" placeholder=" IRREGULAR발생시 입력하세요." />
							</div>  
							
							<button type="submit" class="btn btn-default">변경</button>
                        </form>
                    </div>
                </div> 
            </div>
        </div>
    </section>

<%@include file="footer.jsp" %>