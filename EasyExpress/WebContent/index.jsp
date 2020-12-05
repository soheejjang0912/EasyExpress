<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %> 
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.net.URLEncoder" %>
 
<!DOCTYPE html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>EASY EXPRESS</title>
    <!--  bootstrap css -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" integrity="sha384-1q8mTJOASx8j1Au+a5WDVnPi2lkFfwwEAa8hDDdjZlpLegxhjVME1fgjWPGmkzs7" crossorigin="anonymous">
    <!--  font Awesome Css  -->
    <link href="http://maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css" rel="stylesheet">
    <!--    stylesheet for fonts-->
    <link href="fonts/stylesheet.css" rel="stylesheet">
    <!-- Reset css-->
    <link href="css/reset.css" rel="stylesheet">

    <!--slick css-->
    <link href="css/slick.css" rel="stylesheet">
    <!--  owl-carousel css -->
    <link href="css/owl.carousel.css" rel="stylesheet">
    <!--  YTPlayer css For Background Video -->
    <link href="css/jquery.mb.YTPlayer.min.css" rel="stylesheet">
    <!--  style css  -->
    <link rel="stylesheet" href="css/meanmenu.css">
    <link href="style.css" rel="stylesheet">
    <!--  Responsive Css  -->
    <link href="css/responsive.css" rel="stylesheet">
 
</head>

<body class="js">
    <!--start header area-->
    <div id="preloader"></div>
    <section class="header_area" id="home">
        <!--   start logo & menu markup    -->
        <div class="logo_menu" id="sticker">
            <div class="container">
                <div class="row">
                    <div class="col-md-2 col-lg-2 col-sm-2 col-xs-6">
                        <div class="logo">
                            <a href="index.jsp"><img src="img/EElogo.png" alt="logo"></a>
                        </div>
                    </div>
                    <div class="col-md-6 col-xs-6 col-md-offset-1 col-sm-7 col-lg-offset-1 col-lg-6 mobMenuCol">
                        <nav class="navbar">
                            <!-- Collect the nav links, forms, and other content for toggling -->
                                <ul class="nav navbar-nav navbar-right menu">
                                	
                                    <li><a href="index.jsp">홈</a></li>
                                    <li><a href="about.jsp">소개</a></li>
                                    <%    
                                    System.out.println(session.getAttribute("userType"));
                            		if(session.getAttribute("userID")!=null){
										if(session.getAttribute("userType").equals("customer")){ 
											out.println("<li><a href='./expressRegister.jsp'>운송 서비스 신청</a></li>");
											out.println("<li><a href='./expressHistory.jsp'>운송 서비스 조회하기</a></li>"); 
											out.println("<li><a href='./customerServiceRegister.jsp'>문의하기</a></li>"); 
											out.println("<li><a href='./customerService.jsp'>문의내역 확인하기</a></li>");
										}else if(session.getAttribute("userType").equals("manager")){
											out.println("<li><a href='./expressRegister.jsp'>운송 서비스 신청</a></li>");
											out.println("<li><a href='./expressHistory.jsp'>운송 서비스 조회하기</a></li>");  
											out.println("<li><a href='./customerServiceManager.jsp'>문의내역 확인및 수정하기</a></li>");
										}else if(session.getAttribute("userType").equals("transmanager")){ 
											out.println("<li><a href='./expressHistoryTransmanager.jsp'>운송 서비스 조회하기</a></li>");  
										}
                            		}   
									%>   
                                </ul>
                            <!-- /.navbar-collapse -->
                        </nav>
                    </div>
                    <div class="col-md-3 col-sm-3 col-xs-4 col-lg-3 signup">
                        <ul class="nav navbar-nav">
                       		<%   
							if(session.getAttribute("userID")==null){
								out.println("<li><a href='./userLogin.jsp'>로그인</a></li>");
								out.println("<li><a href='./userRegister.jsp'>회원가입</a></li>");
							}else{
								out.println("<li><a href='./userLogout.jsp'>로그아웃</a></li>");	
							}
							%>
                            
                            
                        </ul>
                    </div>
                </div>
            </div>
        </div>
        <!--   end of logo menu markup     -->
	
        <!--  start welcome text marup  -->
        <div class="table">
            <div class="cell">
                <div class="container">
                    <div class="row">
                        <div class="col-xs-12 text-center">
                            <div class="welcome_text">
                                <h1>Get the fastest service </h1>
                                <h1>Easy Express</h1>
                                <div class="welcome_p">
                                    <p> 안녕하세요 Easy Express 홈페이지입니다. </p>
                                    <p> 모든 서비스는 로그인 후 이용 가능합니다. 로그인/회원가입 해주세요.</p>
                                </div>
                                 
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- end of welcome text markup-->
    </section>
    <!--end of header area-->    

   

<%@include file="footer.jsp" %>