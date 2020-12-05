<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %> 
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.net.URLEncoder" %>

<%@include file="header.jsp" %>
    <!--    start contact page content-->
    <section class="contact-page-area">
        <div class="container">
            <div class="row">
                <div class="col-sm-10 col-sm-offset-1">
                    <div class="contact-form">
                        <h1 class="contact_page_headings">로그인</h1>
                        <form method="post" action="./userLoginAction.jsp">
                        	<div class="form-group">
								<label>아이디</label>
								<input type="text" name ="userID" placeholder="아이디를 입력하세요." />
							</div>
                            <div class="form-group">
								<label>비밀번호</label>
								<input type="password" name ="userPW" placeholder="비밀번호를 입력하세요." />
							</div>
							<button type="submit" class="btn btn-default">로그인</button>
                        </form>
                    </div>
                </div> 
            </div>
        </div>
    </section>

<%@include file="footer.jsp" %>