<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.springmvc.model.Login"%>
<%@page import="com.springmvc.model.Quotations"%>
<%@page import="com.springmvc.model.Company"%>
<%@page import="com.springmvc.model.ServicePerson"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
      <% List<ServicePerson> sp = (List<ServicePerson>) request.getAttribute("listSP"); 
    	List<Company> com = (List<Company>) request.getAttribute("listCP");
    	List<Quotations> quotations = (List<Quotations>) request.getAttribute("listquotations");
    	List<Quotations> review = (List<Quotations>) request.getAttribute("Review");
    	Login user = (Login) session.getAttribute("user");
    ////****** Session from Veiw Quotations Detail
    	List<Company> viewcp = (List<Company>) request.getAttribute("viewCP");
    	List<ServicePerson> viewsp = (List<ServicePerson>) request.getAttribute("viewSP");
    	String totalscore = (String) request.getAttribute("totalscore"); 
    	String SumStarRating = (String) request.getAttribute("SumStarRating"); 
    	String SumPopleReview = (String) request.getAttribute("SumPopleReview");
    	int alls = 0;
    		if(sp != null){
    			alls += 1;
    		}else if(com != null){
    			alls += 1;
    		}
    		int checkRevice = 0;
    		for(Quotations q :quotations){
    			if(q.getReview() != null){
    				checkRevice = 1;
    			}
    		}
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>List Quotation Detail</title>
 <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<!-- Bootstrap 4 -->
 <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
<!-- table -->
    	<link rel="stylesheet" href="https://cdn.datatables.net/1.10.15/css/jquery.dataTables.min.css">
	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
		<script src="https://cdn.datatables.net/1.10.15/js/jquery.dataTables.min.js"></script> 
		
	<script src='https://kit.fontawesome.com/a076d05399.js'></script>
   <link href="http://www.jqueryscript.net/css/jquerysctipttop.css" rel="stylesheet" type="text/css">
     <!-- Star Rating Css -->
     	<link rel="stylesheet" href="/ServiceCleaner_5938/css/StarRating.css">

<!--============================  paging For Table============================ -->
<style type="text/css">
        
.paging-nav {
  text-align: center;
  padding-top: 2px;
  font-size: 18px;
}

.paging-nav a {
  margin: auto 1px;
  text-decoration: none;
  display: inline-block;
  padding: 1px 7px;
  background: #91b9e6;
  color: white;
  border-radius: 3px;
}

.paging-nav .selected-page {
  background: #187ed5;
  font-weight: bold;
}

.paging-nav,
#tableData {
  width:85%;
  margin: 0 auto;
  font-family: Arial, sans-serif;
}
.p1{
	font-size: 30px;
	text-align: center;
}
#splabel{
	font-family: 'Kanit', sans-serif;
	font-size: 22px;
	color: #000;
}
#sp1{
	font-size: 18px;
	padding-left: 5%;
}
/*================ Show Data from  =================== */
.main-body {
    padding: 15px;
}
.card {
    box-shadow: 0 1px 3px 0 rgba(0,0,0,.1), 0 1px 2px 0 rgba(0,0,0,.06);
}
.card2 {
    box-shadow: 0 1px 5px 0 rgba(0,0,0,.1), 0 1px 5px 0 rgba(0,0,0,.06);
}
.card2 {
   
    display: flex;
    flex-direction: column;
    min-width: 0;
    background-color: #fff;
    background-clip: border-box;
    border: 0 solid rgba(0,0,0,.125);
    border-radius: .25rem;
}
.card {
    position: relative;
    display: flex;
    flex-direction: column;
    min-width: 0;
    word-wrap: break-word;
    background-color: #fff;
    background-clip: border-box;
    border: 0 solid rgba(0,0,0,.125);
    border-radius: .25rem;
}

.card-body {
    flex: 1 1 auto;
    min-height: 1px;
    padding: 1rem;
}

.gutters-sm {
    margin-right: -8px;
    margin-left: -8px;
}

.gutters-sm>.col, .gutters-sm>[class*=col-] {
    padding-right: 8px;
    padding-left: 8px;
}
.mb-3, .my-3 {
    margin-bottom: 1rem!important;
}

