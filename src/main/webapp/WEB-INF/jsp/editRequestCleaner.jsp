<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@ page import="java.sql.DriverManager"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="org.hibernate.Session"%>
<%@page import="com.springmvc.model.Request"%>
<%@page import="java.util.Date"%>
<%@page import="com.springmvc.model.Login"%>
<%@page import="com.springmvc.model.ServicePerson"%>
<%@page import="com.springmvc.model.Company"%>
<%@page import="com.springmvc.model.Suggest"%>
<%@page import="com.springmvc.model.Customer"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <% 
      List<Request> requests = (List<Request>) request.getAttribute("listrequests");
      List<Customer> cus = (List<Customer>) request.getAttribute("customerdata");
      List<Suggest> Listsuggests = (List<Suggest>) request.getAttribute("suggests");
      List<Company> companies = (List<Company>) request.getAttribute("companies");
      List<ServicePerson> servicePersons = (List<ServicePerson>) request.getAttribute("servicePersons");
      List<String> listMonth = (List<String>) request.getAttribute("listMonth");
      List<String> listWeek = (List<String>) request.getAttribute("listWeek");
      Login user = (Login) session.getAttribute("user");%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Edit Request Cleaner</title>
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	 <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
	  <!-- Option 1: jQuery and Bootstrap Bundle (includes Popper) -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx" crossorigin="anonymous"></script>
	
	
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
 .btns2{
 	width: 40%; 
 	height: 100%;
 	font-size: 16px; 
	font-family: 'Sarabun', sans-serif;
 }
 
.checkbox label:after, 
.radio label:after {
    content: '';
    display: table;
    clear: both;
}

.checkbox .cr,
.radio .cr {
    position: relative;
    display: inline-block;
    border: 1px solid #a9a9a9;
    border-radius: .25em;
    width: 1.3em;
    height: 1.3em;
    float: left;
    margin-right: .5em;
}

.radio .cr {
    border-radius: 50%;
}

.checkbox .cr .cr-icon,
.radio .cr .cr-icon {
    position: absolute;
    font-size: .8em;
    line-height: 0;
    top: 50%;
    left: 20%;
}

.radio .cr .cr-icon {
    margin-left: 0.04em;
}
/* css Checkbox */
 .bg {
  height: 100%;
  display: flex;
  align-items: center;
  justify-content: center;
  flex-direction: column;
}

.span_pseudo, .chiller_cb span:before, .chiller_cb span:after {
  content: "";
  display: inline-block;
  background: #fff;
  width: 0;
  height: 0.2rem;
  position: absolute;
  transform-origin: 0% 0%;
}

.chiller_cb {
  position: relative;
  height: 2rem;
  display: flex;
  align-items: center;
}
.chiller_cb input {
  display: none;
}
.chiller_cb input:checked ~ span {
  background: #fd2727;
  border-color: #fd2727;
}
.chiller_cb input:checked ~ span:before {
  width: 1rem;
  height: 0.15rem;
  transition: width 0.1s;
  transition-delay: 0.3s;
}
.chiller_cb input:checked ~ span:after {
  width: 0.4rem;
  height: 0.15rem;
  transition: width 0.1s;
  transition-delay: 0.2s;
}
.chiller_cb input:disabled ~ span {
  background: #ececec;
  border-color: #dcdcdc;
}
.chiller_cb input:disabled ~ label {
  color: #dcdcdc;
}
.chiller_cb input:disabled ~ label:hover {
  cursor: default;
}
.chiller_cb label {
  padding-left: 2rem;
  position: relative;
  z-index: 2;
  cursor: pointer;
  margin-bottom:0;
}
.chiller_cb span {
  display: inline-block;
  width: 1.2rem;
  height: 1.2rem;
  border: 2px solid #ccc;
  position: absolute;
  left: 0;
  transition: all 0.2s;
  z-index: 1;
  box-sizing: content-box;
}
.chiller_cb span:before {
  transform: rotate(-55deg);
  top: 1rem;
  left: 0.37rem;
}
.chiller_cb span:after {
  transform: rotate(35deg);
  bottom: 0.35rem;
  left: 0.2rem;
}
</style>
<%
	Date dates = new Date();
		int month = 0;
		if(dates.getMonth()+1 == 2){
			month = 29;
		}else if(dates.getMonth()+1 == 4 || dates.getMonth()+1 ==6 ||dates.getMonth()+1 == 9 || dates.getMonth()+1 == 11){
			month = 30;
		}else{
			month = 31;
		}
