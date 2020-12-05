<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %> 
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.net.URLEncoder" %>

<%@ page import="customerService.CustomerServiceDAO" %>
<%@ page import="customerService.CustomerServiceDTO" %>

<%@include file="header.jsp" %>

    <!--    start contact page content-->
    <section class="contact-page-area">
        <div class="container">
            <div class="row">
                <div class="col-sm-10 col-sm-offset-1">
                    <div class="contact-form">
                        <h1 class="contact_page_headings">고객정보, 문의내용 입력</h1>
                        <form method="post" action="./customerServiceRegisterAction.jsp">
                        	<div class="form-group">
                        		<%   
                        			String id = (String)session.getAttribute("userID");									
								%>
								<label>아이디</label>
								<input type="text" value="<%= id %>" name ="csUserID" readonly/>
							</div>
                            <div class="form-group">
								<label>문의하시는 고객님의 성함</label>
								<input type="text" name ="csUserName" placeholder="문의하시는 고객님의 성함을 입력하세요." />
							</div>
							<div class="form-group">
								<label>전화번호</label>
								<input type="tel" name ="csUserTell" placeholder="전화번호를 입력하세요." />
							</div>
							<div class="form-group">
								<label>이메일</label>
								<input type="email" name ="csUserEmail" placeholder="이메일을 입력하세요." />
							</div>
							<div class="form-group">
								<label>문의 부서</label><br>
								<select name="csDepartment" class="form-group" style="font-size:30px">
										<option value="통운예약" selected> 통운 예약관련 </option>
										<option value="항공수입"> 항공수입 </option>
										<option value="항공수출"> 항공수출 </option>
										<option value="해운수입"> 해운수입 </option> 
										<option value="해운수출"> 해운수출 </option>  
								</select> 
							</div>
							<div class="form-group">
								<label>문의사항</label>
								<input type="text" name ="csContents" placeholder="문의사항을 입력하세요." />
							</div>
							<button type="submit" class="btn btn-default">등록하기</button>
                        </form>
                    </div>
                </div> 
            </div>
        </div>
    </section>

<%@include file="footer.jsp" %>