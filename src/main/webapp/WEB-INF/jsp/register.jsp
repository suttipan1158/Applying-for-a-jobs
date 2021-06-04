<%@page import="java.text.DateFormat"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	<%@page import="java.util.Date"  %>
	<%@page import="java.text.SimpleDateFormat"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
  <meta name="viewport" content="width=device-width, initial-scale=1">
<!-- MAPS -->
  <link href='https://api-maps.thinknet.co.th/libs/thinknetmaps.1.2.0-rc0.min.css' rel='stylesheet' />
 
<!-- import icon -->
 	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
	
<!-- เลือกใช้ไฟล์ css ของ register.css -->
  		<link rel="stylesheet" type="text/css" href="/ServiceCleaner_5938/css/register2.css">
  		<link rel="stylesheet" type="text/css" href="/ServiceCleaner_5938/css/datepicker.css">
  

	    
  	<link href="https://fonts.googleapis.com/css2?family=Sarabun:ital,wght@0,200;1,200&display=swap" rel="stylesheet"> 
		
		<!-- Icon -->
     	<script src='https://kit.fontawesome.com/a076d05399.js'></script>
     	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<style type="text/css">
	.fieldsetCss{
		width: 70%;
		margin-left: auto;
		margin-right: auto;
		
	} 
	.accountCetegory
	{
		width : 55%;
		height : 100%;
		margin-left: 45%;
  		margin-right: auto;
  		padding: 2%  2%  2%  6% ;
	}
	#label1 {
		font-size: 16px;
		font-family: 'Sarabun', sans-serif;
	}
	#cagetoryLegend{
		font-size: 16px; 
		font-family: 'Sarabun', sans-serif;
	}

</style>

    <!-- import jquery JS -->
	 	<link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">

<script type="text/javascript">

    function showCategoryAccount (it) {
        var box = document.getElementById("exampleRadios2"); /*  เมื่อกด exampleRadios2 จะแสดง  SubAccount ให้เลือกประเภทของบัญชีผู้ให้บริการ */
        var vis = (box.checked) ? "block" : "none";
        document.getElementById(it).style.display = vis;
        
        var box = document.getElementById("exampleRadios1"); /*  เมื่อกด exampleRadios2 แบบฟอร์ม CustomerInput จะหายไป  */
        var vis = (box.checked) ? "block" : "none";
        document.getElementById("customerInput").style.display = vis; 
    }
    function showInputRegisterCustomer (it) {
    	
    	var box = document.getElementById("exampleRadios1"); /*  เมื่อกด exampleRadios1  จะแสดงแบบฟอร์ม CustomerInput ให้กรอก */
    	var vis = (box.checked) ? "block" : "none";
    	document.getElementById(it).style.display = vis; 
    	
    	 var box = document.getElementById("exampleRadios2");  /*  เมื่อค่าที่รับเข้ามาไม่ใช่ exampleRadios2 แบบฟอร์ม SubAccount จะหายไป  */
         var vis = (box.checked) ? "block" : "none";
         document.getElementById('subAccount').style.display = vis;
         
         var companybox = document.getElementById("companyRadios").checked = false; /*  checked = false; บังคับเครียค่าใน type="redio"  */
         var company = (companybox.checked) ? "block" : "none";         /*  เมื่อ companyRadios ไม่มีการเลือก จะไม่แสดงแบบฟอร์ม companyInput */
 		document.getElementById('compamyInput').style.display = company;
 		
         var personbox = document.getElementById("personRadios").checked = false; /*  checked = false; บังคับเครียค่าใน type="redio"  */
	     var person = (personbox.checked) ? "block" : "none";         /*  เมื่อ personRadios ไม่มีการเลือก จะไม่แสดงแบบฟอร์ม personInput */
	     document.getElementById('personInput').style.display = person; 
    }
    function showInputRegisterPerson (it) {
        var personbox = document.getElementById("personRadios"); /*  เมื่อ personRadios มีการเลือก จะแสดงแบบฟอร์ม personInput */
        var person = (personbox.checked) ? "block" : "none";
        document.getElementById(it).style.display = person;  
        
        var companybox = document.getElementById("companyRadios"); /*  เมื่อ companyRadios ไม่มีการเลือก จะไม่แสดงแบบฟอร์ม companyInput */
        var company = (companybox.checked) ? "block" : "none";
		document.getElementById('compamyInput').style.display = company;
    }
    function showInputRegisterCompany (it) {
        var companybox = document.getElementById("companyRadios"); /*  เมื่อ companyRadios มีการเลือก จะแสดงแบบฟอร์ม companyInput */
        var company = (companybox.checked) ? "block" : "none";
		document.getElementById(it).style.display = company;	
		
		 var personbox = document.getElementById("personRadios");/*  เมื่อ personRadios ไม่มีการเลือก จะไม่แสดงแบบฟอร์ม personInput */
	     var person = (personbox.checked) ? "block" : "none";
	     document.getElementById('personInput').style.display = person;  
    }
</script>

