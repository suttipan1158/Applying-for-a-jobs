<%@page import="com.springmvc.model.Company"%>
<%@page import="com.springmvc.model.ServicePerson"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.*"%>
<%@page import="com.springmvc.model.Login"%>
<%@page import="com.springmvc.model.Customer"%>
    <%Login user = (Login) session.getAttribute("user"); %>
     <%List<Customer> cus = (List<Customer>) request.getAttribute("customerdata"); 
	   String providertype =(String) request.getAttribute("providertype"); 
	 %>
	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
   <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
   <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"><link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<!-- MAPS -->
  <link href='https://api-maps.thinknet.co.th/libs/thinknetmaps.1.2.0-rc0.min.css' rel='stylesheet' />
<!-- import jquery JS -->
	 	<link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<!-- เลือกใช้ไฟล์ css ของ register.css -->
  		<link rel="stylesheet" type="text/css" href="/ServiceCleaner_5938/css/register2.css">
  		<link rel="stylesheet" type="text/css" href="/ServiceCleaner_5938/css/datepicker.css">   
<!-- Import Font -->
		 <link href="https://fonts.googleapis.com/css2?family=Sarabun:ital,wght@0,200;1,200&display=swap" rel="stylesheet"> <!-- Icon -->
<!-- Import Icon -->	
     	<script src='https://kit.fontawesome.com/a076d05399.js'></script>
     	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
     <!-- เลือกใช้file Script ชื่อ register.js -->
	<script src="/ServiceCleaner_5938/js/AllScript2.js"></script>
<style type="text/css">
	.fieldsetCss{
		width: 90%;
		height: auto;
		margin-left: auto;
		margin-right: auto;
	} 
 
 .btns{
 	width: 40%; 
 	height: 30%;
 	font-size: 16px; 
	font-family: 'Sarabun', sans-serif;
 }
 .btns2{
 	width: 40%; 
 	height: 30%;
 	font-size: 16px; 
	font-family: 'Sarabun', sans-serif;
 }
 #label1 {
		font-size: 16px;
		font-family: 'Sarabun', sans-serif;
	}

</style>

