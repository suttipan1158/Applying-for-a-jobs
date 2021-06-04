<%@page import="com.springmvc.model.Company"%>
<%@page import="com.springmvc.controller.RegisterController"%>
<%@page import="com.springmvc.model.ServicePerson"%>
<%@page import="com.springmvc.model.CleanerProvider"%>
<%@page import="com.springmvc.model.Quotations"%>
<%@page import="java.util.List"%>
<%@page import="com.springmvc.model.Login"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <!-- input cost Session of Login Successful -->
    <%Login user = (Login) session.getAttribute("user"); 
		 RegisterController rg = new RegisterController();
			rg.loadIndexPage(request); 
    %>
    <%List<ServicePerson> listSP = (List<ServicePerson>) request.getAttribute("listSP");
  		List<Company> com = (List<Company>) request.getAttribute("company");
	%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
   <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
   <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
   <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"><link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
 <!-- Import Icon -->	
     	<script src='https://kit.fontawesome.com/a076d05399.js'></script>
 <!-- Css Index -->
     	<link rel="stylesheet" href="/ServiceCleaner_5938/css/index.css">
     	
  <!-- Css Folder Index -->
     	<link rel="stylesheet" href="/ServiceCleaner_5938/css/index/templatemo-art-factory.css">
     	<link rel="stylesheet" href="/ServiceCleaner_5938/css/index/flex-slider.css">
     	<link rel="stylesheet" href="/ServiceCleaner_5938/css/index/bootstrap.min.css">
     	<link rel="stylesheet" href="/ServiceCleaner_5938/css/index/font-awesome.css">
     	<link rel="stylesheet" href="/ServiceCleaner_5938/css/index/owl-carousel.css">
     	
     	
<style type="text/css">
.blog .carousel-indicators {
	left: 0;
	top: auto;
    bottom: -40px;

}

/* The colour of the indicators */
.blog .carousel-indicators li {
    background: #a3a3a3;
    border-radius: 50%;
    width: 8px;
    height: 8px;
}

.blog .carousel-indicators .active {
background: #707070;
}


/******************************************  */


</style>
</head>

<body>
	<!-- Header section -->
			<jsp:include page="../navbar/navbar.jsp"></jsp:include>
	<!-- Header section end -->
<div class="containerImg">
	<input type="hidden" id="alertLogin" value="${msgLogin}">
	<input type="hidden" id="alertRegister" value="${msgRegister}">
	<input type="hidden" id="alertCreate" value="${messageCreate}">
	