</head>
<body style="background-color: #C5E7F1  ;">
<!-- Header section -->
			<jsp:include page="../navbar/navbar.jsp"></jsp:include>
	<!-- Header section end -->
 
	<!-- From Category Account Register -->
	<div class="container" ><br>
		<form action="#" class="frmCetegory shadow p-4 mb-4 bg-white rounded" style=" width: 60%;">
			<div class="form-row">
    				<div >
		    			<label for="categoryAccount" id="label1">ประเภทของบัญชี :</label><br>
		    		</div>
		    	</div>
		    	 <div class="form-row">
    				<div class="form-check-inline">
						  <input class="form-check-input " type="radio" name="exampleRadios" id="exampleRadios1" 
						  	value="ผู้ขอรับบริการทำความสะอาด" checked onclick="showInputRegisterCustomer ('customerInput')">
						  <label class="form-check-label" id="categoryAccount1" for="exampleRadios1" style="font-size:16px; font-family: 'Sarabun', sans-serif;">
						    ผู้ขอรับบริการทำความสะอาด
						  </label>
					</div>
					<div class="form-check-inline"> 
						  <input class="form-check-input" type="radio" name="exampleRadios" id="exampleRadios2" 
						  		value="ผู้ให้บริการทำความสะอาด" onclick="showCategoryAccount ('subAccount')">
						  <label class="form-check-label " id="categoryAccount2" for="exampleRadios2" style="font-size:16px; font-family: 'Sarabun', sans-serif;">
						    ผู้ให้บริการทำความสะอาด
						  </label>
					</div><br><br>
				</div>
				<div class="accountCetegory" id="subAccount" style="display: none;">
					<fieldset >
		    			<legend id="cagetoryLegend">ผู้ให้บริการทำความสะอาด :</legend>
					  <div class="form-check-inline">
						  		<input class="form-check-input" type="radio" name="accountCategory" id="personRadios" 
						  			value="ประเภทบุคคล"  onclick="showInputRegisterPerson('personInput')">
						  		<label class="form-check-label " id="person" for="person" style="font-size:16px; font-family: 'Sarabun', sans-serif;">
						    	ประเภทบุคคล
						  </label>
					 </div>
					  <div class="form-check-inline">
						  		<input class="form-check-input" type="radio" name="accountCategory" id="companyRadios" 
						  			value="ประเภทบริษัท" onclick="showInputRegisterCompany ('compamyInput')">
						  		<label class="form-check-label " id="company" for="company" style="font-size:16px; font-family: 'Sarabun', sans-serif;">
						    	ประเภทบริษัท
						  </label>
					 </div>
					 </fieldset>
				</div>
		</form>
		<br>
	</div>
	<!-- Form Register Input for Customer -->
		<div id="customerInput" >
			<form action="${pageContext.request.contextPath}/getRegisterData" onsubmit="return CheckSubmitToCustomer()" style="padding-bottom: 30px;" method="post">
			  <fieldset class="fieldsetCss shadow p-3 mb-5 bg-white rounded">
			  	  <legend id="legendRegister">สมัครสมาชิก :</legend>
			  	  	<div>
                		 <input type="hidden" name="typeAccount" value="1">
             		 </div>
			    	 <div class="form-row">
	    				<div class="form-group col-md-6">
	    					<span  style="font-family: 'Prompt', sans-serif;color: red"> * </span>
			    			<label for="username" id="label1"><i class='fas fa-id-card' style='font-size:20px'></i> ชื่อผู้ใช้ :</label><br>
			   				<input type="text"  class="form-control"  id="username" name="username" onkeyup="checkUsername(this)">
			   				<label id="showScriptUS" style="font-size: 12px; color: red;"></label><br>
			   				
			    		</div>
			    	</div>
			    	 <div class="form-row">
	    				<div class="form-group col-md-6">
	    					<span  style="font-family: 'Prompt', sans-serif;color: red"> * </span>
			    			<label for="password" id="label1"><i class='fas fa-key' style='font-size:20px'></i> รหัสผ่าน :</label><br>
			    			<input type="password" class="form-control"  id="password" name="password" onkeyup="checkPassword(this)">
			    			<label id="showScriptpwd" style="font-size: 12px; color: red;"></label><br>
			    		</div>
	    				<div class="form-group col-md-6">
	    					<span  style="font-family: 'Prompt', sans-serif;color: red"> * </span>
			    			<label for="passwordconfirm" id="label1"><i class='fas fa-key' style='font-size:20px'></i> ยืนยันรหัสผ่าน :</label><br>
			    			<input type="password" class="form-control"  id="passwordconfirm" name="passwordconfirm" onkeyup="checkPasswordconfirm(this,password)">
			    			<label id="showScriptpwdc" style="font-size: 12px; color: red;"></label><br>
			    		</div>
			    	</div>
			    	<div class="form-row">
	    				<div class="form-group col-md-6">
	    					<span  style="font-family: 'Prompt', sans-serif;color: red"> * </span>
			    			<label for="fname" id="label1"><i class='fas fa-user-alt' style='font-size:20px'></i> ชื่อจริง :</label><br>
			    			<input type="text" class="form-control"  id="fname" name="fname" onkeyup="FName(this)">
			    			<label id="showScriptFname" style="font-size: 12px; color: red;"></label><br>
			    		</div>
	    				<div class="form-group col-md-6">
	    					<span  style="font-family: 'Prompt', sans-serif;color: red"> * </span>
			    			<label for="lname" id="label1"><i class='fas fa-user-alt' style='font-size:20px'></i> นามสกุล:</label><br>
			    			<input type="text" class="form-control"  id="lname" name="lname" onkeyup="LName(this)">
							<label id="showScriptLname" style="font-size: 12px; color: red;"></label><br>
			    		</div>
			    	</div>
			    	<div class="form-row">
	   					<div class="form-group col-md-6">
	   						<span  style="font-family: 'Prompt', sans-serif;color: red"> * </span>
			    			<label for="birthday" id="label1"><i class="fa fa-calendar" style="font-size:20px"></i> วัน /เดือน /ปีเกิด :</label><br>
			  				 <input  class="input-medium form-control" type="text" name="brithday" id="datepicker" 
                				data-provide="datepicker" data-date-language="th-th" placeholder="วว/ดด/ปปปป"
                				 onchange="checkbrithday(this)">
                			 <label id="showScriptDate" style="font-size: 12px; color: red;"></label><br>  
			    		</div>
	    				<div class="form-group col-md-6">
	    					<span  style="font-family: 'Prompt', sans-serif;color: red"> * </span>
			    			<label for="tel" id="label1"><i class='fas fa-phone-alt' style='font-size:20px'></i> เบอร์โทรศัพท์ :</label><br>
			    			<input type="tel" class="form-control"  id="tel" name="tel" onkeyup="checkTelPerson(this)">
			    			<label id="showScriptTel" style="font-size: 12px; color: red;"></label><br>
			    		</div>
			    	</div>
			    	<div class="form-row">
	    				<div class="form-group col-md-6">
	    					<span  style="font-family: 'Prompt', sans-serif;color: red"> * </span>
			    			<label for="email" id="label1"><i class="fa fa-envelope-o" style='font-size:20px'></i> อีเมล์ :</label><br>
			   				<input type="email" class="form-control" id="email" name="email" onkeyup="CheckEmail(this)">
			   				<label id="showScriptEmail" style="font-size: 12px; color: red;"></label><br>
			    		</div>
			    	</div>
	    				<div class="form-group ">
	    					<span  style="font-family: 'Prompt', sans-serif;color: red"> * </span>
			    			 <label for="address" id="label1"><i class="fas fa-home fa-lg fa-fw" aria-hidden="true"></i> ที่อยู่ :</label><br>
			   				 <input type="text" class="form-control" id="address" name="address" onkeyup="CheckAddress(this)">
			   				 <label id="showScriptAddress" style="font-size: 12px; color: red;"></label><br>
			    		</div>
			    	<div class="form-row">
				    	<div class="form-group col-md-6">
				    		<span  style="font-family: 'Prompt', sans-serif;color: red"> * </span>
				    		<label for="subdistrict" id="label1"><i class="fas fa-home fa-lg fa-fw" aria-hidden="true"></i> ตำบล/แขวง :</label><br>
				    		<input type="text" name="subDistrict" class="form-control" id="district" onkeyup="CheckSubdistrict(this)">
							<label id="showScriptSubD" style="font-size: 12px; color: red;"></label><br>
				    	</div>
	    				<div class="form-group col-md-6">
	    					<span  style="font-family: 'Prompt', sans-serif;color: red"> * </span>
	    				 	<label for="district" id="label1"><i class="fas fa-home fa-lg fa-fw" aria-hidden="true"></i> อำเภอ/เขต :</label><br>
	    					 <input type="text" id="amphoe" name="district" class="form-control" onchange="Checkdistrict2(this)" onkeyup="Checkdistrict(this)">
	    				 	<label id="showScriptDtt" style="font-size: 12px; color: red;"></label><br>	    			  
			    		</div>
	    		  	</div>
			    	<div class="form-row">
			    		<div class="form-group col-md-6">
			    			<span  style="font-family: 'Prompt', sans-serif;color: red"> * </span>
	      					<label for="province" id="label1"><i class="fas fa-home fa-lg fa-fw" aria-hidden="true"></i> จังหวัด :</label><br>
	      					<input type="text" id="province" name="province" class="form-control" onchange="CheckProvince2(this)" onkeyup="CheckProvince(this)">
	      					<label id="showScriptPvn" style="font-size: 12px; color: red;"></label><br>
			    		</div>
	    				<div class="form-group col-md-6">
	    					<span  style="font-family: 'Prompt', sans-serif;color: red"> * </span>
			    			<label for="postcode" id="label1"><i class="fas fa-home fa-lg fa-fw" aria-hidden="true"></i>  รหัสไปษณีย์ :</label><br>
			    			<input type="text" class="form-control" id="zipcode" name="postcode" onchange="CheckPostcode2(this)" onkeyup="CheckPostcode(this)">
			    			<label id="showScriptPtc" style="font-size: 12px; color: red;"></label><br>
			    		</div>
			    	</div>
			    	<div class="form-row">
			    		<input type="hidden" id="idlalong">
	    				<div class="form-group col-md-4">
	    					<span  style="font-family: 'Prompt', sans-serif;color: red"> * </span>
			    			<label for="latitude " id="label1"><i class="fas fa-map-marked fa-lg fa-fw" aria-hidden="true"></i> ละติจุด :</label><br>
			    			<input type="text" class="form-control" id="latitude" name="latitude" >
			    			<label id="showScriptLgt" style="font-size: 12px; color: red;"></label><br>
			    		</div>
			    		<div class="form-group col-md-4">
			    			<span  style="font-family: 'Prompt', sans-serif;color: red"> * </span>
			    			<label for="longitude" id="label1"><i class="fas fa-map-marked fa-lg fa-fw" aria-hidden="true"></i> ลองจิจุด :</label><br>
			    			<input type="text" class="form-control" id="longitude" name="longitude">
							<label id="showScriptLtt" style="font-size: 12px; color: red;"></label><br>
			    		</div>
			    	</div>
			    		<div class="form-group" id="map" style="height: 100vh;">
						</div>
						<div class="form-group">
							<input type="hidden" name="registerDate" value="${localdate}">
						</div>
					<div class="col-md-12 text-center">
			    			<button type="submit" class="btn btn-success btn-lg box-shadow-4dp"  style="width: 25%; height: 30%;">ยืนยัน</button>
	
			    			<button type="reset" class="btn btn-warning btn-lg"  style="width: 25%; height: 30%;">ยกเลิก</button>
			    	</div><br>
			 </fieldset>
			 
			 </form>
		</div>
