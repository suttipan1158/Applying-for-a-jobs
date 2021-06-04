<%@page import="com.springmvc.model.Login"%>
<%@page import="com.springmvc.model.Company"%>
<%@page import="com.springmvc.model.ServicePerson"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <% List<ServicePerson> sp = (List<ServicePerson>) request.getAttribute("listServicePerson"); 
    	List<Company> com = (List<Company>) request.getAttribute("listCompany");
    ////****** Session from Veiw Quotations Detail
    	List<Company> viewcp = (List<Company>) request.getAttribute("viewCP");
    	List<ServicePerson> viewsp = (List<ServicePerson>) request.getAttribute("viewSP");
    	Login user = (Login) session.getAttribute("user"); 
    	int alls = 0;
    		if(sp != null){
    			alls += 1;
    		}else if(com != null){
    			alls += 1;
    		}
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>List Account Cleaner Provider</title>
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.1.0/css/all.css" integrity="sha384-lKuwvrZot6UHsBSfcMvOkWwlCMgc0TaWr+30HWe3a4ltaBwTZhyTEggF5tJv8tbt" crossorigin="anonymous">
 <script type="text/javascript" src="${pageContext.request.contextPath}/js/paginationlist/paginga.jquery.js"></script>
   <!--Script -->
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
/*============= View Account  */
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
 <script type="text/javascript">
 	function searchdata() {
		var sn = document.getElementById('search').value;
		document.getElementById('searchname').value = sn;
	}
 	function searchName() {
		var sn = document.getElementById('search').value;
		 document.getElementById('sname').value=sn;
	}
 </script>
</head>
<body style="background: -webkit-linear-gradient(left, #88CDF6 , #C5E7F1 );">
<!-- Header section -->
			<jsp:include page="../navbar/navbar.jsp"></jsp:include>
	<!-- Header section end -->
	<input type="hidden" id="alertEditCP" value="${messageEditCleanerProvider}">