</head>
<body style="background: -webkit-linear-gradient(left,#C5E7F1, #79CEED  );">
	<!-- Header section -->
			<jsp:include page="../navbar/navbar.jsp"></jsp:include>
	<!-- Header section end -->
   <div class="container"><br>
   <input type="hidden" id="alertEditProfile" value="${message1}">
   	<div class="shadow p-3 mb-5 bg-white rounded">
		<%if(user.getLoginType().equals("ลูกค้า") || user.getLoginType().equals("ผู้ดูแลระบบ")){ %> 
			<form action="${pageContext.request.contextPath}/getEditProfileData" method="post" >
				<input type="hidden" name="typeAccount" value="1">	
				<%for (Customer c : cus) {%>
				 <div class="form-row">
				 	<input type="hidden" name="memberid" value="<%= c.getMemberid()%>" >
	    				<div class="form-group col-md-6">
			    			<label for="username" id="label1"><i class='fas fa-id-card' style='font-size:20px'></i> ชื่อผู้ใช้ :</label><br>
			    			<input type="text"  class=" form-control " disabled="disabled" id="username" name="userid" value="<%= user.getUsername()%>"  onkeyup="checkUsername(this)"  >
			   				<label id="showScriptUS" style="font-size: 12px; color: red;"></label><br>
			   				<input type="hidden" name="loginid" value="<%= user.getUsername()%>" >
			    		</div>
			    		<div class="form-group col-md-6"  ><br>
			    			<div style="display: block;" id="editbutton">
	    						<button type="button" class="btn btn-warning btn-lg btns" id="btnCustomer"  onclick="editCustomerdata()" >แก้ไขข้อมูลส่วนตัว</button>
			   	 			</div>
			   	 		</div>
			    	</div>
			    	 <div class="form-row">
	    				<div class="form-group col-md-6">
			    			<label for="password" id="label1"><i class='fas fa-key' style='font-size:20px'></i> รหัสผ่าน :</label><br>
			    			<input type="password" class="form-control disables"  id="password" name="password"  value="<%= user.getPassword() %>" disabled onkeyup="checkPassword(this)">
			    			<label id="showScriptpwd" style="font-size: 12px; color: red;"></label><br>
			    		</div>
	    				<div class="form-group col-md-6">
			    			<label for="passwordconfirm" id="label1"><i class='fas fa-key' style='font-size:20px'></i> ยืนยันรหัสผ่าน :</label><br>
			    			<input type="password" class="form-control"  id="passwordconfirm" name="passwordconfirm" value="<%= user.getPassword()%>" disabled onkeyup="checkPasswordconfirm(this,password)">
			    			<label id="showScriptpwdc" style="font-size: 12px; color: red;"></label><br>
			    		</div>
			    	</div>
			    	<input type="hidden" name="cusid" value="<%= c.getCustomerid()%>">
					<div class="form-row">
	    				<div class="form-group col-md-6">
			    			<label for="fname" id="label1"><i class='fas fa-user-alt' style='font-size:20px'></i> ชื่อจริง :</label><br>
			    			<input type="text" class="form-control"  id="fname" name="fnames" value="<%= c.getFirsName()%>" disabled onkeyup="FName(this)">
			    			<label id="showScriptFname" style="font-size: 12px; color: red;"></label><br>
			    		</div>
	    				<div class="form-group col-md-6">
			    			<label for="lname" id="label1"><i class='fas fa-user-alt' style='font-size:20px'></i> นามสกุล:</label><br>
			    			<input type="text" class="form-control"  id="lname" name="lnames" value="<%= c.getLastName() %>" disabled onkeyup="LName(this)">
							<label id="showScriptLname" style="font-size: 12px; color: red;"></label><br>
			    		</div>
			    	</div>
			    	<div class="form-row">
	   					<div class="form-group col-md-6">
	   							 	<%
										SimpleDateFormat df = new SimpleDateFormat("dd/MM/yyyy") ;
									%>
			    			<label for="birthday" id="label1"><i class="fa fa-calendar" style="font-size:20px"></i> วัน /เดือน /ปีเกิด :</label><br>
			  				 <input  class="input-medium form-control" type="text" name="brithday" id="datepicker" 
                				data-provide="datepicker" data-date-language="th-th" placeholder="วว/ดด/ปปปป" value="<%=df.format( c.getBirthDay()) %>" disabled
                				 onchange="checkbrithday(this)">
                			 <label id="showScriptDate" style="font-size: 12px; color: red;"></label><br>  
			    		</div>
	    				<div class="form-group col-md-6">
			    			<label for="tel" id="label1"><i class='fas fa-phone-alt' style='font-size:20px'></i> เบอร์โทรศัพท์ :</label><br>
			    			<input type="tel" class="form-control"  id="tel" name="tel" value="<%= c.getTel() %>" disabled onkeyup="checkTelPerson(this)">
			    			<label id="showScriptTel" style="font-size: 12px; color: red;"></label><br>
			    		</div>
			    	</div>
			    	<div class="form-row">
	    				<div class="form-group col-md-6">
			    			<label for="email" id="label1"><i class="fa fa-envelope-o" style='font-size:20px'></i> อีเมล์ :</label><br>
			   				<input type="email" class="form-control" id="email" name="email" value="<%= c.getEmail() %>" disabled onkeyup="CheckEmail(this)">
			   				<label id="showScriptEmail" style="font-size: 12px; color: red;"></label><br>
			    		</div>
			    	
	    				<div class="form-group col-md-6">
			    			 <label for="address" id="label1"><i class="fas fa-home fa-lg fa-fw" aria-hidden="true"></i> ที่อยู่ :</label><br>
			   				 <input type="text" class="form-control" id="address" name="address" value="<%= c.getAddress() %>" disabled onkeyup="CheckAddress(this)">
			   				 <label id="showScriptAddress" style="font-size: 12px; color: red;"></label><br>
			    		</div>
			    	</div>
			    	<div class="form-row">
				    	<div class="form-group col-md-6">
				    		<label for="subdistrict" id="label1"><i class="fas fa-home fa-lg fa-fw" aria-hidden="true"></i> ตำบล/แขวง :</label><br>
				    		<input type="text" class="form-control" name="subDistrict"  id="district" value="<%= c.getSubDistrict() %>" disabled onkeyup="CheckSubdistrict(this)">
							<label id="showScriptSubD" style="font-size: 12px; color: red;"></label><br>
				    	</div>
	    				<div class="form-group col-md-6">
	    				 	<label for="district" id="label1"><i class="fas fa-home fa-lg fa-fw" aria-hidden="true"></i> อำเภอ/เขต :</label><br>
	    					 <input type="text" id="amphoe" name="district" class="form-control" value="<%= c.getDistrict() %>" disabled onchange="Checkdistrict2(this)" onkeyup="Checkdistrict(this)">
	    				 	<label id="showScriptDtt" style="font-size: 12px; color: red;"></label><br>	    			  
			    		</div>
	    		  	</div>
			    	<div class="form-row">
			    		<div class="form-group col-md-6">
	      					<label for="province" id="label1"><i class="fas fa-home fa-lg fa-fw" aria-hidden="true"></i> จังหวัด :</label><br>
	      					<input type="text" id="province" name="province" class="form-control" value="<%= c.getProvince() %>" disabled onchange="CheckProvince2(this)" onkeyup="CheckProvince(this)">
	      					<label id="showScriptPvn" style="font-size: 12px; color: red;"></label><br>
			    		</div>
	    				<div class="form-group col-md-6">
			    			<label for="postcode" id="label1"><i class="fas fa-home fa-lg fa-fw" aria-hidden="true"></i> รหัสไปษณีย์ :</label><br>
			    			<input type="text" class="form-control" id="zipcode" name="postcode" value="<%= c.getPostcode() %>" disabled onchange="CheckPostcode2(this)" onkeyup="CheckPostcode(this)">
			    			<label id="showScriptPtc" style="font-size: 12px; color: red;"></label><br>
			    		</div>
			    	</div>
			    	<div class="form-row">
			    		<input type="hidden" id="idlalong">
	    				<div class="form-group col-md-4">
			    			<label for="longitude" id="label1"><i class="fas fa-map-marked fa-lg fa-fw" aria-hidden="true"></i> ละติจุด :</label><br>
			    			<input type="text" class="form-control" id="latitude" name="latitude" value="<%= c.getLatitude() %>" disabled>
			    			<input type="hidden" id="latitude" name="latitude01" value="<%= c.getLatitude() %>">
			    			<label id="showScriptLgt" style="font-size: 12px; color: red;" ></label><br>
			    		</div>
			    		<div class="form-group col-md-4">
			    			<label for="latitude" id="label1"><i class="fas fa-map-marked fa-lg fa-fw" aria-hidden="true"></i> ลองจิจุด :</label><br>
			    			<input type="text" class="form-control" id="longitude" name="longitude" value="<%= c.getLongitude() %>" disabled>
							<input type="hidden" id="longitude" name="longitude01" value="<%= c.getLongitude() %>">
							<label id="showScriptLtt" style="font-size: 12px; color: red;"></label><br>
			    		</div>
			    	</div>
			    			<div class="form-group"   id="map"  style="height: 100vh; display: none;">
							</div>
							<div class="form-group">
									<input type="hidden"  name="registerDate" value="${localdate}">
							</div><br>
				
					<div class="col-md-12 text-center" style="display: none;" id="divButton">
							
			    			<button type="submit" class="btn btn-warning btn-lg btns2" onclick="CheckSubmitToCustomer()" >ยืนยัน</button>
							<a href="${pageContext.request.contextPath}/goEditProfile">
								<button type="button" class="btn btn-success btn-lg btns2" >ยกเลิก</button>
							</a>
			    	</div>
			    <%} %>
			</form>
		<%}else if(providertype.equals("บุคคล") ) {%> 
	<!-- Form Register Input for Service Person -->
		<div id="personInput">
			<form name="frm"  method="post"  enctype="multipart/form-data"  action="${pageContext.request.contextPath}/getEditProfileData"
				onsubmit="return CheckSubmitToPerson()" style="padding-bottom: 30px;" >
				<%  List<ServicePerson> sp = (List<ServicePerson>) request.getAttribute("ServicePerson"); %>
<!-- data 0 -->	<input type="hidden" name="typeAccount" value="2">	
				<%for(ServicePerson sps : sp){%>
			    	 <div class="form-row">
	    				<div class="form-group col-md-6">
			    			<label for="username" id="label1"><i class='fas fa-id-card' style='font-size:20px'></i> ชื่อผู้ใช้ :</label><br>
<!-- data 1 -->				<input type="text"  class="form-control"  id="username2" name="username" disabled value="<%= user.getUsername() %>" onkeyup="checkUsername(this)">
			   				<label id="showScriptUS" style="font-size: 12px; color: red;"></label><br>
			    		</div>
			    		<div class="form-group col-md-6"  ><br>
			    			<div style="display: block;" id="editbutton2">
	    						<button type="button" class="btn btn-warning btn-lg btns" id="btnCustomer" onclick="editPersondata()">แก้ไขข้อมูลส่วนตัว</button>
			   	 			</div>
			   	 		</div>
			    	</div>
			    	 <div class="form-row">
	    				<div class="form-group col-md-6">
			    			<label for="password" id="label1"><i class='fas fa-key' style='font-size:20px'></i> รหัสผ่าน :</label><br>
<!-- data 2 -->	   			<input type="password" class="form-control"  id="password2" name="password" disabled value="<%= user.getPassword() %>" onkeyup="checkPassword(this)">
			    			<label id="showScriptpwd" style="font-size: 12px; color: red;"></label><br>
			    		</div>
	    				<div class="form-group col-md-6">
			    			<label for="passwordconfirm" id="label1"><i class='fas fa-key' style='font-size:20px'></i> ยืนยันรหัสผ่าน :</label><br>
<!-- data 3 -->	   			<input type="password" class="form-control"  id="passwordconfirm2" name="passwordconfirm" disabled value="<%= user.getPassword() %>" onkeyup="checkPasswordconfirm(this,password)">
			    			<label id="showScriptpwdc" style="font-size: 12px; color: red;"></label><br>
			    		</div>
			    	</div>
			    	<div class="form-row">
	    				<div class="form-group col-md-6">
			    			<label for="fname" id="label1"><i class='fas fa-user-alt' style='font-size:20px'></i> ชื่อจริง :</label><br>
<!-- data 4 -->	   			<input type="text" class="form-control"  id="fname2" name="fname" value="<%= sps.getFirstName()%>"disabled onkeyup="FName(this)">
			    			<label id="showScriptFname" style="font-size: 12px; color: red;"></label><br>
			    		</div>
	    				<div class="form-group col-md-6">
			    			<label for="lname" id="label1"><i class='fas fa-user-alt' style='font-size:20px'></i> นามสกุล :</label><br>
<!-- data 5 -->	   			<input type="text" class="form-control"  id="lname2" name="lname" value="<%= sps.getLastName()%>" disabled onkeyup="LName(this)">
							<label id="showScriptLname" style="font-size: 12px; color: red;"></label><br>
			    		</div>
			    	</div>
			    	<div class="form-row">
	   					<div class="form-group col-md-6">
	   						<%
										SimpleDateFormat df = new SimpleDateFormat("dd/MM/yyyy") ;
							%>
			    			<label for="birthday" id="label1"><i class="fa fa-calendar" style="font-size:20px"></i> วัน /เดือน /ปีเกิด :</label><br>
<!-- data 6 -->				  <input  class="input-medium form-control" type="text" name="brithday" id="datepicker2" disabled value="<%= df.format(sps.getBirthday())%>"
                				data-provide="datepicker" data-date-language="th-th"
                				placeholder="วว/ดด/ปปปป" onchange="checkbrithday(this)"><br> 
                				
			    		</div>
	    				<div class="form-group col-md-6">
			    			<label for="tel" id="label1"><i class='fas fa-phone-alt' style='font-size:20px'></i> เบอร์โทรศัพท์ :</label><br>
<!-- data 7 -->	   			<input type="tel" class="form-control"  id="tel2" name="tel"  value="<%= sps.getTel()%>" disabled onkeyup="checkTelPerson(this)">
			    			<label id="showScriptTel" style="font-size: 12px; color: red;"></label><br>
			    		</div>
			    	</div>
			    	<div class="form-row">
	    				<div class="form-group col-md-6">
			    			<label for="email" id="label1"><i class="fa fa-envelope-o" style='font-size:20px'></i> อีเมล์ :</label><br>
<!-- data 8 -->				<input type="email" class="form-control" id="email2" name="email" value="<%= sps.getEmail()%>" disabled onkeyup="CheckEmail(this)">
			   				<label id="showScriptEmail" style="font-size: 12px; color: red;"></label><br>
			    		</div>
	    				<div class="form-group col-md-6">
			    			 <label for="address" id="label1"><i class="fas fa-home fa-lg fa-fw" aria-hidden="true"></i> ที่อยู่ :</label><br>
<!-- data 9 -->				 <input type="text" class="form-control" id="address2" name="address" value="<%= sps.getAddress()%>" disabled onkeyup="CheckAddress(this)">
			   				 <label id="showScriptAddress" style="font-size: 12px; color: red;"></label><br>
			    		</div>
			    	</div>
			    	<div class="form-row">
				    	<div class="form-group col-md-6">
				    		<label for="subdistrict" id="label1"><i class="fas fa-home fa-lg fa-fw" aria-hidden="true"></i> ตำบล/แขวง :</label><br>
<!-- data 10 -->    		<input type="text" name="subDistrict" class="form-control" id="district" value="<%= sps.getSubDistrict()%>" disabled onkeyup="CheckSubdistrict(this)">
							<label id="showScriptSubD" style="font-size: 12px; color: red;"></label><br>  
				    	</div>
	    				<div class="form-group col-md-6">
	    				 	<label for="district" id="label1"><i class="fas fa-home fa-lg fa-fw" aria-hidden="true"></i> อำเภอ/เขต :</label><br>
<!-- data 11 -->		 	<input type="text" id="amphoe" name="district" class="form-control" value="<%= sps.getDistrict()%>" disabled onchange="Checkdistrict2(this)" onkeyup="Checkdistrict(this)">
	    				 	<label id="showScriptDtt" style="font-size: 12px; color: red;"></label><br>
			    		</div>
			    	</div>
			    	<div class="form-row">
			    		<div class="form-group col-md-6">
	      					<label for="province" id="label1"><i class="fas fa-home fa-lg fa-fw" aria-hidden="true"></i> จังหวัด :</label><br>
<!-- data 12 -->			<input type="text" id="province" name="province" class="form-control" value="<%= sps.getProvince()%>" disabled onchange="CheckProvince2(this)" onkeyup="CheckProvince(this)">
	      					<label id="showScriptPvn" style="font-size: 12px; color: red;"></label><br>
			    		</div>
	    				<div class="form-group col-md-6">
			    			<label for="postcode" id="label1"><i class="fas fa-home fa-lg fa-fw" aria-hidden="true"></i> รหัสไปษณีย์ :</label><br>
<!-- data 13 -->			<input type="text" class="form-control" id="zipcode" name="postcode" value="<%= sps.getPostcode()%>" disabled onchange="CheckPostcode2(this)" onkeyup="CheckPostcode(this)">
			    			<label id="showScriptPtc" style="font-size: 12px; color: red;"></label><br>
			    		</div>
			    	</div>
			    	<div class="form-row">
	    				<div class="form-group col-md-4">
			    			<label for="subdistrict" id="label1"><i class="fas fa-map-marked fa-lg fa-fw" aria-hidden="true"></i> ละติจุด :</label><br>
<!-- data 14 -->			<input type="text" class="form-control" id="latitude" name="latitude" disabled value="<%= sps.getLatitude()%>"><br>
			    		</div>
			    		<div class="form-group col-md-4">
			    			<label for="subdistrict" id="label1"><i class="fas fa-map-marked fa-lg fa-fw" aria-hidden="true"></i> ลองจิจุด :</label><br>
<!-- data 15 -->			<input type="text" class="form-control" id="longitude" name="longitude" disabled value="<%= sps.getLongitude()%>"><br>
			    		</div>
			    	</div>
			    		<div class="form-group" id="map" style="height: 100vh; display:none; ">
						</div>
						<div class="form-group">
<!-- data 16 -->			<input type="hidden" name="registerDate" value="${localdate}">
						</div>
					<div class="form-row">
	<!--************** couple Photo Cards ************* -->
						<div class="form-group col-md-5" >
							<div id="showcpcimg1" style="display: none;">
<!-- data 17 -->				<input type="file" id="couplePhotoCards" name="couplePhotoCards" class="custom-file-input"  onchange="fileName(this)">
									 <label class="custom-file-label" for="filepicture" style="font-size: 16px;">
									 	<i class='far fa-file-image' style='font-size:20px'></i> รูปถ่ายคู่บัตรประชาชน :
									 	<span  style="font-family: 'Prompt', sans-serif;color: gray;"> (รูปภาพ ) </span>
									</label>
								<div id="showcpc"></div>
							</div><br><br>
							<div id="showcpcimg2" style="display: block;">
								<label for="filepicture" style="font-size: 16px;">
							 		<i class='far fa-file-image' style='font-size:20px'></i> รูปถ่ายคู่บัตรประชาชน :
							 		<span  style="font-family: 'Prompt', sans-serif;color: gray;"> (รูปภาพ ) </span>
								</label>
								<img alt="#" src="${pageContext.request.contextPath}/CPCards/<%= sps.getCouplePhotoidCards()%>" class="img-thumbnail"  width="300"  height="250">
							</div>
						</div>
						<div class="form-group col-s-1 ">
						</div>
	<!--************** id Cards Photo ************* -->
						<div class="form-group col-md-6">
							<div  id="showicpimg1" style="display: none;">
<!-- data 18 -->				<input type="file" id="idCardsPhoto" name="idCardsPhoto" value="<%= sps.getIdCardsPhoto()%>" onchange="fileName(this)" class="custom-file-input" >
									 <label class="custom-file-label" for="filepicture" style="font-size: 16px;">
									 	<i class='far fa-file-image' style='font-size:20px'></i>  เอกสารบัตรประชาชน :
									 	<span  style="font-family: 'Prompt', sans-serif;color: gray;"> (รูปภาพ) </span>
									</label>
								<div id="showicp"></div>
							</div><br><br>
							<div id="showicpimg2" style="display:block;">
								 <label  for="filepicture" style="font-size: 16px;">
								 	<i class='far fa-file-image' style='font-size:20px'></i>  เอกสารบัตรประชาชน :
								 	<span  style="font-family: 'Prompt', sans-serif;color: gray;"> (รูปภาพ) </span>
								</label>
								<img alt="#" src="${pageContext.request.contextPath}/idCPhoto/<%= sps.getIdCardsPhoto()%>" class="img-thumbnail" width="300"  height="250">
							</div>
						</div>
					</div>
<!--************** profile Photo Person ************* -->
					<div class="form-row">
				    	<div class="form-group col-md-5" >
				    		<div id="showpppimg1" style="display:none;">
<!-- data 19 -->				<input type="file" id="profilePhotoPerson" name="profilePhoto"  value="<%= sps.getProfilePhoto()%>" onchange="fileName(this)" class=" custom-file-input" >
								 <label class="custom-file-label" for="filepicture" style="font-size: 16px;">
								 	<i class='far fa-file-image' style='font-size:20px'></i> รูปโปรไฟล์ :
								 	<span  style="font-family: 'Prompt', sans-serif;color: gray;"> (รูปภาพ) </span>
								</label>
								<div id="profilepersonimg" ></div>
							</div><br><br>
							<div id="showpppimg2" style="display:block;">
								<label  for="filepicture" style="font-size: 16px;">
									 	<i class='far fa-file-image' style='font-size:20px'></i> รูปโปรไฟล์ :
									 	<span  style="font-family: 'Prompt', sans-serif;color: gray;"> (รูปภาพ) </span>
								</label>
								<img alt="#" src="${pageContext.request.contextPath}/PImgPerson/<%= sps.getProfilePhoto()%>" class="img-thumbnail" width="300"  height="250">
							</div>
						</div>
					</div>	
			    	
	    				<div class="col-md-12 text-center" id="divButton2" style="display: none;">
			    			<button type="submit" class="btn btn-warning btn-lg btns2" >ยืนยัน</button>
						<a href="${pageContext.request.contextPath}/goEditProfile">
			    			<button type="button" class="btn btn-success btn-lg btns2" >ยกเลิก</button>
			    		</a>
			    		</div><br>
			    		 <%session.setAttribute("ServicePerson", sp); %>
			    	</form>
				</div>
			   <% } %>
	<%}else if(providertype.equals("บริษัท")){ %>
<!--===================  Form Register Input for Company ==========================-->
		<div id="compamyInput" >
			<form name="frm"  method="post" enctype="multipart/form-data" action="${pageContext.request.contextPath}/getEditProfileData" 
				onsubmit="return CheckSubmitToCompany()" style="padding-bottom: 30px;" >
				<%  List<Company> cp = (List<Company>) request.getAttribute("Company"); %>
<!-- data 0 -->	<input type="hidden" name="typeAccount" value="3">	
				<%for(Company com : cp) {%>
			    	 <div class="form-row">
	    				<div class="form-group col-md-6">
			    			<label for="username" id="label1"><i class='fas fa-user-alt' style='font-size:20px'></i>ชื่อผู้ใช้ :</label><br>
<!-- data 1 -->				<input type="text"  class="form-control"  id="username3" name="username" disabled value="<%= user.getUsername()  %>" onkeyup="checkUsername(this)">
			   				<label id="showScriptUS" style="font-size: 12px; color: red;"></label><br>
			    		</div>
			    		<div class="form-group col-md-6"  ><br>
			    			<div style="display: block;" id="editbutton3">
	    						<button type="button" class="btn btn-warning btn-lg btns" id="btnCustomer" onclick="editCompanydata()">แก้ไขข้อมูลส่วนตัว</button>
			   	 			</div>
			   	 		</div>
			    	</div>
			    	 <div class="form-row">
	    				<div class="form-group col-md-6">
			    			<label for="password" id="label1"><i class='fas fa-key' style='font-size:20px'></i> รหัสผ่าน :</label><br>
<!-- data 2 -->   			<input type="password" class="form-control"  id="password3" name="password" disabled value="<%= user.getPassword()  %>" onkeyup="checkPassword(this)">
			    			<label id="showScriptpwd" style="font-size: 12px; color: red;"></label><br>
			    		</div>
	    				<div class="form-group col-md-6">
			    			<label for="passwordconfirm" id="label1"><i class='fas fa-key' style='font-size:20px'></i> ยืนยันรหัสผ่าน :</label><br>
<!-- data 3 -->    			<input type="password" class="form-control"  id="passwordconfirm3" disabled name="passwordconfirm" value="<%= user.getPassword()  %>" onkeyup="checkPasswordconfirm(this,password)">
			    			<label id="showScriptpwdc" style="font-size: 12px; color: red;"></label><br>
			    		</div>
			    	</div>
			    	<div class="form-row">
	    				<div class="form-group col-md-6">
			    			<label for="fname" id="label1"><i class='fas fa-building' style='font-size:24px'></i> ชื่อบริษัท :</label><br>
<!-- data 4 -->    			<input type="text" class="form-control"  id="companyName" name="companyName" disabled value="<%= com.getCompanyName() %>" onkeyup="checkCompanyName(this)">
			   				<label id="showScriptcompanyName" style="font-size: 12px; color: red;"></label><br>
			    		</div>
	    				<div class="form-group col-md-6">
			    			<label for="lname" id="label1"><i class='fas fa-user-alt' style='font-size:20px'></i> ชื่อผู้ติดต่อ :</label><br>
<!-- data 5 -->    			<input type="text" class="form-control"  id="contactName" name="contactName" disabled value="<%= com.getContactName() %>" onkeyup="checkContactName(this)">
			   				<label id="showScriptcontactName" style="font-size: 12px; color: red;"></label><br>
			    		</div>
			    	</div>
			    	<div class="form-row">
	   					<div class="form-group col-md-6">
			    			<label for="fdFanpage" id="label1"><i class='fab fa-facebook-square' style='font-size:20px'></i> ชื่อเฟสบุ๊คแฟนเพจ :</label><br>
<!-- data 6 -->				<input type="text" class="form-control"  id="fdFanpage" name="fdFanpage" disabled value="<%= com.getFacebookFanpage() %>" onkeyup="checkfdFanpage(this)">
			   				<label id="showScriptfdFanpage" style="font-size: 12px; color: red;"></label><br>
			    		</div>
	    				<div class="form-group col-md-6">
			    			<label for="fdFanpage" id="label1"><i class='fab fa-facebook-square' style='font-size:20px'></i> เฟสบุ๊คแฟนเพจ (URL) :</label><br>
<!-- data 7 -->    			<input type="text" class="form-control"  id="fdFanpageURL" name="fdFanpageURL" placeholder="-" disabled value="<%= com.getFacebookFanpageURL() %>" onkeyup="checkfdFanpageURL(this)">
			   				<label id="showScriptfdFanpageURL" style="font-size: 12px; color: red;"></label><br>
			    		</div>
			    	</div>
			    	<div class="form-row">
	   					<div class="form-group col-md-6">
			    			<label for="fdFanpage" id="label1"><i class='fas fa-globe' style='font-size:20px'></i> ชื่อเว็บไซต์ :</label><br>
<!-- data 8 -->				<input type="text" class="form-control"  id="webSite" name="webSite" disabled value="<%=  com.getWebSite() %>" onkeyup="checkWebSite(this)">
			   				<label id="showScriptwebSite" style="font-size: 12px; color: red;"></label><br>
			    		</div>
	    				<div class="form-group col-md-6">
			    			<label for="fdFanpage" id="label1"><i class='fas fa-globe' style='font-size:20px'></i> เว็บไซต์  (URL):</label><br>
<!-- data 9 -->    			<input type="text" class="form-control"  id="webSiteURL" name="webSiteURL" placeholder="-" disabled value="<%=  com.getWebSiteURL() %>" onkeyup="checkWebSiteURL(this)">
			   				<label id="showScriptwebSiteURL" style="font-size: 12px; color: red;"></label><br>
			    		</div>
			    	</div>
			    	<div class="form-row">
			    		<div class="form-group col-md-6">
			    			<i class='fas fa-phone-alt' style='font-size:24px'></i>
			    			<label for="tel" id="label1">เบอร์โทรศัพท์ :</label><br>
<!-- data 10 -->    			<input type="tel" class="form-control"  id="tel3" name="tel" disabled value="<%= com.getTel() %>" onkeyup="checkTelCompany(this)">
			    			<label id="showScriptTelCom" style="font-size: 12px; color: red;"></label><br>
			    		</div>
	    				<div class="form-group col-md-6">
			    			<label for="email" id="label1"><i class="fa fa-envelope-o" style='font-size:20px'></i> อีเมล์ :</label><br>
<!-- data 11 --> 			<input type="email" class="form-control" id="email3" name="email" disabled value="<%= com.getEmail() %>" onkeyup="CheckEmail(this)">
			   				<label id="showScriptEmail" style="font-size: 12px; color: red;"></label><br>
			    		</div>
			    	</div>
	    				<div class="form-group ">
			    			 <label for="address" id="label1"><i class="fas fa-home fa-lg fa-fw" aria-hidden="true"></i> ที่อยู่ :</label><br>
<!-- data 12 --> 			 <input type="text" class="form-control" id="address3" name="address" disabled value="<%= com.getAddress() %>" onkeyup="CheckAddress(this)">
			   				 <label id="showScriptAddress" style="font-size: 12px; color: red;"></label><br>
			    		</div>
			    	<div class="form-row">
				    	<div class="form-group col-md-6">
				    		<label for="subdistrict" id="label1"><i class="fas fa-home fa-lg fa-fw" aria-hidden="true"></i> ตำบล/แขวง :</label><br>
<!-- data 13 -->     		<input type="text" name="subDistrict" class="form-control" id="district" disabled value="<%= com.getSubDistrict() %>" onkeyup="CheckSubdistrict(this)">
							<label id="showScriptSubD" style="font-size: 12px; color: red;"></label><br>	    			   
				    	</div>
	    				<div class="form-group col-md-6">
	    					<label for="district" id="label1"><i class="fas fa-home fa-lg fa-fw" aria-hidden="true"></i> อำเภอ/เขต :</label><br>
<!-- data 14 --> 		 	<input type="text" id="amphoe" name="district" class="form-control" disabled value="<%= com.getDistrict() %>" onchange="Checkdistrict2(this)" onkeyup="Checkdistrict(this)">
	    					 <label id="showScriptDtt" style="font-size: 12px; color: red;"></label><br>
			    		</div>
			    	</div>
			    	<div class="form-row">
			    		<div class="form-group col-md-6">
	      					<label for="province" id="label1"><i class="fas fa-home fa-lg fa-fw" aria-hidden="true"></i> จังหวัด :</label><br>
<!-- data 15 --> 			<input type="text" id="province" name="province" class="form-control" disabled value="<%= com.getProvince() %>" onchange="CheckProvince2(this)" onkeyup="CheckProvince(this)">
	      					<label id="showScriptPvn" style="font-size: 12px; color: red;"></label><br>
			    		</div>
	    				<div class="form-group col-md-6">
			    			<label for="postcode" id="label1"><i class="fas fa-home fa-lg fa-fw" aria-hidden="true"></i> รหัสไปษณีย์ :</label><br>
<!-- data 16 -->   			<input type="text" class="form-control" id="zipcode" name="postcode" disabled value="<%= com.getPostcode() %>"  onchange="CheckPostcode2(this)" onkeyup="CheckPostcode(this)">
			    			<label id="showScriptPtc" style="font-size: 12px; color: red;"></label><br>
			    		</div>
			    	</div>
			    	<div class="form-row">
	    				<div class="form-group col-md-4">
			    			<label for="subdistrict" id="label1"><i class="fas fa-map-marked fa-lg fa-fw" aria-hidden="true"></i> ละติจุด :</label><br>
<!-- data 17 -->   			<input type="text" class="form-control" id="latitude" name="latitude" disabled value="<%= com.getLatitude() %>"><br>
			    		</div>
			    		<div class="form-group col-md-4">
			    			<label for="subdistrict" id="label1"><i class="fas fa-map-marked fa-lg fa-fw" aria-hidden="true"></i> ลองจิจุด :</label><br>
<!-- data 18 -->   			<input type="text" class="form-control" id="longitude" name="longitude" disabled value="<%= com.getLongitude() %>"><br>
			    		</div>
			    	</div>
			    		<div class="form-group" id="map"  style="height: 100vh; display:none;" >
						</div>
						<div class="form-group">
<!-- data 19 --> 			<input type="hidden" name="registerDate" value="${localdate}">
						</div> 
				
			    	<div class="form-row">
	<!--************** business License************* -->
						<div class="form-group col-md-5" >
							<div id="showbnlnimg1" style="display: none;">
<!-- data 20 --> 				<input type="file" id="businessLicense" name="businessLicense" class="custom-file-input" value="<%= com.getBusinessLicense()%>"  onchange="fileName(this)">
									 <label class="custom-file-label" for="filepicture" style="font-size: 16px;">
									 	<i class='far fa-file-image' style='font-size:20px'></i> ใบอนุญาตประกอบธุรกิจ :
									 	<span  style="font-family: 'Prompt', sans-serif;color: gray;"> (รูปภาพ ) </span>
									</label>
								<div id="showdls"></div>
							</div><br><br>
							<div id="showbnlnimg2" style="display: block;">
								<label for="filepicture" style="font-size: 16px;">
							 		<i class='far fa-file-image' style='font-size:20px'></i> ใบอนุญาตประกอบธุรกิจ :
							 		<span  style="font-family: 'Prompt', sans-serif;color: gray;"> (รูปภาพ ) </span>
								</label>
								<img alt="#" src="${pageContext.request.contextPath}/businessLicense/<%= com.getBusinessLicense()%>" class="img-thumbnail"  width="300"  height="250">
							</div>
						</div>
						<div class="form-group col-s-1 ">
						</div>
	<!--************** profile company ************* -->
						<div class="form-group col-md-5">
							<div  id="showpfpimg1" style="display: none;">
<!-- data 21 --> 				<input type="file" id="profilecompany" name="profilePhoto"  onchange="fileName(this)" class="custom-file-input" value="<%= com.getProfilePhoto()%>" >
									 <label class="custom-file-label" for="filepicture" style="font-size: 16px;">
									 	<i class='far fa-file-image' style='font-size:20px'></i> รูปโปรไฟล์ :
									 	<span  style="font-family: 'Prompt', sans-serif;color: gray;"> (รูปภาพ) </span>
									</label>
								<div id="profileComimg"></div>
							</div><br><br>
							<div id="showpfpimg2" style="display:block;">
								 <label  for="filepicture" style="font-size: 16px;">
								 	<i class='far fa-file-image' style='font-size:20px'></i>  รูปโปรไฟล์ :
								 	<span  style="font-family: 'Prompt', sans-serif;color: gray;"> (รูปภาพ) </span>
								</label>
								<img alt="#" src="${pageContext.request.contextPath}/PImgCompany/<%= com.getProfilePhoto()%>" class="img-thumbnail" width="300"  height="250">
							</div>
						</div>
					</div>
	    				<div class="col-md-12 text-center" style="display: none;" id="divButton3">
			    			<button type="submit" class="btn btn-warning btn-lg btns2" >ยืนยัน</button>
						<a href="${pageContext.request.contextPath}/goEditProfile">
			    			<button type="button" class="btn btn-success btn-lg btns2">ยกเลิก</button>
			    		</a>
			    		</div><br>
			    <%} %>
			    <%session.setAttribute("Company", cp); %>
			<%} %>
			</form>
			</div>
	</div>