.bg-gray-300 {
    background-color: #e2e8f0;
}
.h-100 {
    height: 100%!important;
}
.shadow-none {
    box-shadow: none!important;
}
</style>  
</head>
<body style="background: -webkit-linear-gradient(left, #7fe2ff, #00c6ff);">
<!-- Header section -->
			<jsp:include page="../navbar/navbar.jsp"></jsp:include>
	<!-- Header section end -->
<div class="container"><br>
	<%if(sp != null && com != null) {%>
		<%if(sp != null || alls == 0){ %>
			<div id="listPerson" class="shadow p-3 mb-5 bg-white rounded">
					<p>ประเภทของผู้ให้บริการทำความสะอาด : บุคคล</p>
					<hr class="featurette-divider">
					<%if(sp.size() != 0){ %>
					<%int i = 0 ;
						for(ServicePerson s:sp) {%>
							<div class="form-row">
									<div class="form-group col-md-10" ><br>
										
									</div>
									<div class="form-group col-md-2" ><br>
										<a href="${pageContext.request.contextPath}/goViewQuotationDetail?id=<%= s.getPersonid()%>&&type=บุคคล&&requestid=<%=quotations.get(i).getRequest().getRequestid()%>" >
											<button class="btn btn-warning  "name="Seemore" value="<%= s.getPersonid()%>"> ดูข้อมูลเพิ่มเติม... </button>
										</a>
									</div>
							</div>
							<div class="form-row ">
								<div class="form-group col-md-5" ><br>
									<img alt="#" src="${pageContext.request.contextPath}/PImgPerson/<%= s.getProfilePhoto()%>" class="img-thumbnail" width="290" height="250">
								</div>
								<div class="form-row col-md-7"><br>
									
										<div class="form-group col-md-6">
											<svg width="1.5em" height="1.5em" viewBox="0 0 16 16" class="bi bi-person-fill" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
											  <path fill-rule="evenodd" d="M3 14s-1 0-1-1 1-4 6-4 6 3 6 4-1 1-1 1H3zm5-6a3 3 0 1 0 0-6 3 3 0 0 0 0 6z"/>
											</svg>
											<label for="persomname" >ชื่อ - นามสกุล :</label><br>
											<input type="text" class="form-control" id="persomname" name="persomname" value="<%= s.getFirstName()+"  "+s.getLastName() %>" disabled ><br>
										</div>
										<div class="form-group col-md-6">
											<i class='fas fa-phone-alt' style='font-size:24px'></i>
											<label for="tel">เบอร์โทรศัพท์ :</label><br>
											<input type="text" class="form-control" id="tel" name="tel" value="<%=s.getTel() %>" disabled ><br>
										</div>
									
									
										<div class="form-group col-md-6">
											<i class="fa fa-money " style="font-size:24px"></i>
											<label for="email">ราคาใบเสนอราคา :</label><br>
											<input type="text" class="form-control" id="email" name="email" value="<%= quotations.get(i).getPriceOfferJob() %>" disabled ><br>
										</div>
										<div class="form-group col-md-6">
											<svg width="1.5em" height="1.5em" viewBox="0 0 16 16" class="bi bi-person-fill" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
											  <path fill-rule="evenodd" d="M3 14s-1 0-1-1 1-4 6-4 6 3 6 4-1 1-1 1H3zm5-6a3 3 0 1 0 0-6 3 3 0 0 0 0 6z"/>
											</svg>
											<label for="address">ประเภทของผู้ให้บริการ :</label><br>
											<input type="text" class="form-control" id="address" name="address" value="<%= s.getPrivatetype() %>" disabled ><br>
										</div>
										
										<div class=" col-md-12">
											<i class="fa fa-map-marker" style="font-size:24px"></i>
											<label for="address">ที่อยู่ :</label><br>
											<input type="text" class="form-control" id="address" name="address" value="<%=s.getAddress()+" "+s.getSubDistrict()+" "+
													s.getDistrict()+" "+s.getProvince()+" "+s.getPostcode() %>" disabled ><br><br><br>
										</div>
								</div>
							</div>
					<%	i++;
						} %>
						
						<%}else{ %>
							<h5 style="text-align: center;">ยังไม่มีการยื่นใบเสนอราคาจาก 'จากผู้ให้บริการที่เป็นบุคคล'</h5><br>
						<%} %>
						</div>
		<%}
		  if(com != null || alls == 0){ %>
		<div id="listCompany" class="shadow p-3 mb-5 bg-white rounded">
			<p>ประเภทของผู้ให้บริการทำความสะอาด : บริษัท</p>
				<hr>
				<%if(com.size() != 0){ %>
					<% int i = 0;
						for(Company c : com) {%>
						<div class="form-row ">
							<div class="form-group col-md-10" ><br>
							</div>
							<div class="form-group col-md-2" ><br>
								<a href="${pageContext.request.contextPath}/goViewQuotationDetail?id=<%= c.getCompanyid()%>&&type=บริษัท&&requestid=<%=quotations.get(i).getRequest().getRequestid()%>"> 
									<button class="btn btn-warning " name="Seemore" value="<%= c.getCompanyid() %>">ดูข้อมูลเพิ่มเติม... </button>
								</a>
							</div>
							<div class="form-group col-md-5"><br>
								<img alt="#" src="${pageContext.request.contextPath}/PImgCompany/<%= c.getProfilePhoto()%>"  class="img-thumbnail" width="300" height="250">
							</div>
							<div class="form-row col-md-7">
									<div class="form-group col-md-6">
										<i class='fas fa-building' style='font-size:24px'></i>
										<label for="persomname" >ชื่อบริษัท :</label><br>
										<input type="text" class="form-control" id="persomname" name="persomname" value="<%= c.getCompanyName() %>" disabled ><br>
									</div>
									<div class="form-group col-md-6">
										<i class='fas fa-phone-alt' style='font-size:24px'></i>
										<label for="tel">เบอร์โทรศัพท์ :</label><br>
										<input type="text" class="form-control" id="tel" name="tel" value="<%= c.getTel() %>" disabled ><br>
									</div>
									<div class="form-group col-md-6">
										<i class="fa fa-money " style="font-size:24px"></i>
										<label for="email">ราคาใบเสนอราคา :</label><br>
										<input type="text" class="form-control" id="email" name="email" value="<%= quotations.get(i).getPriceOfferJob() %>" disabled ><br>
									</div>
									<div class="form-group col-md-6">
										<i class='fas fa-building' style='font-size:24px'></i>
										<label for="address">ประเภทของผู้ให้บริการ :</label><br>
										<input type="text" class="form-control" id="address" name="address" value="<%= c.getPrivatetype() %>" disabled ><br>
									</div>
						
							
									<div class=" col-md-12">
										<i class="fa fa-map-marker" style="font-size:24px"></i>
										<label for="address">ที่อยู่ :</label><br>
										<input type="text" class="form-control" id="address" name="address" value="<%=c.getAddress()+" "+c.getSubDistrict()+" "+
												c.getDistrict()+" "+c.getProvince()+" "+c.getPostcode() %>" disabled ><br><br><br>
									</div>
							</div>
						</div>
					<% i++;
						} %>
					<%}else{ %>
						<h5 style="text-align: center;">ยังไม่มีการยื่นใบเสนอราคาจาก 'จากผู้ให้บริการที่เป็นบริษัท'</h5><br>
					<%} %>
				</div>	
		<%} %>
	<%}else { %>		
</div>
<!-- **************** View Quotations Detail ***************** -->
<div class="container"><br>
		<%if(viewsp != null){ %>
		<section  class="shadow p-3 mb-5 bg-white rounded">
		<div style="background-color: #A5DEE5;">
		<%int i = 0;
			for(ServicePerson s:viewsp) {%>
   		 <div class="main-body">
          <div class="row gutters-sm">
            <div class="col-md-4 mb-3">
              <div class="card">
                <div class="card-body">
                  <div class="d-flex flex-column align-items-center text-center">
                    <img src="${pageContext.request.contextPath}/PImgPerson/<%=s.getProfilePhoto()%>" alt="Responsive image"  width="100%">
                   
                  </div>
                </div>
              </div>
               <div class="card">
                <div class="card-body">
								<button type="button" class="btn btn-success" id="gotoupdate" data-toggle="modal" data-target="#exampleModalCenter" style="width: 100%; font-size: 18px; color: black;">ยืนยันรับใบเสนอราคา</button>
				</div>
			</div>
              <div class="card2 mt-3">
                <div class="card-body">
               	<h2>คะแนนและรีวิว: ( <%=SumPopleReview %> )</h2>
					<h1><%= totalscore %>/ 5
						<span>
							 <div id="fixture">
								<input type="hidden" id="StarRating" value="<%= SumStarRating%>">
							</div>
						</span>
					</h1>
              </div>
              </div>
            </div>
            <div class="col-md-8">
              <div class="card mb-3">
                <div class="card-body">
                  <div class="row">
                    <div class="col-sm-3">
                      <h6 class="mb-0">ชื่อ - นามสกุล</h6>
                    </div>
                    <div class="col-sm-9 text-secondary">
                      <%= s.getFirstName()+"  "+s.getLastName() %>
                    </div>
                  </div>
                  <hr>
                  <div class="row">
                    <div class="col-sm-3">
                      <h6 class="mb-0">อีเมล์</h6>
                    </div>
                    <div class="col-sm-9 text-secondary">
                      <%=s.getEmail() %>
                    </div>
                  </div>
                  <hr>
                  <div class="row">
                    <div class="col-sm-3">
                      <h6 class="mb-0">เบอร์โทรศัพท์</h6>
                    </div>
                    <div class="col-sm-9 text-secondary">
                      <%=s.getTel() %>
                    </div>
                  </div>
                  <hr>
                  <div class="row">
                    <div class="col-sm-3">
                      <h6 class="mb-0">ประเภทของผู้ให้บริการ</h6>
                    </div>
                    <div class="col-sm-9 text-secondary">
                      <%=s.getPrivatetype() %>
                    </div>
                  </div>
                  <hr>
                  <div class="row">
                    <div class="col-sm-3">
                      <h6 class="mb-0">ที่อยู่</h6>
                    </div>
                    <div class="col-sm-9 text-secondary">
                      <%=s.getAddress()+" ต."+s.getSubDistrict()+" อ."+s.getDistrict()+" จ."+s.getProvince()+" "+s.getPostcode() %>
                    </div>
                  </div>
                  <hr>
                  <div class="row">
                    <div class="col-sm-3">
                      <h6 class="mb-0">ราคาใบเสนอ :</h6>
                    </div>
                    <div class="col-sm-9 text-secondary">
                      <%=quotations.get(i).getPriceOfferJob() %>
                    </div>
                  </div>
                  <hr>
                  <div class="row">
                    <div class="col-sm-3">
                      <h6 class="mb-0">หมายเหตุ :</h6>
                    </div>
                    <div class="col-sm-9 text-secondary">
                      <%=quotations.get(i).getNote() %>
                    </div>
                    <input type="hidden" name="requestid" id="requestid" value="<%= quotations.get(i).getRequest().getRequestid()%>">
				    <input type="hidden" name="quotationid" id="quotationid" value="<%= quotations.get(i).getQuotationsid()%>">
                  </div>
                </div>
              </div>
              <div class="row gutters-sm">
                <div class="col-sm-12 mb-3">
                  <div class="card2 h-100">
                    <div class="card-body">
                      <h6 class="d-flex align-items-center mb-3"><i class="material-icons text-info mr-2">assignment</i>รีวิว</h6>
                 		 <% if(checkRevice != 0){ %>
								<%for(Quotations q: review) {%>
									<%if(q.getReview() != null){ %>	
									<%	
										SimpleDateFormat df1 = new SimpleDateFormat("dd-MM-yyyy") ; 
										Date date = q.getReview().getReviewDate();
										date.setYear(q.getReview().getReviewDate().getYear()-543);
											%>
									<table id="tableData" class="table ">
								        <tbody>
								        	<tr>
								                <td>
								                	<p><div id="fixture2">
								                		ชื่อ : <%=q.getRequest().getCustomer().getFirsName()+"  "+q.getRequest().getCustomer().getLastName() %>
															<input type="hidden" id="StarRating2" value="<%=q.getReview().getServiceScore() %>">
														</div>
								                	</p>
								                	<p>คอมเมนต์ :  <%= q.getReview().getWriteReview()%></p><br>
								                	<p>วันที่ : <%= df1.format(date) %></p>
								                </td>
								            </tr>
								         </tbody>
								       </table>
								       	<%} %>		
								<%i++;
									} %>
									<%}else{ %>
											<hr style="width: 100%; float: left;">
											<h5 style="text-align: center; padding-top: 5%;">ผู้ให้บริการยังไม่มีการรีวิว</h5>
										<br><br>
									<%} %>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
        	<%} %>
        </div>
        </section> 
		<%}
		  if(viewcp != null){ %>
		
			<section  class="shadow p-3 mb-5 bg-white rounded">
		<div style="background-color: #A5DEE5;">
		  <%int i = 0;
		  	for(Company c : viewcp) {%>
   		 <div class="main-body">
          <div class="row gutters-sm">
            <div class="col-md-4 mb-3">
              <div class="card">
                <div class="card-body">
                  <div class="d-flex flex-column align-items-center text-center">
                    <img src="${pageContext.request.contextPath}/PImgCompany/<%= c.getProfilePhoto()%>" alt="Admin" width="100%">
                   
                  </div>
                </div>
              </div>
              <div class="card">
                <div class="card-body">
					<button type="button" class="btn btn-success" id="gotoupdate" data-toggle="modal" data-target="#exampleModalCenter" style="width: 100%; font-size: 18px; color: black;">ยืนยันรับใบเสนอราคา</button>
			  	</div>
			  </div>
              <div class="card2 mt-3">
                <div class="card-body">
               	<h2>คะแนนและรีวิว: ( <%=SumPopleReview %> )</h2>
					<h1><%= totalscore %>/ 5
						<span>
							 <div id="fixture">
								<input type="hidden" id="StarRating" value="<%= SumStarRating%>">
							</div>
						</span>
					</h1>
              </div>
              </div>
            </div>
            <div class="col-md-8">
              <div class="card mb-3">
                <div class="card-body">
                  <div class="row">
                    <div class="col-sm-3">
                      <h6 class="mb-0">ชื่อบริษัท :</h6>
                    </div>
                    <div class="col-sm-9 text-secondary">
                      <%=c.getCompanyName()%>
                    </div>
                  </div>
                  <hr>
                  <div class="row">
                    <div class="col-sm-3">
                      <h6 class="mb-0">อีเมล์</h6>
                    </div>
                    <div class="col-sm-9 text-secondary">
                      <%=c.getEmail() %>
                    </div>
                  </div>
                  <hr>
                  <div class="row">
                    <div class="col-sm-3">
                      <h6 class="mb-0">เบอร์โทรศัพท์</h6>
                    </div>
                    <div class="col-sm-9 text-secondary">
                      <%=c.getTel() %>
                    </div>
                  </div>
                  <hr>
                  <div class="row">
                    <div class="col-sm-3">
                      <h6 class="mb-0">ประเภทของผู้ให้บริการ</h6>
                    </div>
                    <div class="col-sm-9 text-secondary">
                      <%=c.getPrivatetype() %>
                    </div>
                  </div>
                  <hr>
                  <div class="row">
                    <div class="col-sm-3">
                      <h6 class="mb-0">ที่อยู่</h6>
                    </div>
                    <div class="col-sm-9 text-secondary">
                      <%=c.getAddress()+" ต. "+c.getSubDistrict()+" อ. "+c.getDistrict()+" จ. "+c.getProvince()+" "+c.getPostcode() %>
                    </div>
                  </div>
                  <hr>
                    <div class="row">
                    <div class="col-sm-3">
                      <h6 class="mb-0">ราคาใบเสนอ :</h6>
                    </div>
                    <div class="col-sm-9 text-secondary">
                      <%=quotations.get(i).getPriceOfferJob() %>
                    </div>
                  </div>
                  <hr>
                  <div class="row">
                    <div class="col-sm-3">
                      <h6 class="mb-0">หมายเหตุ :</h6>
                    </div>
                    <div class="col-sm-9 text-secondary">
                      <%=quotations.get(i).getNote() +" " + c.getCompanyid()%>
                    </div>
                    <input type="hidden" name="requestid" id="requestid" value="<%= quotations.get(i).getRequest().getRequestid()%>">
				    <input type="hidden" name="quotationid" id="quotationid" value="<%= quotations.get(i).getQuotationsid()%>">
                  </div>
                </div>
              </div>
              <div class="row gutters-sm">
                <div class="col-sm-12 mb-3">
                  <div class="card2 h-100">
                    <div class="card-body">
                      <h5 class="d-flex align-items-center mb-3"><i class="material-icons text-info mr-2">assignment</i>รีวิว</h5>
                 		 <% if(checkRevice != 0){ %>
								<%for(Quotations q: review) {%>
									<%if(q.getReview() != null){ %>	
									<%	
										SimpleDateFormat df1 = new SimpleDateFormat("dd-MM-yyyy") ; 
										Date date = q.getReview().getReviewDate();
										date.setYear(q.getReview().getReviewDate().getYear()-543);
											%>
									<table id="tableData" class="table ">
								        <tbody>
								        	<tr>
								                <td>
								                	<p><div id="fixture2">
								                		ชื่อ : <%=q.getRequest().getCustomer().getFirsName()+"  "+q.getRequest().getCustomer().getLastName() %>
															<input type="hidden" id="StarRating2" value="<%=q.getReview().getServiceScore() %>">
														</div>
								                	</p>
								                	<p>คอมเมนต์ :  <%= q.getReview().getWriteReview()%></p><br>
								                	<p>วันที่ : <%= df1.format(date) %></p>
								                </td>
								            </tr>
								         </tbody>
								       </table>
								       	<%} %>		
									<%} %>
									<%} else{ %>
											<hr style="width: 100%; float: left;">
											<h5 style="text-align: center;padding-top: 5%;">ผู้ให้บริการยังไม่มีการรีวิว</h5>
										<br><br>
									<%} %>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
        <%i++;
        	} %>
         </div>
         </section>
		<%} %>
	<%} %>
