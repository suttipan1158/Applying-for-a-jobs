<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%String massage = (String) session.getAttribute("error_msg"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login</title>
	 <meta name="viewport" content="width=device-width, initial-scale=1">
<!-- link Icon -->
	 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
  	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.3/css/all.css" integrity="sha384-UHRtZLI+pbxtHCWp1t77Bi1L4ZtiqrqD80Kn4Z8NTSRyMA2Fd33n5dQ8lWUE00s/" crossorigin="anonymous"></head>
  	
  	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  	
  	<script type="text/javascript" src="${pageContext.request.contextPath}/js/AllScript2.js"></script>
  	
  	
  
</head>
<body>
<!-- Header section -->
			<jsp:include page="../navbar/navbar.jsp"></jsp:include>
	<!-- Header section end -->
	<!-- Start From Login -->
	<section class="login-block">
		<div class="container" style="width: 70%">
		    <div class="shadow p-3 mb-5 bg-white rounded">
				<div class="row">
					<div class="col-md-5 login-sec" style="margin-top: 10%; margin-left: 5%;">
					    <h2 class="text-center">เข้าสู่ระบบ</h2><br>
					    	<form class="login-form" action="${pageContext.request.contextPath}/isValidateLogin" method="post">
								 <div class="form-group">
								    <label for="exampleInputEmail1" class="text-uppercase" style="font-size: 20px;">
								    	<svg width="1.5em" height="1.5em" viewBox="0 0 16 16" class="bi bi-person-fill" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
								  			<path fill-rule="evenodd" d="M3 14s-1 0-1-1 1-4 6-4 6 3 6 4-1 1-1 1H3zm5-6a3 3 0 1 0 0-6 3 3 0 0 0 0 6z"/>
										</svg>
											ชื่อผู้ใช้ :
								    </label>
								    <input type="text" id="username" name="username" class="form-control form-control-lg" placeholder="ชื่อผู้ใช้" onkeyup="checkUsername(this)">
									<label id="showScriptUS" style="font-size: 12px; color: red;"></label>
								  </div>
								  <div class="form-group">
								    <label for="exampleInputPassword1" class="text-uppercase" style="font-size: 20px;">
								    	<svg width="1.5em" height="1.5em" viewBox="0 0 16 16" class="bi bi-key-fill" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
											  <path fill-rule="evenodd" d="M3.5 11.5a3.5 3.5 0 1 1 3.163-5H14L15.5 8 14 9.5l-1-1-1 1-1-1-1 1-1-1-1 1H6.663a3.5 3.5 0 0 1-3.163 2zM2.5 9a1 1 0 1 0 0-2 1 1 0 0 0 0 2z"/>
										</svg>
											รหัสผ่าน :
									</label>
										<input type="password" class="form-control form-control-lg"  id="password" name="password" placeholder="รหัสผ่าน" onkeyup="checkPassword(this)">
										<label id="showScriptpwd" style="font-size: 12px; color: red;"></label><br>
								  </div>
							      <div class="form-check">
							    		<button type="submit" class="btn btn-primary float-right" style=" font-size:20px; width: 50%;">เข้าสู่ระบบ</button>
							      </div>
							</form>
						</div>
					<div class="col-md-6 banner-sec">
			            <div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel"> 
				            <div class="carousel-inner" role="listbox">
							   	 <div class="carousel-item active">
							      	<img class="d-block img-fluid rounded float-right" src="/ServiceCleaner_5938/images/imagestemplate/about-1.jpg" alt="First slide" width="400px">
							    </div>
						    </div>	   
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	${error_msg};
<!-- End From Login -->
	<!-- FOOTER -->
		<jsp:include page="../footer/footer.jsp"></jsp:include>
	<!-- END FOOTER -->
		
	<script>
	var x = ${msgLogin};
	if(x == "1"||x == "2"){
		myf(x);
	}
	function myf(x) {
		if(x == "1"){
			alert("ไม่พบข้อมูลผู้ใช้ หรือ ชื่อผู้ใช้งานไม่ได้รับอนุญาตให้เข้าใช้งาน กรุณาลองใหม่อีกครั้งในภายหลัง !!!");
		}else if(document.getElementById("username").value ==""||document.getElementById("password").value ==""){
			alert("กรุณากรอกข้อมูลให้ครบ!!!");
		}
		
	}
	</script>
</body>
</html>