</div>

</body>
	<!-- FOOTER -->
		<jsp:include page="../footer/footer.jsp"></jsp:include>
	<!-- END FOOTER -->
	  <!-- import jquery JS -->
	  
	  <!-- Import link and script form Bootstrap --> 
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
	  
        <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
        <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    <!-- select file java Script -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.4/jquery.min.js"></script>
    <script src="//getbootstrap.com/2.3.2/assets/js/jquery.js"></script>
    <script src="//getbootstrap.com/2.3.2/assets/js/google-code-prettify/prettify.js"></script>
  <script src="/ServiceCleaner_5938/js/bootstrap-datepicker.js"></script>
    <script src="/ServiceCleaner_5938/js/bootstrap-datepicker-thai.js"></script>
    <script src="/ServiceCleaner_5938/js/locales/bootstrap-datepicker.th.js"></script>
<!-- code address -->
<script type="text/javascript" src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script type="text/javascript" src="https://earthchie.github.io/jquery.Thailand.js/jquery.Thailand.js/dependencies/JQL.min.js"></script>
<script type="text/javascript" src="https://earthchie.github.io/jquery.Thailand.js/jquery.Thailand.js/dependencies/typeahead.bundle.js"></script>
<link rel="stylesheet" href="https://earthchie.github.io/jquery.Thailand.js/jquery.Thailand.js/dist/jquery.Thailand.min.css">
<script type="text/javascript" src="https://earthchie.github.io/jquery.Thailand.js/jquery.Thailand.js/dist/jquery.Thailand.min.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
	var a = document.getElementById("alertEditProfile").value;
		if(a == "1"){
			alert("แก้ไขข้อมูลเสร็จสิ้น");
		}else if(a == "2"){
			alert("แก้ไขข้อมูลล้มเหลว กรุณาทำการแก้ไขข้อมูลอีกครั้งในภายหลัง");
		}
	});