<!-- Form Register Input for Service Person -->
		<div id="personInput" style="display: none;">
			<form name="frm"  method="post"  enctype="multipart/form-data" action="${pageContext.request.contextPath}/getRegisterData"
				onsubmit="return CheckSubmitToPerson()" style="padding-bottom: 30px;" >
			  <fieldset class="fieldsetCss shadow p-3 mb-5 bg-white rounded">
			    <legend>ผู้ให้บริการทำความสะอาด (ประเภทบุคคล):</legend>
<!-- data 0 -->		<input type="hidden" name="typeAccount" value="2">
			    	 <div class="form-row">
	    				<div class="form-group col-md-6">
	    					<span  style="font-family: 'Prompt', sans-serif;color: red"> * </span>
			    			<label for="username" id="label1"><i class='fas fa-id-card' style='font-size:20px'></i> ชื่อผู้ใช้ :</label><br>
<!-- data 1 --> 			<input type="text"  class="form-control"  id="username2" name="username" onkeyup="checkUsername(this)">
			   				<label id="showScriptUS" style="font-size: 12px; color: red;"></label><br>
			    		</div>
			    	</div>
			    	 <div class="form-row">
	    				<div class="form-group col-md-6">
	    					<span  style="font-family: 'Prompt', sans-serif;color: red"> * </span>
			    			<label for="password" id="label1"><i class='fas fa-key' style='font-size:20px'></i> รหัสผ่าน :</label><br>
<!-- data 2 -->				<input type="password" class="form-control"  id="password2" name="password" value="" onkeyup="checkPassword(this)">
			    			<label id="showScriptpwd" style="font-size: 12px; color: red;"></label><br>
			    		</div>
	    				<div class="form-group col-md-6">
	    					<span  style="font-family: 'Prompt', sans-serif;color: red"> * </span>
			    			<label for="passwordconfirm" id="label1"><i class='fas fa-key' style='font-size:20px'></i> ยืนยันรหัสผ่าน :</label><br>
<!-- data 3 -->	 			<input type="password" class="form-control"  id="passwordconfirm2" name="passwordconfirm" value="" onkeyup="checkPasswordconfirm(this,password)">
			    			<label id="showScriptpwdc" style="font-size: 12px; color: red;"></label><br>
			    		</div>
			    	</div>
			    	<div class="form-row">
	    				<div class="form-group col-md-6">
	    					<span  style="font-family: 'Prompt', sans-serif;color: red"> * </span>
   							<label for="fname" id="label1"><i class='fas fa-user-alt' style='font-size:20px'></i> ชื่อจริง :</label><br>
