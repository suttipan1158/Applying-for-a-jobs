<%@page import="com.springmvc.model.Quotations"%>
<%@page import="com.springmvc.model.Login"%>
<%@page import="com.springmvc.model.Company"%>
<%@page import="com.springmvc.model.ServicePerson"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <% List<ServicePerson> sp = (List<ServicePerson>) request.getAttribute("searchSP"); 
    	List<Company> com = (List<Company>) request.getAttribute("searchCOM");
    	List<Quotations> qtt = (List<Quotations>) request.getAttribute("providerReview");
    	Login user = (Login) session.getAttribute("user"); 
    	String searchAddress =(String) request.getAttribute("searchAddress");
    	int no = 0;
    	for(int q = 0; q< sp.size(); q++){
    		for(int p = 0; p< qtt.size(); p++){
				if(sp.get(q).getMemberid() == qtt.get(p).getQuotationsid()){	
					 no++;
				}
			} 
    	}
    	int no1 = 0;
    	for(int q = 0; q< com.size(); q++){
    		for(int p = 0; p< qtt.size(); p++){
				if(com.get(q).getMemberid() == qtt.get(p).getQuotationsid()){	
					 no1++;
				}
			} 
    	}
    	if(user != null){
    		session.setAttribute("user", user);
    	}
    %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	#linkNo:hover{
		 text-decoration: none;
	}
/*=== Button of Catagory Address ====*/
.buttonCatagory {
  text-align: center;
  text-transform: uppercase;
  cursor: pointer;
  font-size: 20px;
  letter-spacing: 4px;
  position: relative;
  background-color: #16a085;
  border: none;
  color: #fff;
  padding: 20px;
  width: 200px;
  text-align: center;
  transition-duration: 0.4s;
  overflow: hidden;
  box-shadow: 0 5px 15px #193047;
  border-radius: 4px;
}

.buttonCatagory:hover {
  background: #fff;
  box-shadow: 0px 2px 10px 5px #1abc9c;
  color: #000;
}