</script>
<script type="text/javascript">
/* File Up Load of Person */
 function businessLicenseImg() {
		  var $cpc = $('#showcpc').empty();
		  if (this.files) $.each(this.files, readAndPreview);

		  function readAndPreview(i, file) {
		    
		    if (!/\.(jpe?g|png)$/i.test(file.name)){
		      return alert(file.name +" is not an image");
		    } // else...
		    var reader = new FileReader();
		    $(reader).on("load", function() {
		      $cpc.append($("<img /> ", {src:this.result, height:100}));
		    });
		    reader.readAsDataURL(file);
		  }
		}
	$('#couplePhotoCards').on("change", businessLicenseImg);
 
function idCardsPhotoPerson() {
	  var $icp = $('#showicp').empty();
	  if (this.files) $.each(this.files, readAndPreview);

	  function readAndPreview(i, file) {
	    
	    if (!/\.(jpe?g|png)$/i.test(file.name)){
	      return alert(file.name +" is not an image");
	    } // else...
	    
	    var reader = new FileReader();

	    $(reader).on("load", function() {
	      $icp.append($("<img /> ", {src:this.result, height:100}));
	    });
	    reader.readAsDataURL(file);
	  }
	}

	$('#idCardsPhoto').on("change", idCardsPhotoPerson);

	function profileperson() {
		  var $preview = $('#profilepersonimg').empty();
		  if (this.files) $.each(this.files, readAndPreview);

		  function readAndPreview(i, file) {
		    
		    if (!/\.(jpe?g|png)$/i.test(file.name)){
		      return alert(file.name +" is not an image");
		    } // else...
		    
		    var reader = new FileReader();

		    $(reader).on("load", function() {
		      $preview.append($("<img /> ", {src:this.result, height:100}));
		    });
		    reader.readAsDataURL(file);
		  }
		}

		$('#profilePhotoPerson').on("change", profileperson);
