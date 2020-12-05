<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %> 
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.net.URLEncoder" %> 
<%@page import="customerService.CustomerServiceDAO"%>
<%@page import="customerService.CustomerServiceDTO"%> 

<%@include file="header.jsp" %>
  
    <section class="about_us_area" id="about">
        <div class="container">
            <div class="row page-title">
                <div class="col-md-6 col-sm-6 col-xs-6 text-left">
                    <div class="about_us_content_title">
                        <h2>about us</h2>
                        <h5>Easy Express</h5>
                    </div>
                </div> 
            </div>
            <div class="row">
                <div class="col-md-6 col-sm-6">
                    <div class="about_us_content">
                        <p>안녕하세요. EasyExpree에 방문해주셔서 감사합니다.</p>
                        <p>홈페이지의 모든 서비스는 로그인 후 진행이 가능합니다.</p>
                        <p>회원가입이 힘드신 분은 회사 전화번호로 연락 주시면 직원이 직접 예약을 진행하니 전화 부탁드립니다.</p> 
                    </div>
                </div>
                <div class="col-md-offset-1 col-sm-6 col-md-5">
                    <div class="about_car">
                        <img src="img/EElogo.png" alt="car">
                    </div>
                </div>
            </div>
        </div>
    </section>
 
     
<%@include file="footer.jsp" %> 