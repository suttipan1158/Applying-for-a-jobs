<%@page import="com.springmvc.model.Login"%>
<%@page import="com.springmvc.model.Company"%>
<%@page import="com.springmvc.model.ServicePerson"%>
<%@page import="com.springmvc.model.CleanerProvider"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="com.springmvc.model.Suggest"%>
<%@page import="com.springmvc.model.Customer"%>
<%@page import="com.springmvc.model.Request"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <% List<Request> requests = (List<Request>) request.getAttribute("listrequests");
     	List<CleanerProvider> listprovider = (List<CleanerProvider>) request.getAttribute("providerdata");
      List<String> listMonth = (List<String>) request.getAttribute("listMonth");
      List<String> listWeek = (List<String>) request.getAttribute("listWeek");
      Login user = (Login) session.getAttribute("user");
      %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>View Request Customer Detail</title>
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
	
 <!-- Option 1: jQuery and Bootstrap Bundle (includes Popper) -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    
  <!-- icon link -->
	<script src='https://kit.fontawesome.com/a076d05399.js'></script>
	
	 <!-- import jquery JS -->
	 	<link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
        <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
        <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
  	<!-- เลือกใช้ไฟล์ css ของ register.css -->
  		<link rel="stylesheet" type="text/css" href="/ServiceCleaner_5938/css/register2.css">
  		<link rel="stylesheet" type="text/css" href="/ServiceCleaner_5938/css/datepicker.css">
  	<!-- css Of Offer Quotation -->
  		<link rel="stylesheet" type="text/css" href="/ServiceCleaner_5938/css/modelOffer.css">
  	<!-- Script -->
	<script src="/ServiceCleaner_5938/js/AllScript2.js"></script>
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
	/* Date For Offer Quotation */ 
	Date date = new Date() ;
		date.setYear(date.getYear()+543);
		SimpleDateFormat df1 = new SimpleDateFormat("dd/MM/yyyy") ;

