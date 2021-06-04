<%@page import="com.springmvc.model.Login"%>
<%@page import="com.springmvc.model.Customer"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<%
	List<Customer> listcustomers =(List<Customer> ) request.getAttribute("listcustomers");
	List<Customer> viewcustomers =(List<Customer> ) request.getAttribute("viewcustomers");
	Login user = (Login) session.getAttribute("user");
  	int alls = 0;
    		if(listcustomers != null){
    			alls = 1;
    		}else if(viewcustomers != null){
    			alls = 1;
    		}
    %>
<title>List Account Customer Detail</title>
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<!------ Include the above in your HEAD tag ---------->

<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.1.0/css/all.css" integrity="sha384-lKuwvrZot6UHsBSfcMvOkWwlCMgc0TaWr+30HWe3a4ltaBwTZhyTEggF5tJv8tbt" crossorigin="anonymous">
 <script type="text/javascript" src="${pageContext.request.contextPath}/js/paginationlist/paginga.jquery.js"></script>
  <!--Script -->
	<script src="/ServiceCleaner_5938/js/AllScript2.js"></script>
 <style type="text/css">
 /*================ pager form list Account Customer  */
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
	<input type="hidden" id="alertEditCus" value="${messageEditCustomer}">
<%if(listcustomers != null){ %>
	<div class="container"><br>
		<section class="shadow-sm p-3 mb-5 bg-white rounded">
		<div class="input-group">
		  <input type="text" class="form-control" id="search" name="sname" placeholder="ชื่อของลูกค้า" aria-label="Recipient's username" aria-describedby="basic-addon2" onkeyup="FName(this)">
		  <div class="input-group-append">
		  	<form action="${pageContext.request.contextPath}/findListAccountCustomerName" method="post">
		    	<input type="hidden" name="sname" id="sname">
		    	<button class="btn btn-outline-secondary" type="submit" id="searchlocation" style="width:100%;" onclick="searchName()"><i class="fa fa-search"></i>ค้นหา</button>
		    </form>
		    <button class="btn btn-outline-success" type="button" style="width:100%;" onclick="searchdata() ,document.getElementById('showListCatagory').style.display ='block'"> <i class="fas fa-bars"></i> ตัวกรอง</button>
		  </div>
		</div>
	</section>
	<section class="shadow-sm p-3 mb-5 bg-white rounded" style="max-width: 50%; display: none;" id="showListCatagory">
		<div class="card border-success mb-3" style=" padding: 3%; " >
			<section class="shadow-sm p-3 mb-5 bg-white rounded">
			<form action="${pageContext.request.contextPath}/findAccountCustomerDetail"  method="post">
				<div class="form-row">
				    <div class="form-group col-md-7">
		      			<label for="AccountType">ประเภทของสถานะบัญชี :</label><br>
		      				<select name="statusAccountType" id="statusAccountType" class="form-control">
		      					 <option value="ทั้งหมด">ทั้งหมด</option>
								 <option value="อนุญาตให้เข้าใช้งาน">อนุญาตให้เข้าใช้งาน</option>
								 <option value="ไม่อนุญาตให้เข้าใช้งานชั่วคราว">ไม่อนุญาตให้เข้าใช้งานชั่วคราว</option>
							</select>
							 <input type="hidden" name="searchname" id="searchname">
							
				    </div>
				    <div class="form-group col-md-4"><br>
						<button type="submit" class="btn btn-success btn-lg "  onclick="document.getElementById('showListCatagory').style.display ='none'">ค้นหา</button>
				    </div>
				</div>
			</form>
			</section>
		</div>
	</section>
	<div id="listPerson" class="shadow p-3 mb-5 bg-white rounded" >
				<p style="font-size: 20px;">ประเภทของบัญชี : ลูกค้า</p>
					<hr style="height: 5px;background-color: gray;">
		<%if(!listcustomers.isEmpty()){ %>
					<div class="paginate 1">
						<div class="items"> 
					<%for(Customer c:listcustomers) {%>
							<div>
						<div class="form-row ">
							<div class="form-group col-md-10" >	
							</div>
							<div class="form-group col-md-2" >
									<a href="${pageContext.request.contextPath}/viewAccountCustomer?id=<%= c.getCustomerid()%>">
									<button class="btn btn-warning " name="Seemore" value="<%= c.getCustomerid()%>"> ดูข้อมูลเพิ่มเติม... </button>	
								</a>
								
							</div>
						</div>
						<div class="form-row ">
							<div class="form-group col-md-6" >
								
									<label for="persomname" >ชื่อ - นามสกุล :</label><br>
									<input type="text" class="form-control" id="persomname" name="persomname" value="<%= c.getFirsName()+"  "+c.getLastName() %>" disabled >
							</div>
							<div class="form-group col-md-6" >	
									<label for="status">สถานะของบัญชี :</label><br>
									<input type="text" class="form-control" id="status" name="status" value="<%=c.getLogin().getStatus() %>" disabled >
							</div>	
						</div>
						<div class="form-row ">
							<div class="form-group col-md-6">
								<label for="tel">เบอร์โทรศัพท์ :</label><br>
								<input type="text" class="form-control" id="tel" name="tel" value="<%=c.getTel() %>" disabled >
							</div>
							<div class="form-group col-md-6" >	
								<label for="email">อีเมล์ :</label><br>
								<input type="text" class="form-control" id="email" name="email" value="<%=c.getEmail() %>" disabled >
							</div>
							<div class="form-group col-md-12">
								<label for="address">ที่อยู่ :</label><br>
								<input type="text" class="form-control" id="address" name="address" value="<%=c.getAddress()+" ต."+c.getSubDistrict()+" อ."+
										c.getDistrict()+"  จ."+c.getProvince()+" "+c.getPostcode() %>" disabled >
							</div>
								
						</div><hr style="height: 2px; background-color: gray;">
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
		<%} else{%>
			<div>
				<h3>ไม่พบบัญชีของลูกค้าที่ต้องการค้นหา </h3>
				<p>กรุณาทำการค้นหาใหม่อีกครั้ง</p>
			</div>
		<%} %>
</div>
	</div>
<%}else{ %>
<!-- **************** View Quotations Detail ***************** -->
<div class="container"><br>
		<%if(!viewcustomers.isEmpty() ){ %>
			<div id="listPerson" class="shadow-sm p-3 mb-5 bg-white rounded">
				<label style="font-size: 25px; ">บัญชีของลูกค้า :</label>
					<hr style="height: 5px; background-color: gray;">
					<%for(Customer c: viewcustomers) {%>
			<div class="col-md-12">
              <div class="card mb-3">
                <div class="card-body">
                 <div class="row">
                    <div class="col-sm-3">
                      <h6 class="mb-0">ชื่อผู้ใช้ :</h6>
                    </div>
                    <div class="col-sm-9 text-secondary">
                      <%= c.getLogin().getUsername()%>
                    </div>
                  </div>
                  <hr>
                  <div class="row">
                    <div class="col-sm-3">
                      <h6 class="mb-0">ชื่อ - นามสกุล :</h6>
                    </div>
                    <div class="col-sm-9 text-secondary">
                      <%= c.getFirsName()+"  "+c.getLastName() %>
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
                      <h6 class="mb-0">ที่อยู่ :</h6>
                    </div>
                    <div class="col-sm-9 text-secondary">
                      <%=c.getAddress()+" ต."+c.getSubDistrict()+" อ."+c.getDistrict()+" จ."+c.getProvince()+" "+c.getPostcode() %>
                    </div>
                  </div>
                    <hr>
                  <div class="row">
                    <div class="col-sm-3">
                      <h6 class="mb-0">สถานะของบัญชี :</h6>
                    </div>
                    <div class="col-sm-9 text-secondary">
                    	<div class="row">
                    		<div class="col-sm-7">
                     <input type="hidden" id="AccountType" value="<%= c.getLogin().getStatus()%>">
			      				<select name="statusAccountType" id="statusAccountType" class="form-control" disabled >
			      					<%if(c.getLogin().getStatus().equals("อนุญาตให้เข้าใช้งาน")){ %>
										 <option value="อนุญาตให้เข้าใช้งาน">อนุญาตให้เข้าใช้งาน</option>
										 <option value="ไม่อนุญาตให้เข้าใช้งานชั่วคราว">ไม่อนุญาตให้เข้าใช้งานชั่วคราว</option>
									 <%}else  {%>
									 	 <option value="ไม่อนุญาตให้เข้าใช้งานชั่วคราว">ไม่อนุญาตให้เข้าใช้งานชั่วคราว</option>
									 	 <option value="อนุญาตให้เข้าใช้งาน">อนุญาตให้เข้าใช้งาน</option>
									 <%}%>
								</select>
							</div>
							<div class="col-sm-5">
								<div id="EditStatus" >
											<button type="submit" class="btn btn-warning btn-lg " onclick="Editdisplay()">แก้ไข</button>
								</div>
						
								<div id="UpdateStatus" style="display: none;">
									<form action="${pageContext.request.contextPath}/isEditAccountStatusCustomer" method="post">
										<input type="hidden" name="cusid" id="cusid" value="<%= c.getCustomerid()%>">
										<input type="hidden" name="statustype" id="statustype">
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
					
				<%} %>
						
				</div>
		<%}%>
	<%} %>
</div><br><br>
		<!-- FOOTER -->
		<jsp:include page="../footer/footer.jsp"></jsp:include>
	<!-- END FOOTER -->
	  <script type="text/javascript">
  $(document).ready(function(){
		var a = document.getElementById("alertEditCus").value;
			if(a == "1"){
				alert("ยืนยันการแก้ไขสถานะการเข้าใช้งานบัญชีของลูกค้าเสร็จสิ้น");
			}else if(a == "2"){
				alert("ยืนยันการแก้ไขสถานะการเข้าใช้งานบัญชีของลูกค้าล้มเหลว กรุณาทำรายการใหม่อีกครั้งในภายหลัง");
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

$("#search").change(function() {
	var sn = document.getElementById('search').value;
	document.getElementById('searchname').value = sn;
})
</script>
</body>
</html>