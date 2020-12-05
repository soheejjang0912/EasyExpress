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
                        <h1 class="contact_page_headings">통운예약</h1>
                        <form method="post" action="./expressRegisterAction.jsp">
                        	<div class="form-group">
                        		<%   
                        			String id = (String)session.getAttribute("userID");									
								%>
								<label>보내시는 고객님의 아이디</label>
								<input type="text" value="<%= id %>" name ="resUserID" readonly/>
							</div>
                        	<div class="form-group">
								<label>보내시는 고객님의 성함</label>
								<input type="text" name ="resSendName" placeholder="보내시는 고객님의 성함을 입력하세요." />
							</div>
							<div class="form-group">
								<label>보내시는 고객님의 나라</label><br>
								<select name="resSendCountry" class="form-group" style="font-size:30px; width:500px">
										<option value="kor" selected> 한국 </option>
										<option value="jp"> 일본 </option> 
								</select> 
							</div> 
							<div class="form-group">
								<label>보내시는 고객님의 상세주소</label>
								<input type="text" name ="resSendAdress" placeholder="보내시는 고객님의 상세주소를 입력하세요." />
							</div>
							<div class="form-group">
								<label>보내시는 고객님의 전화번호</label>
								<input type="tel" name ="resSendTel" placeholder="보내시는 고객님의 전화번호를 입력하세요." />
							</div>
							<div class="form-group">
								<label>보내시는 고객님의이메일</label>
								<input type="email" name ="resSendEmail" placeholder="보내시는 고객님의 이메일을 입력하세요." />
							</div>
							
							<div class="form-group">
								<label>받으시는 고객님의 성함</label>
								<input type="text" name ="resRecName" placeholder="받으시는 고객님의 성함을 입력하세요." />
							</div>
							<div class="form-group">
								<label>받으시는 고객님의 나라</label><br>
								<select name="resRecCountry" class="form-group" style="font-size:30px; width:500px">
										<option value="kor"> 한국 </option>
										<option value="jp" selected> 일본 </option> 
								</select> 
							</div>  
							<div class="form-group">
								<label>받으시는 고객님의 상세주소</label>
								<input type="text" name ="resRecAdress" placeholder="받으시는 고객님의 상세주소를 입력하세요." />
							</div>
							<div class="form-group">
								<label>받으시는 고객님의 전화번호</label>
								<input type="tel" name ="resRecTel" placeholder="받으시는 고객님의 전화번호를 입력하세요." />
							</div>
							<div class="form-group">
								<label>받으시는 고객님의이메일</label>
								<input type="email" name ="resRecEmail" placeholder="받으시는 고객님의 이메일을 입력하세요." />
							</div> 
							<div class="form-group">
								<label>운송유형</label><br>
								<select name="resLugType" class="form-group" style="font-size:30px; width:500px">
										<option value="FLC" selected> FLC </option>
										<option value="LCL"> LCL </option>
										<option value="BULKCARGO"> BULKCARGO </option> 
								</select> 
							</div>
							<div class="form-group">
								<label>운송하는 물건의 품명</label>
								<input type="text" name ="resLugName" placeholder="운송하는 물건의 품명을 입력하세요." />
							</div>
							<div class="form-group">
								<label>운송하는 물건의 무게</label>
								<input type="number" name ="resLugWeight" placeholder="운송하는 물건의 무게를 입력하세요." />
							</div>
							<button type="submit" class="btn btn-default">예약하기</button>
                        </form>
                    </div>
                </div> 
            </div>
        </div>
    </section>

<%@include file="footer.jsp" %>