<!-- data 4 -->    			<input type="text" class="form-control"  id="fname2" name="fname" value="" onkeyup="FName(this)">
			    			<label id="showScriptFname" style="font-size: 12px; color: red;"></label><br>
			    		</div>
	    				<div class="form-group col-md-6">
	    					<span  style="font-family: 'Prompt', sans-serif;color: red"> * </span>
			    			<label for="lname" id="label1"><i class='fas fa-user-alt' style='font-size:20px'></i> นามสกุล :</label><br>
<!-- data 5 -->				<input type="text" class="form-control"  id="lname2" name="lname" value="" onkeyup="LName(this)">
							<label id="showScriptLname" style="font-size: 12px; color: red;"></label><br>
			    		</div>
			    	</div>
			    	<div class="form-row">
	   					<div class="form-group col-md-6">
			    			<span  style="font-family: 'Prompt', sans-serif;color: red"> * </span>
			    			<label for="birthday" id="label1"><i class="fa fa-calendar" style="font-size:20px"></i> วัน /เดือน /ปีเกิด :</label><br>
<!-- data 6 -->				  <input  class="input-medium form-control" type="text" name="brithday" id="datepicker2"
                				data-provide="datepicker" data-date-language="th-th"
                				placeholder="วว/ดด/ปปปป" onchange="checkbrithdayPerson(this)"><br> 
                				
			    		</div>
	    				<div class="form-group col-md-6">
	    					<span  style="font-family: 'Prompt', sans-serif;color: red"> * </span>
			    			<label for="tel" id="label1"><i class='fas fa-phone-alt' style='font-size:20px'></i> เบอร์โทรศัพท์ :</label><br>
<!-- data 7 -->    			<input type="tel" class="form-control"  id="tel2" name="tel" value="" onkeyup="checkTelPerson(this)">
			    			<label id="showScriptTel" style="font-size: 12px; color: red;"></label><br>
			    		</div>
			    	</div>
			    	<div class="form-row">
	    				<div class="form-group col-md-6">
	    					<span  style="font-family: 'Prompt', sans-serif;color: red"> * </span>
			    			<label for="email" id="label1"><i class="fa fa-envelope-o" style='font-size:20px'></i> อีเมล์ :</label><br>
<!-- data 8 -->				<input type="email" class="form-control" id="email2" name="email" value="" onkeyup="CheckEmail(this)">
			   				<label id="showScriptEmail" style="font-size: 12px; color: red;"></label><br>
			    		</div>
			    		<div class="form-group col-md-5">
<!-- data 9 -->				<input type="file" id="couplePhotoCards" name="couplePhotoCards" class="custom-file-input"  onchange="fileName(this)" >
								 <label class="custom-file-label" for="filepicture" style="font-size: 16px;">
								 	<span  style="font-family: 'Prompt', sans-serif;color: red"> * </span>
								 	<i class='far fa-file-image' style='font-size:20px'></i> รูปถ่ายคู่บัตรประชาชน :
								 	<span  style="font-family: 'Prompt', sans-serif;color: gray;"> (รูปภาพ เข่น JPG หรือ PNG) </span>
								</label>
							<div id="showcpc"></div>
						</div>
			    	</div>
					<div class="form-row">
				    	<div class="form-group col-md-6">
<!-- data 10 -->			<input type="file" id="idCardsPhoto" name="idCardsPhoto" onchange="fileName(this)" class="custom-file-input" >
								 <label class="custom-file-label" for="filepicture" style="font-size: 16px;">
								 	<span  style="font-family: 'Prompt', sans-serif;color: red"> * </span>
								 	<i class='far fa-file-image' style='font-size:20px'></i>  เอกสารบัตรประชาชน :
								 	<span  style="font-family: 'Prompt', sans-serif;color: gray;"> (รูปภาพ เข่น JPG หรือ PNG) </span>
								</label>
							<div id="showicp"></div>
						</div>
						<div class="form-group col-s-1 ">
						</div>
				    	<div class="form-group col-md-5">
<!-- data 11 -->			<input type="file" id="profilePhotoPerson" name="profilePhoto"   onchange="fileName(this)" class=" custom-file-input" >
								 <label class="custom-file-label" for="filepicture" style="font-size: 16px;">
								 	<span  style="font-family: 'Prompt', sans-serif;color: red"> * </span>
								 	<i class='far fa-file-image' style='font-size:20px'></i> รูปโปรไฟล์ :
								 	<span  style="font-family: 'Prompt', sans-serif;color: gray;"> (รูปภาพ เข่น JPG หรือ PNG) </span>
								</label>
							<div id="profilepersonimg"></div>
						</div>
			    	</div>
	    				<div class="form-group ">
	    					<span  style="font-family: 'Prompt', sans-serif;color: red"> * </span>
			    			 <label for="address" id="label1"><i class="fas fa-home fa-lg fa-fw" aria-hidden="true"></i> ที่อยู่ :</label><br>
<!-- data 12 -->			 <input type="text" class="form-control" id="address2" name="address" value="" onkeyup="CheckAddress(this)">
			   				 <label id="showScriptAddress" style="font-size: 12px; color: red;"></label><br>
			    		</div>
			    	
			    	<div class="form-row">
				    	<div class="form-group col-md-6">
				    		<span  style="font-family: 'Prompt', sans-serif;color: red"> * </span>
				    		<label for="subdistrict" id="label1"><i class="fas fa-home fa-lg fa-fw" aria-hidden="true"></i> ตำบล/แขวง :</label><br>
<!-- data 13 -->    		<input type="text" name="subDistrict" class="form-control" id="district2" value="" onkeyup="CheckSubdistrict(this)">
							<label id="showScriptSubD" style="font-size: 12px; color: red;"></label><br>  
				    	</div>
	    				<div class="form-group col-md-6">
	    					<span  style="font-family: 'Prompt', sans-serif;color: red"> * </span>
	    				 	<label for="district" id="label1"><i class="fas fa-home fa-lg fa-fw" aria-hidden="true"></i> อำเภอ/เขต :</label><br>
<!-- data 14 -->		 	<input type="text" id="amphoe2" name="district" class="form-control" value="" onchange="Checkdistrict2(this)" onkeyup="Checkdistrict(this)">
	    				 	<label id="showScriptDtt" style="font-size: 12px; color: red;"></label><br>
			    		</div>
			    	</div>
			    	<div class="form-row">
			    		<div class="form-group col-md-6">
			    			<span  style="font-family: 'Prompt', sans-serif;color: red"> * </span>
	      					<label for="province" id="label1"><i class="fas fa-home fa-lg fa-fw" aria-hidden="true"></i> จังหวัด :</label><br>