%>
</head>
<body style="background: -webkit-linear-gradient(left, #88CDF6 , #BCE6FF);">
<!-- Header section -->
			<jsp:include page="../navbar/navbar.jsp"></jsp:include>
	<!-- Header section end -->
	<div class="container">
		<div id="ShowViewRequest" class="shadow p-3 mb-5 bg-white rounded" >
		<form action="#" method="post">
		<%for(Request r : requests) {%>	
				<%if(!r.getWeekNo().equals("-")){ %>
					<div class="form-row">
						<input type="hidden" name="requestid" value="<%= r.getRequestid()%>">
						<div class="form-group col-md-6">
							<label>จำนวนครั้งทำความสะอาด :</label><br>
							<input type="text" id="cleanNo" name="cleanNo" class="form-control col-md-7" disabled value="<%= r.getCleanNo()%>">
						</div>
						<div class="form-group col-md-6" >
							<label>เสนอราคา ค่าบริการ :</label><br>
							<button type="button"  onclick="document.getElementById('id01').style.display='block'" style="width:auto;">ยื่นใบเสนอราคา</button>
						</div>
					</div>
					<div class="form-row">
						<div class="form-group col-md-2" id="allWeek">
							<i class="fa fa-calendar" style="font-size:24px"></i>
							<label>จำนวนครั้ง/สัปดาห์ :</label><br>
							<input type="text" id="allWKAndMAndSD" name="weekNo" class="form-control col-md-7" disabled value="<%= r.getWeekNo()%>">
						</div>
						<div class="form-group col-md-4" id="alldayInweek">
							<i class="fa fa-calendar" style="font-size:24px"></i>
							<label>วันในสัปดาห์ :</label><br>
							<%	String[] weeks = {"จ.","อ.","พ.","พฤ.","ศ.","ส.","อา."};
										int j = 0 ;
										 for(int i = 0; i < weeks.length ; i++) {%>
										 	<% if(listWeek.get(j).equals(weeks[i])){ %>
												<input type="checkbox" name="dayInWeed" checked disabled value="<%=weeks[i]%>,"> <%=weeks[i]  %>
												<%j++; %>
													<% if(j >= listWeek.size() ){
													j = 0 ;
													 }%> 
											<%}else{ %>
												<input type="checkbox" name="dayInWeed" disabled value="<%=weeks[i]%>,"> <%=weeks[i]  %>  
											<%} %>
										<%} %>
						</div>
						<div class="form-group col-md-6">
							<i class='far fa-clock' style='font-size:24px'></i>
							<label>เวลาเริ่มให้บริการทำความสะอาด :</label><br>
							<input type="text" id="servicePeriod" name="servicePeriod" class="form-control" disabled value="<%= r.getServicePeriod()%>">
						</div>
					</div>
				<%}else if(!r.getMonthNo().equals("-")) {%>
					<div class="form-row">
						<div class="form-group col-md-3">
							<label>จำนวนครั้งทำความสะอาด :</label><br>
							<input type="text" id="cleanNo" name="cleanNo" class="form-control col-md-7" disabled value="<%= r.getCleanNo()%>">
						</div>
						<div class="form-group col-md-3" id="allMonths">
							<i class="fa fa-calendar" style="font-size:24px"></i>
							<label>เดือน :</label><br>
							<input type="text" id="months"  name="months" class="form-control col-md-7" disabled value="<%= r.getMonths()%>">
						</div>
						<div class="form-group col-md-6" >
							<label>เสนอราคา ค่าบริการ :</label><br>
							<button type="button" onclick="document.getElementById('id01').style.display='block'" style="width:auto;">ยื่นใบเสนอราคา</button>
						</div>
					</div>
					<div class="form-row">
						<div class="form-group col-md-3" id="allMonthNo">
							<i class="fa fa-calendar" style="font-size:24px"></i>
							<label>จำนวนครั้ง/เดือน :</label><br>
							<input type="text" id="allWKAndMAndSD"  name="monthNo" class="form-control col-md-7" disabled value="<%= r.getMonthNo()%>">
						</div>
						<div class="form-group col-md-5" id="alldayInMonths">
							<i class="fa fa-calendar" style="font-size:24px"></i>
							<label>วันที่ / เดือน :</label><br>
							<%  int j = 0;
								for(int i = 0; i < month ; i++) {%>
								 	<%if(Integer.parseInt(listMonth.get(j)) == i+1 ){ %> 
										<input type="checkbox" name="dayInMonth"  checked  disabled  value="<%= i+1 %>"> <%=i+1  %>  
										<%j++;%>
											<% if(j >= listMonth.size() ){
												j = 0 ;
											} %>
										<%}	else{ %>
											<input type="checkbox" name="dayInMonth" disabled value="<%=i+1%>"> <%=i+1  %>
										<%} %>
									
								<%} %>
						</div>
						<div class="form-group col-md-4">
							<i class='far fa-clock' style='font-size:24px'></i>
							<label>เวลาเริ่มให้บริการทำความสะอาด :</label><br>
							<input type="text" id="servicePeriod" name="servicePeriod" class="form-control " disabled value="<%= r.getServicePeriod()%>">
						</div>
					</div>
				<%}else{ %>
					<div class="form-row">
						<div class="form-group col-md-6">
							<label>จำนวนครั้งทำความสะอาด :</label><br>
							<input type="text" id="cleanNo" name="cleanNo" class="form-control" disabled value="<%= r.getCleanNo()%>">
						</div>
						<div class="form-group col-md-6" >
							<label>เสนอราคา ค่าบริการ :</label><br>
							<button type="button" onclick="document.getElementById('id01').style.display='block'" style="width:auto;">ยื่นใบเสนอราคา</button>
						</div>
					</div>
					<div class="form-row">
						<div class="form-group col-md-6">
							<% SimpleDateFormat df = new SimpleDateFormat("dd/MM/yyyy") ; %>
							<i class="fa fa-calendar" style="font-size:24px"></i>
							<label>วันที่ให้บริการทำความสะอาด :</label><br>
							<input type="text" id="allWKAndMAndSD" name="serviceDate" class="form-control" disabled value="<%= df.format(r.getServiceDate())%>">
							<input type="hidden" id="allWKAndMAndSD"  value="1">
						</div>
						<div class="form-group col-md-6">
							<i class='far fa-clock' style='font-size:24px'></i>
							<label>เวลาเริ่มให้บริการทำความสะอาด :</label><br>
							<input type="text" id="servicePeriod" name="servicePeriod" class="form-control " disabled value="<%= r.getServicePeriod()%>">
						</div>
					</div>
				<%} %>
					<div class="form-row">
						<div class="form-group col-md-6">
							<i class='fas fa-house-user' style='font-size:24px'></i>
							<label>ประเภทที่อยู่ :</label><br>
							<input type="text" id="addressType" name="addressType" class="form-control" disabled value="<%= r.getSuggest().getAddressType()%>">
						</div>
						<div class="form-group col-md-6">
							<i class='fas fa-house-user' style='font-size:24px'></i>
							<label>รูปแบบที่พัก :</label><br>
							<input type="text" id="abodeFormat" name="abodeFormat" class="form-control" disabled value="<%= r.getAbodeFormat()%>">
							<input type="hidden" name="doProvider" value="<%= r.getDoProvider()%>">
						</div>
					</div>
					<div class="form-row">
						<div class="form-group col-md-6">
							<svg width="1.5em" height="1.5em" viewBox="0 0 16 16" class="bi bi-person-fill" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
								  <path fill-rule="evenodd" d="M3 14s-1 0-1-1 1-4 6-4 6 3 6 4-1 1-1 1H3zm5-6a3 3 0 1 0 0-6 3 3 0 0 0 0 6z"/>
							</svg>
							<label>ชื่อ - นามสกุล : </label><br>
							<input type="text"   class="form-control" disabled value="<%= r.getCustomer().getFirsName()+"  "+r.getCustomer().getLastName() %>">
						</div>
						<div class="form-group col-md-6">
							<i class='fas fa-phone-alt' style='font-size:24px'></i>
							<label>เบอร์โทรศัพท์ :</label><br>
							<input type="text" class="form-control" disabled value="<%= r.getCustomer().getTel()%>">
						</div>
					</div>
					<div class="form-row">
						<div class="form-group col-md-6">
							<i class="fa fa-map-marker" style="font-size:24px"></i>
							<label>ที่อยู่ :</label><br>
							<textarea class="form-control" disabled><%= r.getAddress()+" ตำบล "+r.getSubDistrict()+" อำเภอ "+r.getDistrict()
										+"จังหวัด "+r.getProvince()+" รหัสไปรษณีย์ "+r.getPostcode()%></textarea>
						</div>
						<div class="form-group col-md-6">
							<i class='fas fa-cat' style='font-size:24px'></i>
							<label>ที่พักของคุณมีสัตว์เลี้ยง หรือไม่ :</label><br>
							<input type="text" id="animal" name="animal" class="form-control" disabled value="<%= r.getAnimal()%>">
						</div>
					</div>
					<div class="form-row">
						<div class="form-group col-md-6">
							<i class='far fa-clock' style='font-size:24px'></i>
							<label>ระยะเวลาในการให้บริการทำความสะอาด :</label><br>
							<input type="text" id="timePeriod" name="timePeriod" class="form-control" disabled value="<%= r.getTimePeriod()%>">
						</div>
						<div class="form-group col-md-6">
							<i class="fa fa-money " style="font-size:24px"></i>
							<label>ราคาที่คุณต้องการ :</label><br>
							<input type="text" id="priceMin" name="priceMin" class="form-control" disabled value="<%= r.getPriceMin() +" - "+r.getPriceMax()%>">
						</div>
					</div>				
					<div class="form-row">
						<div class="form-group col-md-6">
							<i class='fas fa-edit' style='font-size:24px'></i>
							<label>หมายเหตุ :</label><br>
							<textarea class="form-control" id="note" name="note" disabled ><%= r.getNote()%></textarea>
						</div>
						<div class="form-group col-md-6">
							<i class="fa fa-spinner" style="font-size:24px"></i>
							<label>สถานะคำขอรับบริการ :</label><br>
							<input type="text" class="form-control" name="status" disabled value="<%= r.getStatus()%>">
						</div>
					</div>
				<%} %>
				</form>
			</div>
	</div>
	
