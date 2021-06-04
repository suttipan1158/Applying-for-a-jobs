<%@page import="com.springmvc.model.Company"%>
<%@page import="com.springmvc.model.ServicePerson"%>
<%@page import="com.springmvc.model.Quotations"%>
<%@page import="com.springmvc.model.Login"%>
<%@page import="com.springmvc.model.Suggest"%>
<%@page import="com.springmvc.model.Customer"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Date"%>
<%@page import="com.sun.xml.txw2.Document"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <% 
      List<Customer> cus = (List<Customer>) request.getAttribute("customerdata");
      List<Suggest> Listsuggests = (List<Suggest>) request.getAttribute("suggests");
      List<Company> companies = (List<Company>) request.getAttribute("companies");
      List<ServicePerson> servicePersons = (List<ServicePerson>) request.getAttribute("servicePersons");
      Login user = (Login) session.getAttribute("user");%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Create Request Cleaner</title>
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
 <!-- icon link -->
	<script src='https://kit.fontawesome.com/a076d05399.js'></script>
	
	 <!-- import jquery JS -->
	 	<link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
       
  	<!-- เลือกใช้ไฟล์ css ของ register.css -->
  		<link rel="stylesheet" type="text/css" href="/ServiceCleaner_5938/css/register2.css">
  		<link rel="stylesheet" type="text/css" href="/ServiceCleaner_5938/css/datepicker.css">
    	
<!-- Import Font -->
	 <link href="https://fonts.googleapis.com/css2?family=Sarabun:ital,wght@0,200;1,200&display=swap" rel="stylesheet"> <!-- Icon -->
<!-- MAPS -->
  	<link href='https://api-maps.thinknet.co.th/libs/thinknetmaps.1.2.0-rc0.min.css' rel='stylesheet' />		
<style type="text/css">
 #label1 {
		font-size: 18px;
		font-family: 'Sarabun', sans-serif;
		color: #1a1a1a;
	}
.ordios{
	font-size: 16px;
	color: #1a1a1a;
}
/* Buttom Submit And Reset */
 .btns2 {
  text-align: center;
  text-transform: uppercase;
  cursor: pointer;
  letter-spacing: 4px;
  position: relative;
  background-color: #16a085;
  border: none;
  color: #fff;
  padding: 20px;
  width: 200px;
  text-align: center;
  transition-duration: 0.4s;
  overflow: hidden;
  box-shadow: 0 5px 15px #193047;
  border-radius: 4px;
  	width: 30%; 
 	height: 100%;
 	font-size: 100%; 
	font-family: 'Sarabun', sans-serif;
}

.btns2:hover {
  background: #fff;
  box-shadow: 0px 2px 10px 5px #1abc9c;
  color: #000;
}

.btns2:after {
  content: "";
  background: #1abc9c;
  display: block;
  position: absolute;
  padding-top: 300%;
  padding-left: 350%;
  margin-left: -20px !important;
  margin-top: -120%;
  opacity: 0;
  transition: all 0.8s
}

.btns2:active:after {
  padding: 0;
  margin: 0;
  opacity: 1;
  transition: 0s
}