.buttonCatagory:after {
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

.buttonCatagory:active:after {
  padding: 0;
  margin: 0;
  opacity: 1;
  transition: 0s
}

.buttonCatagory:focus { outline:0; }
/*====== Session ======*/
.sectionService {
    padding-top: 4rem;
    padding-bottom: 5rem;
    background-color: #A5DEE5;
   }
</style>
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<!-- link Icon -->
	 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
  	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.3/css/all.css" integrity="sha384-UHRtZLI+pbxtHCWp1t77Bi1L4ZtiqrqD80Kn4Z8NTSRyMA2Fd33n5dQ8lWUE00s/" crossorigin="anonymous"></head>
  	
  	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  	
	<!-- List Provider Link Css -->
	<link href="https://fonts.googleapis.com/css2?family=Roboto:wght@300;400;500;700;900&display=swap" rel="stylesheet">

	<link rel="stylesheet" href="/ServiceCleaner_5938/csstest/animate.css">
	<link rel="stylesheet" href="/ServiceCleaner_5938/csstest/listProvider.css">
	
	<!-- pangition -->
     	<script src='https://kit.fontawesome.com/a076d05399.js'></script>
     	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
     	
   <!-- Script -->
	<script src="/ServiceCleaner_5938/js/Allscript2.js"></script>
	
	 <!-- Star Rating Css -->
     	<link rel="stylesheet" href="/ServiceCleaner_5938/css/StarRating.css">
</head>
<script type="text/javascript">
/* function checkAddressThai(x) {
	var address = /^[ก-์-]+$/ ;
	if(!x.value.match(address)){
		alert("กรุณากรอกเป็นภาษาไทย");
	}
} */
</script>
<body style="background-color: #D9ECF2 ">
<!-- Header section -->
			<jsp:include page="../navbar/navbar.jsp"></jsp:include>
	<!-- Header section end -->
	<div class="container"><br>
		<div class="shadow p-3 mb-5 bg-white rounded "style="width: 30%;">
		<h3 class="mb-3">ค้าหาผู้ให้บริการที่ต้องการ</h3>
			<hr style="height:5px;background-color:gray">
			<div class="form-row">
				<div class="form-group col-md-6 " >
					<div class="input-group-btn">
			<!-- ปิดในส่วนของการใช้ ละติจุด และลองติจุด ในการค้นหาผู้ให้บริการที่อยู่บริเวนใกล้เคียง -->
							        	<!-- <button class="btn btn-primary" type="button"  id="searchlocation" onclick="searchLocation()" 
							        			data-toggle="tooltip" data-placement="top" title="ค้นหาที่อยู่ปัจจุยัน"><span class="glyphicon glyphicon-record" aria-hidden="true" style="width: 50%;"  ></span></button> -->
							        		<!-- <input type="hidden" id="latitude" name="latitude">
						        		<input type="hidden" id="longitude" name="longitude"> -->
						        		<!-- Button to Open the Modal -->
						<button class="btn btn-success buttonCatagory"  data-toggle="modal" data-target="#myModal"  style="width: 200px; font-size: 16px;"> <i class="fas fa-bars"></i><span aria-hidden="true"></span> ตัวกรอง</button>
					
					</div>
				</div>
			<div class="form-group col-md-8 ">
				<%if(searchAddress == null) {%>			
				<%}else{ %>
					<textarea rows="3" cols="40" id="inputAddress" readonly class="form-control-plaintext"  style="width: 130%; font-size: 16px;"><%=searchAddress%></textarea>
					<samp><hr></samp>
				<%} %>
			</div>
			</div>
		</div>
		<%if(sp != null){ %>
			<div id="listPerson" class="shadow p-3 mb-5 bg-white rounded" style="width: 100%;">
				<section class="sectionService">
						<div class="container">
							<div class="row justify-content-center pb-5">
								<div class="col-md-12 heading-section ftco-animate">
									<h2 class="mb-3">ผู้ให้บริการทำความสะอาด : <span style="color:#fff;">ประเภทบุคคล</span></h2>
								<hr style="width: 55%; float: left;height:2px;background-color:gray;">
								</div>
							</div>
						<%if(!sp.isEmpty()){ %>
							<div class="row">
								<%int n = 0;%>
								<%for(int i = 0  ; i < sp.size() ; i++) {%>
									<input type="hidden" id="nos" value="<%=no%>">
									<div class="col-md-6 col-lg-3 ftco-animate"> 
										<div class="staff">
											<div class="img-wrap d-flex align-items-stretch">
												<div class="img align-self-stretch" style="background-image: url(/ServiceCleaner_5938/PImgPerson/<%=sp.get(i).getProfilePhoto()%>);">
												</div>
											</div>
											<a href="${pageContext.request.contextPath}/goViewCleanerProvider?id=<%= sp.get(i).getPersonid()%>&&type=บุคคล" id="linkNo">
											<div class="text text-center">
												<h3 class="mb-2" style="font-size: 16px; color: black;" ><i class='fas fa-user-alt' style='font-size:16px'></i> <%= sp.get(i).getFirstName()+"  "+sp.get(i).getLastName() %></h3>
												<span class="position mb-2" style="color: black;"><i class='fas fa-phone-alt' style='font-size:16px'></i> <%=sp.get(i).getTel() %></span>
												<span style='font-size:14px; color: black;'><i class="fa fa-envelope-o" ></i> <%=sp.get(i).getEmail() %></span><br>
												<span id="address" style='font-size:14px; color: black;'><i class='fas fa-map-marker-alt' ></i> <%=sp.get(i).getAddress()+" ต."+sp.get(i).getSubDistrict()+" อ."+
														sp.get(i).getDistrict()+" จ."+sp.get(i).getProvince()+" "+sp.get(i).getPostcode() %></span><br>
												<%for(int j = 0; j< qtt.size(); j++){ %>
													<%if(sp.get(i).getMemberid() == qtt.get(j).getQuotationsid()){ %>	
														<%n++; %>
														 <div id="fixture<%=n%>" style="color: black;">
																คะแนน : <input type="hidden" id="StarRating<%=n%>" value="<%=qtt.get(j).getNote()%>">
																		<input type="hidden" id="RatingNo<%=n%>" value="<%=qtt.get(j).getStatus()%>">
														</div>
													<%}%>
												<%} %>
													
													<br><button class="btn btn-success " type="button" style="font-size: 16px;"> ดูข้อมูลเพิ่มเติม... </button>
											</div>
											</a> 
										</div>
									</div>
								<%} %>
							</div>
							<%}else{ %>
							<div class="row justify-content-center pb-5">
								<div class="col-md-12 heading-section ftco-animate">
									<h1 style="text-align: center;">ไม่มีผู้ให้บริการอยู้ในบริเวณที่ต้องการ</h1>
								</div>
							</div>
							
						<%} %>
						</div>
					</section>
				</div>	
		<%}%>
		<%if( com != null){ %>
		<div id="listCompany" class="shadow p-3 mb-5 bg-white rounded" style="width: 100%;">
			<section class="sectionService">
				<div class="container">
					<div class="row justify-content-center pb-5">
							<div class="col-md-12 heading-section ftco-animate">
								<h2 class="mb-3">ผู้ให้บริการทำความสะอาด : <span style="color:#fff;">ประเภทบริษัท </span></h2>
							<hr style="width: 55%; float: left;height:2px;background-color:gray;">
							</div>
					</div>
					<%if(!com.isEmpty()){ %>
						<input type="hidden" id="nosCom" value="<%=no1%>">
						<div class="row">
							<%int n = 0; %>
								<%for(int i = 0  ; i < com.size() ; i++) {%>
									<div class="col-md-6 col-lg-3 ftco-animate"> 
										<div class="staff">
											<div class="img-wrap d-flex align-items-stretch">
												<div class="img align-self-stretch" style="background-image: url(/ServiceCleaner_5938/PImgCompany/<%=com.get(i).getProfilePhoto()%>);" >
												</div>
											</div>
											<a href="${pageContext.request.contextPath}/goViewCleanerProvider?id=<%= com.get(i).getCompanyid()%>&&type=บริษัท" id="linkNo"> 
											<div class="text text-center">
												<h3 class="mb-2" style="font-size: 16px; color: black;"><i class='fas fa-user-alt' ></i> <%= com.get(i).getCompanyName() %></h3>
												<span class="position mb-2" style='font-size:14px; color: black;'><i class='fas fa-phone-alt' ></i> <%= com.get(i).getTel() %></span>
												<span style='font-size:14px; color: black;'><i class="fa fa-envelope-o" ></i> <%= com.get(i).getEmail() %></span><br>
												<span style='font-size:14px; color: black;'><i class='fas fa-map-marker-alt' ></i> <%=com.get(i).getAddress()+" ต."+com.get(i).getSubDistrict()+" อ."+
															com.get(i).getDistrict()+" จ."+com.get(i).getProvince()+" "+com.get(i).getPostcode() %></span><br>
												<%for(int j = 0; j< qtt.size(); j++){ %>
													<%if(com.get(i).getMemberid() == qtt.get(j).getQuotationsid()){ %>	
														<%n++; %>
														 <div id="fixtureCom<%=n%>" style="color: black;">
																คะแนน : <input type="hidden" id="RatingCom<%=n%>" value="<%=qtt.get(j).getNote()%>">
																		<input type="hidden" id="RatingNoCom<%=n%>" value="<%=qtt.get(j).getStatus()%>">
														</div>
													<%}%>
												<%} %>
														<br><button class="btn btn-success " type="button">ดูข้อมูลเพิ่มเติม...</button>
											</div>
											</a> 
										</div>
									</div>
								<%} %>
							</div>
						<%}else{ %>
							<div class="row justify-content-center pb-5">
								<div class="col-md-12 heading-section ftco-animate">
									<h1 style="text-align: center;">ไม่มีผู้ให้บริการอยู้ในบริเวณที่ต้องการ</h1>
								</div>
							</div>
						<%} %>
						</div>
					</section>
				</div>
			<%} %>
		</div>
	</div><br><br><br><br><br>

	<!-- FOOTER -->
		<jsp:include page="../footer/footer.jsp"></jsp:include>
	<!-- END FOOTER -->
<!--====== Javascripts & Jquery ======-->

	<!-- Script from liat show from Service person and Company -->
		<script type="text/javascript" src="${pageContext.request.contextPath}/jstest/jquery.min.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/jstest/jquery-migrate-3.0.1.min.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/jstest/jquery.waypoints.min.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/jstest/jquery.stellar.min.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/jstest/owl.carousel.min.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/jstest/scrollax.min.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/jstest/main.js"></script>
</body>

  <!-- The Modal -->
  <div class="modal" id="myModal">
    <div class="modal-dialog">
      <div class="modal-content">
        <!-- Modal Header -->
        <div class="modal-header">
          <h2 class="modal-title" style="float: none;">ค้นหาผู้ให้บริการ..</h2>
          <button type="button" class="close" data-dismiss="modal">&times;</button>
        </div>
        
        <!-- Modal body -->
        <div class="modal-body">
			<form action="${pageContext.request.contextPath}/searchCleanerProviderCategory"  method="post">
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
				    			<input type="hidden" class="form-control" id="zipcode" name="postcode">
				    		</div>
			    		</div>
			    	</div>
					<div class="form-row">
				    		<div class="form-group col-md-7">
		      					<label for="province">ประเภทของผู้ให้บริการทำความสะอาด :</label><br>
		      					<select name="providerType" id="cars" class="form-control">
		      					 	<option value="ทั้งหมด">ทั้งหมด</option>
								    <option value="บุคคล">บุคคล</option>
								    <option value="บริษัท">บริษัท</option>
								 </select>

				    		</div>
				    </div>
				     <!-- Modal footer -->
			        <div class="modal-footer">
			          <button type="submit" class="btn btn-danger " style="font-size: 16px;" id="checkModelSubmit" onclick="inputAddresstext()">ค้นหา</button>
			        </div>
			</form>
        </div>
        
      </div>
    </div>
  </div>
<script type="text/javascript">
	function inputAddresstext() {
		session.removeAttribute("searchAddress");
	}
</script>
<!-- latitude-and-longitude -->
	   <script type="text/javascript" src="https://api.longdo.com/map/?key=2aef91fd8115bea3002b78e2838a5d99"></script>
        <script type="text/javascript" src="http://code.jquery.com/jquery-1.10.2.min.js"></script>
        <!-- latitude-and-longitude -->
<script
		src='https://unpkg.com/bootstrap@4.1.0/dist/js/bootstrap.min.js'></script>
		<script
		src='https://api-maps.thinknet.co.th/libs/thinknetmaps.1.2.0-rc0.min.js'></script>

  <script>
  $(function() {
        var qttSize = document.getElementById("nos").value;
			for(var i = 1; i <= qttSize ; i++){
    		var StarRating = document.getElementById("StarRating"+i).value;
    		var no = document.getElementById("RatingNo"+i).value;
    		var sum = (StarRating/no);
    		 var total = (sum/5)*100;
    		
	    	  function addScore(score, $domElement) {
	    	    $("<span class='stars-container' style='font-size: 20px;'>")
	    	      .addClass("stars-" + score.toString())
	    	      .text("★★★★★")
	    	      .appendTo($domElement);
	    	  }
    	  	addScore(total, $("#fixture"+i));
			}
    }); 
  $(function() {
      var qttSize = document.getElementById("nosCom").value;
			for(var i = 1; i <= qttSize ; i++){
  		var StarRating = document.getElementById("RatingCom"+i).value;
  		var no = document.getElementById("RatingNoCom"+i).value;
  		var sum = (StarRating/no);
  		 var total = (sum/5)*100;
  		
	    	  function addScore(score, $domElement) {
	    	    $("<span class='stars-container' style='font-size: 20px;'>")
	    	      .addClass("stars-" + score.toString())
	    	      .text("★★★★★")
	    	      .appendTo($domElement);
	    	  }
  	  	addScore(total, $("#fixtureCom"+i));
			}
  }); 
    </script>

<script type="text/javascript">
	
	/* 	 if ( navigator.geolocation ) {
	            // ตรงนี้คือรองรับ geolocation
	            navigator.geolocation.getCurrentPosition(function(location) {
	                var location = location.coords;
	                 $("#latitude").val(""+location.latitude);
	                $("#longitude").val(""+location.longitude);
	             
	            }, function() {
	                alert('มีปัญหาในการตรวจหาตำแหน่ง');
	            });
	            
	        } else {
	            alert('เบราเซอร์นี้ไม่รองรับ geolocation');
	        } */
	
/* 	  function searchLocation() {
	        }
	        if ( navigator.geolocation ) {
  	            // ตรงนี้คือรองรับ geolocation
  	            navigator.geolocation.getCurrentPosition(function(location) {
  	                var location = location.coords;
  	                /*$("#geo_data").html('lat: '+location.latitude+'<br />long: '+location.longitude+'<br /> altitude: '+location.altitude+'<br /> accuracy: '+location.accuracy+'<br /> altitude accuracy: '+location.altitudeAccuracy+'<br /> heading: '+location.heading+'<br /> speed: '+location.speed);*/
  	                /*$("#latitude").val(""+location.latitude);
  	                $("#longitude").val(""+location.longitude);
  	                 
  	            
  	            }, function() {
  	                alert('มีปัญหาในการตรวจหาตำแหน่ง');
  	            });
  	        } else {
  	            alert('เบราเซอร์นี้ไม่รองรับ geolocation');
  	        } */
			
	
	   
/* 
	var lon1 = document.getElementById("longitude").value;
	document.getElementById("longitudetest").value = lon1;
	var lat1 = document.getElementById("latitude").value;
	document.getElementById("latitudetest").value = lat1;
	function rerverseGeocoding() { 
	  $.ajax({ 
		 	 type: "GET", 
	          url: "https://api.longdo.com/map/services/address?", 
	          dataType: "json", 
	          
	          contentType: "application/json", 
	          data: "key=2aef91fd8115bea3002b78e2838a5d99&lon="+$("#longitude").val()+"&lat="+$("#latitude").val(),
	      success: function (results)
	      {
	          console.log(results);
	      /*     $("#latitude1").val(""+result[0].coordinate.lng);
	            $("#longitude1").val(""+result[0].coordinate.lat); */
	      /*},
	      error: function (response)
	      {
	          console.log(response);
	      }
	  });
	} */

</script>
 
<!-- <script>
$(document).ready(function(){
	 var lon1 = document.getElementById("longitude").value;
		document.getElementById("longitudetest").value = lon1;
	var lat1 = document.getElementById("latitude").value;
		document.getElementById("latitudetest").value = lat1;
	if(lon1 != null){
		rerverseGeocoding(lon1,lat1); 
	}
    function rerverseGeocoding(lon1,lat1) { 
      $.ajax({ 
              url: "https://api.longdo.com/map/services/address?", 
              dataType: "json", 
              type: "POST", 
              contentType: "application/json", 
              data: {
                  key: "2aef91fd8115bea3002b78e2838a5d99",
                  lon: lon1,
                  lat: lat1
          },
          success: function (results)
          {
              console.log(results);
          /*     $("#latitude1").val(""+result[0].coordinate.lng);
                $("#longitude1").val(""+result[0].coordinate.lat); */
          },
          error: function (response)
          {
              console.log(response);
          }
      });
	}
});

</script> -->

<!-- code address -->
<script type="text/javascript" src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
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
</html>