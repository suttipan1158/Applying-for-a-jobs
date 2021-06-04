<%@page import="java.util.Date"%>
<%@page import="com.springmvc.model.Quotations"%>
<%@page import="java.util.List"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    	 <% 
    	List<Quotations> listquotations = (List<Quotations>) request.getAttribute("listquotations");
      List<String> listMonth = (List<String>) request.getAttribute("listMonth");
      List<String> listWeek = (List<String>) request.getAttribute("listWeek");
      %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>View Cleaner Service Detail</title>
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<!-- link Icon -->
	 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
  	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.3/css/all.css" integrity="sha384-UHRtZLI+pbxtHCWp1t77Bi1L4ZtiqrqD80Kn4Z8NTSRyMA2Fd33n5dQ8lWUE00s/" crossorigin="anonymous"></head>
  	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css" />
  	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
  <!-- icon link -->
	<script src='https://kit.fontawesome.com/a076d05399.js'></script>
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
</head>
<body style="background: -webkit-linear-gradient(left, #88CDF6 , #C5E7F1 );">
<!-- Header section -->
			<jsp:include page="../navbar/navbar.jsp"></jsp:include>
	<!-- Header section end -->
<div class="container"><br>
	<section class="shadow p-3 mb-5 bg-white rounded">
		<%for(Quotations q : listquotations) {%>	
				<div class="form-row">
						<div class="form-group col-md-6">
							<i class="fa fa-spinner" style="font-size:24px"></i>
							<label>สถานะใบเสนอราคา :</label><br>
							<input type="text" id="status" name="status" class="form-control"  disabled value="<%= q.getStatus()%>">
						</div>
						<div class="form-group col-md-6" >
							<label></label><br>
							<%if(q.getStatus().equals("รอให้บริการ") && q.getPriceOffrtDate().after(dates)){ %>
							 <button  type="button" class="btn btn-success" data-toggle="modal" data-target="#exampleModalCenter" style="width: 100%; font-size: 18px; color: black;">บริการเสร็จสิ้น</button>
							<%} %>
						</div>
					</div>
				<%if(!q.getRequest().getWeekNo().equals("-")){ %>
					<div class="form-row">
						<input type="hidden" name="requestid" value="<%= q.getRequest().getRequestid()%>">
						<div class="form-group col-md-6">
							<label>จำนวนครั้งทำความสะอาด :</label><br>
							<input type="text" id="cleanNo" name="cleanNo" class="form-control " disabled value="<%= q.getRequest().getCleanNo()%>">
						</div>
						<div class="form-group col-md-6" id="allWeek">
							<i class="fa fa-calendar" style="font-size:24px"></i>
							<label>จำนวนครั้ง/สัปดาห์ :</label><br>
							<input type="text" id="allWKAndMAndSD" name="weekNo" class="form-control" disabled value=" <%= q.getRequest().getWeekNo()%>">
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
							<input type="text" id="servicePeriod" name="servicePeriod" class="form-control" disabled value="<%= q.getRequest().getServicePeriod()%>">
						</div>
					</div>
				<%}else if(!q.getRequest().getMonthNo().equals("-")) {%>
					<div class="form-row">
						<div class="form-group col-md-6">
							<label>จำนวนครั้งทำความสะอาด :</label><br>
							<input type="text" id="cleanNo" name="cleanNo" class="form-control col-md-7" disabled value="<%= q.getRequest().getCleanNo()%>">
						</div>
						<div class="form-group col-md-6" id="allMonthNo">
							<i class="fa fa-calendar" style="font-size:24px"></i>
							<label>จำนวนครั้ง/เดือน :</label><br>
							<input type="text" id="allWKAndMAndSD"  name="monthNo" class="form-control col-md-7" disabled value="<%= q.getRequest().getMonthNo()%>">
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
							<input type="text" id="servicePeriod" name="servicePeriod" class="form-control " disabled value="<%= q.getRequest().getServicePeriod()%>">
						</div>
					</div>
				<%}else{ %>
					<div class="form-row">
						<div class="form-group col-md-4">
							<label>จำนวนครั้งทำความสะอาด :</label><br>
							<input type="text" id="cleanNo" name="cleanNo" class="form-control col-md-9" disabled value="<%= q.getRequest().getCleanNo()%>">
						</div>
						<div class="form-group col-md-4">
							<% SimpleDateFormat df = new SimpleDateFormat("dd/MM/yyyy") ; %>
							<i class="fa fa-calendar" style="font-size:24px"></i>
							<label>วันที่ให้บริการทำความสะอาด :</label><br>
							<input type="text" id="allWKAndMAndSD" name="serviceDate" class="form-control col-md-9" disabled value="<%= df.format(q.getRequest().getServiceDate())%>">
							<input type="hidden" id="allWKAndMAndSD" class="form-control col-md-7"  value="1">
						</div>
						<div class="form-group col-md-4">
							<i class='far fa-clock' style='font-size:24px'></i>
							<label>เวลาเริ่มให้บริการทำความสะอาด :</label><br>
							<input type="text" id="servicePeriod" name="servicePeriod" class="form-control col-md-9" disabled value="<%= q.getRequest().getServicePeriod()%>">
						</div>
					</div>
				<%} %>
				<div class="form-row">
					<div class="form-group col-md-6">
						<i class='fas fa-house-user' style='font-size:24px'></i>
						<label>ประเภทที่อยู่ :</label><br>
						<input type="text" id="addressType" name="addressType" class="form-control" disabled value="<%= q.getRequest().getSuggest().getAddressType()%>">
					</div>
					<div class="form-group col-md-6">
						<i class='fas fa-house-user' style='font-size:24px'></i>
						<label>รูปแบบที่พัก :</label><br>
						<input type="text" id="abodeFormat" name="abodeFormat" class="form-control" disabled value="<%= q.getRequest().getAbodeFormat()%>">
						<input type="hidden" name="doProvider" value="<%= q.getRequest().getDoProvider()%>">
					</div>
				</div>
				<div class="form-row">
					<div class="form-group col-md-6">
							<svg width="1.5em" height="1.5em" viewBox="0 0 16 16" class="bi bi-person-fill" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
								  <path fill-rule="evenodd" d="M3 14s-1 0-1-1 1-4 6-4 6 3 6 4-1 1-1 1H3zm5-6a3 3 0 1 0 0-6 3 3 0 0 0 0 6z"/>
							</svg>
						<label>ชื่อ - นามสกุล : </label><br>
						<input type="text"   class="form-control" disabled value="<%= q.getRequest().getCustomer().getFirsName()+"  "+q.getRequest().getCustomer().getLastName() %>">
					</div>
					<div class="form-group col-md-6">
						<i class='fas fa-phone-alt' style='font-size:24px'></i>
						<label>เบอร์โทรศัพท์ :</label><br>
						<input type="text" class="form-control" disabled value="<%= q.getRequest().getCustomer().getTel()%>">
					</div>
				</div>
				<div class="form-row">
					<div class="form-group col-md-6">
						<i class='fas fa-at' style='font-size:24px'></i>
						<label>อีเมล์ :</label><br>
						<input type="text" class="form-control" disabled value="<%= q.getRequest().getCustomer().getEmail()%>">
					</div>
					<div class="form-group col-md-6">
						<i class="fa fa-map-marker" style="font-size:24px"></i>
						<label>ที่อยู่ :</label><br>
						<textarea class="form-control" disabled><%= q.getRequest().getCustomer().getAddress()%></textarea>
					</div>
				</div>
				<div class="form-row">
					<div class="form-group col-md-6">
						<i class='fas fa-house-user' style='font-size:24px'></i>
						<label>ตำบล :</label><br>
						<input type="text" id="timePeriod" name="timePeriod" class="form-control" disabled value="<%= q.getRequest().getSubDistrict()%>">
					</div>
					<div class="form-group col-md-6">
						<i class='fas fa-house-user' style='font-size:24px'></i>
						<label>อำเภอ :</label><br>
						<input type="text" id="animal" name="animal" class="form-control" disabled value="<%= q.getRequest().getDistrict()%>">
					</div>
				</div>
				<div class="form-row">
					<div class="form-group col-md-6">
						<i class='fas fa-house-user' style='font-size:24px'></i>
						<label>จังหวัด :</label><br>
						<input type="text" id="timePeriod" name="timePeriod" class="form-control" disabled value="<%= q.getRequest().getProvince()%>">
					</div>
					<div class="form-group col-md-6">
						<i class='fas fa-house-user' style='font-size:24px'></i>
						<label>รหัสไปรษณีย์ :</label><br>
						<input type="text" id="animal" name="animal" class="form-control" disabled value="<%= q.getRequest().getPostcode()%>">
					</div>
				</div>
				<div class="form-row">
					<div class="form-group col-md-6">
						<i class='far fa-clock' style='font-size:24px'></i>
						<label>ระยะเวลาในการให้บริการทำความสะอาด :</label><br>
						<input type="text" id="timePeriod" name="timePeriod" class="form-control" disabled value="<%= q.getRequest().getTimePeriod()%>">
					</div>
					<div class="form-group col-md-6">
						<i class='fas fa-cat' style='font-size:24px'></i>
						<label>ที่พักของคุณมีสัตว์เลี้ยง หรือไม่ :</label><br>
						<input type="text" id="animal" name="animal" class="form-control" disabled value="<%= q.getRequest().getAnimal()%>">
					</div>
				</div>
				<div class="form-row">
					<div class="form-group col-md-6">
						<i class="fa fa-money " style="font-size:24px"></i>
						<label>ราคาที่ลูกค้าลูกค้าต้องการ :</label><br>
						<input type="text" id="priceMin" name="priceMin" class="form-control" disabled value="<%= q.getRequest().getPriceMin()+" - "+q.getRequest().getPriceMax()%>">
					</div>
					<div class="form-group col-md-6">
						<i class="fa fa-money " style="font-size:24px"></i>
						<label>ราคาที่คุณเสนอ:</label><br>
						<input type="text"  id="priceMax" name="priceMax" class="form-control" disabled value="<%= q.getPriceOfferJob()%>">
					</div>
				</div>
				<div class="form-row">
					<div class="form-group col-md-12">
						<i class='fas fa-edit' style='font-size:24px'></i>
						<label>หมายเหตุ :</label><br>
						<textarea class="form-control" id="note" name="note" disabled ><%= q.getRequest().getNote()%></textarea>
					</div>
				</div>
			<%} %>
		</section>
	</div>
<!-- **************** Confirm Quotation ************* -->

<!-- Modal -->
<div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
     <form action="${pageContext.request.contextPath}/isUpdateStatusCleanerServiceAndRequestCleaner" method="post">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLongTitle"></h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
      	<div class="col-md-12 ml-auto">
        	<h4>ยืนยันการให้บริการเสร็จสิ้นแล้ว ใช่ หรือไม่ !!</h4>
        </div>
      </div>
      	<% session.setAttribute("quotations",listquotations );%>
      <div class="modal-footer">
        <button type="submit" class="btn btn-secondary" >ยืนยัน</button>
        <button type="reset" class="btn btn-primary">ยกเลิก</button>
      </div>
      </form>
    </div>
  </div>
</div>
<!-- FOOTER -->
		<jsp:include page="../footer/footer.jsp"></jsp:include>
	<!-- END FOOTER -->
</body>
</html>