%>
<script type="text/javascript">
/*<!-- ************* Script Cleaner Number ****************** -->*/

function showListDays2 () {
	var texts = document.getElementById("day").value; /* input value of radio id="day"  */
	document.getElementById('showCleanerno').style.display = 'block'; /* display id="showCleanerno"  */
	document.getElementById("cleanerNo").innerHTML = texts;	/* รับค่าจาก texts แล้วเอาไปใสใน ตัวที่มี id="cleanerNo" */
	document.getElementById('days').style.display = 'block'; 			/* display id="showCleanerno"  */

    document.getElementById('weeks').style.display = 'none';
    document.getElementById('months').style.display = 'none';
}
function showListWeek2 () {

    var texts = document.getElementById("week").value; 
    document.getElementById('showCleanerno').style.display = 'block';
    document.getElementById("cleanerNo").innerHTML = texts;
    document.getElementById('weeks').style.display = 'block'; 
    
    document.getElementById('days').style.display = 'none';
    document.getElementById('months').style.display = 'none';

}
function showListMonth2 () {
    var texts = document.getElementById("month").value; 
    document.getElementById('showCleanerno').style.display = 'block';
    document.getElementById("cleanerNo").innerHTML = texts;
    document.getElementById('months').style.display = 'block'; 
    
    document.getElementById('days').style.display = 'none';
    document.getElementById('weeks').style.display = 'none';

}
</script>
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

