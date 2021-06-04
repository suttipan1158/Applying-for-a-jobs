<%@page import="com.springmvc.model.Login"%>
<%@page import="java.util.Date"%>
<%@page import="com.springmvc.model.Suggest"%>
<%@page import="com.springmvc.model.Customer"%>
<%@page import="com.springmvc.model.Request"%>
<%@page import="java.util.List"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <% List<Request> requests = (List<Request>) request.getAttribute("listrequests");
    	List<Customer> cus = (List<Customer>) request.getAttribute("customerdata");
      List<Suggest> Listsuggests = (List<Suggest>) request.getAttribute("suggests");
      List<String> listMonth = (List<String>) request.getAttribute("listMonth");
      List<String> listWeek = (List<String>) request.getAttribute("listWeek");
      Login user = (Login) session.getAttribute("user");
      %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>View Request Cleaner Detail</title>
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <!-- icon link -->
	<script src='https://kit.fontawesome.com/a076d05399.js'></script>
	 <!-- import jquery JS -->
	 	<link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
        <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
        <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
  	<!-- เลือกใช้ไฟล์ css ของ register.css -->
  		<link rel="stylesheet" type="text/css" href="/ServiceCleaner_5938/css/register2.css">
  		<link rel="stylesheet" type="text/css" href="/ServiceCleaner_5938/css/datepicker.css">
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
<style type="text/css">
	.contact-image{
    text-align: center;
}
.contact-image img{
    border-radius: 6rem;
    width: 11%;
    margin-top: -3%;
    transform: rotate(29deg);
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
  text-align: center;
  transition-duration: 0.4s;
  overflow: hidden;
  box-shadow: 0 5px 15px #193047;
  border-radius: 4px;
  	width: 100%; 
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
 
</style>
</head>

<script type="text/javascript">
 	function editRequestCleaner() {
	
 		document.getElementById('EditRequestData').style.display = 'block'; 
 		document.getElementById('ShowViewRequest').style.display = 'none'; 
	} 
	function cancelEditRequest() {
 		document.getElementById('EditRequestData').style.display = 'none'; 
 		document.getElementById('ShowViewRequest').style.display = 'block'; 
	} 
</script>
<script>
/// Script Alert Cancel Request Cleaner
function cancelRequestOfCustomer() {
  var txt;
  if (confirm("ท่านแน่ใจ หรือไม่ที่จะทำการ 'ยกเลิก' คำขอรับบริการทำความสะอาด ?")) {

  } else {
	retrue false;
  }
}
</script>
<body style="background: -webkit-linear-gradient(left, #7fe2ff, #00c6ff);">
<!-- Header section -->
			<jsp:include page="../navbar/navbar.jsp"></jsp:include>
	<!-- Header section end --><br>
	<div class="container">
		<div id="ShowViewRequest" class="shadow p-3 mb-5 bg-white rounded">
		  <div class="contact-image">
                <img src="https://image.ibb.co/kUagtU/rocket_contact.png" alt="rocket_contact"/>
            </div>
		<form action="${pageContext.request.contextPath}/goEditRequestCleanerPage" method="post">
		<%for(Request r : requests) {%>	
			<input type="hidden" name="requestid" value="<%=r.getRequestid()%>">
				<%if(!r.getWeekNo().equals("-")){ %>
					<div class="form-row">
						<input type="hidden" name="requestid" value="<%= r.getRequestid()%>">
						<div class="form-group col-md-6">
							<label>จำนวนครั้งทำความสะอาด :</label><br>
							<input type="text" id="cleanNo" name="cleanNo" class="form-control " disabled value="<%= r.getCleanNo()%>">
						</div>
						<div class="form-group col-md-6" id="allWeek">
							<i class="fa fa-calendar" style="font-size:24px"></i>
							<label>จำนวนครั้ง/สัปดาห์ :</label><br>
							<input type="text" id="allWKAndMAndSD" name="weekNo" class="form-control" disabled value="<%= r.getWeekNo()%>">
						</div>
					</div>
					<div class="form-row">
						<div class="form-group col-md-6" id="alldayInweek">
							<i class="fa fa-calendar" style="font-size:24px"></i>
							<label>วันในสัปดาห์ :</label><br>
							<%	String[] weeks = {"จ.","อ.","พ.","พฤ.","ศ.","ส.","อา."};
										int j = 0 ;
										 for(int i = 0; i < weeks.length ; i++) {%>
										 	<% if(listWeek.get(j).equals(weeks[i])){ %>
												<input type="checkbox" name="dayInWeed" checked disabled value="<%=weeks[i]%>,"> <%=weeks[i]  %>
												<%j++;%>
													 <% if(j >= listWeek.size()){
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
						<div class="form-group col-md-3">
							<label>เดือน :</label><br>
							<input type="text" id="cleanNo" name="cleanNo" class="form-control col-md-7" disabled value="<%= r.getMonths()%>">
						</div>
						<div class="form-group col-md-3" id="allMonthNo">
							<label>จำนวนครั้ง/เดือน :</label><br>
							<input type="text" id="allWKAndMAndSD"  name="monthNo" class="form-control col-md-7" disabled value="<%= r.getMonthNo()%>">
						</div>
					</div>
					<div class="form-row">
						<div class="form-group col-md-6" id="alldayInMonths">
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
						<div class="form-group col-md-6">
								<i class='far fa-clock' style='font-size:24px'></i>
								<label>เวลาเริ่มให้บริการทำความสะอาด :</label><br>
								<input type="text" id="servicePeriod" name="servicePeriod" class="form-control " disabled value="<%= r.getServicePeriod()%>">
						</div>
					</div>
				<%}else{ %>
					<div class="form-row">
						<div class="form-group col-md-4">
							<label>จำนวนครั้งทำความสะอาด :</label><br>
							<input type="text" id="cleanNo" name="cleanNo" class="form-control col-md-9" disabled value="<%= r.getCleanNo()%>">
						</div>
						<div class="form-group col-md-4">
							<% SimpleDateFormat df = new SimpleDateFormat("dd/MM/yyyy") ; %>
							<i class="fa fa-calendar" style="font-size:24px"></i>
							<label>วันที่ให้บริการทำความสะอาด :</label><br>
							<input type="text" id="allWKAndMAndSD" name="serviceDate" class="form-control col-md-9" disabled value="<%= df.format(r.getServiceDate())%>">
							<input type="hidden" id="allWKAndMAndSD" class="form-control col-md-7"  value="1">
						</div>
						<div class="form-group col-md-4">
								<i class='far fa-clock' style='font-size:24px'></i>
								<label>เวลาเริ่มให้บริการทำความสะอาด :</label><br>
								<input type="text" id="servicePeriod" name="servicePeriod" class="form-control col-md-9" disabled value="<%= r.getServicePeriod()%>">
						</div>
					</div>
				<%} %>
					<div class="form-row">
						<div class="form-group col-md-6">
							<i class='fas fa-house-user' style='font-size:24px'></i>
							<label>ประเภทที่อยู่ :</label><br>
							<input type="text" id="addressType" name="addressType" class="form-control" disabled value="<%= r.getAddressType()%>">
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
							<textarea class="form-control" disabled><%= r.getCustomer().getAddress()+" ตำบล "+r.getCustomer().getSubDistrict()+" อำเภอ "+r.getCustomer().getDistrict()
										+" จังหวัด "+r.getCustomer().getProvince()+" รหัสไปรษณีย์ "+r.getCustomer().getPostcode()%></textarea>
						</div>
						<div class="form-group col-md-6">
							<i class='far fa-clock' style='font-size:24px'></i>
							<label>ระยะเวลาในการให้บริการทำความสะอาด :</label><br>
							<input type="text" id="timePeriod" name="timePeriod" class="form-control" disabled value="<%= r.getTimePeriod()%>">
						</div>
					</div>
					<div class="form-row">
							<div class="form-group col-md-6">
								<i class="fa fa-money " style="font-size:24px"></i>
								<label>ราคาที่คุณต้องการ :</label><br>
								<input type="text" id="priceMin" name="priceMin" class="form-control" disabled value="<%= r.getPriceMin()+" - "+r.getPriceMax()%>">
							</div>
						<div class="form-group col-md-6">
							<i class='fas fa-cat' style='font-size:24px'></i>
							<label>ที่พักของคุณมีสัตว์เลี้ยง หรือไม่ :</label><br>
							<input type="text" id="animal" name="animal" class="form-control" disabled value="<%= r.getAnimal()%>">
						</div>
					</div>
					<div class="form-row">
						<%if(r.getStatus().equals("รอรับบริการทำความสะอาด") || r.getStatus().equals("บริการเสร็จสิ้น")){ %>
							<div class="form-group col-md-6">
								<i class="fa fa-money " style="font-size:24px"></i>
								<label>ผู้ให้บริการ :</label><br>
								<input type="text" id="priceMin" name="priceMin" class="form-control" disabled value="${names}">
							</div>
							<div class="form-group col-md-6">
								<i class="fa fa-money " style="font-size:24px"></i>
								<label>ราคาที่ผู้ให้บริการเสนอ :</label><br>
								<input type="text"  id="priceMax" name="priceMax" class="form-control" disabled value="${quotations}">
							</div>
						<%} %>
						
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
			
					<div class="form-row">
						<div class="col-md-12 center-block" style="text-align: center;" id="showEditRequest">
						<%if(!r.getStatus().equals("รอรับบริการทำความสะอาด")){ %>
								<button type="submit" class="btn btn-warning btn-lg btns2" style="width: 40%;">แก้ไขคำขอ</button>
							<a href="${pageContext.request.contextPath}/goDeleteRequestCleaner?id=<%= r.getRequestid() %>" >
								<button type="button" class="btn btn-success btn-lg btns2" style="width: 40%;" onclick="cancelRequestOfCustomer()">ยกเลิกคำขอ</button>
							</a>
						<% }%>
						</div>
					</div>
				<%} %>
				</form>
			</div>
	</div><br><br>
		<!-- FOOTER -->
		<jsp:include page="../footer/footer.jsp"></jsp:include>
	<!-- END FOOTER -->
</body>
</html>