<%if(sp != null || com != null){ %>
	<div class="container"><br>
	<section class="shadow-sm p-3 mb-5 bg-white rounded">
		<div class="input-group" style="max-width: 100%;">
			<input type="text" class="form-control" id="search" name="search" placeholder="ชื่อของผู้ให้บริการ" aria-label="Recipient's username" aria-describedby="basic-addon2" onkeyup="checkCompanyName(this)">
				<div class="input-group-append">
					<form action="${pageContext.request.contextPath}/findListAccountCleanerProviderName" method="post">
					      <input type="hidden" name="sname" id="sname">
		    			  <button class="btn btn-outline-secondary" type="submit" id="searchlocation" style="width:100%;" onclick="searchName()"><i class="fa fa-search"></i>ค้นหา</button>
					</form>
					     <button class="btn btn-success "  style="width:100%;" onclick="searchdata() ,document.getElementById('showListCatagory').style.display ='block'"><i class="fas fa-bars"></i> ตัวกรอง</button>
				</div>
		</div>
		</section>
		<section  class="shadow-sm p-3 mb-5 bg-white rounded" style="max-width: 50%; padding: 3%; display: none;" id="showListCatagory">
		<div class="card border-success mb-3" style="padding: 3%;">
			<form action="${pageContext.request.contextPath}/findListAccountCleanerProvider"  method="post">
				<div class="form-row">
				    <div class="form-group col-md-7">
				    	<label for="province">ประเภทของผู้ให้บริการทำความสะอาด :</label><br>
		      				<select name="providerType" id="cars" class="form-control">
		      					 <option value="ทั้งหมด">ทั้งหมด</option>
								 <option value="บุคคล">บุคคล</option>
								 <option value="บริษัท">บริษัท</option>
							</select>
							<input type="hidden" name="searchname" id="searchname">
				    </div>
			    </div>
				<div class="form-row">
				    <div class="form-group col-md-7">
		      			<label for="AccountType">ประเภทของสถานะบัญชี :</label><br>
		      				<select name="statusAccountType" id="statusAccountType" class="form-control">
		      					 <option value="ทั้งหมด">ทั้งหมด</option>
								 <option value="อนุญาตให้เข้าใช้งาน">อนุญาตให้เข้าใช้งาน</option>
								 <option value="ไม่อนุญาตให้เข้าใช้งานชั่วคราว">ไม่อนุญาตให้เข้าใช้งานชั่วคราว</option>
							</select>
				    </div>
				    <div class="form-group col-md-4"><br>
						<button type="submit" class="btn btn-success btn-lg "  onclick="document.getElementById('showListCatagory').style.display ='none'">ค้นหา</button>
				    </div>
				</div>
			</form>
		</div>
		</section>
		<%if(sp != null || alls == 0){ %>
			<div id="listPerson" class="shadow p-3 mb-5 bg-white rounded" >
				<p style="font-size:25px;">บัญชีผู้ให้บริการประเภท : บุคคล</p>
					<hr style="height: 4px; background-color: gray;">
					<div class="paginate 1">
						<div class="items"> 
					<%for(ServicePerson s:sp) {%>
						<div>
						<div class="form-row ">
							<div class="form-group col-md-10" >
								
							</div>	
							<div class="form-group col-md-2" >
							<a href="${pageContext.request.contextPath}/findAccountCleanerProvider?id=<%= s.getPersonid()%>&&type=บุคคล">
								<button class="btn btn-warning " name="Seemore" value="<%= s.getPersonid()%>"> ดูข้อมูลเพิ่มเติม... </button>	
							</a>
							</div>
						</div>
						<div class="form-row ">
							<div class="form-group col-md-4" ><br>
								<img alt="#" src="${pageContext.request.contextPath}/PImgPerson/<%= s.getProfilePhoto()%>" class="img-thumbnail" width="290" height="250">
							</div>
							<div class="form-group col-md-8">
								<div class="form-row ">
								<div class="form-group col-md-6">
									<label for="persomname" >ชื่อผู้ให้บริการ :</label><br>
									<input type="text" class="form-control" id="persomname" name="persomname" value="<%= s.getFirstName()+"  "+s.getLastName() %>" disabled >
								</div>
								<div class="form-group col-md-6">
									<label for="tel">เบอร์โทรศัพท์ :</label><br>
									<input type="text" class="form-control" id="tel" name="tel" value="<%=s.getTel() %>" disabled >
								</div>
								<div class="form-group col-md-6">
									<label for="email">อีเมล์ :</label><br>
									<input type="text" class="form-control" id="email" name="email" value="<%=s.getEmail() %>" disabled >
								</div>
								<div class="form-group col-md-6">
									<label for="email">สถานะของบัญชี :</label><br>
									<input type="text" class="form-control" id="status" name="status" value="<%=s.getLogin().getStatus() %>" disabled >
								</div>
								<div class="form-group col-md-12">
									<label for="address">ที่อยู่ :</label><br>
									<input type="text" class="form-control" id="address" name="address" value="<%=s.getAddress()+" "+s.getSubDistrict()+" "+
											s.getDistrict()+" "+s.getProvince()+" "+s.getPostcode() %>" disabled >
								</div>
							</div>
							</div>
						</div>
							<hr style="height: 2px; width:80%; background-color: gray; text-align: center;">
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
				</div>
		<%}
		  if(com != null || alls == 0){ %>
		<div id="listCompany" class="shadow p-3 mb-5 bg-white rounded" >
			<p style="font-size: 25px;">บัญชีผู้ให้บริการประเภท : บริษัท</p>
				<hr style="height: 4px; background-color: gray;">
				<div class="paginate 2">
						<div class="items"> 
					<%for(Company c : com) {%>
						<div>
						<div class="form-row ">
							<div class="form-group col-md-10" >
							</div>	
							<div class="form-group col-md-2" >
								<a href="${pageContext.request.contextPath}/findAccountCleanerProvider?id=<%= c.getCompanyid()%>&&type=บริษัท"> 
									<button class="btn btn-warning " name="Seemore" value="<%= c.getCompanyid() %>">ดูข้อมูลเพิ่มเติม... </button>
								</a>
							</div>
						</div>
						<div class="form-row ">
							<div class="form-group col-md-4"><br>
								<img alt="#" src="${pageContext.request.contextPath}/PImgCompany/<%= c.getProfilePhoto()%>"  class="img-thumbnail" width="300" height="250">
							</div>
							<div class="form-group col-md-8">
								<div class="form-row ">
									<div class="form-group col-md-6">
										<label for="persomname">ชื่อผู้ให้บริการ :</label><br>
										<input type="text" class="form-control" id="persomname" name="persomname" value="<%= c.getCompanyName() %>" disabled >
									</div>
									<div class="form-group col-md-6">		
										<label for="tel">เบอร์โทรศัพท์ :</label><br>
										<input type="text" class="form-control" id="tel" name="tel" value="<%= c.getTel() %>" disabled >
									</div>
									<div class="form-group col-md-6">		
										<label for="email">อีเมล์ :</label><br>
										<input type="text" class="form-control" id="email" name="email" value="<%= c.getEmail() %>" disabled >
									</div>
									<div class="form-group col-md-6">		
										<label for="email">สถานะของบัญชี  :</label><br>
										<input type="text" class="form-control" id="status" name="status" value="<%= c.getLogin().getStatus() %>" disabled >
									</div>
									<div class="form-group col-md-12">		
										<label for="address">ที่อยู่ :</label><br>
										<input type="text" class="form-control" id="address" name="address" value="<%=c.getAddress()+" "+c.getSubDistrict()+" "+
												c.getDistrict()+" "+c.getProvince()+" "+c.getPostcode() %>" disabled >
									</div>
								</div>
							</div>
						</div><hr style="height: 2px; width:80%; background-color: gray; text-align: center;">
						</div>
					<%} %>
					<div class="pager">
					<div class="firstPage">&laquo;</div>
					<div class="previousPage">&lsaquo;</div>
					<div class="pageNumbers"></div>
					<div class="nextPage">&rsaquo;</div>
					<div class="lastPage">&raquo;</div>
				</div>
			</div>
				</div>
		<%} %>
	</div>
	</div>
<%}else{ %>
<!-- **************** View Quotations Detail ***************** -->
<div class="container"><br>
		<%if(viewsp != null ){ %>
			<div id="listPerson" class="shadow p-3 mb-5 bg-white rounded">
			<label style="font-size: 25px;">บัญชีของผู้ให้บริการประเภทบุคคล :</label>
			<hr style="height: 4px; background-color: gray;">
					<%for(ServicePerson s: viewsp) {%>
						<div class="main-body">
          <div class="row gutters-sm">
            <div class="col-md-4 mb-3">
              <div class="card">
                <div class="card-body">
                  <div class="d-flex flex-column align-items-center text-center">
                    <img src="${pageContext.request.contextPath}/PImgPerson/<%= s.getProfilePhoto()%>" alt="Admin" width="100%">
                   
                  </div>
                </div>
              </div><br>
            </div>
            <div class="col-md-8">
              <div class="card mb-3">
                <div class="card-body">
                 <div class="row">
                    <div class="col-sm-3">
                      <h6 class="mb-0">ชื่อผู้ใช้งาน:</h6>
                    </div>
                    <div class="col-sm-9 text-secondary">
                      <%= s.getLogin().getUsername()%>
                    </div>
                  </div>
                  <hr>
                  <div class="row">
                    <div class="col-sm-3">
                      <h6 class="mb-0">ชื่อ - นามสกุล :</h6>
                    </div>
                    <div class="col-sm-9 text-secondary">
                      <%= s.getFirstName()+"  "+s.getLastName() %>
                    </div>
                  </div>
                  <hr>
                  <div class="row">
                    <div class="col-sm-3">
                      <h6 class="mb-0">อีเมล์ :</h6>
                    </div>
                    <div class="col-sm-9 text-secondary">
                      <%=s.getEmail() %>
                    </div>
                  </div>
                  <hr>
                  <div class="row">
                    <div class="col-sm-3">
                      <h6 class="mb-0">เบอร์โทรศัพท์ :</h6>
                    </div>
                    <div class="col-sm-9 text-secondary">
                      <%=s.getTel() %>
                    </div>
                  </div>
                  <hr>
                  <div class="row">
                    <div class="col-sm-3">
                      <h6 class="mb-0">ประเภทของผู้ให้บริการ :</h6>
                    </div>
                    <div class="col-sm-9 text-secondary">
                      <%=s.getPrivatetype() %>
                    </div>
                  </div>
                  <hr>
                  <div class="row">
                    <div class="col-sm-3">
                      <h6 class="mb-0">ที่อยู่ :</h6>
                    </div>
                    <div class="col-sm-9 text-secondary">
                      <%=s.getAddress()+" ต."+s.getSubDistrict()+" อ."+s.getDistrict()+" จ."+s.getProvince()+" "+s.getPostcode() %>
                    </div>
                  </div>
                  <hr>
                   <div class="row">
                    <div class="col-sm-3">
                      <h6 class="mb-0">สถานะของบัญชี  :</h6>
                    </div>
                    <div class="col-sm-9 text-secondary">
                      <div class="row">
                    		<div class="col-sm-7">
                      	<input type="hidden" id="AccountType" value="<%= s.getLogin().getStatus()%>">
			      				<select name="statusAccountType" id="statusAccountType" class="form-control" disabled>
			      					<%if(s.getLogin().getStatus().equals("อนุญาตให้เข้าใช้งาน")){ %>
										 <option value="อนุญาตให้เข้าใช้งาน">อนุญาตให้เข้าใช้งาน</option>
										 <option value="ไม่อนุญาตให้เข้าใช้งานชั่วคราว">ไม่อนุญาตให้เข้าใช้งานชั่วคราว</option>
									 <%}else{ %>
									 	 <option value="ไม่อนุญาตให้เข้าใช้งานชั่วคราว">ไม่อนุญาตให้เข้าใช้งานชั่วคราว</option>
									 	  <option value="อนุญาตให้เข้าใช้งาน">อนุญาตให้เข้าใช้งาน</option>
									 <%} %>
								</select>
							 </div>
							<div class="col-sm-5">
								<div id="EditStatus" >
									<button type="submit" class="btn btn-warning btn-lg " onclick="Editdisplay()">แก้ไข</button>
								</div>
								
								<div id="UpdateStatus" style="display: none;">
									<form action="${pageContext.request.contextPath}/isEditAccountStatusCleanerProvider" method="post">
										<input type="hidden" name="allid" id="allid" value="<%= s.getPersonid()%>">
										<input type="hidden" name="statustype" id="statustype">
										<input type="hidden" name="accountType" id="accountType" value="บุคคล">
										<button type="submit" class="btn btn-success btn-lg " onclick="statusAccount(), Updatedisplay()">ยืนยัน</button>
									
										<button type="reset" class="btn btn-warning btn-lg " onclick="Updatedisplay() ">ยกเลิก</button>
									</form>
								</div>
							</div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
				<%	} %>
						
				</div>
		<%}
		  if(viewcp != null){ %>
		<div id="listCompany" class="shadow p-3 mb-5 bg-white rounded">
			<label style="font-size: 25px;">บัญชีของผู้ให้บริการประเภทบริษัท :</label>
			<hr style="height: 4px; background-color: gray;">
			<%for(Company c : viewcp) {%>
				<div class="main-body">
		          <div class="row gutters-sm">
		            <div class="col-md-4 mb-3">
		              <div class="card">
		                <div class="card-body">
		                  <div class="d-flex flex-column align-items-center text-center">
		                    <img src="${pageContext.request.contextPath}/PImgCompany/<%= c.getProfilePhoto()%>" alt="Admin" width="100%">
		                   
		                  </div>
		                </div>
		              </div><br>
		            </div>
		            <div class="col-md-8">
		              <div class="card mb-3">
		                <div class="card-body">
		                <div class="row">
		                    <div class="col-sm-3">
		                      <h6 class="mb-0">ชื่อผู้ใช้งาน :</h6>
		                    </div>
		                    <div class="col-sm-9 text-secondary">
		                      <%=c.getLogin().getUsername() %>
		                    </div>
		                  </div>
		                  <hr>
		                  <div class="row">
		                    <div class="col-sm-3">
		                      <h6 class="mb-0">ชื่อบริษัท :</h6>
		                    </div>
		                    <div class="col-sm-9 text-secondary">
		                      <%=c.getCompanyName() %>
		                    </div>
		                  </div>
		                  <hr>
		                   <div class="row">
		                    <div class="col-sm-3">
		                      <h6 class="mb-0">ชื่อผู้ติดต่อ :</h6>
		                    </div>
		                    <div class="col-sm-9 text-secondary">
		                      <%=c.getContactName() %>
		                    </div>
		                  </div>
		                  <hr>
		                  <div class="row">
		                    <div class="col-sm-3">
		                      <h6 class="mb-0">อีเมล์ :</h6>
		                    </div>
		                    <div class="col-sm-9 text-secondary">
		                      <%=c.getEmail() %>
		                    </div>
		                  </div>
		                  <hr>
		                  <div class="row">
		                    <div class="col-sm-3">
		                      <h6 class="mb-0">เบอร์โทรศัพท์ :</h6>
		                    </div>
		                    <div class="col-sm-9 text-secondary">
		                      <%=c.getTel() %>
		                    </div>
		                  </div>
		                  <hr>
		                  <div class="row">
		                    <div class="col-sm-3">
		                      <h6 class="mb-0">ประเภทของผู้ให้บริการ :</h6>
		                    </div>
		                    <div class="col-sm-9 text-secondary">
		                      <%=c.getPrivatetype() %>
		                    </div>
		                  </div>
		                  <hr>
		                  <div class="row">
		                    <div class="col-sm-3">
		                      <h6 class="mb-0">ที่อยู่ :</h6>
		                    </div>
		                    <div class="col-sm-9 text-secondary">
		                      <%=c.getAddress()+" ต."+c.getSubDistrict()+" อ."+c.getDistrict()+" จ."+c.getProvince()+" "+c.getPostcode() %>
		                    </div>
		                  </div>
		                   <hr>
		                   <div class="row">
		                    <div class="col-sm-3">
		                      <h6 class="mb-0">สถานะของบัญชี  :</h6>
		                    </div>
		                    <div class="col-sm-9 text-secondary">
		                      <div class="row">
		                    		<div class="col-sm-7">
		                      	<input type="hidden" id="AccountType" value="<%= c.getLogin().getStatus()%>">
					      				<select name="statusAccountType" id="statusAccountType" class="form-control" disabled>
					      					<%if(c.getLogin().getStatus().equals("อนุญาตให้เข้าใช้งาน")){ %>
												 <option value="อนุญาตให้เข้าใช้งาน">อนุญาตให้เข้าใช้งาน</option>
												 <option value="ไม่อนุญาตให้เข้าใช้งานชั่วคราว">ไม่อนุญาตให้เข้าใช้งานชั่วคราว</option>
											 <%}else{ %>
											 	 <option value="ไม่อนุญาตให้เข้าใช้งานชั่วคราว">ไม่อนุญาตให้เข้าใช้งานชั่วคราว</option>
											 	  <option value="อนุญาตให้เข้าใช้งาน">อนุญาตให้เข้าใช้งาน</option>
											 <%} %>
										</select>
									 </div>
									<div class="col-sm-5">
										<div id="EditStatus" >
											<button type="submit" class="btn btn-warning btn-lg " onclick="Editdisplay()">แก้ไข</button>
										</div>
										<div id="UpdateStatus" style="display: none;">
											<form action="${pageContext.request.contextPath}/isEditAccountStatusCleanerProvider" method="post">
												<input type="hidden" name="allid" id="allid" value="<%= c.getCompanyid()%>">
												<input type="hidden" name="statustype" id="statustype">
												<input type="hidden" name="accountType" id="accountType" value="บริษัท">
												<button type="submit" class="btn btn-success btn-lg " onclick="statusAccount(), Updatedisplay()">ยืนยัน</button>
											
												<button type="reset" class="btn btn-warning btn-lg " onclick="Updatedisplay() ">ยกเลิก</button>
											</form>
										</div>
									</div>
		                      </div>
		                    </div>
		                </div>
		              </div>
		            </div>
		          </div>
		        </div>
		        </div>				 
				<%} %>
			</div>
		<%} %>
	<%} %>
</div>
		<!-- FOOTER -->
		<jsp:include page="../footer/footer.jsp"></jsp:include>
	<!-- END FOOTER -->
	  <script type="text/javascript">
  $(document).ready(function(){
		var a = document.getElementById("alertEditCP").value;
			if(a == "1"){
				alert("ยืนยันการแก้ไขสถานะการเข้าใช้งานบัญชีของผู้ให้บริการทำความสะอากเสร็จสิ้น");
			}else if(a == "2"){
				alert("ยืนยันการแก้ไขสถานะการเข้าใช้งานบัญชีของผู้ให้บริการทำความสะอากล้มเหลว กรุณาทำรายการใหม่อีกครั้งในภายหลัง");
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
function statusAccount() {
	var sn = document.getElementById('statusAccountType').value;
	document.getElementById('statustype').value = sn;
}
function Editdisplay() {
	document.getElementById('statusAccountType').disabled = false;
	document.getElementById('UpdateStatus').style.display ='block';
	document.getElementById('EditStatus').style.display ='none';
}
function Updatedisplay() {
	var sn = document.getElementById('AccountType').value;
	document.getElementById('statusAccountType').value = sn;
	
	document.getElementById('UpdateStatus').style.display ='none';
	document.getElementById('EditStatus').style.display ='block';
	document.getElementById('statusAccountType').disabled = true;
}
</script>
</body>
</html>