<!-- data 15 -->			<input type="text" id="province2" name="province" class="form-control" value="" onchange="CheckProvince2(this)" onkeyup="CheckProvince(this)">
	      					<label id="showScriptPvn" style="font-size: 12px; color: red;"></label><br>
			    		</div>
	    				<div class="form-group col-md-6">
	    					<span  style="font-family: 'Prompt', sans-serif;color: red"> * </span>
			    			<label for="postcode" id="label1"><i class="fas fa-home fa-lg fa-fw" aria-hidden="true"></i> รหัสไปษณีย์ :</label><br>
<!-- data 16 -->   			<input type="text" class="form-control" id="zipcode2" name="postcode" value="" onchange="CheckPostcode2(this)" onkeyup="CheckPostcode(this)">
			    			<label id="showScriptPtc" style="font-size: 12px; color: red;"></label><br>
			    		</div>
			    	</div>
			    	<div class="form-row">
	    				<div class="form-group col-md-4">
	    					<span  style="font-family: 'Prompt', sans-serif;color: red"> * </span>
			    			<label for="subdistrict" id="label1"><i class="fas fa-map-marked fa-lg fa-fw" aria-hidden="true"></i> ละติจุด :</label><br>
<!-- data 17 -->   			<input type="text" class="form-control" id="longitude2" name="longitude" value=""><br>
			    		</div>
			    		<div class="form-group col-md-4">
			    			<span  style="font-family: 'Prompt', sans-serif;color: red"> * </span>
			    			<label for="subdistrict" id="label1"><i class="fas fa-map-marked fa-lg fa-fw" aria-hidden="true"></i> ลองจิจุด :</label><br>
<!-- data 18 -->   			<input type="text" class="form-control" id="latitude2" name="latitude" value=""><br>
			    		</div>
			    	</div>
			    		<div class="form-group" id="map2" style="height: 100vh;">
						</div>
						<div class="form-group">
<!-- data 19 -->				<input type="hidden" name="registerDate" value="${localdate}">
						</div>
	    				<div class="col-md-12 text-center">
			    			<button type="submit" class="btn btn-success btn-lg "  style="width: 25%; height: 30%;">ยืนยัน</button>
	
			    			<button type="reset" class="btn btn-warning btn-lg" style="width: 25%; height: 30%;">ยกเลิก</button>
			    		</div><br>
			  </fieldset>
			</form>
		</div>
<!-- Form Register Input for Company -->
		<div id="compamyInput" style="display: none;">
			<form name="frm"  method="post"  enctype="multipart/form-data" action="${pageContext.request.contextPath}/getRegisterData" 
				onsubmit="return CheckSubmitToCompany()" style="padding-bottom: 30px;" >
			  <fieldset class="fieldsetCss shadow p-3 mb-5 bg-white rounded">
			    <legend>ผู้ให้บริการทำความสะอาด (ประเภทบริษัท):</legend>
<!-- data 0 -->	    <input type="hidden" name="typeAccount" value="3">
			    	 <div class="form-row">
	    				<div class="form-group col-md-6">
	    					<span  style="font-family: 'Prompt', sans-serif;color: red"> * </span>
			    			<label for="username" id="label1"><i class='fas fa-id-card' style='font-size:20px'></i> ชื่อผู้ใช้ :</label><br>
<!-- data 1 -->				<input type="text"  class="form-control"  id="username3" name="username" value="" onkeyup="checkUsername(this)">
			   				<label id="showScriptUS" style="font-size: 12px; color: red;"></label><br>
			    		</div>
			    	</div>
			    	 <div class="form-row">
	    				<div class="form-group col-md-6">
	    					<span  style="font-family: 'Prompt', sans-serif;color: red"> * </span>
			    			<label for="password" id="label1"><i class='fas fa-key' style='font-size:20px'></i> รหัสผ่าน :</label><br>
<!-- data 2 -->    			<input type="password" class="form-control"  id="password3" name="password" value="" onkeyup="checkPassword(this)">
			    			<label id="showScriptpwd" style="font-size: 12px; color: red;"></label><br>
			    		</div>
	    				<div class="form-group col-md-6">
	    					<span  style="font-family: 'Prompt', sans-serif;color: red"> * </span>
			    			<label for="passwordconfirm" id="label1"><i class='fas fa-key' style='font-size:20px'></i> ยืนยันรหัสผ่าน :</label><br>
<!-- data 3 -->    			<input type="password" class="form-control"  id="passwordconfirm3" name="passwordconfirm" value="" onkeyup="checkPasswordconfirm(this,password)">
			    			<label id="showScriptpwdc" style="font-size: 12px; color: red;"></label><br>
			    		</div>
			    	</div>
			    	<div class="form-row">
	    				<div class="form-group col-md-6">
	    					<span  style="font-family: 'Prompt', sans-serif;color: red"> * </span>
			    			<label for="fname" id="label1"><i class='far fa-building' style='font-size:20px'></i> ชื่อบริษัท :</label><br>
<!-- data 4 -->    			<input type="text" class="form-control"  id="companyName" name="companyName" value="" onkeyup="checkCompanyName(this)">
			   				<label id="showScriptcompanyName" style="font-size: 12px; color: red;"></label><br>
			    		</div>
	    				<div class="form-group col-md-6">
	    					<span  style="font-family: 'Prompt', sans-serif;color: red"> * </span>
			    			<label for="lname" id="label1"><i class='fas fa-user-alt' style='font-size:20px'></i> ชื่อผู้ติดต่อ :</label><br>
<!-- data 5 -->    			<input type="text" class="form-control"  id="contactName" name="contactName" value="" onkeyup="checkContactName(this)">
			   				<label id="showScriptcontactName" style="font-size: 12px; color: red;"></label><br>
			    		</div>
			    	</div>
			    	<div class="form-row">
	   					<div class="form-group col-md-6">
			    			<label for="fdFanpage" id="label1"><i class='fab fa-facebook-square' style='font-size:20px'></i> ชื่อเฟสบุ๊คแฟนเพจ :</label><br>
<!-- data 6 -->				<input type="text" class="form-control"  id="fdFanpage" name="fdFanpage" placeholder="-" value="" onkeyup="checkfdFanpage(this)">
			   				<label id="showScriptfdFanpage" style="font-size: 12px; color: red;"></label><br>
			    		</div>
	    				<div class="form-group col-md-6">
			    			<label for="fdFanpage" id="label1"><i class='fab fa-facebook-square' style='font-size:20px'></i> เฟสบุ๊คแฟนเพจ (URL) :</label><br>
