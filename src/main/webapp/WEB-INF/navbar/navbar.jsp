<%@page import="com.springmvc.model.Login"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%Login user = (Login) session.getAttribute("user"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Navbar</title>
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
 <script type="text/javascript" src="${pageContext.request.contextPath}/js/paginationlist/paginga.jquery.js"></script>
 
   <!-- Css Folder Index -->
     	<link rel="stylesheet" href="/ServiceCleaner_5938/css/index/templatemo-art-factory.css">
     	<link rel="stylesheet" href="/ServiceCleaner_5938/css/index/flex-slider.css">
     	<link rel="stylesheet" href="/ServiceCleaner_5938/css/index/bootstrap.min.css">
     	<link rel="stylesheet" href="/ServiceCleaner_5938/css/index/font-awesome.css">
     	<link rel="stylesheet" href="/ServiceCleaner_5938/css/index/owl-carousel.css">

    <style type="text/css">
    *
			{
				font-family: sans-serif;
			}
			.pager div
			{
				float: left;
				border: 1px solid gray;
				margin: 5px;
				padding: 10px;
			}
			.pager div.disabled
			{
				opacity: 0.25;
			}
			.pager .pageNumbers a
			{
				display: inline-block;
				padding: 0 10px;
				color: gray;
			}
			.pager .pageNumbers a.active
			{
				color: orange;
			}

			.pager 
			{
				overflow: hidden;
			}

			.paginate-no-scroll .items div
			{
				height: 250px;
			}
			
			#welcome {

  background-image: url(/ServiceCleaner_5938/images/banner-bg.png);

  }
    </style>
    
</head>
<body>
 <!-- ***** Preloader Start ***** -->
    <div id="preloader">
        <div class="jumper">
            <div></div>
            <div></div>
            <div></div>
        </div>
    </div>  
    <!-- ***** Preloader End ***** -->
    <!-- ***** Header Area Start ***** -->
    <header class="header-area header-sticky">
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <nav class="main-nav">
                        <!-- ***** Logo Start ***** -->
                        <a href="${pageContext.request.contextPath}/doIndex" class="logo"><i class="fa fa-cube"></i>Cleaning<b>Service</a>
                        <!-- ***** Logo End ***** -->
                        <!-- ***** Menu Start ***** -->
                        <ul class="nav">
                            <li class="scroll-to-section"><a href="${pageContext.request.contextPath}/doIndex" >หน้าหลัก</a></li>
                            <li class="scroll-to-section"><a href="${pageContext.request.contextPath}/goListCleanerProvider">รายการผู้ให้บริการ</a></li>
                            	 <%if(user != null){ %>
						        	<%if(user.getLoginType().equals("ลูกค้า")){%>
						        		 <li class="scroll-to-section"><a href="${pageContext.request.contextPath}/goCreateRequestCleaner">ขอรับบริการ</a></li>
						        		 <li class="scroll-to-section"><a href="${pageContext.request.contextPath}/goListRequestCleaner">รายการขอรับบริการ</a></li>
					      			<%}else if(user.getLoginType().equals("ให้บริการทำความสะอาด")){ %>
						      			<li class="scroll-to-section"><a href="${pageContext.request.contextPath}/goListRequestCustomer">คำขอรับบริการจากลูกค้า</a></li>
						      			<li class="scroll-to-section"><a href="${pageContext.request.contextPath}/goListCleanerServicePage">บริการทำความสะอาด</a></li>
									<%}else{ %>	
										 <li class="submenu">
			                                <a href="javascript:;">รายการบัญชี</a>
			                                <ul>
			                                    <li><a href="${pageContext.request.contextPath}/goListAccountCustomer">บัญชีลูกค้า</a></li>
			                                    <li><a href="${pageContext.request.contextPath}/goListAccountCleanerProvider">บัญชีผู้ให้บริการ</a></li>
			                                </ul>
			                             </li>
									<%} %> 
									<li class="submenu">
			                                <a href="#">
			                                	 <svg width="1.5em" height="1.5em" viewBox="0 0 16 16" class="bi bi-person-fill" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
													<path fill-rule="evenodd" d="M3 14s-1 0-1-1 1-4 6-4 6 3 6 4-1 1-1 1H3zm5-6a3 3 0 1 0 0-6 3 3 0 0 0 0 6z"/>
												</svg> <%= user.getUsername()%>
												<input type="hidden" id="loginnane" value="<%= user.getUsername()%>">
			                                </a>
			                                <ul>
			                                    <li><a href="${pageContext.request.contextPath}/goEditProfile"><i class='far fa-user-circle'></i> แก้ไขข้อมูลส่วนตัว</a></li>
			                                    <li><a href="${pageContext.request.contextPath}/LogOut"><i class="material-icons">&#xE8AC;</i> ออกจากระบบ</a></li>
			                                </ul>
			                             </li>
					    	<%}else{ %>
					    	 	<li class="scroll-to-section"><a href="${pageContext.request.contextPath}/goLogin">เข้าสู่ระบบ</a></li>
					    	 	<li class="scroll-to-section"><a href="${pageContext.request.contextPath}/gotoRegister">สมัครสมาชิก</a></li>
					    	
					    	<%} %>
                        </ul>
                        <a class='menu-trigger'>
                            <span>Menu</span>
                        </a>
                        <!-- ***** Menu End ***** -->
                    </nav>
                </div>
            </div>
        </div>
    </header>
    <!-- ***** Header Area End ***** -->

