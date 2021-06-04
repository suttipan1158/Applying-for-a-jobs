<%@page import="com.springmvc.model.Quotations"%>
<%@page import="com.springmvc.model.Login"%>
<%@page import="com.springmvc.model.ServicePerson"%>
<%@page import="com.springmvc.model.Company"%>
<%@page import="com.springmvc.model.CleanerProvider"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.springmvc.model.Request"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%List<Company> companies = (List<Company>) request.getAttribute("companies"); %>
     <%List<ServicePerson> servicePersons = (List<ServicePerson>) request.getAttribute("servicePersons"); %>
     <%Login user = (Login) session.getAttribute("user");%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>List Request Cleaner</title>
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <!-- icon link -->
	<script src='https://kit.fontawesome.com/a076d05399.js'></script>
	  <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
	
 <!-- Option 1: jQuery and Bootstrap Bundle (includes Popper) -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    
<style type="text/css">
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
  transition: all 0.8s;
}

.btns2:active:after {
  padding: 0;
  margin: 0;
  opacity: 1;
  transition: 0s;
}

.btns2:focus { outline:0; }
 
</style>	
</head>
<body style="background-color: #D9ECF2;">
<!-- Header section -->
			<jsp:include page="../navbar/navbar.jsp"></jsp:include>
	<!-- Header section end -->
	<div class="container"><br>
		<div class="form-row">
				<div class="form-group col-md-5">
					<div class="shadow p-3 mb-5 bg-white rounded">
			      	<label for="province">ประเภทของสถานะคำขอรับบริการ :</label><hr>
			      		<select name="listStatusType" id="listaddressType" class="form-control">
			      			<option value="ทั้งหมด">ทั้งหมด</option>	
			      			<option value="รอยืนยันใบเสนอราคา">รอยืนยันใบเสนอราคา</option>	
			      			<option value="รอผู้ให้บริการยืนยันรับคำขอ">รอผู้ให้บริการยืนยันรับคำขอ</option>	
			      			<option value="รอรับบริการทำความสะอาด">รอรับบริการทำความสะอาด</option>
			      			<option value="บริการเสร็จสิ้น">บริการเสร็จสิ้น</option>		
						</select>
					</div>
				</div>
		</div>
		<input type="hidden" id="alertConfirm" value="${messageConfirm}">
		<input type="hidden" id="alertCancel" value="${messageCancel}">
	<div  id="status01" style="display: block;">
		<section class="shadow p-3 mb-5 bg-white rounded">
		<label>สถานะคำขอรับบริการ : รอยืนยันใบเสนอราคา</label><hr>	
			<%List<Request> statusNo1 = (List<Request>) request.getAttribute("statusNo1");
				List<String> quotationsNo = (List<String>) request.getAttribute("quotationsNo");
			if(!statusNo1.isEmpty()){ int i = 0;	%>
			 <div class="paginate 1">
				<div class="items"> 
				<% for(Request r : statusNo1) {%> 
					<div>
					<div class="form-row">
						<div class="form-group col-md-9">
						</div>
						<div class="form-group col-md-2">
							<a href="${pageContext.request.contextPath}/goViewRequestCleanerDetail?id=<%= r.getRequestid() %>">
								<button class="btn btn-success btns2"  >ดูข้อมุลเพิ่มเติม</button>
							</a>
						</div>
					</div>
					<div class="form-row">
							<%if(!r.getWeekNo().equals("-")){ %>
								<div class="form-group col-md-3">
									<label>จำนวนครั้ง/สัปดาห์ :</label><br>
									<input type="text" class="form-control" disabled value="<%= r.getWeekNo()%>">
								</div>
								<div class="form-group col-md-3">
									<label>วันในสัปดาห์ :</label><br>
									<input type="text" class="form-control " disabled value="<%= r.getDayInWeek()%>">
								</div>
							<%}else if(!r.getMonthNo().equals("-")) {%>
								<div class="form-group col-md-2">
									<label>เดือน :</label><br>
									<input type="text" class="form-control " disabled value="<%= r.getMonths()%>">
								</div>
								<div class="form-group col-md-2">
									<label>จำนวนครั้ง/เดือน :</label><br>
									<input type="text" class="form-control " disabled value="<%= r.getMonthNo()%>">
								</div>
								<div class="form-group col-md-2">
									<label>วันที่ / เดือน :</label><br>
									<input type="text" class="form-control" disabled value="<%= r.getDayInMonth()%>">
								</div>
							<%}else{ %>
								<div class="form-group col-md-6">
									<% SimpleDateFormat df = new SimpleDateFormat("dd/MM/yyyy") ; %>
									<label>วันที่ให้บริการทำความสะอาด :</label><br>
									<input type="text" class="form-control" disabled value="<%= df.format(r.getServiceDate())%>">
								</div>
							<%} %>
						
						<div class="form-group col-md-6">
							<label>เวลาเริ่มให้บริการทำความสะอาด :</label><br>
							<input type="text" class="form-control" disabled value="<%= r.getServicePeriod()%>">
						</div>
					</div>
					</div>
					<div class="form-row">
						<div class="form-group col-md-6">
							<label>ที่อยู่ :</label><br>
							<textarea class="form-control" disabled><%= r.getCustomer().getAddress()+""+r.getCustomer().getSubDistrict()+""+r.getCustomer().getDistrict()
										+""+r.getCustomer().getProvince()+""+r.getCustomer().getPostcode()%></textarea>
						</div>
						<div class="form-group col-md-6">
							<label>สถานะคำขอรับบริการ :</label><br>
							<input type="text" class="form-control" disabled value="<%= r.getStatus()%>">
						</div>
					</div>
					<div class="form-row">
						<div class="form-group col-md-6">
							<label>ประเภทที่อยู่อาศัย:</label><br>
							<input type="text" class="form-control" disabled value="<%= r.getAddressType()%>">
						</div>
						<div class="form-group col-md-4">
							<label>จำนวนผู้ยื่นใบเสนอราคา :</label><br>
							<input type="text" class="form-control" disabled value="<%= quotationsNo.get(i)%>">
						</div>
						<div class="form-group col-md-2">
							<label ></label>
							<div class="input-group-btn" >
								<a href="${pageContext.request.contextPath}/goListQuotationDetail?id=<%= r.getRequestid() %>">
						     		<button type="button" class="btn btn-warning "  > <i class="fas fa-bars"></i> ดูรายการ</button>
						     	</a>
					 		</div>
						</div>
					</div>
				<% i++;} %>
				</div>
				<div class="pager">
					<div class="firstPage">&laquo;</div>
					<div class="previousPage">&lsaquo;</div>
					<div class="pageNumbers"></div>
					<div class="nextPage">&rsaquo;</div>
					<div class="lastPage">&raquo;</div>
				</div>
			</div>
				<%}else{ %>
						<br>
							<h5 style="text-align: center;">ยังไม่มีคำขอที่อยู่ในสถานะ 'รอยืนยันใบเสนอราคา'</h5>
						<br>
				<%} %>
			</section>
		</div>
	
        <div  id="status02" style="display: block;">
        	<section class="shadow p-3 mb-5 bg-white rounded body1">
			<label>สถานะคำขอรับบริการ : รอผู้ให้บริการยืนยันรับคำขอ</label><hr>	
			<%	List<Request> statusNo2 = (List<Request>) request.getAttribute("statusNo2");
				List<String> listProivder = (List<String>) request.getAttribute("listProivder");
				if(!statusNo2.isEmpty()){ 
					int i =0;%>	
				 <div class="paginate 2">
				<div class="items"> 
				<% for(Request r : statusNo2) {%> 
					<div>
					<div class="form-row">
						<div class="form-group col-md-9">
						</div>
						<div class="form-group col-md-2">
							<a href="${pageContext.request.contextPath}/goViewRequestCleanerDetail?id=<%= r.getRequestid() %>">
								<button class="btn btn-success btns2"  >ดูข้อมุลเพิ่มเติม</button>
							</a>
						</div>
					</div>
					<div class="form-row">
							<%if(!r.getWeekNo().equals("-")){ %>
								<div class="form-group col-md-3">
									<label>จำนวนครั้ง/สัปดาห์ :</label><br>
									<input type="text" class="form-control " disabled value="<%= r.getWeekNo()%>">
								</div>
								<div class="form-group col-md-3">
									<label>วันในสัปดาห์ :</label><br>
									<input type="text" class="form-control " disabled value="<%= r.getDayInWeek()%>">
								</div>
							<%}else if(!r.getMonthNo().equals("-")) {%>
								<div class="form-group col-md-3">
									<label>จำนวนครั้ง/เดือน :</label><br>
									<input type="text" class="form-control " disabled value="<%= r.getMonthNo()%>">
								</div>
								<div class="form-group col-md-3">
									<label>วันที่ / เดือน :</label><br>
									<input type="text" class="form-control" disabled value="<%= r.getDayInMonth()%>">
								</div>
							<%}else{ %>
								<div class="form-group col-md-6">
									<% SimpleDateFormat df = new SimpleDateFormat("dd/MM/yyyy") ; %>
									<label>วันที่ให้บริการทำความสะอาด :</label><br>
									<input type="text" class="form-control" disabled value="<%= df.format(r.getServiceDate())%>">
								</div>
							<%} %>
						
						<div class="form-group col-md-6">
							<label>เวลาเริ่มให้บริการทำความสะอาด :</label><br>
							<input type="text" class="form-control" disabled value="<%= r.getServicePeriod()%>">
						</div>
					</div>
					</div>
					<div class="form-row">
						<div class="form-group col-md-6">
							<label>ที่อยู่ :</label><br>
							<textarea class="form-control" disabled><%= r.getCustomer().getAddress()+""+r.getCustomer().getSubDistrict()+""+r.getCustomer().getDistrict()
										+""+r.getCustomer().getProvince()+""+r.getCustomer().getPostcode()%></textarea>
						</div>
						<div class="form-group col-md-6">
							<label>สถานะคำขอรับบริการ :</label><br>
							<input type="text" class="form-control" disabled value="<%= r.getStatus()%>">
						</div>
					</div>
					<div class="form-row">
						<div class="form-group col-md-6">
							<label>ประเภทที่อยู่อาศัย:</label><br>
							<input type="text" class="form-control" disabled value="<%= r.getAddressType()%>">
						</div>
						<div class="form-group col-md-4">
							<label>จำนวนผู้จำนวนผู้ให้บริการที่ถูกเลือก :</label><br>
							
							<input type="text" class="form-control" disabled value="<%= listProivder.get(i)%>">
						</div>
						<div class="form-group col-md-2">
							<label ></label>
							<div class="input-group-btn" >
								<a href="${pageContext.request.contextPath}/goListQuotationDetail?id=<%= r.getRequestid() %>">
						     		<button type="button" class="btn btn-warning "  > <i class="fas fa-bars"></i> ดูรายการ</button>
						     	</a>
					 		</div>
						</div>
					</div><hr>
				<%i++;} %>
				</div>
				<div class="pager">
					<div class="firstPage">&laquo;</div>
					<div class="previousPage">&lsaquo;</div>
					<div class="pageNumbers"></div>
					<div class="nextPage">&rsaquo;</div>
					<div class="lastPage">&raquo;</div>
				</div>
			</div>
				<%	}else{ %>
						<br>
							<h5 style="text-align: center;">ยังไม่มีคำขอที่อยู่ในสถานะ 'รอผู้ให้บริการยืนยันรับคำขอ'</h5>
						<br>
				<%} %>
			</section>
		</div>
		<div id="status03" style="display: block;">
			<section class="shadow p-3 mb-5 bg-white rounded" >
			<label>สถานะคำขอรับบริการ : รอรับบริการทำความสะอาด</label><hr>
				<%	int i = 0; int j = 0 ; 
					List<Request> statusNo3 = (List<Request>) request.getAttribute("statusNo3");
					if(!statusNo3.isEmpty()){%>	 
					 <div class="paginate 3">
				<div class="items"> 
				<% for(Request r : statusNo3) {%> 
					<div>
						<div class="form-row">
							<div class="form-group col-md-9">
							</div>
							<div class="form-group col-md-2">
								<a href="${pageContext.request.contextPath}/goViewRequestCleanerDetail?id=<%= r.getRequestid() %>">
									<button class="btn btn-success btns2"  >ดูข้อมุลเพิ่มเติม</button>
								</a>
							</div>
						</div>
						<div class="form-row">
								<%if(!r.getWeekNo().equals("-")){ %>
								<div class="form-group col-md-3">
									<label>จำนวนครั้ง/สัปดาห์ :</label><br>
									<input type="text" class="form-control " disabled value="<%= r.getWeekNo()%>">
								</div>
								<div class="form-group col-md-3">
									<label>วันในสัปดาห์ :</label><br>
									<input type="text" class="form-control " disabled value="<%= r.getDayInWeek()%>">
								</div>
							<%}else if(!r.getMonthNo().equals("-")) {%>
								<div class="form-group col-md-3">
									<label>จำนวนครั้ง/เดือน :</label><br>
									<input type="text" class="form-control " disabled value="<%= r.getMonthNo()%>">
								</div>
								<div class="form-group col-md-3">
									<label>วันที่ / เดือน :</label><br>
									<input type="text" class="form-control" disabled value="<%= r.getDayInMonth()%>">
								</div>
							<%}else{ %>
								<div class="form-group col-md-6">
									<% SimpleDateFormat df = new SimpleDateFormat("dd/MM/yyyy") ; %>
									<label>วันที่ให้บริการทำความสะอาด :</label><br>
									<input type="text" class="form-control" disabled value="<%= df.format(r.getServiceDate())%>">
								</div>
							<%} %>
							<div class="form-group col-md-6">
								<label>เวลาเริ่มให้บริการทำความสะอาด :</label><br>
								<input type="text" class="form-control" disabled value="<%= r.getServicePeriod()%>">
							</div>
						</div>
						</div>
						<div class="form-row">
							<div class="form-group col-md-6">
								<label>ที่อยู่ :</label><br>
								<textarea  class="form-control" disabled="disabled"><%= r.getCustomer().getAddress()+""+r.getCustomer().getSubDistrict()+""+r.getCustomer().getDistrict()
										+""+r.getCustomer().getProvince()+""+r.getCustomer().getPostcode()%></textarea>
							</div>
							<div class="form-group col-md-6">
								<label>สถานะคำขอรับบริการ :</label><br>
								<input type="text" class="form-control" disabled value="<%= r.getStatus()%>">
							</div>
						</div>
						<div class="form-row">
							<div class="form-group col-md-6">
								<label>ประเภทที่อยู่อาศัย:</label><br>
								<input type="text" class="form-control" disabled value="<%= r.getAddressType()%>">
							</div>
							<%if(servicePersons != null){ %>
								<div class="form-group col-md-6">
									<label>ชื่อผู้ให้บริการ (บุคคล) :</label><br>
									<input type="text" class="form-control" disabled value="<%=servicePersons.get(i).getFirstName()+"  "+servicePersons.get(i).getLastName()%>"> 
								</div>
							<%i++;
								}else{ %>
								<div class="form-group col-md-6">
									<label>ชื่อผู้ให้บริการ (บริษัท) :</label><br>
									<input type="text" class="form-control" disabled value="<%= companies.get(j).getCompanyName()%>"> 
								</div> 
							 <%j++;
							 	} %> 
							 
						</div><hr>
					<%}%>
				</div>
				<div class="pager">
					<div class="firstPage">&laquo;</div>
					<div class="previousPage">&lsaquo;</div>
					<div class="pageNumbers"></div>
					<div class="nextPage">&rsaquo;</div>
					<div class="lastPage">&raquo;</div>
				</div>
			</div>
				<%}else{ %>
						<br>
							<h5 style="text-align: center;">ยังไม่มีคำขอที่อยู่ในสถานะ 'รอรับบริการทำความสะอาด'</h5>
						<br>
				<%} %>
				</section>
			</div>

		<div  id="status04" style="display: block;">
			<section class="shadow p-3 mb-5 bg-white rounded">
			<label>สถานะคำขอรับบริการ : บริการเสร็จสิ้น</label><hr>
				<%int x = 0; int y = 0 ;
					List<Request> statusNo4 = (List<Request>) request.getAttribute("statusNo4");
					if(!statusNo4.isEmpty()){%>	
					 <div class="paginate 4">
				<div class="items"> 
				<% for(Request r : statusNo4) {%> 
					<div>
					<div class="form-row">
						<div class="form-group col-md-9">
						</div>
						<div class="form-group col-md-2">
							<a href="${pageContext.request.contextPath}/goReviewCleanerProvider?id=<%= r.getRequestid() %>">
								<button class="btn btn-success btns2"  >ดูข้อมุลเพิ่มเติม</button>
							</a>
						</div>
					</div>

					<div class="form-row">
							<%if(!r.getWeekNo().equals("-")){ %>
								<div class="form-group col-md-3">
									<label>จำนวนครั้ง/สัปดาห์ :</label><br>
									<input type="text" class="form-control " disabled value="<%= r.getWeekNo()%>">
								</div>
								<div class="form-group col-md-3">
									<label>วันในสัปดาห์ :</label><br>
									<input type="text" class="form-control " disabled value="<%= r.getDayInWeek()%>">
								</div>
							<%}else if(!r.getMonthNo().equals("-")) {%>
								<div class="form-group col-md-3">
									<label>จำนวนครั้ง/เดือน :</label><br>
									<input type="text" class="form-control " disabled value="<%= r.getMonthNo()%>">
								</div>
								<div class="form-group col-md-3">
									<label>วันที่ / เดือน :</label><br>
									<input type="text" class="form-control" disabled value="<%= r.getDayInMonth()%>">
								</div>
							<%}else{ %>
								<div class="form-group col-md-6">
									<% SimpleDateFormat df = new SimpleDateFormat("dd/MM/yyyy") ; %>
									<label>วันที่ให้บริการทำความสะอาด :</label><br>
									<input type="text" class="form-control" disabled value="<%= df.format(r.getServiceDate())%>">
								</div>
							<%} %>
						<div class="form-group col-md-6">
							<label>เวลาเริ่มให้บริการทำความสะอาด :</label><br>
							<input type="text" class="form-control" disabled value="<%= r.getServicePeriod()%>">
						</div>
					</div>
					</div>
					<div class="form-row">
						<div class="form-group col-md-6">
							<label>ที่อยู่ :</label><br>
							<textarea  class="form-control" disabled="disabled"><%= r.getCustomer().getAddress()+""+r.getCustomer().getSubDistrict()+""+r.getCustomer().getDistrict()
									+""+r.getCustomer().getProvince()+""+r.getCustomer().getPostcode()%></textarea>
						</div>
						<div class="form-group col-md-6">
							<label>สถานะคำขอรับบริการ :</label><br>
							<input type="text" class="form-control" disabled value="<%= r.getStatus()%>">
						</div>
					</div>

					<div class="form-row">
						<div class="form-group col-md-6">
							<label>ประเภทที่อยู่อาศัย:</label><br>
							<input type="text" class="form-control" disabled value="<%= r.getAddressType()%>">
						</div>
						<%if(servicePersons != null){ %>
								<div class="form-group col-md-6">
									<label>ชื่อผู้ให้บริการ (บุคคล) :</label><br>
									<input type="text" class="form-control" disabled value="<%=servicePersons.get(x).getFirstName()+"  "+servicePersons.get(x).getLastName()%>"> 
								</div>
							<%i++;
								}else{ %>
								<div class="form-group col-md-6">
									<label>ชื่อผู้ให้บริการ (บริษัท) :</label><br>
									<input type="text" class="form-control" disabled value="<%= companies.get(y).getCompanyName()%>"> 
								</div> 
							 <%j++;
							 	} %> 
					</div>
					<%} %>
					</div>
				<div class="pager">
					<div class="firstPage">&laquo;</div>
					<div class="previousPage">&lsaquo;</div>
					<div class="pageNumbers"></div>
					<div class="nextPage">&rsaquo;</div>
					<div class="lastPage">&raquo;</div>
				</div>
			</div>
				<%}else{ %>
					<br>
						<h5 style="text-align: center;">ยังไม่มีคำขอที่อยู่ในสถานะ 'บริการเสร็จสิ้น'</h5>
					<br>
				<%} %>
			</section>
		</div>
	</div><br><br>
		<!-- FOOTER -->
		<jsp:include page="../footer/footer.jsp"></jsp:include>
	<!-- END FOOTER -->
	<!--====== Javascripts & Jquery ======-->
	<script type="text/javascript">
	$(document).ready(function(){
	
	var a1 = document.getElementById("alertConfirm").value;
		if(a1 == "1"){
			alert("ยืนยันใบเสนอราคาจากผู้ให้บริการเสร็จสิ้น");
		}else if(a1 == "2"){
			alert("ยืนยันใบเสนอราคาจากผู้ให้บริการล้มเหลว  กรุณาทำรายการใหม่อีกครั้งในภายหลัง");
		}
	var a2 = document.getElementById("alertCancel").value;
		if(a2 == "1"){
			alert("ยกเลิกคำขอรับบริการทำความสะอาดเสร็จสิ้น");
		}else if(a2 == "2"){
			alert("ยกเลิกคำขอรับบริการทำความสะอาดล้มเหลว กรุณาทำรายการใหม่อีกครั้งในภายหลัง");
		}
	});