</script>
<script type="text/javascript">
/* File Up Load of Company */
 function businessLicenseImg() {
		  var $bls = $('#showdls').empty();
		  if (this.files) $.each(this.files, readAndPreview);

		  function readAndPreview(i, file) {
		    
		    if (!/\.(jpe?g|png)$/i.test(file.name)){
		      return alert(file.name +" is not an image");
		    } // else...
		    var readercom = new FileReader();
		    $(readercom).on("load", function() {
		      $bls.append($("<img /> ", {src:this.result, height:100}));
		    });
		    readercom.readAsDataURL(file);
		  }
		}
	$('#businessLicense').on("change", businessLicenseImg);
 
function profilecompany() {
	  var $preview = $('#profileComimg').empty();
	  if (this.files) $.each(this.files, readAndPreview); 

	  function readAndPreview(i, file) {
	    
	    if (!/\.(jpe?g|png)$/i.test(file.name)){
	      return alert(file.name +" is not an image");
	    } // else...
	    
	    var reader = new FileReader();

	    $(reader).on("load", function() {
	      $preview.append($("<img /> ", {src:this.result, height:100}));
	    });
	    reader.readAsDataURL(file);
	  }
	}

	$('#profilecompany').on("change", profilecompany);

</script>
<script type="text/javascript">