<!-- data 7 -->    			<input type="text" class="form-control"  id="fdFanpageURL" name="fdFanpageURL" placeholder="-" value="" onkeyup="checkfdFanpageURL(this)">
			   				<label id="showScriptfdFanpageURL" style="font-size: 12px; color: red;"></label><br>
			    		</div>
			    	</div>
			    	<div class="form-row">
	   					<div class="form-group col-md-6">
			    			<label for="fdFanpage" id="label1"><i class='fas fa-globe' style='font-size:20px'></i> ชื่อเว็บไซต์ :</label><br>
<!-- data 8 -->				<input type="text" class="form-control"  id="webSite" name="webSite" placeholder="-" value="" onkeyup="checkWebSite(this)">
			   				<label id="showScriptwebSite" style="font-size: 12px; color: red;"></label><br>
			    		</div>
	    				<div class="form-group col-md-6">
			    			<label for="fdFanpage" id="label1"><i class='fas fa-globe' style='font-size:20px'></i> เว็บไซต์  (URL):</label><br>
<!-- data 9 -->    			<input type="text" class="form-control"  id="webSiteURL" name="webSiteURL" placeholder="-" value="" onkeyup="checkWebSiteURL(this)">
			   				<label id="showScriptwebSiteURL" style="font-size: 12px; color: red;"></label><br>
			    		</div>
			    	</div>
			    	<div class="form-row">
			    		<div class="form-group col-md-6">
			    			<span  style="font-family: 'Prompt', sans-serif;color: red"> * </span>
			    			<label for="tel" id="label1"><i class='fas fa-fax' style='font-size:20px'></i> เบอร์โทรศัพท์ :</label><br>
<!-- data 10 -->    			<input type="tel" class="form-control"  id="tel3" name="tel" value="" onkeyup="checkTelCompany(this)">
			    			<label id="showScriptTelCom" style="font-size: 12px; color: red;"></label><br>
			    		</div>
	    				<div class="form-group col-md-6">
	    					<span  style="font-family: 'Prompt', sans-serif;color: red"> * </span>
			    			<label for="email" id="label1"><i class="fa fa-envelope-o" style='font-size:20px'></i> อีเมล์ :</label><br>
<!-- data 11 -->				<input type="email" class="form-control" id="email3" name="email" value="" onkeyup="CheckEmail(this)">
			   				<label id="showScriptEmail" style="font-size: 12px; color: red;"></label><br>
			    		</div>
			    	</div>
			    	<div class="form-row">
				    	<div class="form-group col-md-6">
<!-- data 12 -->			<input type="file" name="businessLicense" id="businessLicense" class="custom-file-input" onchange="fileName(this)">
								 <label class="custom-file-label" for="filepicture" style="font-size: 16px;">
								 	<span  style="font-family: 'Prompt', sans-serif;color: red"> * </span>
								 	<i class='far fa-file-image' style='font-size:20px'></i>  ใบอนุญาตประกอบธุรกิจ  :
								 	<span  style="font-family: 'Prompt', sans-serif;color: gray;"> (รูปภาพ เข่น JPG หรือ PNG) </span>
								</label>
							<div id="showdls"></div>
						</div>
						<div class="form-group col-s-1 ">
						</div>
				    	<div class="form-group col-md-5">
<!-- data 13 -->			<input type="file" name="profilePhoto" id="profilecompany" class="form-control custom-file-input" onchange="fileName(this)">
								 <label class="custom-file-label" for="filepicture" style="font-size: 16px;">
								 	<span  style="font-family: 'Prompt', sans-serif;color: red"> * </span>
								 	<i class='far fa-file-image' style='font-size:20px'></i> รูปโปรไฟล์ :
								 	<span  style="font-family: 'Prompt', sans-serif;color: gray;"> (รูปภาพ เข่น JPG หรือ PNG) </span>
								</label>
							<div id="profileComimg"></div>
						</div>
			    	</div>
	    				<div class="form-group ">
	    					<span  style="font-family: 'Prompt', sans-serif;color: red"> * </span>
			    			 <label for="address" id="label1"><i class='far fa-building' style='font-size:20px'></i> ที่อยู่ :</label><br>
<!-- data 14 -->			 <input type="text" class="form-control" id="address3" name="address" value="" onkeyup="CheckAddress(this)">
			   				 <label id="showScriptAddress" style="font-size: 12px; color: red;"></label><br>
			    		</div>
			    	<div class="form-row">
				    	<div class="form-group col-md-6">
				    		<span  style="font-family: 'Prompt', sans-serif;color: red"> * </span>
				    		<label for="subdistrict" id="label1"><i class='far fa-building' style='font-size:20px'></i> ตำบล/แขวง :</label><br>
<!-- data 15 -->    		<input type="text" name="subDistrict" class="form-control" id="district3" value="" onkeyup="CheckSubdistrict(this)">
							<label id="showScriptSubD" style="font-size: 12px; color: red;"></label><br>
				    			   
				    	</div>
	    				<div class="form-group col-md-6">
	    					<span  style="font-family: 'Prompt', sans-serif;color: red"> * </span>
	    					<label for="district" id="label1"><i class='far fa-building' style='font-size:20px'></i> อำเภอ/เขต :</label><br>
<!-- data 16 -->		 	<input type="text" id="amphoe3" name="district" class="form-control" onchange="Checkdistrict2(this)" onkeyup="Checkdistrict(this)">
	    				 <label id="showScriptDtt" style="font-size: 12px; color: red;"></label><br>
			    		</div>
			    	</div>
			    	<div class="form-row">
			    		<div class="form-group col-md-6">
			    			<span  style="font-family: 'Prompt', sans-serif;color: red"> * </span>
	      					<label for="province" id="label1"><i class='far fa-building' style='font-size:20px'></i> จังหวัด :</label><br>
<!-- data 17 -->			<input type="text" id="province3" name="province" class="form-control" onchange="CheckProvince2(this)" onkeyup="CheckProvince(this)">
	      					<label id="showScriptPvn" style="font-size: 12px; color: red;"></label><br>
			    		</div>
	    				<div class="form-group col-md-6">
	    					<span  style="font-family: 'Prompt', sans-serif;color: red"> * </span>
			    			<label for="postcode" id="label1"><i class='far fa-building' style='font-size:20px'></i> รหัสไปษณีย์ :</label><br>
