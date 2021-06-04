<%@page import="com.springmvc.model.Login"%>
<%@page import="com.springmvc.model.Review"%>
<%@page import="com.springmvc.model.Company"%>
<%@page import="com.springmvc.model.ServicePerson"%>
<%@page import="com.springmvc.model.Quotations"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.springmvc.model.Suggest"%>
<%@page import="com.springmvc.model.Customer"%>
<%@page import="com.springmvc.model.Request"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <% List<Request> requests = (List<Request>) request.getAttribute("listrequests");
    	List<Customer> cus = (List<Customer>) request.getAttribute("customerdata");
      List<Quotations> quotations = (List<Quotations>) request.getAttribute("quotations");
      List<ServicePerson> servicePersons = (List<ServicePerson>) request.getAttribute("servicePersons");
      List<Company> companies = (List<Company>) request.getAttribute("companies");
      List<Review> reviews = (List<Review>) request.getAttribute("reviews");
      List<String> listMonth = (List<String>) request.getAttribute("listMonth");
      List<String> listWeek = (List<String>) request.getAttribute("listWeek");
      Login user = (Login) session.getAttribute("user");
      %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Review Cleaner Provider Page</title>
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	
	  <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
	
 <!-- Option 1: jQuery and Bootstrap Bundle (includes Popper) -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx" crossorigin="anonymous"></script>
  <!-- Star Rating Css -->
     	<link rel="stylesheet" href="/ServiceCleaner_5938/css/StarRating.css">
      <!-- icon link -->
	<script src='https://kit.fontawesome.com/a076d05399.js'></script>


     	<style type="text/css">
     		 .animated {
    -webkit-transition: height 0.2s;
    -moz-transition: height 0.2s;
    transition: height 0.2s;
}