$.Thailand.setup({
   /*  database: './jquery.Thailand.js/database/db.json' */
    database: '/ServiceCleaner_5938/db/db.json'

});

$.Thailand({
    $district: $('#district'), // input ของตำบล
    $amphoe: $('#amphoe'), // input ของอำเภอ
    $province: $('#province'), // input ของจังหวัด
    $zipcode: $('#zipcode'), // input ของรหัสไปรษณีย์
});

// ไม่ต้องกำหนด path ของ database ซ้ำ
$.Thailand({
    $search: $('#demo1 [name="search"]'),
    onDataFill: function(data){
        console.log(data)
    }
});

// ไม่ต้องกำหนด path ของ database ซ้ำเช่นกัน
$.Thailand({
    $search: $('#demo2 [name="search"]'),
    onDataFill: function(data){
        console.log(data)
    }
});
</script> 
<!-- latitude-and-longitude -->
	<script src='https://unpkg.com/bootstrap@4.1.0/dist/js/bootstrap.min.js'></script>
	<script src='https://api-maps.thinknet.co.th/libs/thinknetmaps.1.2.0-rc0.min.js'></script>
		
	<script>
	 $("#btnCustomer").click(function(){
		if ( navigator.geolocation ) {
            // ตรงนี้คือรองรับ geolocation
            navigator.geolocation.getCurrentPosition(function(location) {
            	
                var location = location.coords;
                const map = new thinknetmaps.Map({
                    container: 'map', // id ของ div ที่จะให้ map ไป render
                    app_id: 'test-tncnx-7iqgm',
                    api_key: 'YTA2N2YyZjQ0YzlkOTNlOTVhYTFhNGRiNzU3NTIyZTI',
                    center : {
                    	lng: location.longitude,
                    	lat: location.latitude
                    },
                  });
                map.on('load', function() {
                	  map.addMarker({
                	    id: 'bangbon',
                	    lat: location.latitude,
                	    lng: location.longitude,
                	    offset: [0, -10],
                	    draggable: true,
                	    onDragEnd: function(e) {
                	        const {lng, lat} = e.lngLat
                	         $("#latitude").val(""+lat);
                            $("#longitude").val(""+lng);
                	      }
                	  }) 
                	});
                
            }, function() { 
                alert('มีปัญหาในการตรวจหาตำแหน่ง');
            });  
        } else {
            alert('เบราเซอร์นี้ไม่รองรับ geolocation');
        }
		var vs = document.getElementById("zipcode").value;
		if(vs != null){
			maps();
		}

		function maps(){
					 
			$.ajax({
		     		type: "POST",
				    url: "https://api-maps.thinknet.co.th/v1/search/textsearch",
				    data: "app_id=test-tncnx-7iqgm&api_key=YTA2N2YyZjQ0YzlkOTNlOTVhYTFhNGRiNzU3NTIyZTI&keyword="+$("#district").val()+""+$("#amphoe").val()+""+$("#province").val()
				    +""+$("#zipcode").val(),
				 	success: function(msg){
				 	
		            console.log(msg.result[0].name.th+","+msg.result[0].address.tambon.th+","+msg.result[0].address.amphoe.th		
		            +","+msg.result[0].address.province.th+","+msg.result[0].coordinate.lat+","+msg.result[0].coordinate.lng);

		            const map = new thinknetmaps.Map({
	                    container: 'map', // id ของ div ที่จะให้ map ไป render
	                    app_id: 'test-tncnx-7iqgm',
	                    api_key: 'YTA2N2YyZjQ0YzlkOTNlOTVhYTFhNGRiNzU3NTIyZTI',
	                     center : {
	                    	lng: msg.result[0].coordinate.lng ,
	                    	lat: msg.result[0].coordinate.lat
	                    }, 
	                  });  
		             map.on('load', function() { 
	                	  map.addMarker({  
	                	    id: 'bangbon',
	                	    lat: msg.result[0].coordinate.lat, 
	                	    lng: msg.result[0].coordinate.lng, 
	                	    offset: [0, -10],  
	                	    draggable: true, 
	                	    onDragEnd: function(e) { 
	                	        const {lng, lat} = e.lngLat
	                	        /* alert('lat : ' +lat +'lng :'+lng) */
	                	         $("#latitude").val(""+lat);
	                            $("#longitude").val(""+lng);
	                	      }
	                	  }) 
	                	}); 
				 	} 
			}); 
 	}; 
	 });