<!-- Offer Quotation -->

<div id="id01" class="modal">
  
  <form class="modal-content animate" action="${pageContext.request.contextPath}/isOfferQuotationData" method="post" style="width: 50%;">
    <div class="container">
    <div class="imgcontainer">
      <span onclick="document.getElementById('id01').style.display='none'" class="close" title="Close Modal">&times;</span>
      <label style="font-size: 20px;">ใบเสนอราคา</label>
    </div>

    <div class="container">
      <label for="uname"><b>เสนอราคา ค่าบริการ :</b></label><br>
      <input type="text" class="form-control"  style="width: 100%;" placeholder="Enter Price" name="priceofferjob" required  onkeyup="checkpricemin(this)"><br>
		<label id="Moneymin"></label><br>
		<input type="hidden" name="priceofferdate" value="<%= df1.format(date) %>">
      <label for="psw"><b>หมายเหตุ :</b></label><br>
      <input type="text" class="form-control " style="width: 100%;" placeholder="Enter Note" name="noteOffer" required><br>
       <input type="hidden" name="statusoffer" value="รอลูกค้ายืนยัน">
      <button type="submit" class="btn btn-success " style="width: 100%; float: initial ;">ยืนยันใบเสนอราคา</button><br>
       <button type="reset" style="width: 100%;" onclick="document.getElementById('id01').style.display='none'" class="btn btn-warning ">ยกเลิกใบเสนอราคา</button>
    </div>
    	<% session.setAttribute("requests", requests);
    	session.setAttribute("listprovider", listprovider);
    	%>
    </div>
  </form>
</div>
<!-- FOOTER -->
		<jsp:include page="../footer/footer.jsp"></jsp:include>
	<!-- END FOOTER -->
<script>
// Get the modal
var modal = document.getElementById('id01');

// When the user clicks anywhere outside of the modal, close it
window.onclick = function(event) {
    if (event.target == modal) {
        modal.style.display = "none";
    }
}
</script>
</body>
</html>