<!-- data 18 -->   			<input type="text" class="form-control" id="zipcode3" name="postcode" value=""  onchange="CheckPostcode2(this)" onkeyup="CheckPostcode(this)">
			    			<label id="showScriptPtc" style="font-size: 12px; color: red;"></label><br>
			    		</div>
			    	</div>
			    	<div class="form-row">
	    				<div class="form-group col-md-4">
	    					<span  style="font-family: 'Prompt', sans-serif;color: red"> * </span>
			    			<label for="subdistrict" id="label1"><i class="fas fa-map-marked fa-lg fa-fw" aria-hidden="true"></i> ละติจุด :</label><br>
<!-- data 19 -->   			<input type="text" class="form-control" id="longitude3" name="longitude" value=""><br>
			    		</div>
			    		<div class="form-group col-md-4">
			    			<span  style="font-family: 'Prompt', sans-serif;color: red"> * </span>
			    			<label for="subdistrict" id="label1"><i class="fas fa-map-marked fa-lg fa-fw" aria-hidden="true"></i> ลองจิจุด :</label><br>
<!-- data 20 -->   			<input type="text" class="form-control" id="latitude3" name="latitude" value=""><br>
			    		</div>
			    	</div>
			    		<div class="form-group" id="map3" style="height: 100vh;">
						</div>
						<div class="form-group">
<!-- data 21 -->				<input type="hidden" name="registerDate" value="${localdate}">
						</div>
	    				<div class="col-md-12 text-center">
			    			<button type="submit" class="btn btn-success btn-lg "  style="width: 25%; height: 30%;">ยืนยัน</button>
	
			    			<button type="reset" class="btn btn-warning btn-lg" style="width: 25%; height: 30%;">ยกเลิก</button>
			    		</div><br>
			  </fieldset>
			</form>
	</div><br><br><br><br><br><br><br><br><br><br>
</body>

	<!-- FOOTER -->
		<jsp:include page="../footer/footer.jsp"></jsp:include>
	<!-- END FOOTER -->

<!--====== Javascripts & Jquery ======-->
<!-- Import link and script form Bootstrap --> 
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
<!-- import icon -->    
  	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<!-- เลือกใช้file Script ชื่อ register.js -->
	<script src="/ServiceCleaner_5938/js/AllScript2.js"></script>
<!-- link for template -->
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  <!-- import jquery JS -->
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
<script >
function checkbrithday(x) {
	var birthday = new Date(document.getElementById('datepicker').value.split("/")[2]-543+"-"+document.getElementById('datepicker').value.split("/")[1]+"-"+document.getElementById('datepicker').value.split("/")[0]);
	var birthday2 = new Date();
	birthday2.setFullYear(new Date().getFullYear()-15);
	if(birthday.getTime() > birthday2.getTime()){
		document.getElementById('datepicker').style.border = "thick solid #ed3a14";
		alert( "อายุของผู้สมัครสมาชิกจะต้องมีอายุ 15 ปีขึ้นไป !!" );
		document.getElementById("datepicker").innerHTML = "";
		document.getElementById("datepicker").focus();
		
		 return false;
	}else{
		document.getElementById('datepicker').style.border = "1px solid #000";
		return true;
	}
	
}
function checkbrithdayPerson(x) {
	var birthday = new Date(document.getElementById('datepicker2').value.split("/")[2]-543+"-"+document.getElementById('datepicker2').value.split("/")[1]+"-"+document.getElementById('datepicker2').value.split("/")[0]);
	var birthday2 = new Date();
	birthday2.setFullYear(new Date().getFullYear()-15);
	if(birthday.getTime() > birthday2.getTime()){
		document.getElementById('datepicker2').style.border = "thick solid #ed3a14";
		alert( "อายุของผู้สมัครสมาชิกจะต้องมีอายุ 15 ปีขึ้นไป !!" );
		document.getElementById("datepicker2").innerHTML = "";
		document.getElementById("datepicker2").focus();
		
		 return false;
	}else{
		document.getElementById('datepicker2').style.border = "1px solid #000";
		return true;
	}
	
}
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

$.Thailand({
    $district: $('#district2'), // input ของตำบล
    $amphoe: $('#amphoe2'), // input ของอำเภอ
    $province: $('#province2'), // input ของจังหวัด
    $zipcode: $('#zipcode2'), // input ของรหัสไปรษณีย์
});

$.Thailand({
    $district: $('#district3'), // input ของตำบล
    $amphoe: $('#amphoe3'), // input ของอำเภอ
    $province: $('#province3'), // input ของจังหวัด
    $zipcode: $('#zipcode3'), // input ของรหัสไปรษณีย์
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
	<script	src="https://unpkg.com/bootstrap@4.1.0/dist/js/bootstrap.min.js"></script>
		<script src="https://api-maps.thinknet.co.th/libs/thinknetmaps.1.2.0-rc0.min.js"></script>
		
 <script>
 /* latitude-and-longitude for Customer */

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
	                    /* document.getElementById("latitude").value= lat;
            	        document.getElementById("longitude").value= lng; */
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
	                	    	 
	                	        const {lng, lat} = e.lngLat;  
	                	        
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
  	                $("#latitude").val(""+location.latitude);
  	                $("#longitude").val(""+location.longitude);
  	                 
  	            
  	            }, function() {
  	                alert('มีปัญหาในการตรวจหาตำแหน่ง');
  	            });
  	        } else {
  	            alert('เบราเซอร์นี้ไม่รองรับ geolocation');
  	        }
</script>
<script>
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
                	        /* alert('lat : ' +lat +'lng :'+lng) */
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
      
   
    </script> 