</script>  
<script>
$(document).ready(function(){
	 $("#zipcode").change(function(){
			$.ajax({
		     		type: "POST",
				    url: "https://api-maps.thinknet.co.th/v1/search/textsearch",
				    data: "app_id=test-tncnx-7iqgm&api_key=YTA2N2YyZjQ0YzlkOTNlOTVhYTFhNGRiNzU3NTIyZTI&keyword="+$("#district").val()+""+$("#amphoe").val()+""+$("#province").val()
				    +""+$("#zipcode").val(),
				 	success: function(msg){
				 	
		            console.log(msg.result[0].name.th+","+msg.result[0].address.tambon.th+","+msg.result[0].address.amphoe.th		
		            +","+msg.result[0].address.province.th+","+msg.result[0].coordinate.lat+","+msg.result[0].coordinate.lng);


		            const map = new thinknetmaps.Map({
	                    container: 'map', // id ของ div ที่จะให้ map ไป render
	                    app_id: 'test-tncnx-7iqgm',
	                    api_key: 'YTA2N2YyZjQ0YzlkOTNlOTVhYTFhNGRiNzU3NTIyZTI',
	                     center : {
	                    	lng: msg.result[0].coordinate.lng ,
	                    	lat: msg.result[0].coordinate.lat 
	                    }, 
	                  });  
		            $("#latitude").val(""+msg.result[0].coordinate.lat);
                 	$("#longitude").val(""+msg.result[0].coordinate.lng );
		             map.on('load', function() { 
		            	 map.addMarker({ 
	                	    id: 'bangbon',
	                	    lat: msg.result[0].coordinate.lat, 
	                	    lng: msg.result[0].coordinate.lng,
	                	    offset: [0, -10], 
	                	    draggable: true,
	                	    onDragEnd: function(e) {
	                	        const {lng, lat} = e.lngLat
	                	        /* alert('lat : ' +lat +'lng :'+lng) */
	                	         $("#latitude").val(""+lat);
	                            $("#longitude").val(""+lng);
	                	      }
	                	  })
	                	}); 
				 	}
			}); 
			
			});
	 if ( navigator.geolocation ) {
           // ตรงนี้คือรองรับ geolocation
           navigator.geolocation.getCurrentPosition(function(location) {
               var location = location.coords;
               /*$("#geo_data").html('lat: '+location.latitude+'<br />long: '+location.longitude+'<br /> altitude: '+location.altitude+'<br /> accuracy: '+location.accuracy+'<br /> altitude accuracy: '+location.altitudeAccuracy+'<br /> heading: '+location.heading+'<br /> speed: '+location.speed);*/
               $("#latitude2").val(""+location.latitude);
               $("#longitude2").val(""+location.longitude);
                
           
           }, function() {
               alert('มีปัญหาในการตรวจหาตำแหน่ง');
           });
       } else {
           alert('เบราเซอร์นี้ไม่รองรับ geolocation');
       }
}); 
	 </script>