.stars
{
    margin: 20px 0;
    font-size: 24px;
    color: #d17581;
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
		/* Date From Review */ 
		Date date = new Date() ;
			date.setYear(date.getYear()+543);
			SimpleDateFormat df1 = new SimpleDateFormat("dd/MM/yyyy") ;
%>
<link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.6/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rwoIResjU2yc3z8GV/NPeZWAv56rSmLldC3R/AZzGRnGxQQKnKkoFVhFQhNUwEyJ" crossorigin="anonymous">

<style type="text/css">
		
@import url(//netdna.bootstrapcdn.com/font-awesome/3.2.1/css/font-awesome.css);

/* Styling h1 and links
––––––––––––––––––––––––––––––––– */


.starrating > input {display: none;}  /* Remove radio buttons */

.starrating > label:before { 
  content: "\f005"; /* Star */
  margin: 2px;
  font-size: 4em;
  font-family: FontAwesome;
  display: inline-block; 
}

.starrating > label
{
  color: #222222; /* Start color when not clicked */
}

.starrating > input:checked ~ label
{ color: #ffca08 ; } /* Set yellow color when star checked */

.starrating > input:hover ~ label
{ color: #ffca08 ;  } /* Set yellow color when star hover */

		
		</style>
</head>
<body style="background: -webkit-linear-gradient(left, #7fe2ff, #00c6ff);">
<!-- Header section -->
			<jsp:include page="../navbar/navbar.jsp"></jsp:include>
	<!-- Header section end -->
	<div class="container"><br>
		<div class="shadow p-3 mb-5 bg-white rounded">
		<div class="form-row">
  			<div class="form-row  col-md-8">
  				<section class="shadow-sm p-3 mb-5 bg-white rounded" style="background: -webkit-linear-gradient(left,#C5E7F1, #79CEED  );">
  				<form action="">
  					<%for(Request r : requests) {%>	
				<%if(!r.getWeekNo().equals("-")){ %>
					<div class="form-row">
						<input type="hidden" name="requestid" value="<%= r.getRequestid()%>">
						<div class="form-group col-md-6">
							<label>จำนวนครั้งทำความสะอาด :</label><br>
							<input type="text" id="cleanNo" name="cleanNo" class="form-control col-md-7" disabled value="<%= r.getCleanNo()%>">
						</div>
						<div class="form-group col-md-6" id="allWeek">
							<i class="fa fa-calendar" style="font-size:24px"></i>
							<label>จำนวนครั้ง/สัปดาห์ :</label><br>
							<input type="text" id="allWKAndMAndSD" name="weekNo" class="form-control col-md-7" disabled value="<%= r.getWeekNo()%>">
						</div>
					</div>
					<div class="form-row">
						<div class="form-group col-md-6" id="alldayInweek">
							<i class="fa fa-calendar" style="font-size:24px"></i>
							<label>วันในสัปดาห์ :</label><br>
							<%if(listWeek != null){ %>
							<%	String[] weeks = {"จ.","อ.","พ.","พฤ.","ศ.","ส.","อา."};
										int j = 0 ;
										 for(int x = 0; x < weeks.length ; x++) {%>
										 	<% if(listWeek.get(j).equals(weeks[x])){ %>
												<input type="checkbox" name="dayInWeed" checked disabled value="<%=weeks[x]%>,"> <%=weeks[x]  %>
												<%j++; %>
													<% if(j >= weeks.length ){
													j = 0 ;
													 }%> 
											<%}else{ %>
												<input type="checkbox" name="dayInWeed" disabled value="<%=weeks[x]%>,"> <%=weeks[x]  %>  
											<%} %>
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
						<div class="form-group col-md-6">
							<label>เดือน :</label><br>
							<input type="text" id="cleanNo" name="cleanNo" class="form-control col-md-7" disabled value="<%= r.getMonths()%>">
						</div>
						<div class="form-group col-md-6">
							<label>จำนวนครั้งทำความสะอาด :</label><br>
							<input type="text" id="cleanNo" name="cleanNo" class="form-control col-md-7" disabled value="<%= r.getCleanNo()%>">
						</div>
						<div class="form-group col-md-6" id="allMonthNo">
							<i class="fa fa-calendar" style="font-size:24px"></i>
							<label>จำนวนครั้ง/เดือน :</label><br>
							<input type="text" id="allWKAndMAndSD"  name="monthNo" class="form-control col-md-7" disabled value="<%= r.getMonthNo()%>">
						</div>
					</div>
					<div class="form-row">
						<div class="form-group col-md-6" id="alldayInMonths">
							<i class="fa fa-calendar" style="font-size:24px"></i>
							<label>วันที่ / เดือน :</label><br>
							<%  int j = 0;
								for(int x = 0; x < month ; x++) {%>
								 	<%if(Integer.parseInt(listMonth.get(j)) == x+1 ){ %> 
										<input type="checkbox" name="dayInMonth"  checked  disabled  value="<%= x+1 %>"> <%=x+1  %>  
										<%j++;%>
											<% if(j >= listMonth.size() ){
												j = 0 ;
											} %>
										<%}	else{ %>
											<input type="checkbox" name="dayInMonth" disabled value="<%=x+1%>"> <%=x+1  %>
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
							<label>วันที่ให้บริการ :</label><br>
							<input type="text" id="allWKAndMAndSD" name="serviceDate" class="form-control col-md-9" disabled value="<%= df.format(r.getServiceDate())%>">
							<input type="hidden" id="allWKAndMAndSD" class="form-control col-md-7"  value="1">
						</div>
						<div class="form-group col-md-4">
							<i class='far fa-clock' style='font-size:24px'></i>
							<label>เวลาเริ่มให้บริการ :</label><br>
							<input type="text" id="servicePeriod" name="servicePeriod" class="form-control col-md-9" disabled value="<%= r.getServicePeriod()%>">
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
							<textarea rows="2" cols="40" id="abodeFormat" name="abodeFormat" disabled class="form-control" ><%= r.getAbodeFormat()%></textarea>
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
						<div class="form-group col-md-12">
							<i class="fa fa-map-marker" style="font-size:24px"></i>
							<label>ที่อยู่ :</label><br>
							<textarea class="form-control" disabled><%= r.getCustomer().getAddress()+""+r.getCustomer().getSubDistrict()+""+r.getCustomer().getDistrict()
										+""+r.getCustomer().getProvince()+""+r.getCustomer().getPostcode()%></textarea>
						</div>
					</div>
					<div class="form-row">
						<div class="form-group col-md-6">
							<i class='far fa-clock' style='font-size:24px'></i>
							<label>ระยะเวลาในการให้บริการทำความสะอาด :</label><br>
							<input type="text" id="timePeriod" name="timePeriod" class="form-control" disabled value="<%= r.getTimePeriod()%>">
						</div>
						<div class="form-group col-md-6">
							<i class='fas fa-cat' style='font-size:24px'></i>
							<label>ที่พักของคุณมีสัตว์เลี้ยง หรือไม่ :</label><br>
							<input type="text" id="animal" name="animal" class="form-control" disabled value="<%= r.getAnimal()%>">
						</div>
					</div>
					<div class="form-row">
						<div class="form-group col-md-6">
							<i class="fa fa-money " style="font-size:24px"></i>
							<label>ราคาที่คุณต้องการ :</label><br>
							<input type="text" id="priceMin" name="priceMin" class="form-control" disabled value="<%= r.getPriceMin()%>">
						</div>
						<div class="form-group col-md-6">
							<i class="fa fa-money " style="font-size:24px"></i>
							<label>ราคามากที่สุดที่คุณรับได้ :</label><br>
							<input type="text"  id="priceMax" name="priceMax" class="form-control" disabled value="<%= r.getPriceMax()%>">
						</div>
					</div>
					<div class="form-row">
						<div class="form-group col-md-6">
							<i class="fa fa-money " style="font-size:24px"></i>
							<label>หมายเหตุ :</label><br>
							<textarea class="form-control" id="note" name="note" disabled ><%= r.getNote()%></textarea>
						</div>
						<div class="form-group col-md-6">
							<label>สถานะคำขอรับบริการ :</label><br>
							<input type="text" class="form-control" name="status" disabled value="<%= r.getStatus()%>">
						</div>
					</div>
				<%} %>
				</form>
				</section>
			</div>
  			<div class="form-row col-md-4">
  				<section class="shadow-sm p-3 mb-5 bg-white rounded" style="background: -webkit-linear-gradient(right, #C5E7F1, #79CEED  );">
  				<form action="">
  					<%if(servicePersons != null){ %>
	  					<%for(ServicePerson sp: servicePersons){ %>
		  					<div class="form-row">
								<div class="form-group col-md-12" style="text-align: center;">
									<img alt="#" src="${pageContext.request.contextPath}/PImgPerson/<%= sp.getProfilePhoto()%>" class="img-thumbnail" width="200" height="auto">
								</div>
							</div>
							<div class="form-row">
								<div class="form-group col-md-12">
									<svg width="1.5em" height="1.5em" viewBox="0 0 16 16" class="bi bi-person-fill" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
										  <path fill-rule="evenodd" d="M3 14s-1 0-1-1 1-4 6-4 6 3 6 4-1 1-1 1H3zm5-6a3 3 0 1 0 0-6 3 3 0 0 0 0 6z"/>
									</svg>
									<label>ชื่อผู้ให้บริการ:</label><br>
									<input type="text" class="form-control" name="status" disabled value="<%= sp.getFirstName()+"  "+sp.getLastName()%>">
								</div>
							</div>
							<div class="form-row">
								<div class="form-group col-md-12">
									<i class='fas fa-phone-alt' style='font-size:24px'></i>
									<label>เบอร์โทรศัพท์ :</label><br>
									<input type="text" class="form-control" name="status" disabled value="<%= sp.getTel()%>">
								</div>
							</div>
							<div class="form-row">
								<div class="form-group col-md-12">
									<i class='fas fa-at' style='font-size:24px'></i>
									<label>อีเมล์ :</label><br>
									<input type="text" class="form-control" name="status" disabled value="<%= sp.getEmail()%>">
								</div>
							</div>
							<div class="form-row">
								<div class="form-group col-md-12">
									<i class="fa fa-map-marker" style="font-size:24px"></i>
									<label>ที่อยู่ :</label><br>
									<textarea rows="2" disabled="disabled" cols="35"><%= sp.getAddress()+" ต."+sp.getSubDistrict()+" อ."+sp.getDistrict()+" จ."+sp.getProvince()+"  "+sp.getPostcode() %></textarea>
								</div>
							</div>
								<%if(reviews.size() != 0){ %>
								<%for(Review r : reviews){ %>
									<div class="form-row">
										<div class="form-group col-md-9">
											<div id="fixture">คะแนนรีวิว :
												<input type="hidden" id="StarRating" value="<%=r.getServiceScore()%>">
											</div>
										</div>
									</div>
									<div class="form-row">
										<div class="form-group col-md-9">
											<i class='fas fa-edit' style='font-size:24px'></i>
											<label>ความคิดเห็น :</label>
											<textarea class="form-control " disabled="disabled" cols="40" rows="2"><%=r.getWriteReview() %></textarea>
										</div>
									</div>
									<%} %>
								<%}else{ %>
									<div class="form-row">
										<div class="form-group col-md-9">
											<button type="button" class="btn btn-success" data-toggle="modal" data-target="#exampleModalCenter">รีวิวผู้ให้บริการ</button>
										</div>
									</div>
								<%} %>
						<%} %>
					<%}else if(companies != null){%>
						<%for(Company c: companies){ %>
		  					<div class="form-row">
								<div class="form-group col-md-12" style="text-align: center;">
									<img alt="#" src="${pageContext.request.contextPath}/PImgCompany/<%= c.getProfilePhoto()%>" class="img-thumbnail" width="200" height="auto">
								</div>
							</div>
							<div class="form-row">
								<div class="form-group col-md-12">
									<i class='fas fa-building' style='font-size:24px'></i>
									<label>ชื่อผู้ให้บริการ:</label><br>
									<input type="text" class="form-control" name="status" disabled value="<%= c.getCompanyName()%>">
								</div>
							</div>
							<div class="form-row">
								<div class="form-group col-md-12">
									<i class='fas fa-phone-alt' style='font-size:24px'></i>
									<label>เบอร์โทรศัพท์ :</label><br>
									<input type="text" class="form-control" name="status" disabled value="<%= c.getTel()%>">
								</div>
							</div>
							<div class="form-row">
								<div class="form-group col-md-12">
									<i class='fas fa-at' style='font-size:24px'></i>
									<label>อีเมล์ :</label><br>
									<input type="text" class="form-control" name="status" disabled value="<%= c.getEmail()%>">
								</div>
							</div>
							<div class="form-row">
								<div class="form-group col-md-12">
									<i class="fa fa-map-marker" style="font-size:24px"></i>
									<label>ที่อยู่ :</label><br>
									<textarea rows="2" disabled="disabled" cols="35"><%= c.getAddress()+" ต."+c.getSubDistrict()+" อ."+c.getDistrict()+" จ."+c.getProvince()+"  "+c.getPostcode() %></textarea>
								</div>
							</div>
								<%if(reviews.size() != 0){ %>
								<%for(Review r : reviews){ %>
									<div class="form-row">
										<div class="form-group col-md-9">
											<div id="fixture">คะแนนรีวิว :
												<input type="hidden" id="StarRating" value="<%=r.getServiceScore()%>">
											</div>
										</div>
									</div>
									<div class="form-row">
										<div class="form-group col-md-9">
											<i class='fas fa-edit' style='font-size:24px'></i>
											<label>ความคิดเห็น :</label>
											<textarea class="form-control " disabled="disabled" cols="40" rows="2"><%=r.getWriteReview() %></textarea>
										</div>
									</div>
									<%} %>
								<%}else{ %>
									<div class="form-row">
										<div class="form-group col-md-9">
											<button type="button" class="btn btn-success" data-toggle="modal" data-target="#exampleModalCenter">รีวิวผู้ให้บริการ</button>
										</div>
									</div>
								<%} %>
						<%} %>
					<%} %>
  				</form>
  				</section>
  			</div>
		</div>
		</div>
	</div><br>
	
	<!-- FOOTER -->
		<jsp:include page="../footer/footer.jsp"></jsp:include>
	<!-- END FOOTER -->

	<!-- Review -->
<div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
     <form action="${pageContext.request.contextPath}/isReviewCleanerProvider" method="post">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLongTitle"></h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
      <div class="container">
      	<div class="col-md-12 ml-auto">
        	<h4>รีวิวผู้ให้บริการทำความสะอาด</h4><br>
        </div>
         
			<input type="hidden" name="reviewdate" value="<%= df1.format(date) %>">
				<div class="col-md-12 ml-auto">
					<label for="psw"><b>คะแนนรีวิว :</b></label>
				</div>
             		<div class="stars starrr" data-rating="0"></div>
               		 <div class="starrating risingstar d-flex justify-content-center flex-row-reverse">
			            <input type="radio" id="star5" name="rating" value="5" /><label for="star5" title="5 star">5</label>
			            <input type="radio" id="star4" name="rating" value="4" /><label for="star4" title="4 star">4</label>
			            <input type="radio" id="star3" name="rating" value="3" /><label for="star3" title="3 star">3</label>
			            <input type="radio" id="star2" name="rating" value="2" /><label for="star2" title="2 star">2</label>
			            <input type="radio" id="star1" name="rating" value="1" /><label for="star1" title="1 star">1</label>
       				 </div>
       		 <label for="psw"><b>เขียนรีวิว :</b></label><br>
      			<textarea class="form-control animated"  placeholder="-"  cols="40" id="new-review" name="comment" placeholder="Enter your review here..." rows="3"></textarea><br>
      	</div>
      	<%for(Request r : requests){ %>
      		<input type="hidden" name="id" value="<%=r.getRequestid()%>">
      	<%} %>
      	
      	<% session.setAttribute("quotations", quotations);
      	session.setAttribute("requests", requests);
      		session.setAttribute("customerdata", cus);
      	%>
      <div class="modal-footer">
        <button type="submit" class="btn btn-secondary" >ยืนยัน</button>
        <button type="reset" class="btn btn-primary" >ยกเลิก</button>
      </div>
      </div>
      </form>
    </div>
  </div>
</div >
<!-- Star Rating -->
        <script>
        $(function() {
    		var StarRating1 = document.getElementById("StarRating").value;
    		var total = (StarRating1/5)*100;
    	  function addScore(score, $domElement) {
    	    $("<span class='stars-container' style='font-size: 30px;'>")
    	      .addClass("stars-" + score.toString())
    	      .text("★★★★★")
    	      .appendTo($domElement);
    	  }

    	  addScore(total, $("#fixture"));
    	});
        </script>
</body>
</html>