</div>  
    
   <!-- ***** Features Big Item Start ***** -->
    <section class="section" id="about">
        <div class="container">
            <div class="row">
                <div class="col-lg-7 col-md-12 col-sm-12" data-scroll-reveal="enter left move 30px over 0.6s after 0.4s">
                    <img src="/ServiceCleaner_5938/imgtext/Level-Condominium.jpg" class="rounded img-fluid d-block mx-auto" alt="App">
                </div>
                <div class="right-text col-lg-5 col-md-12 col-sm-12 mobile-top-fix">
                    <div class="left-heading">
                        <h5>คอนโดมิเนียม</h5>
                    </div>
                    <div class="left-text">
                        <p>เป็นที่อยู่อาศัยรูปแบบหนึ่งที่เจ้าของห้องชุดจะต้องแบ่งปันกรรมสิทธิ์หรือความเป็นเจ้าของร่วมกับเจ้าของห้องชุดอื่น ๆ  ในพื้นที่ส่วนกลาง เช่น ทางเดิน บริเวณห้องโถง บันได ลิฟต์ โรงจอดรถ สระว่ายน้ำ สนามเด็กเล่น ซึ่งเจ้าของห้องทุกคนจะเป็นเจ้าของร่วมตามกฎหมาย ลักษณะของห้องในอาคารชุดจะเหมือนกับห้องอยู่อาศัย เพียงแต่เราเป็นเจ้าของห้อง ไม่ใช่ผู้เช่า <br><br>
                       		ทางเว็บไซต์ของเราจะมีรูปแบบของขนาดคอนโด และรูปแบบของคอนโดมาให้กับลูกค้าเลือก เพื่อทำให้การเข้าใช้บริการที่สะดวกมากที่สุดแก่ลูกค้า</p>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-12">
                    <div class="hr"></div>
                </div>
            </div>
        </div>
    </section>
    <!-- ***** Features Big Item End ***** -->

    <!-- ***** Features Big Item Start ***** -->
    <section class="section" id="about2">
        <div class="container">
            <div class="row">
                <div class="left-text col-lg-5 col-md-12 col-sm-12 mobile-bottom-fix">
                    <div class="left-heading">
                        <h5>บ้านพัก 1 ชั้น  และ  บ้านพัก 2 ชั้น</h5>
                    </div>
                    <p>ลักษณะของบ้านชั้นเดียว และบ้านสองชั้นในนิยามของแต่ละตัว</p>
                    <ul>
                        <li>
                            <img src="assets/images/about-icon-01.png" alt="">
                            <div class="text">
                                <h6>บ้านชั้นเดียว</h6>
                                <p> บ้านที่มีลักษณะทางกายภาพทางแนวระนาบ เพียงระดับเดียวทั้งหลัง</p>
                            </div>
                        </li>
                        <li>
                            <img src="assets/images/about-icon-02.png" alt="">
                            <div class="text">
                                <h6>บ้านสองชั้น </h6>
                                <p>บ้านที่มีพื้นที่ต่างระดับในแนวดิ่ง 2 ระดับ ทั้งชั้นบนและชั้นล่าง โดยพื้นที่ ชั้นบนและชั้นล่างมีอัตราส่วนเท่าๆกัน</p>
                            </div>
                        </li>
                        <li>
                            <img src="assets/images/about-icon-03.png" alt="">
                            <div class="text">
                                <p>ทางเว็บไซต์ของเราจะมีรูปแบบของขนาดคอนโด และรูปแบบของคอนโดมาให้กับลูกค้าเลือก เพื่อทำให้การเข้าใช้บริการที่สะดวกมากที่สุดแก่ลูกค้า </p>
                            </div>
                        </li>
                    </ul>
                </div>
                <div class="right-image col-lg-7 col-md-12 col-sm-12 mobile-bottom-fix-big" data-scroll-reveal="enter right move 30px over 0.6s after 0.4s">
                    <img src="/ServiceCleaner_5938/imgtext/phut-crisp.jpg" class="rounded img-fluid d-block mx-auto" alt="App">
                </div>
            </div>
        </div>
    </section>
    <!-- ***** Features Big Item End ***** -->
    <!-- ***** Features Small Start ***** -->
    <section class="section" id="services">
        <div class="container">
            <div class="row">
                <div class="owl-carousel owl-theme">
                <%if( listSP!= null ){ %>
                	<%for(ServicePerson s : listSP){ %>
                    <div class="item service-item">
                        <div class="icon">
                            <i><img src="${pageContext.request.contextPath}/PImgPerson/<%=s.getProfilePhoto()%>" alt=""></i>
                        </div>
                        <h5 class="service-title">คุณ  <%= s.getFirstName()+" " +s.getLastName() %></h5>
                        <p>Tel : <%= s.getTel() %></p>
                        <div class="mt-20" >
                        <p><%= s.getAddress() %><br><span>
							<%=" ต."+s.getSubDistrict()+" อ."+s.getDistrict()+" จ."+s.getProvince()+" "+s.getPostcode() %>
							</span>
						</p>
						</div>
                        <a href="${pageContext.request.contextPath}/goViewCleanerProvider?id=<%= s.getPersonid()%>&&type=บุคคล" class="main-button">Read More</a>
                    </div>
                    <%} %>
                  <%} %>
                <!-- Show List Review to Company -->
              <%if(com != null){ %>
                    <%for(Company c : com){ %>
                    <div class="item service-item">
                        <div class="icon">
                            <i><img src="${pageContext.request.contextPath}/PImgCompany/<%=c.getProfilePhoto()%>"" alt=""></i>
                        </div>
                        <h5 class="service-title">บริษัท  <%= c.getCompanyName() %></h5>
                        <p>Tel : <%= c.getTel() %></p>
                        <div class="mt-20" >
                        	<p>
	                        	<%= c.getAddress() %><br>
					          	<%=" ต."+c.getSubDistrict()+" อ."+c.getDistrict()+" จ."+c.getProvince()+" "+c.getPostcode() %><br>
					        	
					        </p>
        				</div>
                        <a href="${pageContext.request.contextPath}/goViewCleanerProvider?id=<%= c.getCompanyid()%>&&type=บริษัท" class="main-button">Discover More</a>
                    </div>
                    <%} %>
                 <%} %> 
                </div>
            </div>
        </div>
    </section>
    <!-- ***** Features Small End ***** -->


	<!-- FOOTER -->
		<jsp:include page="../footer/footer.jsp"></jsp:include>
	<!-- END FOOTER -->
	<script type="text/javascript">
	$(document).ready(function(){
	var a = document.getElementById("alertLogin").value;
	var rgtSus = document.getElementById("alertRegister").value;
	
	/* Alert of Login */
		/*if(a == "0"){
			var name = document.getElementById("loginnane").value;
			alert("ยินดีต้อนรับ ชื่อผู้ใช้   "+name+"");
		}*/
	/* Alert of Create Cleaner */
		var a1 = document.getElementById("alertCreate").value;
		if(a1 == "1"){
			alert("สร้างรายการคำขอรับบริการทำความสะอาดเสร็จสิ้น");
		}else if(a1 == "2"){
			alert("สร้างรายการคำขอรับบริการทำความสะอาดเล้มเหลว  กรุณาทำรายการใหม่อีกครั้งในภายหลัง");
		}
	/* Alert of Register */
		if(rgtSus == "1"){
			alert("สมัครสมาชิกเสร็จสิ้น");
		}else if(rgtSus == "2"){
			alert("สมัครสมาชิกล้มเหลว  กรุณาทำรายการใหม่อีกครั้งในภายหลัง");
		}
	});

	

</script>

    <!-- Bootstrap -->
    <script src="/ServiceCleaner_5938/js/index/popper.js"></script>
    <script src="/ServiceCleaner_5938/js/index/bootstrap.min.js"></script>

    <!-- Plugins -->
    <script src="/ServiceCleaner_5938/js/index/owl-carousel.js"></script>
    <script src="/ServiceCleaner_5938/js/index/scrollreveal.min.js"></script>
    <!-- <script src="/ServiceCleaner_5938/js/index/waypoints.min.js"></script> -->
    <script src="/ServiceCleaner_5938/js/index/jquery.counterup.min.js"></script>
    <script src="/ServiceCleaner_5938/js/index/imgfix.min.js"></script> 
    
    <!-- Global Init -->
    <script src="/ServiceCleaner_5938/js/index/custom.js"></script>
</body>
</html>