<script >
	function checkfdFanpageURL(fn) {
		var inputText = /^[A-Za-z0-9-/_.()-_ก-์- ]+$/ ;
		var inputSize = /^([A-Za-z0-9-/_.()-_ก-์- ]{10,200})?$/ ;
		var inputSize2 = /^[- ]+$/ ;
		 if(!fn.value.match(inputText)){
			fn.style.border = "thick solid #ed3a14";
			document.getElementById("showScriptfdFanpageURL").innerHTML = "+ ต้องเป็นตัวอักษรภาษาอังกฤษ  หรือภาษาไทย หรือตัวเลขอาบิก  และอักขระพิเศษที่กำหนดเท่านั้น[A-Za-z0-9ก-์-  -/_.()-_] ";
		}else if(fn.value.match(inputSize2)){
			fn.style.border = "1px solid #000";
			document.getElementById("showScriptfdFanpageURL").innerHTML = "";
		}else if(!fn.value.match(inputSize)){
			fn.style.border = "thick solid #ed3a14";
			document.getElementById("showScriptfdFanpageURL").innerHTML = "+ มีความยาวตั้งแต่  10 - 200 ตัวอักษร";
		}else{
			fn.style.border = "1px solid #000";
			document.getElementById("showScriptfdFanpageURL").innerHTML = "";
		}
	}
	function checkWebSiteURL(ws) {
		var inputText =  /^[A-Za-z0-9-/_.()-_ก-์- ]+$/ ;
		var inputSize = /^([A-Za-z0-9-/_.()-_ก-์- ]{10,200})?$/ ;
		var inputSize2 = /^[- ]+$/ ;
		if(!ws.value.match(inputText)){
			ws.style.border = "thick solid #ed3a14";
			document.getElementById("showScriptwebSiteURL").innerHTML = "+  ต้องเป็นตัวอักษรภาษาอังกฤษ  หรือภาษาไทย หรือตัวเลขอาบิก  และอักขระพิเศษที่กำหนดเท่านั้น[A-Za-z0-9ก-์-  -/_.()-_] ";
		}else if(ws.value.match(inputSize2)){
			ws.style.border = "1px solid #000";
			document.getElementById("showScriptwebSiteURL").innerHTML = "";
		}else if(!ws.value.match(inputSize)){
			ws.style.border = "thick solid #ed3a14";
			document.getElementById("showScriptwebSiteURL").innerHTML = "+ มีความยาวตั้งแต่  10 - 200 ตัวอักษร";
		}else{
			ws.style.border = "1px solid #000";
			document.getElementById("showScriptwebSiteURL").innerHTML = "";
		}
	}
	</script> 
</html>