</div><br>
<!-- Modal -->
<div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
     <form action="${pageContext.request.contextPath}/updateRequestCleanerDetail" method="post">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLongTitle"></h5>
        <button type="button" class="close" data-dismiss="modal"  aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
      	<div class="col-md-12 ml-auto">
        	<h4>ยืนยันที่จะรับข้อเสนอจากผู้ให้บริการทำความสะอาด ใช่ หรือไม่!!</h4>
        </div>
      </div>
      	<input type="hidden" name="Uprequestid" id="Uprequestid">
      	<input type="hidden" name="Upquotationid" id="Upquotationid">
      <div class="modal-footer">
        <button type="submit" class="btn btn-secondary" >ยืนยัน</button>
      </div>
      </form>
    </div>
  </div>
</div>	
	<!-- FOOTER -->
		<jsp:include page="../footer/footer.jsp"></jsp:include>
	<!-- END FOOTER -->
	

<!--************* Star Rating *************-->
        <script>
        $(function() {
    		var StarRating1 = document.getElementById("StarRating").value;
    	  function addScore(score, $domElement) {
    	    $("<span class='stars-container'>")
    	      .addClass("stars-" + score.toString())
    	      .text("★★★★★")
    	      .appendTo($domElement);
    	  }

    	  addScore(StarRating1, $("#fixture"));
    	});
        </script>
 <!--************* Paginate for Table *************-->
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script> 
<script src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.11.2/jquery-ui.min.js"></script>
<script type="text/javascript" src="/ServiceCleaner_5938/js/paging.js"></script> 
<script type="text/javascript">
            $(document).ready(function() {
                $('#tableData').paging({limit:4});
            });
        </script>
        <script type="text/javascript">

  var _gaq = _gaq || [];
  _gaq.push(['_setAccount', 'UA-36251023-1']);
  _gaq.push(['_setDomainName', 'jqueryscript.net']);
  _gaq.push(['_trackPageview']);

  (function() {
    var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
    ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
    var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
  })();

</script>
<!-- **************** Confirm Quotation ************* -->
<script type="text/javascript">
	$("#gotoupdate").click(function() {
		var requestid = document.getElementById("requestid").value;
		var quotationid = document.getElementById("quotationid").value;
		document.getElementById("Uprequestid").value = requestid;
		document.getElementById("Upquotationid").value = quotationid;
	});
</script>

</body>
</html>