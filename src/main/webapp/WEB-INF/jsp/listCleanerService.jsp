<%@page import="com.springmvc.model.Login"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.springmvc.model.Quotations"%>
<%@page import="com.springmvc.model.Request"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%	/* Login user = (Login) session.getAttribute("user"); */
    	List<Quotations> listrq1 = (List<Quotations>) request.getAttribute("listRP1"); 
    	List<Quotations> listrq2 = (List<Quotations>) request.getAttribute("listRP2"); 
    	List<Quotations> listrq3 = (List<Quotations>) request.getAttribute("listRP3");
    	List<Quotations> listrq4 = (List<Quotations>) request.getAttribute("listRP4"); 
    	Login user = (Login) session.getAttribute("user"); 
    	
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>List Cleaner Service</title>
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
 <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">

  <!-- Option 1: jQuery and Bootstrap Bundle (includes Popper) -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx" crossorigin="anonymous"></script>

<!-- link Icon -->
	 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
  	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.3/css/all.css" integrity="sha384-UHRtZLI+pbxtHCWp1t77Bi1L4ZtiqrqD80Kn4Z8NTSRyMA2Fd33n5dQ8lWUE00s/" crossorigin="anonymous"></head>
  	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css" />
  	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
  	
  	   <script src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/paginationlist/paginga.jquery.js"></script>
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
	
	/*============== headder section ====================== */
		#labelCss {
			font-size: 20px;
		}

	 </style>	

</head>