<script>
/* latitude-and-longitude for Service Person */
	$(document).ready(function(){
		  $("#zipcode2").change(function(){
			$.ajax({
		     		type: "POST",
				    url: "https://api-maps.thinknet.co.th/v1/search/textsearch",
				    data: "app_id=test-tncnx-7iqgm&api_key=YTA2N2YyZjQ0YzlkOTNlOTVhYTFhNGRiNzU3NTIyZTI&keyword="+$("#district2").val()+""+$("#amphoe2").val()+""+$("#province2").val()
				    +""+$("#zipcode2").val(),
				 	success: function(msg){
				 	
		            console.log(msg.result[0].name.th+","+msg.result[0].address.tambon.th+","+msg.result[0].address.amphoe.th		
		            +","+msg.result[0].address.province.th+","+msg.result[0].coordinate.lat+","+msg.result[0].coordinate.lng);


		            const map2 = new thinknetmaps.Map({
	                    container: 'map2', // id ของ div ที่จะให้ map ไป render
	                    app_id: 'test-tncnx-7iqgm',
	                    api_key: 'YTA2N2YyZjQ0YzlkOTNlOTVhYTFhNGRiNzU3NTIyZTI',
	                     center : {
	                    	lng: msg.result[0].coordinate.lng ,
	                    	lat: msg.result[0].coordinate.lat 
	                    }, 
	                  });  
		            $("#latitude2").val(""+msg.result[0].coordinate.lat);
                 	$("#longitude2").val(""+msg.result[0].coordinate.lng );
		             map2.on('load', function() { 
		            	 map2.addMarker({
	                	    id: 'bangbon',
	                	    lat: msg.result[0].coordinate.lat, 
	                	    lng: msg.result[0].coordinate.lng,
	                	    offset: [0, -10], 
	                	    draggable: true,
	                	    onDragEnd: function(e) {
	                	        const {lng, lat} = e.lngLat
	                	        /* alert('lat : ' +lat +'lng :'+lng) */
	                	         $("#latitude2").val(""+lat);
	                            $("#longitude2").val(""+lng);
	                	      }
	                	  })
	                	}); 
				 	}
			}); 
			
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
</script>
<script>
		if ( navigator.geolocation ) {
            // ตรงนี้คือรองรับ geolocation
            navigator.geolocation.getCurrentPosition(function(location) {
            	
                var location = location.coords;
                const map2 = new thinknetmaps.Map({
                    container: 'map2', // id ของ div ที่จะให้ map ไป render
                    app_id: 'test-tncnx-7iqgm',
                    api_key: 'YTA2N2YyZjQ0YzlkOTNlOTVhYTFhNGRiNzU3NTIyZTI',
                    center : {
                    	lng: location.longitude,
                    	lat: location.latitude
                    },
                  });
                map2.on('load', function() {
                	  map2.addMarker({
                	    id: 'bangbon',
                	    lat: location.latitude,
                	    lng: location.longitude,
                	    offset: [0, -10],
                	    draggable: true,
                	    onDragEnd: function(e) {
                	        const {lng, lat} = e.lngLat 
                	        /* alert('lat : ' +lat +'lng :'+lng) */
                	         $("#latitude2").val(""+lat);
                            $("#longitude2").val(""+lng);
                	      }
                	  })
                	});
            }, function() { 
                alert('มีปัญหาในการตรวจหาตำแหน่ง');
            }); 
        } else {
            alert('เบราเซอร์นี้ไม่รองรับ geolocation');
        }
      
  
    </script> 
<script>
/* latitude-and-longitude for Company */
	$(document).ready(function(){
		  $("#zipcode3").change(function(){
			$.ajax({
		     		type: "POST",
				    url: "https://api-maps.thinknet.co.th/v1/search/textsearch",
				    data: "app_id=test-tncnx-7iqgm&api_key=YTA2N2YyZjQ0YzlkOTNlOTVhYTFhNGRiNzU3NTIyZTI&keyword="+$("#district3").val()+""+$("#amphoe3").val()+""+$("#province3").val()
				    +""+$("#zipcode3").val(),
				 	success: function(msg){
				 	
		            console.log(msg.result[0].name.th+","+msg.result[0].address.tambon.th+","+msg.result[0].address.amphoe.th		
		            +","+msg.result[0].address.province.th+","+msg.result[0].coordinate.lat+","+msg.result[0].coordinate.lng);

		            const map3 = new thinknetmaps.Map({
	                    container: 'map3', // id ของ div ที่จะให้ map ไป render
	                    app_id: 'test-tncnx-7iqgm',
	                    api_key: 'YTA2N2YyZjQ0YzlkOTNlOTVhYTFhNGRiNzU3NTIyZTI',
	                     center : {
	                    	lng: msg.result[0].coordinate.lng ,
	                    	lat: msg.result[0].coordinate.lat
	                    }, 
	                  });  
		            $("#latitude3").val(""+msg.result[0].coordinate.lat);
                 	$("#longitude3").val(""+msg.result[0].coordinate.lng );
		             map3.on('load', function() {
	                	  map3.addMarker({ 
	                	    id: 'bangbon',
	                	    lat: msg.result[0].coordinate.lat, 
	                	    lng: msg.result[0].coordinate.lng,
	                	    offset: [0, -10],
	                	    draggable: true,
	                	    onDragEnd: function(e) {
	                	        const {lng, lat} = e.lngLat
	                	        /* alert('lat : ' +lat +'lng :'+lng) */
	                	         $("#latitude3").val(""+lat);
	                            $("#longitude3").val(""+lng);
	                	      }
	                	  })
	                	}); 
				 	}
			}); 
			
			});
			}); 
  		  if ( navigator.geolocation ) {
  	            // ตรงนี้คือรองรับ geolocation
  	            navigator.geolocation.getCurrentPosition(function(location) {
  	                var location = location.coords;
  	                /*$("#geo_data").html('lat: '+location.latitude+'<br />long: '+location.longitude+'<br /> altitude: '+location.altitude+'<br /> accuracy: '+location.accuracy+'<br /> altitude accuracy: '+location.altitudeAccuracy+'<br /> heading: '+location.heading+'<br /> speed: '+location.speed);*/
  	                $("#latitude3").val(""+location.latitude);
  	                $("#longitude3").val(""+location.longitude);
  	                 
  	            
  	            }, function() {
  	                alert('มีปัญหาในการตรวจหาตำแหน่ง');
  	            });
  	        } else {
  	            alert('เบราเซอร์นี้ไม่รองรับ geolocation');
  	        }
	
</script>
<script>
		if ( navigator.geolocation ) {
            // ตรงนี้คือรองรับ geolocation
            navigator.geolocation.getCurrentPosition(function(location) {
            	
                var location = location.coords;
                const map3 = new thinknetmaps.Map({
                    container: 'map3', // id ของ div ที่จะให้ map ไป render
                    app_id: 'test-tncnx-7iqgm',
                    api_key: 'YTA2N2YyZjQ0YzlkOTNlOTVhYTFhNGRiNzU3NTIyZTI',
                    center : {
                    	lng: location.longitude,
                    	lat: location.latitude
                    },
                  });
                map3.on('load', function() {
                	  map3.addMarker({
                	    id: 'bangbon',
                	    lat: location.latitude,
                	    lng: location.longitude,
                	    offset: [0, -10],
                	    draggable: true,
                	    onDragEnd: function(e) {
                	        const {lng, lat} = e.lngLat
                	         $("#latitude3").val(""+lat);
                            $("#longitude3").val(""+lng);
                	      }
                	  })
                	});
            }, function() { 
                alert('มีปัญหาในการตรวจหาตำแหน่ง');
            }); 
        } else {
            alert('เบราเซอร์นี้ไม่รองรับ geolocation');
        }
      
  
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