.btns2:focus { outline:0; }
 
	/* Check Box */
  @keyframes check {0% {height: 0;width: 0;}
    25% {height: 0;width: 10px;}
    50% {height: 20px;width: 10px;}
  }
  .checkbox{background-color:#fff;display:inline-block;height:28px;margin:0 .25em;width:28px;border-radius:4px;border:1px solid #ccc;float:right}
  .checkbox span{display:block;height:28px;position:relative;width:28px;padding:0}
  .checkbox span:after{-moz-transform:scaleX(-1) rotate(135deg);-ms-transform:scaleX(-1) rotate(135deg);-webkit-transform:scaleX(-1) rotate(135deg);transform:scaleX(-1) rotate(135deg);-moz-transform-origin:left top;-ms-transform-origin:left top;-webkit-transform-origin:left top;transform-origin:left top;border-right:4px solid #fff;border-top:4px solid #fff;content:'';display:block;height:20px;left:3px;position:absolute;top:15px;width:10px}
  .checkbox span:hover:after{border-color:#999}
  .checkbox input{display:none}
  .checkbox input:checked + span:after{-webkit-animation:check .8s;-moz-animation:check .8s;-o-animation:check .8s;animation:check .8s;border-color:#555}
.checkbox input:checked + .default:after{border-color:#444}
</style>
<script type="text/javascript">
function inputMonths() { 
	var month = document.getElementById("pickMonths").value;
	var dates = new Date();
	var month01 = dates.getMonth() + 1;
	var a = dates.getDate();
	if(month < month01){
		alert( "เดือนที่เลือกไปทำความสะอาดจะต้องไม่ใช่เดือนที่ผ่านมาแล้ว  !!" +month01); 
		document.getElementById("pickMonths").value = "";
		document.getElementById('months31').style.display = "none";
		document.getElementById('months29').style.display = "none";
		document.getElementById('months30').style.display = "none";
		
		document.getElementById('monthsno29').style.display = "none";
		document.getElementById('monthsno30').style.display = "none";
		document.getElementById('monthsno31').style.display = "none";
	}
	else{
		if( month == "4" || month == "6" || month == "9" || month == "11"){
			
			document.getElementById('months30').style.display = "block";
			document.getElementById('months31').style.display = "none";
			document.getElementById('months29').style.display = "none";
			
			document.getElementById('monthsno29').style.display = "none";
			document.getElementById('monthsno30').style.display = "block";
			document.getElementById('monthsno31').style.display = "none";
			if(month == month01){
				 for(var i = 0; i <30 ;i++){
					 if(i < a){
						document.getElementById("dayInMonthsOne"+[i+1]).disabled = true;
					 }
				 }
			 }
		}else if( month == "2"){
			document.getElementById('months29').style.display = "block";
			document.getElementById('months31').style.display = "none";
			document.getElementById('months30').style.display = "none";
			
			document.getElementById('monthsno29').style.display = "block";
			document.getElementById('monthsno30').style.display = "none";
			document.getElementById('monthsno31').style.display = "none";
			if(month == month01){
				 for(var i = 0; i <29 ;i++){
					 if(i < a){
						document.getElementById("dayInMonthsThee"+[i+1]).disabled = true;
					 }
				 }
			 }
		}else{
			document.getElementById('months31').style.display = "block";
			document.getElementById('months29').style.display = "none"; 
			document.getElementById('months30').style.display = "none";
			
			document.getElementById('monthsno29').style.display = "none";
			document.getElementById('monthsno30').style.display = "none";
			document.getElementById('monthsno31').style.display = "block";
			 if(month == month01){
				 for(var i = 0; i <31 ;i++){
					 if(i < a){
						document.getElementById("dayInMonthsTwo"+[i+1]).disabled = true;
					 }
				 }
			 }
		}
	}
 }

</script>
</head>
<body style="background-color: #D9ECF2 ">
<!-- Header section -->
			<jsp:include page="../navbar/navbar.jsp"></jsp:include>
	<!-- Header section end -->
	<div class="container"><br>
		<section class="shadow p-3 mb-5 bg-white rounded">
		<div ><br>
		<form action="${pageContext.request.contextPath}/createRequestCleaner" method="post" style="margin: 2%;" onsubmit="return confirm('ท่านได้ตรวจสอบข้อมูลละเอียดดีแล้ว ยืนยันการสร้างคำข้อรับบริการหรือไม่ ?')">
			<div class="form-row">
				<div class="form-group col-md-6">
					<span  style="font-family: 'Prompt', sans-serif;color: red"> * </span>
					<label for="cleanerNo" id="label1">จำนวนครั้งทำความสะอาด :</label>
				</div>
			</div>
			<div class="form-row" style="margin: 1% 2%;">
				<div class="form-group col-md-3">
					<p  class="ordios">
						<input type="radio" id="day" name="nos" value="ครั้งเดียว" checked onclick="showListDays()">  ครั้งเดียว
					</p>
				</div>
				<div class="form-group col-md-3">
					<p  class="ordios">
						<input type="radio" name="nos" id="week" value="หนึ่งสัปดาหฺ์" onclick="showListWeek()" >  หนึ่งสัปดาหฺ์
					</p>
				</div>
				<div class="form-group col-md-3">
					<p  class="ordios">
						<input type="radio" name="nos" id="month" value="หนึ่งเดือน" onclick="showListMonth()">  หนึ่งเดือน 
					</p>
				</div>
			</div>
			<div class="form-row">
				<div class="form-group col-md-8">
					<span  style="font-family: 'Prompt', sans-serif;color: red"> * </span>
			      	<label for="province" id="label1">ประเภทของสถานที่ให้บริการทำความสะอาด :</label><br>
			      		<select name="listaddressType" id="listaddressType"  class="form-control"  style="margin: 1% 2%;">
			      			<option value="ทั้งหมด" >--- กรุณาเลือก ---</option>
			      			<%for(Suggest s : Listsuggests){ %>
									<option  value="<%=s.getAddressType()%>" data-suggestid="<%= s.getSuggestid() %>">
										<%=s.getAddressType()%>
									</option>
						  	<% } %>
						</select>
	
				</div>
			</div>
			<div class="form-row">
				<div class="form-group col-md-11" id="showaddresstypes" style="display: none; margin: 1% 2%;">
					<fieldset  style="width:100%; margin-left: auto; margin-right: auto;border: 2px solid powderblue;padding: 2%  2%  2%  1% ;">
						<legend id="nameAddresstype"  class="ordios"></legend>
							<div class=" col-md-11">
								<span  style="font-family: 'Prompt', sans-serif;color: red"> * </span>
						      	<label for="province" id="label1">รูปแบบของสถานที่ :</label><br>
						      	<select name="cleanerProviderServiceType" id="listaddressFormat" class="form-control" >
					      			<option value="ทั้งหมด">--- กรุณาเลือก ---</option>
					      			<%for(Suggest s: Listsuggests ){ %>
								    	<option value="<%= s.getAddressFormat()%>" data-times="<%= s.getSuggestTime() %>" data-price="<%= s.getSuggestPrice()%>"><%= s.getAddressFormat()%></option>
								    <%} %>
								</select>
					      	</div>
					</fieldset>
				</div><br>
			</div>
			<div class="form-row">
				<div class="form-group col-md-6">
					<label for="cleanerNo" id="label1">ผู้ให้บริการทำความสะอาด :</label>
				</div>
			</div>
			<div class="form-row" style="margin: 1% 2%;">
				<div class="form-group col-md-3">
					<p  class="ordios">
						<input type="radio" name="listcleanerProvider" value="ไม่มีผู้ให้บริการที่ต้องการ" id="showNotHistory" checked onclick="showNotHistoryProviders()">  ไม่มีผู้ให้บริการที่ต้องการ
					</p>	
				</div>
				<div class="form-group col-md-3">
					<p  class="ordios">
						<input type="radio"  name="listcleanerProvider" id="showhistory" value="ผู้ให้บริการที่เคยใช้งาน" onclick="showHistoryProviders()">  ผู้ให้บริการที่เคยใช้งาน
					</p>
				</div>
			</div>
			<div class="form-row">
				<div class="form-group col-md-8 shadow-sm p-3 mb-5 bg-white rounded" id="ShowtHistoryProvider" style="display: none; margin: 1% 3%;">
					<fieldset style="width:100%; margin-left: auto; margin-right: auto;border: 2px solid powderblue;padding: 2%  2%  2%  1% ;">
						<legend id="listHistoryProvider" class="ordios">ผู้ให้บริการที่เคยใช้งาน :</legend>
							<div class="form-group col-md-12">
							<div class="form-row">
								<%if(servicePersons != null || companies != null){%>
									<%if(!servicePersons.isEmpty()){ %>
										<%for(ServicePerson sp :servicePersons){ %>
										<div style="padding-right: 10px;">
										<div class="card" style="width: 12rem;">
										  <img src="${pageContext.request.contextPath}/PImgPerson/<%= sp.getProfilePhoto()%>" class="card-img-top" alt="...">
										  <div class="card-body">
										    <h5 class="card-title" style="font-size: 18px;"><i class="glyphicon glyphicon-user"></i> :<%= sp.getFirstName()+" "+sp.getLastName() %></h5>
										    <p class="card-text" style="font-size: 16px;"><i class="fas fa-phone-alt"></i> :<%=sp.getTel() %></p>
										  
												<label class="checkbox" >
		                                        <input type="checkbox" name="personid"  value="<%=sp.getPersonid()%>,"/>
		                                        <span class="default"></span>
		                                    </label>
										  </div>
										</div>
										</div>
										<%} %>
									<%} %>
									<%if(companies != null){ %>
										<%for(Company c :companies){ %>
										<div style="padding-right: 10px;">
										<div class="card" style="width: 12rem;">
										  <img src="${pageContext.request.contextPath}/PImgCompany/<%= c.getProfilePhoto()%>" class="card-img-top" alt="...">
										  <div class="card-body">
										    <h5 class="card-title" style="font-size: 18px;"><i class="glyphicon glyphicon-user"></i> :<%= c.getCompanyName()%></h5>
										    <p class="card-text" style="font-size: 16px;"><i class="fas fa-phone-alt"></i> :<%=c.getTel() %></p>
										  
												<label class="checkbox" >
		                                        <input type="checkbox" name="personid"  value="<%=c.getCompanyid()%>,"/>
		                                        <span class="default"></span>
		                                    </label>
										  </div>
										</div>
										</div>
										<%} %>
									<%} %>
								<%}else{ %>
									<h3>ยังไม่เคยได้รับบริการ</h3>
								<%} %>
					      	</div>
					      </div>
					</fieldset>
				</div>
			</div>
			<div class="form-row">
				<div class="form-group col-md-6">
					<span  style="font-family: 'Prompt', sans-serif;color: red"> * </span>
					<label for="cleanerNo" id="label1">ระยะเวลาในการให้บริการทำความสะอาด :</label><br>
							<span id="suggestshowtime"  style="margin: 1% 2%;"></span>
						<select name="timePeriod" id="listaddressType" class="form-control" onclick="addressType()" style="margin: 1% 2%;" >
			      			<option value="ทั้งหมด">--- กรุณาเลือก ---</option>
			      			<%for(Suggest s : Listsuggests){ %>
						    	<option value="<%= s.getSuggestTime()%>"><%= s.getSuggestTime()%></option>
						    <%} %>
						</select>
				</div>
			</div>
			<div class="form-row">
				<div class="form-group col-md-11" id="showCleanerno" style="display: none; margin: 1% 3%;">
					<fieldset style="width:80%; margin-left: auto; margin-right:50%;border: 2px solid powderblue;padding: 2% ;">
						<legend id="cleanerNo" class="ordios"></legend>
							<div id="days" style="display: none;">
								<div class="form-row">
							      	<div class="form-group col-md-6">
							      		<span  style="font-family: 'Prompt', sans-serif;color: red"> * </span>
								      	<label id="label1">วันในสัปดาหห์ :</label><br>
										<input class="input-medium form-control" type="text" name="startDate" id="datepicker" 
                							data-provide="datepicker" data-date-language="th-th" placeholder="วว/ดด/ปปปป"  onchange="isDateBeforeToday(startDate)">
                						<label id="showScriptDate" style="font-size: 12px; color: red;"></label><br>   
							      	</div>
							      	<div class="form-group col-md-5">
							      		<span  style="font-family: 'Prompt', sans-serif;color: red"> * </span>
								      	<label id="label1">เวลาเริ่มการทำความสะอาด :</label><br>
										<input type="time" name="serviceTime" id="timeservice" class="form-control">  
							      	</div>
						      	</div>
						    </div>
							<div id="weeks" style="display: none;">
								<div class="form-row">
									<div class="form-group col-md-4">
										<span  style="font-family: 'Prompt', sans-serif;color: red"> * </span>
								      	<label id="label1">จำนวนครั้ง / สัปดาหห์</label><br>
								      		<select name="weekNo" id="listweekNo" class="form-control"  >
								      				<option value="0">--- กรุณาเลือก ---</option>
								      			<%for(int i = 1; i < 8 ; i++) {%>
												    <option value="<%= i%>"><%= i%></option>
											    <%} %>
											</select>
							      	</div>
							      	<div class="form-group col-md-6">
							      		<span  style="font-family: 'Prompt', sans-serif;color: red"> * </span>
								      	<label id="label1">วันในสัปดาหห์ :</label><br>
								      		<%	String[] weeks = {"จ.","อ.","พ.","พฤ.","ศ.","ส.","อา."};
								      			for(int i = 0; i < weeks.length ; i++) {%>
												  <input type="checkbox" name="dayInWeeks" id="dayInWeeks<%=i %>" onclick="dayInWeeksss2(dayInWeeks<%=i %>)"  value="<%=weeks[i]%>,"> <%=weeks[i]  %>  
											<%} %>
							      	</div>
						      	</div><br>
						      	<div class="form-row">
							      	<div class="form-group col-md-6">
							      		<span  style="font-family: 'Prompt', sans-serif;color: red"> * </span>
								      	<label id="label1">เวลาเริ่มการทำความสะอาด :</label><br>
										<input type="time" name="serviceTime2" class="form-control">  
							      	</div>
						    	</div>
						    </div>
						    <div id="months" style="display: none;">
						    	<div class="form-row">
						    		<div class="form-group col-md-8">
							      		<%String[] m = {"มกราคม","กุมภาพันธ์","มีนาคม","เมษายน","พฤษภาคม","มิถุนายน","กรกฎาคม","สิงหาคม","กันยายน","ตุลาคม","พฤศจิกายน","ธันวาคม"}; %>
							      		<span  style="font-family: 'Prompt', sans-serif;color: red"> * </span>
								      	<label id="label1">เดือนที่ต้องการ:</label><br>
										<select class="form-control" name="pickMonths" id="pickMonths" onchange="inputMonths(this)">
											<option value="0">--- กรุณาเลือก ---</option>
												<%for(int i = 0 ; i < m.length ; i++){ %>
												<option value="<%= i+1 %>"><%= m[i] %></option>
												<%} %>
										</select>  
							      	</div>
									<div class="form-group col-md-4">
										<span  style="font-family: 'Prompt', sans-serif;color: red"> * </span>
								      	<label id="label1">จำนวนครั้ง / เดือน</label><br>
								      	<div id="monthsno30" style="display: none;">
								      		<select name="monthNo1" id="monthNo1" class="form-control">
								      				<option value="0">--- กรุณาเลือก ---</option>
									      			<%for(int i = 0; i < 30 ; i++) {%>
													    <option value="<%= i+1 %>"><%= i+1%></option>
												    <%} %>
										   	</select>
										   	<input type="hidden" id="sumMonth1" value="<%=30%>">
										</div>
										<div id="monthsno31" style="display: none;">
											<select name="monthNo2" id="monthNo2" class="form-control" >
														<option value="0">--- กรุณาเลือก ---</option>
									      			<%for(int i = 0; i < 31 ; i++) {%>
													    <option value="<%= i+1 %>"><%= i+1%></option>
												    <%} %>
											</select>
											<input type="hidden" id="sumMonth2" value="<%=31%>">
										</div>
										<div id="monthsno29" style="display: none;">
											<select name="monthNo3" id="monthNo3" class="form-control" >
													<option value="0">--- กรุณาเลือก ---</option>
									      			<%for(int i = 0; i < 29 ; i++) {%>
													    <option value="<%= i+1 %>"><%= i+1%></option>
												    <%} %>
											</select>
											<input type="hidden" id="sumMonth3" value="<%=29%>">
										</div>
							      	</div>
						      	</div><br>
						      	<div class="form-row">
							      	<div class="form-group col-md-4">
							      		<span  style="font-family: 'Prompt', sans-serif;color: red"> * </span>
								      	<label id="label1">เวลาเริ่มการทำความสะอาด :</label><br>
										<input type="time" name="serviceTime3"  class="form-control">    
							      	</div>
							      	<div class="form-group col-md-8" id="checkBoxMonth" >
							      		<span  style="font-family: 'Prompt', sans-serif;color: red"> * </span>
								      	<label id="label1">วันที่ในเดือน: </label><br>
								      	<div id="months30" style="display: none;">
								      		<%for(int i = 0; i < 30 ; i++) {%>
												<input type="checkbox" name="dayInMonths" id="dayInMonthsOne<%=i+1%>" onclick="listdayInMonths2(this)" value="<%= i+1 %>,">  <%= i+1  %>
											<%} %>
									    </div>
									    <div id="months31" style="display: none;">
								      		<%for(int i = 0; i < 31 ; i++) {%>
												<input type="checkbox" name="dayInMonths" id="dayInMonthsTwo<%=i+1%>" onclick="listdayInMonths2(this)" value="<%= i+1 %>,">  <%= i+1  %>
											<%} %>
									    </div>
									    <div id="months29" style="display: none;">
								      		<%for(int i = 0; i < 29 ; i++) {%>
												<input type="checkbox" name="dayInMonths" id="dayInMonthsthee<%=i+1%>" onclick="listdayInMonths2(this)" value="<%= i+1 %>,">  <%= i+1  %>
											<%} %>
									    </div>
							      	</div>
						      	</div>
						    </div>
					</fieldset>
				</div>
			</div>
			<div class="form-row">
				<div class="form-group col-md-6">
					<span  style="font-family: 'Prompt', sans-serif;color: red"> * </span>
					<label id="label1">ราคาที่คุณต้องการ :</label><br>
						<span id="suggestshowpricemin"  style="margin: 1% 2%;"></span>
					<input type="text" name="priceMin" id="priceMins" class="form-control"onkeyup="checkpricemin(this)" style="margin: 1% 2%;"> 
					<label id="Moneymin" style="font-size: 12px; color: red;"></label><br>
				</div>
				<div class="form-group col-md-6">
					<span  style="font-family: 'Prompt', sans-serif;color: red"> * </span>
					<label id="label1">ราคามากที่สุดที่คุณจะรับได้ :</label><br>
						<span id="suggestshowpricemix"  style="margin: 1% 2%;"></span>
					<input type="text" name="priceMax" id="priceMax" class="form-control" onkeyup="checkpricemax(this)" style="margin: 1% 2%;">  
					<label id="Moneymax" style="font-size: 12px; color: red;"></label><br>
				</div>
			</div><br>
			<%for(Customer c : cus){ %>
				<input type="hidden" name="memberid" value="<%= c.getMemberid()%>">
				<input type="hidden" name="customerid" value="<%= c.getCustomerid()%>">
				<div class="form-row">
			    	<div class="form-group col-md-6">
			    		<span  style="font-family: 'Prompt', sans-serif;color: red"> * </span>
					    <label for="fname" id="label1">ชื่อจริง (ผู้ติดต่อ) :</label><br>
					   	<input type="text" class="form-control"  id="fname" name="fname" onkeyup="FName(this)" style="margin: 1% 2%;" value="<%= c.getFirsName()%>">
					   	<label id="showScriptFname" style="font-size: 12px; color: red;"></label><br>
					</div>
			    	<div class="form-group col-md-6">
			    		<span  style="font-family: 'Prompt', sans-serif;color: red"> * </span>
					   	<label for="lname" id="label1">นามสกุล (ผู้ติดต่อ):</label><br>
					   	<input type="text" class="form-control"  id="lname" style="margin: 1% 2%;" name="lname"  onkeyup="LName(this)" value="<%= c.getLastName()%>">
						<label id="showScriptLname" style="font-size: 12px; color: red;"></label><br>
					</div>
				</div>
				<div class="form-row">
			    	<div class="form-group col-md-6">
			    		<span  style="font-family: 'Prompt', sans-serif;color: red"> * </span>
					 	<label for="tel" id="label1">เบอร์โทรศัพท์ :</label><br>
					    <input type="tel" class="form-control"  id="tel" name="tel" onkeyup="checkTelCustomer(this)" value="<%= c.getTel()%>" style="margin: 1% 2%;">
					    <label id="showScriptTel" style="font-size: 12px; color: red;"></label><br>
					 </div>
					 <input type="hidden" name="email" value="<%= c.getEmail()%>">
					  <div class="form-group col-md-5" style="margin-left:  2%; ">
					  	<span  style="font-family: 'Prompt', sans-serif;color: red"> * </span>
					  	<label id="label1">ที่พักของคุณมีสัตว์เลี้ยงหรือไม่ :</label><br>
					  		<p  class="ordios">
								<input type="radio" name="listanimal" value="มีสัตว์เลี้ยง " checked style="margin: 1% 2%;">  มีสัตว์เลี้ยง  
								<input type="radio" name="listanimal" value="ไม่มีสัตว์เลี้ยง" style="margin-left:  2%; ">  ไม่มีสัตว์เลี้ยง
							</p>
					</div>
				</div>
			    <div class="form-group ">
			    	<span  style="font-family: 'Prompt', sans-serif;color: red"> * </span>
					<label for="address" id="label1">ที่อยู่ :</label><br>
					<input type="text" class="form-control" id="address" onkeyup="CheckAddress(this)" name="address" value="<%= c.getAddress()%>" style="margin: 1% 1%;">
					<label id="showScriptAddress" style="font-size: 12px; color: red;"></label><br>
				</div>
				<div class="form-row">
					<div class="form-group col-md-6">
						<span  style="font-family: 'Prompt', sans-serif;color: red"> * </span>
						<label for="subdistrict" id="label1">ตำบล/แขวง :</label><br>
						<input type="text" name="subDistrict" class="form-control" id="district" onkeyup="CheckSubdistrict(this)" value="<%= c.getSubDistrict()%>" style="margin: 1% 2%;">
						<label id="showScriptSubD" style="font-size: 12px; color: red;"></label><br>
					</div>
			    	<div class="form-group col-md-6">
			    		<span  style="font-family: 'Prompt', sans-serif;color: red"> * </span>
			    		<label for="district" id="label1">อำเภอ/เขต :</label><br>
			    		<input type="text" id="amphoe" name="district" class="form-control" onkeyup="Checkdistrict(this)" onchange="Checkdistrict2(this)" value="<%= c.getDistrict()%>" style="margin: 1% 2%;">
			    		<label id="showScriptDtt" style="font-size: 12px; color: red;"></label><br>	    			  
					</div>
			    </div>
				<div class="form-row">
					<div class="form-group col-md-6">
					    <span  style="font-family: 'Prompt', sans-serif;color: red"> * </span>
			      		<label for="province" id="label1">จังหวัด :</label><br>
			      		<input type="text" id="province" name="province" class="form-control" onchange="CheckProvince2(this)" onkeyup="CheckProvince(this)" value="<%= c.getProvince()%>" style="margin: 1% 2%;">
			      		<label id="showScriptPvn" style="font-size: 12px; color: red;"></label><br>
					</div>
			    	<div class="form-group col-md-6">
			    		<span  style="font-family: 'Prompt', sans-serif;color: red"> * </span>
					    <label for="postcode" id="label1">รหัสไปษณีย์ :</label><br>
					    <input type="text" class="form-control" id="zipcode" name="postcode" value="<%= c.getPostcode()%>" onchange="CheckPostcode2(this)" onkeyup="CheckPostcode(this)" style="margin: 1% 2%;">
					    <label id="showScriptPtc" style="font-size: 12px; color: red;"></label><br>
					 </div>
				</div>
				<div class="form-row">
					 <input type="hidden" id="idlalong">
			    		<div class="form-group col-md-4">
			    			<span  style="font-family: 'Prompt', sans-serif;color: red"> * </span>
					    	<label for="longitude" id="label1">ละติจุด :</label><br>
					    	<input type="text" class="form-control" id="longitude" name="longitude" value="<%= c.getLongitude()%>" style="margin: 1% 2%;">
					    	<label id="showScriptLgt" style="font-size: 12px; color: red;"></label><br>
					    </div>
					    <div class="form-group col-md-4">
					    	<span  style="font-family: 'Prompt', sans-serif;color: red"> * </span>
					    	<label for="latitude" id="label1">ลองจิจุด :</label><br>
					    	<input type="text" class="form-control" id="latitude" name="latitude" value="<%= c.getLatitude()%>" style="margin: 1% 2%;">
							<label id="showScriptLtt" style="font-size: 12px; color: red;"></label><br>
					    </div>
				</div>
			<%} %>
				<div class="form-group" id="map" style="height: 100vh;"></div>
				<div class="form-group">
					<input type="hidden" name="registerDate" value="${localdate}">
				</div>
				<div class="form-row">
					<div class="form-group col-md-6">
						<label id="label1">หมายเหตุ - ( เงื่อนไขการเข้าที่พัก หรือ พื่นที่ที่อยากให้เน้นเป็นพิเศษ )</label>
						<textarea class="form-control" name="notes" rows="3" style="margin: 1% 2%;"></textarea>
					</div>
				</div><br>
				<input type="hidden" name="status" value="รอยืนยันใบเสนอราคา">
				<div class="form-row">
					<div class="form-group col-md-12" style="text-align: center;">
						<button type="submit" class="btn btn-success  btns2" style="color: black;" >ยืนยัน</button>
						
						<button type="reset" class="btn btn-warning  btns2" >ยกเลิก</button>
					</div>
				</div><br>
		</form>
		</div>
		</section> 
	</div><br><br><br><br><br>
</body>
	<!-- FOOTER -->
		<jsp:include page="../footer/footer.jsp"></jsp:include>
	<!-- END FOOTER -->
<!--====== Javascripts & Jquery ======-->

 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
  <!-- icon link -->
  <script src='https://kit.fontawesome.com/a076d05399.js'></script>
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
    
  <!-- Script -->
	<script src="/ServiceCleaner_5938/js/AllScript2.js"></script>
<!-- code address -->
<script type="text/javascript" src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script type="text/javascript" src="https://earthchie.github.io/jquery.Thailand.js/jquery.Thailand.js/dependencies/JQL.min.js"></script>
<script type="text/javascript" src="https://earthchie.github.io/jquery.Thailand.js/jquery.Thailand.js/dependencies/typeahead.bundle.js"></script>
<link rel="stylesheet" href="https://earthchie.github.io/jquery.Thailand.js/jquery.Thailand.js/dist/jquery.Thailand.min.css">
<script type="text/javascript" src="https://earthchie.github.io/jquery.Thailand.js/jquery.Thailand.js/dist/jquery.Thailand.min.js"></script>
<!-- Script check Date -->

<script type="text/javascript">
function isDateBeforeToday(x) {
		/* Fine Date of Customer */
	    var res = x.value.split("/");
	    var fineday = res[0];
	    var finemonths = res[1];
	    var fineyeays =  res[2];
		
	/* Present date*/
	    var today = new Date();
	    var days = today.getDate();
		var yeays =  today.getFullYear()+543;
		var months = today.getMonth()+1;
		var allDate = days+"/"+months+"/"+yeays;
		
	    var err_txt = "" ;
			
	    if(finemonths >= months && fineyeays >= yeays){
	    	if(fineday > days){
	    		err_txt+=(fineday+" / "+finemonths+" / "+fineyeays+"\n");
	    	}else{
	    		if(finemonths > months  ){
	    			err_txt+=(fineday+" / "+finemonths+" / "+fineyeays+"\n");
	    		}else{
	    			err_txt+=(fineday+" / "+finemonths+" / "+fineyeays+" กรุณาเลือกวันที่ที่ยังไม่ถึง เท่านั้น\n");
	    			document.getElementById("datepicker").value="";
	    		}
	    	}	
	    }else{  
	    	if(finemonths < months && fineyeays > yeays){    
				err_txt+=(fineday+" / "+finemonths+" / "+fineyeays+"\n");
			}else{
				err_txt+=(fineday+" / "+finemonths+" / "+fineyeays+" กรุณาเลือกวันที่ที่ยังไม่ถึง เท่านั้น\n");
				document.getElementById("datepicker").value="";
			}
	    	
	    }
		
	    return (alert('วันที่ที่เลือก '+err_txt));
}
</script>
<script type="text/javascript">
/********************* Check WeekNo == DayInWeek*******************/
  var c = 0;
 $("#listweekNo").change(function () {
	var listweekNo = document.getElementById("listweekNo").value;
		/* alert( "listweekNo ==!!"+listweekNo ); */
		for(var z = 0; z <7 ;z++){
			if(document.getElementById("dayInWeeks"+[z]).checked != false){
				c++;
			}
		}
		/* alert( "c++++ ==!!"+c ); */
		for(var i = 0; i <7 ;i++){
		  if(c == listweekNo  && document.getElementById("dayInWeeks"+[i]).checked != true){
			  document.getElementById("dayInWeeks"+[i]).disabled = true;
		  }else{
			  document.getElementById("dayInWeeks"+[i]).disabled = false;
		  }
		}
 });
var s = 0;
for(var z = 0; z <7 ;z++){
	if(document.getElementById("dayInWeeks"+[z]).checked != false){
		s++;
	}
	/* alert( "c++++ ==!!"+s ); */
}
function dayInWeeksss2(x) {
		var listweekNo = document.getElementById("listweekNo").value;
		
		if(x.checked){	
			s++;
			
				for(var i = 0; i <7 ;i++){
				  if(s == listweekNo && x !=document.getElementById("dayInWeeks"+[i]) && document.getElementById("dayInWeeks"+[i]).checked != true){
					  document.getElementById("dayInWeeks"+[i]).disabled = true;
				  }
				}
			}else{
				for(var i = 0; i <7 ;i++){
					document.getElementById("dayInWeeks"+[i]).disabled = false;
				}
				s--;
				for(var i = 0; i <7 ;i++){
					  if(s == listweekNo && document.getElementById("dayInWeeks"+[i]).checked != true){
						  document.getElementById("dayInWeeks"+[i]).disabled = true;
					  }
					}
			}
		
}
/********************* Check MonthNo == DayInMonth*******************/
  var sumMonth1 = document.getElementById("sumMonth1").value;
  var sumMonth2 = document.getElementById("sumMonth2").value;
  var sumMonth3 = document.getElementById("sumMonth3").value;
  var pmn = 0;

 $("#pickMonths").change(function () { 
	 var datesNo = new Date();
		var month01 = datesNo.getMonth() + 1;
		var a = datesNo.getDate();
	 var pickMonths = document.getElementById("pickMonths").value;
	
	 if(pmn != pickMonths){
		 if(pmn == 4 || pmn == 6 || pmn == 9 || pmn == 11){
			
				for(var i = 0; i <sumMonth1 ;i++){
					document.getElementById("dayInMonthsOne"+[i+1]).checked = false;
					  document.getElementById("dayInMonthsOne"+[i+1]).disabled = false;
				}
			
	 	 document.getElementById("monthNo1").value= " ";
		}else if(pmn == 2 ){
			for(var i = 0; i <sumMonth3 ;i++){
				 document.getElementById("dayInMonthsThee"+[i+1]).checked = false;
				 document.getElementById("dayInMonthsThee"+[i+1]).disabled = false;
							
			}
				 document.getElementById("monthNo3").value= " ";
		 }else{
			 for(var i = 0; i <sumMonth2 ;i++){
				 document.getElementById("dayInMonthsTwo"+[i+1]).checked = false;
				 document.getElementById("dayInMonthsTwo"+[i+1]).disabled = false;
			}
				 document.getElementById("monthNo2").value= " ";
		}
	}
	/*  alert( "pickMonths ==!!"+pmn+" ==  "+ pickMonths+" "+sumMonth1+" "+sumMonth2+" "+sumMonth3);  */
	 pmn = pickMonths;
 }); 
var m = 0;
var a = 0;
var aNo = 0;
$("#monthNo1").change(function () { 
	var monthNo1 = document.getElementById("monthNo1").value;
			a = monthNo1;
			aNo = 1;
		/* alert( "listmonthNo ==!!"+monthNo1+" "+ sumMonth1);  */
		for(var z = 0; z <sumMonth1 ;z++){
			if(document.getElementById("dayInMonthsOne"+[z+1]).checked != false){
				m++;
			}
		}
		 /* alert( "m++++ ==!!"+m );  */
		for(var i = 0; i <sumMonth1 ;i++){
		  if(m == monthNo1 && document.getElementById("dayInMonthsOne"+[i+1]).checked != true){
			  document.getElementById("dayInMonthsOne"+[i+1]).disabled = true;
		  }else{
			  document.getElementById("dayInMonthsOne"+[i+1]).disabled = false;
		  }
		}
});
$("#monthNo2").change(function () { 
	var monthNo2 = document.getElementById("monthNo2").value;
			a = monthNo2;
			aNo = 2;
		/* alert( "listmonthNo ==!!"+monthNo2+" "+ sumMonth2);  */
		for(var z = 0; z <sumMonth2 ;z++){
			if(document.getElementById("dayInMonthsTwo"+[z+1]).checked != false){
				m++;
			}
		}
		 /* alert( "m++++ ==!!"+m );  */
		for(var i = 0; i < sumMonth2 ;i++){
		  if(m == monthNo2 && document.getElementById("dayInMonthsTwo"+[i+1]).checked != true){
			  document.getElementById("dayInMonthsTwo"+[i+1]).disabled = true;
		  }else{
			  document.getElementById("dayInMonthsTwo"+[i+1]).disabled = false;
		  }
		}
});
$("#monthNo3").change(function () { 
	var monthNo3 = document.getElementById("monthNo3").value;
			a = monthNo3;
			aNo = 3;
		/* alert( "listmonthNo ==!!"+monthNo3+" "+ sumMonth3); */ 
		for(var z = 0; z <sumMonth3 ;z++){
			if(document.getElementById("dayInMonthsthee"+[z+1]).checked != false){
				m++;
			}
		}
		 /* alert( "m++++ ==!!"+m );  */
		for(var i = 0; i <sumMonth3 ;i++){
		  if(m == monthNo3 && document.getElementById("dayInMonthsthee"+[i+1]).checked != true){
			  document.getElementById("dayInMonthsthee"+[i+1]).disabled = true;
		  }else{
			  document.getElementById("dayInMonthsthee"+[i+1]).disabled = false;
		  }
		}
});
var n = 0;
var s = "";
function listdayInMonths2(x) {
 		var pickMonths = document.getElementById("pickMonths").value;
 			if(s != pickMonths){
 				n=0;
 			}
 			s= pickMonths;
		if(x.checked){	
			n++;
			 /* alert( "n++++ ==!!"+n + " aNo ="+ aNo); */
				if(aNo == 1){
					for(var i = 0; i <sumMonth1 ;i++){
						  if(n ==a && x !=document.getElementById("dayInMonthsOne"+[i+1]) && document.getElementById("dayInMonthsOne"+[i+1]).checked != true){
							  document.getElementById("dayInMonthsOne"+[i+1]).disabled = true;
						  }
						}
				}else if(aNo == 2 ){
					for(var i = 0; i <sumMonth2 ;i++){
						  if(n ==a && x !=document.getElementById("dayInMonthsTwo"+[i+1]) && document.getElementById("dayInMonthsTwo"+[i+1]).checked != true){
							  document.getElementById("dayInMonthsTwo"+[i+1]).disabled = true;
						  }
						}
				} else{
					for(var i = 0; i <sumMonth3 ;i++){
						  if(n ==a && x !=document.getElementById("dayInMonthsThee"+[i+1]) && document.getElementById("dayInMonthsThee"+[i+1]).checked != true){
							  document.getElementById("dayInMonthsThee"+[i+1]).disabled = true;
						  }
						}
				}
			}else{
				/* alert( "n--- ==!!"+n);  */
				if(aNo == 1){
					for(var i = 0; i <sumMonth1 ;i++){
						document.getElementById("dayInMonthsOne"+[i+1]).disabled = false;
					}
					n--;
					for(var i = 0; i <sumMonth1 ;i++){
						  if(n == a && document.getElementById("dayInMonthsOne"+[i+1]).checked != true){
							  document.getElementById("dayInMonthsOne"+[i+1]).disabled = true;
						  }
						}
				}else if(aNo ==2 ){
					for(var i = 0; i <sumMonth2 ;i++){
						document.getElementById("dayInMonthsTwo"+[i+1]).disabled = false;
					}
					n--;
					for(var i = 0; i <sumMonth2 ;i++){
						  if(n == a && document.getElementById("dayInMonthsTwo"+[i+1]).checked != true){
							  document.getElementById("dayInMonthsTwo"+[i+1]).disabled = true;
						  }
						}
				}else{
					for(var i = 0; i <sumMonth3 ;i++){
						document.getElementById("dayInMonthsthee"+[i+1]).disabled = false;
					}
					n--;
					for(var i = 0; i <sumMonth3 ;i++){
						  if(n == a && document.getElementById("dayInMonthsthee"+[i+1]).checked != true){
							  document.getElementById("dayInMonthsthee"+[i+1]).disabled = true;
						  }
						}
				}
			}
		
}

</script>
<!-- Form Address Show Suggest Time And Price -->
<script type="text/javascript">
$("#listaddressFormat").change(function () {
    
    document.getElementById("suggestshowtime").innerHTML ='ระยะเวลาที่ แนะนำ'+" "+$(this).find(':selected').data('times');

    document.getElementById("suggestshowpricemin").innerHTML ='ราคาที่ แนะนำ'+" "+$(this).find(':selected').data('price');
	
    document.getElementById("suggestshowpricemix").innerHTML ='ราคาที่ แนะนำ'+" "+$(this).find(':selected').data('price');
});

/* Type Address Show Form Address */
$("#listaddressType").change(function() {
	var listaddresstype = document.getElementById("listaddressType").value;
	
	 var myId = $(this).find(':selected').data('suggestid');
     
	 if(listaddresstype == "ทั้งหมด"){
		 document.getElementById('showaddresstypes').style.display = 'none'; 
	}else if( myId <= "3"){
		document.getElementById("nameAddresstype").innerHTML = 'คอนโด';
		document.getElementById('showaddresstypes').style.display = 'block';
	}else {
		document.getElementById("nameAddresstype").innerHTML = 'บ้านพัก' ;
		 document.getElementById('showaddresstypes').style.display = 'block'; 
	} 
});
/* Check Price Mins And Max*/
 $("#priceMins").change(function() {
	var priceMins = document.getElementById("priceMins").value;
	var priceMax = document.getElementById("priceMax").value;
     
	 if(priceMax != "" && priceMins > priceMax){
		 document.getElementById('priceMins').style.border = "thick solid #ed3a14";
		 alert( "ราคาที่คุณต้องการ ' จะต้องน้อยกว่า '  ราคามากที่สุดที่คุณจะรับได้ !!" );
			document.getElementById("priceMins").innerHTML = "";
			document.getElementById("priceMins").focus();
			
			 return false;
	}else {
		document.getElementById('priceMins').style.border = "1px solid #000";
		return true;
	}
});
 $("#priceMax").change(function() {
		var priceMins = document.getElementById("priceMins").value;
		var priceMax = document.getElementById("priceMax").value;
	     
		 if(priceMax < priceMins){
			 document.getElementById('priceMax').style.border = "thick solid #ed3a14";
			 alert( "ราคาที่คุณต้องการ ' จะต้องน้อยกว่า '  ราคามากที่สุดที่คุณจะรับได้ !!" );
				document.getElementById("priceMax").innerHTML = "";
				document.getElementById("priceMax").focus();
				
				 return false;
		}else {
			document.getElementById('priceMax').style.border = "1px solid #000";
			return true;
		}
	});
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
	<script	src="https://unpkg.com/bootstrap@4.1.0/dist/js/bootstrap.min.js"></script>
		<script src="https://api-maps.thinknet.co.th/libs/thinknetmaps.1.2.0-rc0.min.js"></script>
 <script>
 /* latitude-and-longitude for Customer */
 $(document).ready(function(){
	var texts1 = document.getElementById("day").value;
		if(texts1 != null){
			showListDays();
		}
});
$(document).ready(function(){
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
	                	}); 
				 	});
			} 
			
		});
	};
});		 
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
</html> 