<!-- ***** Welcome Area Start ***** -->
    <div class="welcome-area" id="welcome">

        <!-- ***** Header Text Start ***** -->
        <div class="header-text">
            <div class="container">
                <div class="row">
                    <div class="left-text col-lg-6 col-md-6 col-sm-12 col-xs-12" data-scroll-reveal="enter left move 30px over 0.6s after 0.4s">
                        <h1>Cleaning <strong>Service</strong></h1>
                        <h2 style="color: White;">ศูนย์กลางการให้บริการทำความสะอาด</h2>
                        <p>เว็บไซต์เพื่อบริการให้กับผู้ให้บริการ และลูกค้าสามารถติกต่อ ขอรับบริการทำความสะอาดใด้.</p>
                          <%if(user != null){ %>
			            		<%if(user.getLoginType().equals("ลูกค้า")){%>
				            		<a href="${pageContext.request.contextPath}/goCreateRequestCleaner"  class="main-button-slider" target="_blank"><span>ขอรับบริการทำความสะอาด</span></a>
				            	<%} %>
			            	<%}else{ %>
			            		<a href="${pageContext.request.contextPath}/gotoRegister"  class="main-button-slider" target="_blank"><span>สมัครสมาชิก </span></a>
			            	<%} %>
                    </div>
                    <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12" data-scroll-reveal="enter right move 30px over 0.6s after 0.4s">
                        <img src="/ServiceCleaner_5938/imgtext/cleanerService.png" class="rounded img-fluid d-block mx-auto" alt="First Vector Graphic">
                    </div>
                </div>
            </div>
        </div>
        <!-- ***** Header Text End ***** -->
    </div>
    <!-- ***** Welcome Area End ***** -->

<%session.setAttribute("user", user); %>



    <!-- Bootstrap -->
    <script src="/ServiceCleaner_5938/js/index/popper.js"></script>
    <script src="/ServiceCleaner_5938/js/index/bootstrap.min.js"></script>

    <!-- Plugins -->
    <script src="/ServiceCleaner_5938/js/index/owl-carousel.js"></script>
    <script src="/ServiceCleaner_5938/js/index/scrollreveal.min.js"></script>
    <script src="/ServiceCleaner_5938/js/index/waypoints.min.js"></script>
    <script src="/ServiceCleaner_5938/js/index/jquery.counterup.min.js"></script>
    <script src="/ServiceCleaner_5938/js/index/imgfix.min.js"></script> 
    
    <!-- Global Init -->
    <script src="/ServiceCleaner_5938/js/index/custom.js"></script>
</body>
</html>


