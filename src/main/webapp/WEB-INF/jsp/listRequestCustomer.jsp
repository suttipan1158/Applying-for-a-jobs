<%@page import="com.springmvc.model.Login"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.springmvc.model.Request"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <% 	Login user = (Login) session.getAttribute("user");
    	String statusPick = (String) request.getAttribute("statusPick");
    %>
   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>List Request Customer</title>
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
    <!-- select file java Script -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.4/jquery.min.js"></script>
    <script src="//getbootstrap.com/2.3.2/assets/js/jquery.js"></script>
    <script src="//getbootstrap.com/2.3.2/assets/js/google-code-prettify/prettify.js"></script>
  <script src="/ServiceCleaner_5938/js/bootstrap-datepicker.js"></script>
    <script src="/ServiceCleaner_5938/js/bootstrap-datepicker-thai.js"></script>
    <script src="/ServiceCleaner_5938/js/locales/bootstrap-datepicker.th.js"></script>
  

<!-- Script -->
	<script src="/ServiceCleaner_5938/js/AllScript2.js"></script>
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
	 </style>	
    
</head>

<body style="background: -webkit-linear-gradient(left, #BEF2E5, #00c6ff);">
<!-- Header section -->
			<jsp:include page="../navbar/navbar.jsp"></jsp:include>
	<!-- Header section end -->
	<% session.setAttribute("user", user); %>
	<div class="container"><br>
		<div class="form-row">
				<div class="form-group col-md-5">
					<div class="input-group-btn">
						<div class="shadow p-3 mb-5 bg-white rounded">
							<h5 ><i class='fas fa-search' style='font-size:20px'></i>  ค้นหาสถานะของคำขอ</h5>
								<hr style="height: 5px; background-color: gray;">
							<button class="btn btn-success buttonCatagory"  data-toggle="modal" data-target="#myModal"  style="width: 200px; font-size: 16px;"> <i class="fas fa-bars"></i><span aria-hidden="true"></span> ตัวกรอง</button>
						
						</div>
					</div>
				</div>
		</div>
	</div>
	<div class="container">
	<input type="hidden" id="alertOffer" value="${messageOffer}">
	<%if( statusPick.equals("รอยืนยันใบเสนอราคา") || statusPick.equals("ทั้งหมด")){ %>
		<div class="shadow p-3 mb-5 bg-white rounded" >
		<label style="font-size: 20px;">สถานะคำขอรับบริการ : รอยืนยันใบเสนอราคา</label><hr style="height: 4px; background-color: gray;">
		<%List<Request> listrequest01 = (List<Request>) request.getAttribute("listrequest01");%>
		<%if(!listrequest01.isEmpty()){ %>	
		 <div class="paginate 1">
			<div class="items"> 	
				<%for(Request r : listrequest01) { %>
				<%if(r.getStatus().equals("รอยืนยันใบเสนอราคา")){ %>
					<div>
					<div class="form-row">
						<div class="form-group col-md-10">
						</div>
						<div class="form-group col-md-2">
							<a href="${pageContext.request.contextPath}/goViewRequestCustomerDetail?id=<%= r.getRequestid() %>">
								<button class="btn btn-success"  >ดูข้อมุลเพิ่มเติม</button>
							</a>
						</div>
					</div>
					<div class="form-row">
						<div class="form-group col-md-6">
							<label>ชื่อ - นามสกุล :</label><br>
							<input type="text" class="form-control " disabled value="<%= r.getCustomer().getFirsName() +"  "+r.getCustomer().getLastName() %>">
						</div>
						<div class="form-group col-md-6">
							<label>สถานะคำขอรับบริการ :</label><br>
							<input type="text" class="form-control" disabled value="<%= r.getStatus()%>">
						</div>
					</div>
					<div class="form-row">
							<%if(!r.getWeekNo().equals("-")){ %>
								<div class="form-group col-md-3">
									<label>จำนวนครั้ง/สัปดาห์ :</label><br>
									<input type="text" class="form-control col-md-7" disabled value="<%= r.getWeekNo()%>">
								</div>
								<div class="form-group col-md-3">
									<label>วันในสัปดาห์ :</label><br>
									<input type="text" class="form-control " disabled value="<%= r.getDayInWeek()%>">
								</div>
							<%}else if(!r.getMonthNo().equals("-")) {%>
								<div class="form-group col-md-3">
									<label>จำนวนครั้ง/เดือน :</label><br>
									<input type="text" class="form-control col-md-7" disabled value="<%= r.getMonthNo()%>">
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
					<div class="form-row">
						<div class="form-group col-md-6">
							<label>ประเภทที่อยู่อาศัย:</label><br>
							<input type="text" class="form-control" disabled value="<%= r.getSuggest().getAddressType()%>">
						</div>
						<div class="form-group col-md-6">
							<label>ราคาน้อยสุด - มากสุด :</label><br>
							<input type="text" class="form-control" disabled value="<%= r.getPriceMin() +" - "+r.getPriceMax() %>">
						</div>
					</div>
					<div class="form-row">
						<div class="form-group col-md-12">
							<label>ที่อยู่ :</label><br>
							<textarea class="form-control" disabled><%= r.getAddress()+" ตำบล "+r.getSubDistrict()+" อำเภอ "+r.getDistrict()
										+" จังหวัด "+r.getProvince()+" รหัสไปรษณีย์ "+r.getPostcode()%></textarea>
						</div>
					</div><hr  style="height: 2px; background-color: gray;">
					 </div>
				<%} %>
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
			<%}else {%>
					<h5 style="text-align: center;margin-top: 5%;">ยังไม่มีคำขอรับบริการจากลูกค้าที่อยู่ในสถานะ 'รอยืนยันใบเสนอราคา'</h5>
					<br>
			<%} %>
		</div>
		<%}%>
		
<!-- **************************************************************************************************************** -->
		<%List<Request> listrequest02 = (List<Request>) request.getAttribute("listrequest02");%>
			<%if(statusPick.equals("รอผู้ให้บริการยืนยัน") || statusPick.equals("ทั้งหมด") ){ %>
			<div class="shadow p-3 mb-5 bg-white rounded" >
		<label style="font-size: 20px;">สถานะคำขอรับบริการ : คำขอจากลูกค้าโดยเฉพาะ</label><hr style="height: 4px; background-color: gray;">	
				<%if(!listrequest02.isEmpty()){ %>
		 <div class="paginate 2">
				<div class="items"> 	
				<%for(Request r : listrequest02) { %>
			
					<div>
					<div class="form-row">
						<div class="form-group col-md-10">
						</div>
						<div class="form-group col-md-2">
							<a href="${pageContext.request.contextPath}/goViewRequestCustomerDetail?id=<%= r.getRequestid() %>">
								<button class="btn btn-success"  >ดูข้อมุลเพิ่มเติม</button>
							</a>
						</div>
					</div>
					<div class="form-row">
						<div class="form-group col-md-6">
							<label>ชื่อ - นามสกุล :</label><br>
							<input type="text" class="form-control " disabled value="<%= r.getCustomer().getFirsName() +"  "+r.getCustomer().getLastName() %>">
						</div>
						<div class="form-group col-md-6">
							<label>สถานะคำขอรับบริการ :</label><br>
							<input type="text" class="form-control" disabled value="<%= r.getStatus() %>">
						</div>
					</div>
					<div class="form-row">
							<%if(!r.getWeekNo().equals("-")){ %>
								<div class="form-group col-md-3">
									<label>จำนวนครั้ง/สัปดาห์ :</label><br>
									<input type="text" class="form-control col-md-7" disabled value="<%= r.getWeekNo()%>">
								</div>
								<div class="form-group col-md-3">
									<label>วันในสัปดาห์ :</label><br>
									<input type="text" class="form-control " disabled value="<%= r.getDayInWeek()%>">
								</div>
							<%}else if(!r.getMonthNo().equals("-")) {%>
								<div class="form-group col-md-3">
									<label>จำนวนครั้ง/เดือน :</label><br>
									<input type="text" class="form-control col-md-7" disabled value="<%= r.getMonthNo()%>">
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
					<div class="form-row">
						<div class="form-group col-md-6">
							<label>ประเภทที่อยู่อาศัย:</label><br>
							<input type="text" class="form-control" disabled value="<%= r.getSuggest().getAddressType()%>">
						</div>
						<div class="form-group col-md-6">
							<label>ราคาน้อยสุด - มากสุด :</label><br>
							<input type="text" class="form-control" disabled value="<%= r.getPriceMin() +" - "+r.getPriceMax() %>">
						</div>
					</div>
					<div class="form-row">
						<div class="form-group col-md-12">
							<label>ที่อยู่ :</label><br>
							<textarea class="form-control" disabled><%= r.getAddress()+" ตำบล "+r.getSubDistrict()+" อำเภอ "+r.getDistrict()
										+" จังหวัด "+r.getProvince()+" รหัสไปรษณีย์ "+r.getPostcode()%></textarea>
						</div>
					</div><hr  style="height: 2px; background-color: gray;">
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
			
				<%}else {%>
						<h5 style="text-align: center; margin-top: 5%;">ยังไม่มีคำขอรับบริการจากลูกค้าที่อยู่ในสถานะ 'รอผู้ให้บริการยืนยัน'</h5>
						<br>
				<%} %>
		<%}%>
			</div>
		</div><br><br><br><br>
		<!-- FOOTER -->
		<jsp:include page="../footer/footer.jsp"></jsp:include>
	<!-- END FOOTER -->
	
  <!-- The Modal ตัวกรอง -->
  <!-- Modal -->
  <div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog modal-lg">
      <div class="modal-content">
        <div class="modal-header">
         <h2 class="modal-title" style="float: none;">ค้นหาคำขอรับบริการ..</h2>
          <button type="button" class="close" data-dismiss="modal">&times;</button>
        </div>
        <div class="modal-body">
          <form action="${pageContext.request.contextPath}/searchGetAddressType"  method="post">
				<div class="form-row">
				    	<div class="form-row">
					    	<div class="form-group col-md-4">
					    		<label for="subdistrict">ตำบล/แขวง :</label><br>
					    		<input type="text" name="subDistrict" class="form-control" id="district" onkeyup="checkSubDistrictThai(this)">
					    		<label id="checkSubDistrict" style="font-size: 12px; color: red;"></label>
					    	</div>
		    				<div class="form-group col-md-4">
		    				 	<label for="district">อำเภอ/เขต :</label><br>
		    					 <input type="text" id="amphoe" name="district" class="form-control" onkeyup="checkdistrictThai(this)">    			  
				    			 <label id="checkdistrict" style="font-size: 12px; color: red;"></label>  
				    		</div>
				    		<div class="form-group col-md-4">
		      					<label for="province">จังหวัด :</label><br>
		      					<input type="text" id="province" name="province" class="form-control" onkeyup="checkprovinceThai(this)">
				    			<label id="checkprovince" style="font-size: 12px; color: red;"></label> 
				    		</div>
		    				<div class="form-group col-md-6">
				    			<input type="hidden" class="form-control" id="zipcode" name="postcode"  >
				    		</div>
			    		</div>
			    	</div>
					<div class="form-row">
				    		<div class="form-group col-md-7">
		      				<label for="province">ประเภทของคำขอรับบริการ :</label><hr>
					      		<select name="statusType" id="statusType" class="form-control"  >
					      			<option value="ทั้งหมด">ทั้งหมด</option>	
					      			<option value="รอยืนยันใบเสนอราคา">รอลูกค้ายืนยันใบเสนอราคา</option>	
					      			<option value="รอผู้ให้บริการยืนยัน">คำขอจากลูกค้าโดยเฉพาะ</option>		
								</select>
				    		</div>
				    </div>
				     <!-- Modal footer -->
			        <div class="modal-footer">
			          <button type="submit" class="btn btn-danger" style="font-size: 16px;" id="checkModelSubmit" onclick="inputAddresstext()">ค้นหา</button>
			        </div>
			         <% session.setAttribute("user", user); %>
			</form>
        </div>
      </div>
    </div>
  </div>
    <script type="text/javascript">
  $(document).ready(function(){
		var a = document.getElementById("alertOffer").value;
			if(a == "1"){
				alert("ยืนยันการยื่นในเสนอราคาเสร็จสิ้น");
			}else if(a == "2"){
				alert("ยืนยันการยื่นในเสนอราคาล้มเหลว กรุณาทำรายการใหม่อีกครั้งในภายหลัง");
			}
		});
  </script>
  <script type="text/javascript">
  
	function inputAddresstext() {
		request.removeAttribute("searchAddress");
	}
</script>
   <script src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/paginationlist/paginga.jquery.js"></script>
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
<!-- code address -->
<script type="text/javascript" src="https://earthchie.github.io/jquery.Thailand.js/jquery.Thailand.js/dependencies/JQL.min.js"></script>
<script type="text/javascript" src="https://earthchie.github.io/jquery.Thailand.js/jquery.Thailand.js/dependencies/typeahead.bundle.js"></script>
<link rel="stylesheet" href="https://earthchie.github.io/jquery.Thailand.js/jquery.Thailand.js/dist/jquery.Thailand.min.css">
<script type="text/javascript" src="https://earthchie.github.io/jquery.Thailand.js/jquery.Thailand.js/dist/jquery.Thailand.min.js"></script>

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
</body>
</html>