function ConfirmEditRequest() {
	var v = confirm("ท่านได้ตรวจสอบข้อมูลละเอียดดีแล้ว ยืนยันการสร้างคำข้อรับบริการหรือไม่ ?");
	if (v) {
		return true;
	}else{
		return false;
	}
}
</script>
</head>
<body>
<%--  <%
	Connection connect = null;
	Statement s = null;
	try{
		Class.forName("com.mysql.jdbc.Driver");
		connect =  DriverManager.getConnection("jdbc:mysql://localhost:3306/servicecleaner_5938_db?characterEncoding=UTF-8","root","1234");
		s = connect.createStatement();
%>  --%>
<!-- Header section -->
			<jsp:include page="../navbar/navbar.jsp"></jsp:include>
	<!-- Header section end -->
	<div class="container"><br>
		<div class="shadow p-3 mb-5 bg-white rounded" >
		<form action="${pageContext.request.contextPath}/doisUpdateRequestCleaner" method="post" style="margin: 2%;">
			<%for(Request r : requests){ %>
			<input type="hidden" name="requestid" value="<%=r.getRequestid()%>">
			<div class="form-row">
				<div class="form-group col-md-6">
					<span  style="font-family: 'Prompt', sans-serif;color: red"> * </span>
					<label for="cleanerNo" id="label1">จำนวนครั้งทำความสะอาด :</label>
				</div>
			</div>
			<div class="form-row" style="margin: 1% 2%;">
				<div class="form-group col-md-3">
						<p  class="ordios">
							<%if(!r.getCleanNo().equals("ครั้งเดียว")){ %>
								<input type="radio" id="day" name="cleanNo" value="ครั้งเดียว"  onclick="showListDays2()">  ครั้งเดียว
							<%}else{ %>
								<input type="radio" id="day" name="cleanNo" value="ครั้งเดียว" checked  onclick="showListDays2()">  ครั้งเดียว
							<%} %>
						</p>		
				</div>
				<div class="form-group col-md-3">
						<p  class="ordios">
							<%if(!r.getCleanNo().equals("หนึ่งสัปดาห์")){ %>
								<input type="radio" name="cleanNo" id="week" value="หนึ่งสัปดาห์"  onclick="showListWeek2()" >  หนึ่งสัปดาห์
							<%}else{ %>
								<input type="radio" name="cleanNo" id="week" value="หนึ่งสัปดาห์" checked onclick="showListWeek2()" >  หนึ่งสัปดาห์
							<%} %>
						</p>				
				</div>
				<div class="form-group col-md-3">
					<p  class="ordios">
						<%if(!r.getCleanNo().equals("หนึ่งเดือน")){ %>
							<input type="radio" name="cleanNo" id="month" value="หนึ่งเดือน"  onclick="showListMonth2()">  หนึ่งเดือน 
						<%}else{ %>
							<input type="radio" name="cleanNo" id="month" value="หนึ่งเดือน" checked onclick="showListMonth2()">  หนึ่งเดือน 
						<%} %>
					</p>
					
				</div>
			</div>
			<div class="form-row">
				<div class="form-group col-md-8">
					<span  style="font-family: 'Prompt', sans-serif;color: red"> * </span>
			      	<label for="province" id="label1">ประเภทของสถานที่ให้บริการทำความสะอาด :</label><br>
			      		<select name="listaddressType" id="listaddressType"  class="form-control" onchange="addressType()" style="margin: 1% 2%;">
						  	<%for(int i=0; i <Listsuggests.size();i++){ %>
					      				<%if(r.getAddressType() == Listsuggests.get(i).getAddressType()){ %>
					      					<option  value="<%=r.getAddressType()%>"><%=r.getAddressType()%></option>
					      				<%}else{ %>
								    		<option  value="<%=Listsuggests.get(i).getAddressType()%>"><%=Listsuggests.get(i).getAddressType()%></option>
								   		<%} %>
								    <%} %>
						</select>
							<input type="hidden" id="listaddressTypeSub" name="listaddressTypeSub" value="<%= r.getAddressType()%>">
	
				</div>
			</div>
			<div class="form-row">
				<div class="form-group col-md-11" id="showaddresstypes" style="display: none; margin: 1% 2%;">
					<fieldset  style="width:100%; margin-left: auto; margin-right: auto;border: 2px solid powderblue;padding: 2%  2%  2%  1% ;">
						<legend id="nameAddresstype"  class="ordios"></legend>
							<div class=" col-md-11">
								<span  style="font-family: 'Prompt', sans-serif;color: red;"> * </span>
						      	<label for="province" id="label1">รูปแบบของสถานที่ :</label><br>
						      	<select name="cleanerProviderServiceType" id="listaddressFormat" class="form-control" >
					      			<%for(int i=0; i <Listsuggests.size();i++){ %>
					      				<%if(Listsuggests.get(i).getAddressFormat().equals("2 - 3 ห้องนอน  2 ห้องน้ำ 1 ห้องครัว 1 ห้องน้่งเล่น")){ %>
					      					<option value="<%= r.getAbodeFormat()%>" data-times="<%= r.getSuggest().getSuggestTime() %>" data-price="<%= r.getSuggest().getSuggestPrice()%>"><%= r.getAbodeFormat()%></option>
					      				<%i+=1;}else{ %>
								    		<option value="<%= Listsuggests.get(i).getAddressFormat()%>" data-ids="<%=Listsuggests.get(i).getSuggestid()%>" data-times="<%= Listsuggests.get(i).getSuggestTime() %>" 
								    			data-price="<%= Listsuggests.get(i).getSuggestPrice()%>" data-addressTypes="<%=Listsuggests.get(i).getAddressType()%>"><%= Listsuggests.get(i).getAddressFormat()%></option>
								   		<%} %>
								    <%} %>
								</select>
									<input type="hidden" name="abodeFormatsub" id="abodeFormatsub" value="<%= r.getAbodeFormat() %>" >
					      			<input type="hidden" id="suggestid" name="suggestid" value="<%= r.getSuggest().getSuggestid()%>">
									<input type="hidden" id="suggestPrice" name="suggestPrice" value="<%= r.getSuggest().getSuggestPrice()%>">
									<input type="hidden" id="suggestTime" name="suggestTime" value="<%= r.getSuggest().getSuggestTime()%>">
									<input type="hidden" id="suggestType" name="suggestType" value="<%= r.getSuggest().getAddressType()%>">
									<input type="hidden" id="suggestFormat" name="suggestFormat" value="<%= r.getSuggest().getAddressFormat()%>">
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
						<%if(!r.getDoProvider().equals("ไม่มีผู้ให้บริการที่ต้องการ")){ %>
							<input type="radio" name="listcleanerProvider" value="ไม่มีผู้ให้บริการที่ต้องการ" id="showNotHistory"  onclick="showNotHistoryProviders()">  ไม่มีผู้ให้บริการที่ต้องการ
						<%}else{ %>
							<input type="radio" name="listcleanerProvider" value="ไม่มีผู้ให้บริการที่ต้องการ" id="showNotHistory" checked onclick="showNotHistoryProviders()">  ไม่มีผู้ให้บริการที่ต้องการ
						<%} %>
					</p>	
				</div>
				<div class="form-group col-md-3">
					<p  class="ordios">
						<%if(!r.getDoProvider().equals("ไม่มีผู้ให้บริการที่ต้องการ")){ %>
							<input type="radio"  name="listcleanerProvider" id="showhistory" value="ผู้ให้บริการที่เคยใช้งาน" onclick="showHistoryProviders()">  ผู้ให้บริการที่เคยใช้งาน
						<%}else{ %>
							<input type="radio"  name="listcleanerProvider" id="showhistory" value="ผู้ให้บริการที่เคยใช้งาน" onclick="showHistoryProviders()">  ผู้ให้บริการที่เคยใช้งาน
						<%} %>
					</p>
				</div>
			</div>
			<div class="form-row">
				<div class="form-group col-md-12 shadow-sm p-3 mb-5 bg-white rounded" id="ShowtHistoryProvider" style="display: none; margin: 1% 3%;">
					<fieldset style="width:100%; margin-left: auto; margin-right: auto;border: 2px solid powderblue;padding: 2%  2%  2%  1% ;">
						<legend id="listHistoryProvider" class="ordios">ผู้ให้บริการที่เคยใช้งาน :</legend>
							<div class="form-group col-md-12">
								<div class="row">
								<%if(servicePersons != null || companies != null){%>
								
									<%if(servicePersons != null){ %>
										<% for(ServicePerson sp :servicePersons){ %>
										<div class="col-sm-4">
								      	<div class="card" style="width: 18rem;">
											  <img class="card-img-top" src="${pageContext.request.contextPath}/PImgPerson/<%=sp.getProfilePhoto()%>" alt="Card image cap">
												  <div class="card-body">
												    	<label class="card-text"><i class="glyphicon glyphicon-user"></i> :<%= sp.getFirstName()+" "+sp.getLastName() %></label><br>				    	
												    	<label class="card-text"><i class="fas fa-phone-alt"></i> :<%=sp.getTel() %></label><br>
															<input  type="checkbox"  name="personid"  value="<%=sp.getPersonid() %>,"> :เลือก
												  	</div>		
										</div>
										</div>
										<%} %>
									<%} %>
									
									<%if(companies != null){ %>
										<%for(Company c :companies){ %>
										<div class="col-sm-4">
								      	<div class="card" style="width: 18rem;">
											  <img class="card-img-top" src="${pageContext.request.contextPath}/PImgCompany/<%= c.getProfilePhoto()%>" alt="Card image cap">
												  <div class="card-body">
												    	<label class="card-text"><i class="glyphicon glyphicon-user"></i> :<%= c.getCompanyName()%></label><br>
												    	<label class="card-text"><i class="fas fa-phone-alt"></i> :<%=c.getTel() %></label>
												  		 <input type="checkbox" name="companyid" value="<%=c.getCompanyid() %>,"> :เลือก
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
						<select name="timePeriod" id="timePeriod" class="form-control" onclick="addressType()" style="margin: 1% 2%;" >
						    <%for(int i=0; i <Listsuggests.size();i++){ %>
					      			<%if(Listsuggests.get(i).getAddressFormat().equals(r.getAbodeFormat())){ %>
					      				<option value="<%= Listsuggests.get(i).getSuggestTime()%>"><%= Listsuggests.get(i).getSuggestTime()%></option>
					      			<%i+=1;}else{ %>
								    	<option value="<%= Listsuggests.get(i).getSuggestTime()%>"><%= Listsuggests.get(i).getSuggestTime()%></option>
								  <%} %>
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
								      	<%SimpleDateFormat df1 = new SimpleDateFormat("dd-MM-yyyy") ;  %>
										<input class="input-medium form-control" type="text" name="startDate" id="datepicker" 
                							data-provide="datepicker" data-date-language="th-th" placeholder="วว/ดด/ปปปป" value="<%=df1.format(r.getServiceDate()) %>">
                						<label id="showScriptDate" style="font-size: 12px; color: red;"></label><br>   
							      	</div>
							      	<div class="form-group col-md-5">
							      		<span  style="font-family: 'Prompt', sans-serif;color: red"> * </span>
								      	<label id="label1">เวลาเริ่มการทำความสะอาด :</label><br>
										<input type="time" name="serviceTime" id="timeservice" class="form-control" value="<%=r.getServicePeriod()%>">  
							      	</div>
						      	</div>
						    </div>
							<div id="weeks" style="display: none;">
								<div class="form-row">
									<div class="form-group col-md-4">
										<span  style="font-family: 'Prompt', sans-serif;color: red"> * </span>
								      	<label id="label1">จำนวนครั้ง / สัปดาหห์</label><br>
								      	<input type="text" id="listweekNo" name="weekNo" class="form-control col-md-7" value="<%= r.getWeekNo()%>">
							      	</div>
							      	<div class="form-group col-md-6">
							      		<span  style="font-family: 'Prompt', sans-serif;color: red"> * </span>
								      	<label id="label1">วันในสัปดาหห์ :</label><br>
								      	<div class="checkboxWeek">
								      	<%if(!listWeek.equals("-")){ %>
								      		<%	String[] weeks = {"จ.","อ.","พ.","พฤ.","ศ.","ส.","อา."};
										int j = 0 ;
										 for(int i = 0; i < weeks.length ; i++) {%>
										 	<% if(listWeek.get(j).equals(weeks[i])){ %>
												<input type="checkbox" name="dayInWeed" id="dayInWeeks<%=i %>" checked onclick="dayInWeeksss2(dayInWeeks<%=i %>)" value="<%=weeks[i]%>,"> <%=weeks[i]  %>
												<%j++; %>
													<% if(j >= listWeek.size() ){
													j = 0 ;
													 }%> 
											<%}else{ %>
												<input type="checkbox" name="dayInWeed" id="dayInWeeks<%=i %>" disabled onclick="dayInWeeksss2(dayInWeeks<%=i %>)" value="<%=weeks[i]%>,"> <%=weeks[i]  %>  
											<%} %>
										<%} %>
										<%} %>
										</div>
							      	</div>
						      	</div><br>
						      	<div class="form-row">
							      	<div class="form-group col-md-6">
							      		<span  style="font-family: 'Prompt', sans-serif;color: red"> * </span>
								      	<label id="label1">เวลาเริ่มการทำความสะอาด :</label><br>
										<input type="time" name="serviceTime2" class="form-control" value="<%= r.getServicePeriod()%>">  
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
											<%if(!r.getMonths().equals("-")){ %>	
												<%for(int i = 0 ; i < m.length ; i++){ %>
													<%if( r.getMonths().equals(m[i]) ){ %>
														<option value="<%= i+1 %>"><%= m[i] %></option>
													<%} %>
												<%} %>
												<%for(int i = 0 ; i < m.length ; i++){ %>
													<%if( r.getMonths().equals(m[i]) ){ %>
													<%}else{ %>
														<option value="<%= i+1 %>"><%= m[i] %></option>
													<%} %>
												<%} %>
											<%} %>
										</select>  
							      	</div>
									<div class="form-group col-md-4">
										<span  style="font-family: 'Prompt', sans-serif;color: red"> * </span>
								      	<label id="label1">จำนวนครั้ง / เดือน</label><br>
								      	<select id="allWKAndMAndSD"  name="monthNo" class="form-control">
								      	<%if(!r.getMonthNo().equals("-")){ %>
								      		<%if(r.getMonths().equals("กุมภาพันธ์")){ %>
								      			<%for(int i = 0; i<29 ;i++){ %>
								      				<%if(Integer.parseInt(r.getMonthNo()) == i){ %>
								      					<option value="<%=r.getMonthNo()%>"><%=r.getMonthNo()%></option>
								      				<%} %>
								      			<%} %>
								      			<%for(int i = 0; i<29 ;i++){ %>
								      				<%if(Integer.parseInt(r.getMonthNo()) != i+1){ %>
								      					<option value="<%=i+1%>"><%=i+1%></option>
								      				<%} %>
								      			<%} %>
								      		<%}else if(r.getMonths().equals("เมษายน") || r.getMonths().equals("มิถุนายน") || r.getMonths().equals("กันยายน") || r.getMonths().equals("พฤศจิกายน") ){ %>
								      			<%for(int i = 0; i<30 ;i++){ %>
								      				<%if(Integer.parseInt(r.getMonthNo()) == i){ %>
								      					<option value="<%=r.getMonthNo()%>"><%=r.getMonthNo()%></option>
								      				<%} %>
								      			<%} %>
								      			<%for(int i = 0; i<30 ;i++){ %>
								      				<%if(Integer.parseInt(r.getMonthNo()) == i+1){ %>
								      				<%}else{ %>
								      					<option value="<%=i+1%>"><%=i+1%></option>
								      				<%} %>
								      			<%} %>
								      		<%}else { %>
								      			<%for(int i = 0; i<31 ;i++){ %>
								      				<%if(Integer.parseInt(r.getMonthNo()) == i){ %>
								      					<option value="<%=r.getMonthNo()%>"><%=r.getMonthNo()%></option>
								      				<%} %>
								      			<%} %>
								      			<%for(int i = 0; i<31 ;i++){ %>
								      				<%if(Integer.parseInt(r.getMonthNo()) == i+1){ %>
								      				<%}else{ %>
								      					<option value="<%=i+1%>"><%=i+1 %></option>
								      				<%} %>
								      			<%} %>
								      		<%} %>
								      	<%} %>
								      	</select>
							      	</div>
						      	</div><br>
						      	<div class="form-row">
							      	<div class="form-group col-md-4">
							      		<span  style="font-family: 'Prompt', sans-serif;color: red"> * </span>
								      	<label id="label1">เวลาเริ่มการทำความสะอาด :</label><br>
										<input type="time" name="serviceTime3"  class="form-control" value="<%= r.getServicePeriod()%>">    
							      	</div>
							      	<div class="form-group col-md-8">
							      		<span  style="font-family: 'Prompt', sans-serif;color: red"> * </span>
								      	<label id="label1">วันที่ในเดือน:</label><br>
								      	
								    		<%  int x = 0;
										for(int i = 0; i < 31 ; i++) {%>
											<input type="hidden" id="sumMonth" value="<%=month%>">
										<%if(!listMonth.get(x).equals("-")){ %>
									 		<%if(Integer.parseInt(listMonth.get(x)) == i+1 ){ %> 
												<input type="checkbox" name="dayInMonth" id="dayInMonth<%= i %>"  onclick="listdayInMonths2(dayInMonth<%= i %>)"  checked value="<%= i+1 %>," > <%=i+1  %>  
												<%x++;
													if(x >= listMonth.size() ){
														x = 0 ;
												} %>
											<%}	else{ %>
												<input type="checkbox" name="dayInMonth" id="dayInMonth<%= i %>" disabled onclick="listdayInMonths2(dayInMonth<%= i %>)" value="<%=i+1%>,"> <%=i+1  %>
											<%} %>
											
										<%} %>
										<%} %>
										
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
					<input type="text" name="priceMin" id="priceMins" class="form-control"  value="<%= r.getPriceMin()%>" onkeyup="checkpricemin(this)" style="margin: 1% 2%;"> 
					<label id="Moneymin" style="font-size: 12px; color: red;"></label><br>
				</div>
				<div class="form-group col-md-6">
					<span  style="font-family: 'Prompt', sans-serif;color: red"> * </span>
					<label id="label1">ราคามากที่สุดที่คุณจะรับได้ :</label><br>
						<span id="suggestshowpricemix"  style="margin: 1% 2%;"></span>
					<input type="text" name="priceMax" class="form-control" value="<%= r.getPriceMax()%>" onkeyup="checkpricemax(this)" style="margin: 1% 2%;">  
					<label id="Moneymax" style="font-size: 12px; color: red;"></label><br>
				</div>
			</div><br>
			<%for(Customer c : cus){ %>
				<input type="hidden" name="memberid" value="<%= c.getMemberid()%>">
				<input type="hidden" name="customerid" value="<%= c.getCustomerid()%>">
				<div class="form-row">
			    	<div class="form-group col-md-6">
			    		<span  style="font-family: 'Prompt', sans-serif;color: red"> * </span>
					    <label for="fname" id="label1">ชื่อจริง :</label><br>
					   	<input type="text" class="form-control"  id="fname" name="fname" onkeyup="FName(this)" style="margin: 1% 2%;" value="<%= c.getFirsName()%>">
					   	<label id="showScriptFname" style="font-size: 12px; color: red;"></label><br>
					</div>
			    	<div class="form-group col-md-6">
			    		<span  style="font-family: 'Prompt', sans-serif;color: red"> * </span>
					   	<label for="lname" id="label1">นามสกุล:</label><br>
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
					  			<%if(r.getAnimal().equals("มีสัตว์เลี้ยง ")){ %>
									<input type="radio" name="animal" value="มีสัตว์เลี้ยง " checked style="margin: 1% 2%;">  มีสัตว์เลี้ยง  
									<input type="radio" name="animal" value="ไม่มีสัตว์เลี้ยง" style="margin-left:  2%; ">  ไม่มีสัตว์เลี้ยง
								<%}else{ %>
									<input type="radio" name="animal" value="มีสัตว์เลี้ยง "  style="margin: 1% 2%;">  มีสัตว์เลี้ยง  
									<input type="radio" name="animal" value="ไม่มีสัตว์เลี้ยง" checked style="margin-left:  2%; ">  ไม่มีสัตว์เลี้ยง
								<%} %>
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
						<textarea class="form-control" name="notes" rows="3" style="margin: 1% 2%;" ><%= r.getNote()%></textarea>
					</div>
				</div><br>
				<input type="hidden" name="status" value="รอยืนยันใบเสนอราคา">
				<div class="form-row">
					<div class="form-group col-md-12" style="text-align: center;">
						<button type="submit" class="btn btn-success  btns2" style="color: black;" onclick="ConfirmEditRequest()">ยืนยัน</button>
						<a href="${pageContext.request.contextPath}/doCencalEditRequest?id=<%=r.getRequestid() %>" >
						<button type="button" class="btn btn-warning  btns2" >
						 	ยกเลิก</button></a>
					</div>
					
				</div>
				<%} %>
		</form>
		</div> 
	</div>

	<!-- FOOTER -->
		<jsp:include page="../footer/footer.jsp"></jsp:include>
	<!-- END FOOTER -->
<%-- 	 <%
	}catch(Exception e){
		System.out.println(e.getMessage());
		e.printStackTrace();
	}
	try{
		if(s!=null){
			s.close();
			connect.close();
		}
	}catch (SQLException e){
		System.out.println(e.getMessage());
		e.printStackTrace();
	}
	%>  --%>
</body>	
	
	
	
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
    
    <script src="/ServiceCleaner_5938/js/request.js"></script>
<!-- code address -->
<script type="text/javascript" src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script type="text/javascript" src="https://earthchie.github.io/jquery.Thailand.js/jquery.Thailand.js/dependencies/JQL.min.js"></script>
<script type="text/javascript" src="https://earthchie.github.io/jquery.Thailand.js/jquery.Thailand.js/dependencies/typeahead.bundle.js"></script>
<link rel="stylesheet" href="https://earthchie.github.io/jquery.Thailand.js/jquery.Thailand.js/dist/jquery.Thailand.min.css">
<script type="text/javascript" src="https://earthchie.github.io/jquery.Thailand.js/jquery.Thailand.js/dist/jquery.Thailand.min.js"></script>

<script type="text/javascript">
$(document).ready(function(){
var listaddressTypes = document.getElementById("listaddressType").value;
	if(listaddressType != null){
		 if( document.getElementById("listaddressType").value <= "3"){
				document.getElementById("nameAddresstype").innerHTML = 'คอนโด';
				document.getElementById('showaddresstypes').style.display = 'block';
			}else {
				document.getElementById("nameAddresstype").innerHTML = 'บ้านพัก';
				 document.getElementById('showaddresstypes').style.display = 'block'; 
			} 
	}
});
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
}
function dayInWeeksss2(x) {
	var listweekNo = document.getElementById("listweekNo").value;
	
	if(x.checked){	
		s++;
		alert( "s++++ ==!!"+s );
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

var m = 0;
$("#allWKAndMAndSD").change(function () {
	var monthNo = document.getElementById("allWKAndMAndSD").value;
	var sumMonth = document.getElementById("sumMonth").value;
	var pickMonths = document.getElementById("pickMonths").value;
		/* alert( "listmonthNo ==!!"+monthNo ); */
		for(var z = 0; z <sumMonth ;z++){
			if(document.getElementById("dayInMonth"+[z]).checked != false){
				m++;
			}
		}
		/* alert( "m++++ ==!!"+m ); */
		for(var i = 0; i <sumMonth ;i++){
		  if(m == monthNo  && document.getElementById("dayInMonth"+[i]).checked != true){
			  document.getElementById("dayInMonth"+[i]).disabled = true;
		  }else{
			  /* alert( "monthNo-- ==!!"+pickMonths ); */
			  document.getElementById("dayInMonth"+[i]).disabled = false;
				 if(pickMonths == 4 || pickMonths == 6 ||pickMonths == 9 ||pickMonths == 11 ){
					  document.getElementById("dayInMonth"+[30]).disabled = true;
				  }else if(pickMonths == 2){
					  document.getElementById("dayInMonth"+[29]).disabled = true;
					  document.getElementById("dayInMonth"+[30]).disabled = true;
				  }
		  }
		}
});
var n = 0;
var sumMonth = document.getElementById("sumMonth").value;
for(var z = 0; z <sumMonth ;z++){
	if(document.getElementById("dayInMonth"+[z]).checked != false){
		n++;
	}
}
function listdayInMonths2(x) {
	var monthNo = document.getElementById("allWKAndMAndSD").value;
	/* alert( "sumMonth ==!!"+sumMonth ); */
	if(x.checked){	
		n++;
		/* alert( "n++++ ==!!"+n ); */
			for(var i = 0; i <sumMonth ;i++){
			  if(n == monthNo && x !=document.getElementById("dayInMonth"+[i]) && document.getElementById("dayInMonth"+[i]).checked != true){
				  document.getElementById("dayInMonth"+[i]).disabled = true;
			  }
			}
		}else{
			for(var i = 0; i <sumMonth ;i++){
				document.getElementById("dayInMonth"+[i]).disabled = false;
			}
			n--;
			for(var i = 0; i <sumMonth ;i++){
				  if(n == monthNo && document.getElementById("dayInMonth"+[i]).checked != true){
					  document.getElementById("dayInMonth"+[i]).disabled = true;
				  }
				}
		}
}
</script>
<!-- Form Address Show Suggest Time And Price -->
<script type="text/javascript">
$("#listaddressType").change(function () {
    
	var listaddressType = document.getElementById("listaddressType").value;
	 document.getElementById("listaddressTypeSub").value =listaddressType;
	 
});
$("#listaddressFormat").change(function () {
    
	var listaddressFormat = document.getElementById("listaddressFormat").value;
	var id = $(this).find(':selected').data('ids');
 	document.getElementById("suggestid").value =id;
	 
    document.getElementById("suggestshowtime").innerHTML ='เวลาที่ แนะนำ'+" "+$(this).find(':selected').data('times')+" "+id;
    
    document.getElementById("suggestshowpricemin").innerHTML ='ราคาที่ แนะนำ'+" "+$(this).find(':selected').data('price');
    var price =$(this).find(':selected').data('price');
    document.getElementById("suggestPrice").value =price;  
    
    document.getElementById("suggestshowpricemix").innerHTML ='ราคาที่ แนะนำ'+" "+$(this).find(':selected').data('price');
    var times =$(this).find(':selected').data('times');
    document.getElementById("suggestTime").value =times;  
   
    var type =$(this).find(':selected').data('addressTypes');
    document.getElementById("suggestType").value =type;
	
	 document.getElementById("abodeFormatsub").value =listaddressFormat;
	 document.getElementById("suggestFormat").value =$(this).find(':selected').data('addressFormat'); 
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
		if(document.getElementById("day").checked){
			showListDays();
		}else if(document.getElementById("week").checked){
			showListWeek2();
		}else if(document.getElementById("month").checked){
			showListMonth2();
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
</body>
</html>