</script>
<script>
$(function() {
	$(".paginate").paginga({
		// use default options
	});
  
	$(".paginate-page-2").paginga({
		page: 2
	});

	$(".paginate-no-scroll").paginga({
		scrollToTop: false
	});
});
</script>
<script type="text/javascript">
$("#listaddressType").change(function(){
	var category = document.getElementById('listaddressType').value;
		if(category == "รอยืนยันใบเสนอราคา"){
			document.getElementById('status01').style.display ='block';
			document.getElementById('status02').style.display ='none';
			document.getElementById('status03').style.display ='none';
			document.getElementById('status04').style.display ='none';
		}else if(category == "รอผู้ให้บริการยืนยันรับคำขอ"){
			document.getElementById('status02').style.display ='block';
			document.getElementById('status01').style.display ='none';
			document.getElementById('status03').style.display ='none';
			document.getElementById('status04').style.display ='none';
		}else if(category == "รอรับบริการทำความสะอาด"){
			document.getElementById('status03').style.display ='block';
			document.getElementById('status01').style.display ='none';
			document.getElementById('status02').style.display ='none';
			document.getElementById('status04').style.display ='none';
		}else if(category == "บริการเสร็จสิ้น"){
			document.getElementById('status04').style.display ='block';
			document.getElementById('status01').style.display ='none';
			document.getElementById('status02').style.display ='none';
			document.getElementById('status03').style.display ='none';
		}else{
			document.getElementById('status01').style.display ='block';
			document.getElementById('status02').style.display ='block';
			document.getElementById('status03').style.display ='block';
			document.getElementById('status04').style.display ='block';
		}
	 });
</script>
</body>
</html>