<body style="background: -webkit-linear-gradient(left, #A8D0DA, #D8E8E8);">
<!-- Header section -->
			<jsp:include page="../navbar/navbar.jsp"></jsp:include>
	<!-- Header section end -->
	<div class="container"><br>
		<section class="shadow p-3 mb-5 bg-white rounded" style="width: 50%;">
				<div class="form-row">
				    <div class="form-group col-md-12">
		      			<label id="labelCss"><i class='fas fa-search' style='font-size:20px'></i>  ประเภทของสถานะการบริการทำความสะอาด :</label>
		      				<hr style="height: 4px;background-color:gray;">
		      			<select name="providerStatus" id="providerTypes" class="form-control">
		      				<option value="ทั้งหมด">ทั้งหมด</option>
							<option value="รอลูกค้ายืนยัน">รอลูกค้ายืนยัน</option>
							<option value="รอให้บริการ">รอให้บริการ</option>
							<option value="ให้บริการเสร็จสิ้นแล้ว">ให้บริการเสร็จสิ้นแล้ว</option>
							<option value="คำขอไม่ได้รับเลือก">คำขอไม่ได้รับเลือก</option>
						</select>
				    </div> 	
				</div>
		</section>
		<input type="hidden" id="alertFinish" value="${messageFinish}">
			<div class="shadow p-3 mb-5 bg-white rounded" id="status01">
				<p id="labelCss">ประเภทของสถานะการบริการทำความสะอาด  : รอลูกค้ายืนยัน</p>
					<hr style="height: 3px; background-color: gray;">
					<%if(!listrq1.isEmpty()){ %>
					 <div class="paginate 1">
						<div class="items"> 
					<%for(Quotations q :listrq1) {%>
					<div>
						<div class="form-row ">
							<div class="form-group col-md-10">
							</div>
							<div class="form-group col-md-2">
								<a href="${pageContext.request.contextPath}/goViewCleanerServiceDetail?id=<%= q.getQuotationsid()%>">
									<button class="btn btn-warning " name="Seemore" > ดูข้อมูลเพิ่มเติม... </button>
								</a>
							</div>
						</div>
						<div class="form-row ">
							<div class="form-group col-md-6" >
								<svg width="1.5em" height="1.5em" viewBox="0 0 16 16" class="bi bi-person-fill" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
								  <path fill-rule="evenodd" d="M3 14s-1 0-1-1 1-4 6-4 6 3 6 4-1 1-1 1H3zm5-6a3 3 0 1 0 0-6 3 3 0 0 0 0 6z"/>
								</svg>
								<label for="persomname" >ชื่อลูกค้า :</label><br>
								<input type="text" class="form-control" id="persomname" name="persomname" value="<%= q.getRequest().getCustomer().getFirsName()+"  "+q.getRequest().getCustomer().getLastName() %>" disabled >
							</div>
							<div class="form-group col-md-6">
								<i class="fa fa-spinner" style="font-size:24px"></i>
								<label for="persomname" >สถานะใบเสนอราคา :</label><br>
								<input type="text" class="form-control" id="persomname" name="persomname" value="<%= q.getStatus() %>" disabled >
							</div>
						</div>
						<div class="form-row ">
							<div class="form-group col-md-6">
								<i class="fa fa-money " style="font-size:24px"></i>
								<label for="tel">ราคาจากลูกค้า :</label><br>
								<input type="text" class="form-control" id="tel" name="tel" value="<%=q.getRequest().getPriceMin() +" - "+q.getRequest().getPriceMax() %>" disabled >
							</div>
							<div class="form-group col-md-6">
								<i class="fa fa-money" style="font-size:24px"></i>
								<label for="email">ราคาที่ยื่นใบเสนอ :</label><br>
								<input type="text" class="form-control" id="email" name="email" value="<%= q.getPriceOfferJob() %>" disabled >
							</div>
						</div>
						</div>
						<div class="form-row ">
							<%if(!q.getRequest().getWeekNo().equals("-")){ %>
								<div class="form-group col-md-2">
									<i class="fa fa-calendar" style="font-size:24px"></i>
									<label>จำนวนครั้ง/สัปดาห์ :</label><br>
									<input type="text" class="form-control col-md-7" disabled value="<%= q.getRequest().getWeekNo()%>">
								</div>
								<div class="form-group col-md-4">
									<i class="fa fa-calendar" style="font-size:24px"></i>
									<label>วันในสัปดาห์ :</label><br>
									<input type="text" class="form-control " disabled value="<%= q.getRequest().getDayInWeek()%>">
								</div>
							<%}else if(!q.getRequest().getMonthNo().equals("-")) {%>
								<div class="form-group col-md-2">
									<i class="fa fa-calendar" style="font-size:24px"></i>
									<label>จำนวนครั้ง/เดือน :</label><br>
									<input type="text" class="form-control col-md-7" disabled value="<%= q.getRequest().getMonthNo()%>">
								</div>
								<div class="form-group col-md-4">
									<i class="fa fa-calendar" style="font-size:24px"></i>
									<label>วันที่ / เดือน :</label><br>
									<input type="text" class="form-control" disabled value="<%= q.getRequest().getDayInMonth()%>">
								</div>
							<%}else{ %>
								<div class="form-group col-md-6">
									<i class="fa fa-calendar" style="font-size:24px"></i>
									<label for="tel">วันที่บริการ :</label><br>
									<% SimpleDateFormat df = new SimpleDateFormat("dd/MM/yyyy") ; %>
									<input type="text" class="form-control" id="tel" name="tel" value="<%= df.format(q.getRequest().getServiceDate())%>" disabled >
								</div>
							<%} %>
							<div class="form-group col-md-6">
								<i class="fa fa-map-marker" style="font-size:24px"></i>
								<label for="email">ประเภทที่อยู่อาศัย :</label><br>
								<input type="text" class="form-control" id="email" name="email" value="<%= q.getRequest().getSuggest().getAddressType() %>" disabled >
							</div>
						</div>
						
						<div class="form-row ">
							<div class="form-group col-md-12">
								<i class="fa fa-map-marker" style="font-size:24px"></i>
								<label for="address">ที่อยู่ :</label><br>
								<input type="text" class="form-control" id="address" name="address" value="<%=q.getRequest().getAddress()+" "+q.getRequest().getSubDistrict()+" "+
										q.getRequest().getDistrict()+" "+q.getRequest().getProvince()+" "+q.getRequest().getPostcode() %>" disabled >
							</div>
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
				<%}else{%>
					<h5 style="text-align: center;">ยังไม่มีคำขอที่อยู่ในสถานะ 'รอลูกค้ายืนยัน'</h5>
				<%} %>
				</div><br>
		
		 
		<div  class="shadow p-3 mb-5 bg-white rounded" id="status02"><br>
			<p id="labelCss">ประเภทของสถานะการบริการทำความสะอาด  : รอให้บริการ</p>
				<hr style="height: 3px; background-color: gray;">
				<% if(!listrq2.isEmpty()){ %>
					<div class="paginate 2">
						<div class="items"> 
					<%for(Quotations q : listrq2) {%>
						<div>
						<div class="form-row">
							<div class="form-group col-md-9">
							</div>
							<div class="form-group col-md-2">
								<a href="${pageContext.request.contextPath}/goViewCleanerServiceDetail?id=<%= q.getQuotationsid()%>">
									<button class="btn btn-warning " name="Seemore" > ดูข้อมูลเพิ่มเติม... </button>
								</a>
							</div>
						</div>
						<div class="form-row ">
							<div class="form-group col-md-6" >
								<svg width="1.5em" height="1.5em" viewBox="0 0 16 16" class="bi bi-person-fill" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
								  <path fill-rule="evenodd" d="M3 14s-1 0-1-1 1-4 6-4 6 3 6 4-1 1-1 1H3zm5-6a3 3 0 1 0 0-6 3 3 0 0 0 0 6z"/>
								</svg>
								<label for="persomname" >ชื่อลูกค้า :</label><br>
								<input type="text" class="form-control" id="persomname" name="persomname" value="<%= q.getRequest().getCustomer().getFirsName()+"  "+q.getRequest().getCustomer().getLastName() %>" disabled >
							</div>
							<div class="form-group col-md-6">
								<i class="fa fa-spinner" style="font-size:24px"></i>
								<label for="persomname" >สถานะใบเสนอราคา :</label><br>
								<input type="text" class="form-control" id="persomname" name="persomname" value="<%= q.getStatus() %>" disabled >
							</div>
						</div>
						<div class="form-row ">
							<div class="form-group col-md-6">
								<i class="fa fa-money " style="font-size:24px"></i>
								<label for="tel">ราคาจากลูกค้า :</label><br>
								<input type="text" class="form-control" id="tel" name="tel" value="<%=q.getRequest().getPriceMin() +" - "+q.getRequest().getPriceMax() %>" disabled >
							</div>
							<div class="form-group col-md-6">
								<i class="fa fa-money " style="font-size:24px"></i>
								<label for="email">ราคาที่ยื่นใบเสนอ :</label><br>
								<input type="text" class="form-control" id="email" name="email" value="<%= q.getPriceOfferJob() %>" disabled >
							</div>
						</div>
						</div>
						<div class="form-row ">
							<%if(!q.getRequest().getWeekNo().equals("-")){ %>
								<div class="form-group col-md-2">
									<label>จำนวนครั้ง/สัปดาห์ :</label><br>
									<input type="text" class="form-control col-md-7" disabled value="<%= q.getRequest().getWeekNo()%>">
								</div>
								<div class="form-group col-md-4">
									<label>วันในสัปดาห์ :</label><br>
									<input type="text" class="form-control " disabled value="<%= q.getRequest().getDayInWeek()%>">
								</div>
							<%}else if(!q.getRequest().getMonthNo().equals("-")) {%>
								<div class="form-group col-md-2">
									<label>จำนวนครั้ง/เดือน :</label><br>
									<input type="text" class="form-control col-md-7" disabled value="<%= q.getRequest().getMonthNo()%>">
								</div>
								<div class="form-group col-md-4">
									<label>วันที่ / เดือน :</label><br>
									<input type="text" class="form-control" disabled value="<%= q.getRequest().getDayInMonth()%>">
								</div>
							<%}else{ %>
								<div class="form-group col-md-6">
									<i class="fa fa-calendar" style="font-size:24px"></i>
									<label for="tel">วันที่บริการ :</label><br>
									<% SimpleDateFormat df = new SimpleDateFormat("dd/MM/yyyy") ; %>
									<input type="text" class="form-control" id="tel" name="tel" value="<%= df.format(q.getRequest().getServiceDate())%>" disabled >
								</div>
							<%} %>							
							<div class="form-group col-md-6">
								<i class="fa fa-map-marker" style="font-size:24px"></i>
								<label for="email">ประเภทที่อยู่อาศัย :</label><br>
								<input type="text" class="form-control" id="email" name="email" value="<%= q.getRequest().getSuggest().getAddressType() %>" disabled >
							</div>
						</div>
						<div class="form-row ">
							<div class="form-group col-md-12">
								<i class="fa fa-map-marker" style="font-size:24px"></i>
								<label for="address">ที่อยู่ :</label><br>
								<input type="text" class="form-control" id="address" name="address" value="<%=q.getRequest().getAddress()+" "+q.getRequest().getSubDistrict()+" "+
										q.getRequest().getDistrict()+" "+q.getRequest().getProvince()+" "+q.getRequest().getPostcode() %>" disabled >
							</div>
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
				<%}else{%>
					<h5  style="text-align: center;">ยังไม่มีคำขอที่อยู่ในสถานะ 'รอให้บริการ'</h5>
				<%} %>
			</div><br>
		
			<div class="shadow p-3 mb-5 bg-white rounded" id="status03"><br>
				<p id="labelCss">ประเภทของสถานะการบริการทำความสะอาด : ให้บริการเสร็จสิ้นแล้ว</p>
					<hr style="height: 3px; background-color: gray;">
					 <% if(!listrq3.isEmpty()){ %>
					<div class="paginate 3">
						<div class="items"> 
					<%for(Quotations q : listrq3) {%>
						<div>
						<div class="form-row ">
							<div class="form-group col-md-9">
							</div>
							<div class="form-group col-md-2">
								<a href="${pageContext.request.contextPath}/goViewCleanerServiceDetail?id=<%= q.getQuotationsid()%>">
									<button class="btn btn-warning " name="Seemore" > ดูข้อมูลเพิ่มเติม... </button>
								</a>
							</div>
						</div>
						<div class="form-row ">
							<div class="form-group col-md-6" ><br>
								<svg width="1.5em" height="1.5em" viewBox="0 0 16 16" class="bi bi-person-fill" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
								  <path fill-rule="evenodd" d="M3 14s-1 0-1-1 1-4 6-4 6 3 6 4-1 1-1 1H3zm5-6a3 3 0 1 0 0-6 3 3 0 0 0 0 6z"/>
								</svg>
								<label for="persomname" >ชื่อลูกค้า :</label>
								<input type="text" class="form-control" id="persomname" name="persomname" value="<%= q.getRequest().getCustomer().getFirsName()+"  "+q.getRequest().getCustomer().getLastName() %>" disabled >
							</div>
							<div class="form-group col-md-6">
								<i class="fa fa-check" style="font-size:24px"></i>
								<label for="persomname" >สถานะใบเสนอราคา :</label><br>
								<input type="text" class="form-control" id="persomname" name="persomname" value="<%= q.getStatus() %>" disabled >
							</div>
						</div>
						<div class="form-row ">
							<div class="form-group col-md-6">
								<i class="fa fa-money " style="font-size:24px"></i>
								<label for="tel">ราคาจากลูกค้า :</label><br>
								<input type="text" class="form-control" id="tel" name="tel" value="<%=q.getRequest().getPriceMin() +" - "+q.getRequest().getPriceMax() %>" disabled >
							</div>
							<div class="form-group col-md-6">
								<i class="fa fa-money " style="font-size:24px"></i>
								<label for="email">ราคาที่ยื่นใบเสนอ :</label><br>
								<input type="text" class="form-control" id="email" name="email" value="<%= q.getPriceOfferJob() %>" disabled >
							</div>
						</div>
						</div>
						<div class="form-row ">
							<%if(!q.getRequest().getWeekNo().equals("-")){ %>
								<div class="form-group col-md-2">
									<label>จำนวนครั้ง/สัปดาห์ :</label><br>
									<input type="text" class="form-control col-md-7" disabled value="<%= q.getRequest().getWeekNo()%>">
								</div>
								<div class="form-group col-md-4">
									<label>วันในสัปดาห์ :</label><br>
									<input type="text" class="form-control " disabled value="<%= q.getRequest().getDayInWeek()%>">
								</div>
							<%}else if(!q.getRequest().getMonthNo().equals("-")) {%>
								<div class="form-group col-md-2">
									<label>จำนวนครั้ง/เดือน :</label><br>
									<input type="text" class="form-control col-md-7" disabled value="<%= q.getRequest().getMonthNo()%>">
								</div>
								<div class="form-group col-md-4">
									<label>วันที่ / เดือน :</label><br>
									<input type="text" class="form-control" disabled value="<%= q.getRequest().getDayInMonth()%>">
								</div>
							<%}else{ %>
								<div class="form-group col-md-6">
									<i class="fa fa-calendar" style="font-size:24px"></i>
									<label for="tel">วันที่บริการ :</label><br>
									<% SimpleDateFormat df = new SimpleDateFormat("dd/MM/yyyy") ; %>
									<input type="text" class="form-control" id="tel" name="tel" value="<%= df.format(q.getRequest().getServiceDate())%>" disabled >
								</div>
							<%} %>
							<div class="form-group col-md-6">
								<i class="fa fa-map-marker" style="font-size:24px"></i>
								<label for="email">ประเภทที่อยู่อาศัย :</label><br>
								<input type="text" class="form-control" id="email" name="email" value="<%= q.getRequest().getSuggest().getAddressType() %>" disabled >
							</div>
						</div>
						<div class="form-row ">
							<div class="form-group col-md-12">
								<i class="fa fa-map-marker" style="font-size:24px"></i>
								<label for="address">ที่อยู่ :</label><br>
								<input type="text" class="form-control" id="address" name="address" value="<%=q.getRequest().getAddress()+" "+q.getRequest().getSubDistrict()+" "+
										q.getRequest().getDistrict()+" "+q.getRequest().getProvince()+" "+q.getRequest().getPostcode() %>" disabled >
							</div>
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
				<%}else{%>
					<h5 style="text-align: center;">ยังไม่มีคำขอที่อยู่ในสถานะ 'ให้บริการเสร็จสิ้นแล้ว'</h5>
				<%} %>
			</div><br>
				<div class="shadow p-3 mb-5 bg-white rounded" id="status04"><br>
				<p id="labelCss">ประเภทของสถานะการบริการทำความสะอาด : คำขอไม่ได้รับเลือก</p>
					<hr style="height: 3px; background-color: gray;">
					 <% if(!listrq4.isEmpty()){ %>
					<div class="paginate 4">
						<div class="items"> 
					<%for(Quotations q : listrq4) {%>
						<div>
						<div class="form-row ">
							<div class="form-group col-md-9">
							</div>
							<div class="form-group col-md-2">
								<a href="${pageContext.request.contextPath}/goViewCleanerServiceDetail?id=<%= q.getQuotationsid()%>">
									<button class="btn btn-warning " name="Seemore" > ดูข้อมูลเพิ่มเติม... </button>
								</a>
							</div>
						</div>
						<div class="form-row ">
							<div class="form-group col-md-6" ><br>
								<svg width="1.5em" height="1.5em" viewBox="0 0 16 16" class="bi bi-person-fill" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
								  <path fill-rule="evenodd" d="M3 14s-1 0-1-1 1-4 6-4 6 3 6 4-1 1-1 1H3zm5-6a3 3 0 1 0 0-6 3 3 0 0 0 0 6z"/>
								</svg>
								<label for="persomname" >ชื่อลูกค้า :</label>
								<input type="text" class="form-control" id="persomname" name="persomname" value="<%= q.getRequest().getCustomer().getFirsName()+"  "+q.getRequest().getCustomer().getLastName() %>" disabled >
							</div>
							<div class="form-group col-md-6">
								<i class="fa fa-check" style="font-size:24px"></i>
								<label for="persomname" >สถานะใบเสนอราคา :</label><br>
								<input type="text" class="form-control" id="persomname" name="persomname" value="<%= q.getStatus() %>" disabled >
							</div>
						</div>
						<div class="form-row ">
							<div class="form-group col-md-6">
								<i class="fa fa-money " style="font-size:24px"></i>
								<label for="tel">ราคาจากลูกค้า :</label><br>
								<input type="text" class="form-control" id="tel" name="tel" value="<%=q.getRequest().getPriceMin() +" - "+q.getRequest().getPriceMax() %>" disabled >
							</div>
							<div class="form-group col-md-6">
								<i class="fa fa-money " style="font-size:24px"></i>
								<label for="email">ราคาที่ยื่นใบเสนอ :</label><br>
								<input type="text" class="form-control" id="email" name="email" value="<%= q.getPriceOfferJob() %>" disabled >
							</div>
						</div>
						</div>
						<div class="form-row ">
							<%if(!q.getRequest().getWeekNo().equals("-")){ %>
								<div class="form-group col-md-2">
									<label>จำนวนครั้ง/สัปดาห์ :</label><br>
									<input type="text" class="form-control col-md-7" disabled value="<%= q.getRequest().getWeekNo()%>">
								</div>
								<div class="form-group col-md-4">
									<label>วันในสัปดาห์ :</label><br>
									<input type="text" class="form-control " disabled value="<%= q.getRequest().getDayInWeek()%>">
								</div>
							<%}else if(!q.getRequest().getMonthNo().equals("-")) {%>
								<div class="form-group col-md-2">
									<label>จำนวนครั้ง/เดือน :</label><br>
									<input type="text" class="form-control col-md-7" disabled value="<%= q.getRequest().getMonthNo()%>">
								</div>
								<div class="form-group col-md-4">
									<label>วันที่ / เดือน :</label><br>
									<input type="text" class="form-control" disabled value="<%= q.getRequest().getDayInMonth()%>">
								</div>
							<%}else{ %>
								<div class="form-group col-md-6">
									<i class="fa fa-calendar" style="font-size:24px"></i>
									<label for="tel">วันที่บริการ :</label><br>
									<% SimpleDateFormat df = new SimpleDateFormat("dd/MM/yyyy") ; %>
									<input type="text" class="form-control" id="tel" name="tel" value="<%= df.format(q.getRequest().getServiceDate())%>" disabled >
								</div>
							<%} %>
							<div class="form-group col-md-6">
								<i class="fa fa-map-marker" style="font-size:24px"></i>
								<label for="email">ประเภทที่อยู่อาศัย :</label><br>
								<input type="text" class="form-control" id="email" name="email" value="<%= q.getRequest().getSuggest().getAddressType() %>" disabled >
							</div>
						</div>
						<div class="form-row ">
							<div class="form-group col-md-12">
								<i class="fa fa-map-marker" style="font-size:24px"></i>
								<label for="address">ที่อยู่ :</label><br>
								<input type="text" class="form-control" id="address" name="address" value="<%=q.getRequest().getAddress()+" "+q.getRequest().getSubDistrict()+" "+
										q.getRequest().getDistrict()+" "+q.getRequest().getProvince()+" "+q.getRequest().getPostcode() %>" disabled >
							</div>
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
				<%}else{%>
					<h5 style="text-align: center;">ยังไม่มีคำขอที่อยู่ในสถานะ 'คำขอไม่ได้รับเลือก'</h5>
				<%} %>
			</div><br>
	</div><br><br><br><br><br><br>
		<!-- FOOTER -->
		<jsp:include page="../footer/footer.jsp"></jsp:include>
	<!-- END FOOTER -->
	<script type="text/javascript">
	$(document).ready(function(){
		var a = document.getElementById("alertFinish").value;
			if(a == "1"){
				alert("ยืนยันการให้บริการบริการทำความสะอาดเสร็จสิ้น");
			}else if(a == "2"){
				alert("ยืนยันการให้บริการทำความสะอาดล้มเหลว  กรุณาทำรายการใหม่อีกครั้งในภายหลัง");
			}
	});
	</script>
<script>
$(function() {
	$(".paginate").paginga({
		// use default options
	});
  
	$(".paginate-page-2").paginga({
		page: 1
	});

	$(".paginate-no-scroll").paginga({
		scrollToTop: false
	});
});
</script>
	<script type="text/javascript">
	 $("#providerTypes").change(function(){
	var category = document.getElementById('providerTypes').value;
		if(category == "รอลูกค้ายืนยัน"){
			document.getElementById('status01').style.display ='block';
			document.getElementById('status02').style.display ='none';
			document.getElementById('status03').style.display ='none';
			document.getElementById('status04').style.display ='none';
		}else if(category == "รอให้บริการ"){
			document.getElementById('status02').style.display ='block';
			document.getElementById('status01').style.display ='none';
			document.getElementById('status03').style.display ='none';
			document.getElementById('status04').style.display ='none';
		}else if(category == "ให้บริการเสร็จสิ้นแล้ว"){
			document.getElementById('status03').style.display ='block';
			document.getElementById('status01').style.display ='none';
			document.getElementById('status02').style.display ='none';
			document.getElementById('status04').style.display ='none';
		}else if(category == "คำขอไม่ได้รับเลือก"){
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