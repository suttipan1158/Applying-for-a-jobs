<%@page import="java.util.ArrayList"%>
<%@page import="com.springmvc.model.Login"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.springmvc.model.Quotations"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="com.springmvc.model.Company"%>
	<%@page import="com.springmvc.model.ServicePerson"%>
	<%@page import="java.util.List"%>
    <% List<ServicePerson> sp = (List<ServicePerson>) request.getAttribute("searchSP"); 
    	List<Company> com = (List<Company>) request.getAttribute("searchCOM");
    	List<Quotations> listQuotations = (List<Quotations>) request.getAttribute("listQuotations");
    	String totalscore = (String) request.getAttribute("totalscore"); 
    	String SumStarRating = (String) request.getAttribute("SumStarRating"); 
    	String SumPopleReview = (String) request.getAttribute("SumPopleReview"); 
    	Login user = (Login) session.getAttribute("user"); 
    
    		if(user != null){
        		session.setAttribute("user", user);
        	}		
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>View Cleaner Provider</title>
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

    <!-- table -->
    	<link rel="stylesheet" href="https://cdn.datatables.net/1.10.15/css/jquery.dataTables.min.css">
	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
		<script src="https://cdn.datatables.net/1.10.15/js/jquery.dataTables.min.js"></script> 
		
		
   <link href="http://www.jqueryscript.net/css/jquerysctipttop.css" rel="stylesheet" type="text/css">
     <!-- Star Rating Css -->
     	<link rel="stylesheet" href="/ServiceCleaner_5938/css/StarRating.css">
     	
     <!-- Icon -->
     	<script src='https://kit.fontawesome.com/a076d05399.js'></script>
     	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
	<!-- font  -->
		<link href="https://fonts.googleapis.com/css2?family=Kanit:wght@200&display=swap" rel="stylesheet">
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

</style>
<style type="text/css">
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
<body>
	<!-- Header section -->
			<jsp:include page="../navbar/navbar.jsp"></jsp:include>
	<!-- Header section end -->
	<div class="container"><br>
		<%if(sp != null ){ %>
		<section  class="shadow p-3 mb-5 bg-white rounded">
		<div style="background-color: #A5DEE5;">
		<%for(ServicePerson s:sp) {%>
   		 <div class="main-body">
          <div class="row gutters-sm">
            <div class="col-md-4 mb-3">
              <div class="card">
                <div class="card-body">
                  <div class="d-flex flex-column align-items-center text-center">
                    <img src="${pageContext.request.contextPath}/PImgPerson/<%=s.getProfilePhoto()%>" alt="Admin" width="100%">
                   
                  </div>
                </div>
              </div><br>
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
                </div>
              </div>
              <div class="row gutters-sm">
                <div class="col-sm-12 mb-3">
                  <div class="card2 h-100">
                    <div class="card-body">
                      <h6 class="d-flex align-items-center mb-3"><i class="material-icons text-info mr-2">assignment</i>รีวิว</h6>
                 		 <% if(!listQuotations.isEmpty()){ %>
                 		 <input type="hidden" id="sizrsStra1" value="<%= listQuotations.size()%>">
									<table id="tableData" class="table ">
								        <tbody>
								        	<%int p = 0;
											for(Quotations q: listQuotations) {%>
											<%if(q.getReview() != null){ %>	
											<%	
												SimpleDateFormat df1 = new SimpleDateFormat("dd-MM-yyyy") ; 
												Date date = q.getReview().getReviewDate();
												date.setYear(q.getReview().getReviewDate().getYear()-543);
													%>
								        	<tr>
								                <td>
								                	<p><div id="fixture<%=p%>">
								                		ชื่อ : <%=q.getRequest().getCustomer().getFirsName()+"  "+q.getRequest().getCustomer().getLastName() %>
															<input type="hidden" id="StarRating<%=p %>" value="<%=q.getReview().getServiceScore() %>">
														</div>
								                	</p>
								                	<p>คอมเมนต์ :  <%= q.getReview().getWriteReview()%></p><br>
								                	<p>วันที่ : <%= df1.format(date) %></p>
								                </td>
								            </tr>
								              <%} %>		
										<%p++;
											} %>
								         </tbody>
								       </table>
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
        </div>
        </section>
        <%} %>
		<%} if(com != null ){ %>
		<section  class="shadow p-3 mb-5 bg-white rounded">
		<div style="background-color: #A5DEE5;">
		  <%for(Company c : com) {%>
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
                      <h6 class="mb-0">ชื่อเฟสบุ๊คแฟนเพจ</h6>
                    </div>
                    <div class="col-sm-9 text-secondary">
                    <%if(c.getFacebookFanpageURL() != null){ %>
                      	<a href="<%=c.getFacebookFanpageURL()%>" target="_blank"> <%=c.getFacebookFanpage() %> </a>
                      <%}else{ %>
                      	<a href="#"> <%=c.getFacebookFanpage() %> </a>
                      <%} %>
                    </div>
                  </div>
                  <hr>
                   <div class="row">
                    <div class="col-sm-3">
                      <h6 class="mb-0">ชื่อเว็บไซต์</h6>
                    </div>
                    <div class="col-sm-9 text-secondary">
                    <%if(c.getFacebookFanpageURL() != null){ %>
                      <a href="<%=c.getWebSiteURL()%>" target="_blank"> <%=c.getWebSite() %></a>
                     <%}else{ %>
                     	<a href="#"> <%=c.getWebSite() %> </a>
                     <%} %>
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
                </div>
              </div>
              <div class="row gutters-sm">
                <div class="col-sm-12 mb-3">
                  <div class="card2 h-100">
                    <div class="card-body">
                      <h5 class="d-flex align-items-center mb-3"><i class="material-icons text-info mr-2">assignment</i>รีวิว</h5>
                 		 <% if(!listQuotations.isEmpty()){ %>
                 		 	<input type="hidden" id="sizrsStar" value="<%= listQuotations.size()%>">
									<table id="tableData" class="table ">
								        <tbody>
								        	<%int p = 0;
												for(Quotations q: listQuotations) {%>
													<%if(q.getReview() != null){ %>
													<%	
														SimpleDateFormat df1 = new SimpleDateFormat("dd-MM-yyyy") ; 
														Date date = q.getReview().getReviewDate();
														date.setYear(q.getReview().getReviewDate().getYear()-543);
															%>
											<tr>
								                <td>
								                	<p><div id="fixture<%=p%>">
								                		ชื่อ : <%=q.getRequest().getCustomer().getFirsName()+"  "+q.getRequest().getCustomer().getLastName() %>
															<input type="hidden" id="StarRating<%= p %>" value="<%=q.getReview().getServiceScore() %>">
														</div>
								                	</p>
								                	<p>คอมเมนต์ :  <%= q.getReview().getWriteReview()%></p><br>
								                	<p>วันที่ : <%= df1.format(date) %></p>
								                </td>
								            </tr>
								                 	<%} %>		
											<%p++;
												} %>
								         </tbody>
								       </table>
								  
									<%}else{ %>
											<hr style="width: 100%; float: left;">
											<h5 style="text-align: center;padding-top: 10%;">ผู้ให้บริการยังไม่มีการรีวิว</h5>
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
        <%} %>
		
	</div><br><br>
	
	<!-- FOOTER -->
		<jsp:include page="../footer/footer.jsp"></jsp:include>
	<!-- END FOOTER -->
		
	<!-- Star Rating -->
        <script>
        $(function() {
        var sizrsStra1 = document.getElementById("sizrsStra1").value;
   			for(var i = 0; i < sizrsStra1 ; i++){
	    		var StarRating1 = document.getElementById("StarRating"+i).value;
	    		 var total = (StarRating1/5)*100;
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
   /* Star Review Company */
   			var sizrsStar = document.getElementById("sizrsStar").value;
   			for(var i = 0; i < sizrsStar ; i++){
   			 var StarRating2 = document.getElementById("StarRating"+i).value;
		   		  var total = (StarRating2/5)*100;
		   		  	  function addScore2(score, $domElement) {
		   		  	    $("<span class='stars-container' style='font-size: 20px;'> ")
		   		  	      .addClass("stars-" + score.toString())
		   		  	      .text("★★★★★")
		   		  	      .appendTo($domElement);
		   		  	  }
		
		     	  addScore2(total, $("#fixture"+i));
   			}
    	}); 
        $(function() {
        	   /* Star Review Company */
        	   			var StarRating = document.getElementById("StarRating").value;
        			   		  	  function addScore2(score, $domElement) {
        			   		  	    $("<span class='stars-container'> ")
        			   		  	      .addClass("stars-" + score.toString())
        			   		  	      .text("★★★★★")
        			   		  	      .appendTo($domElement);
        			   		  	  }
        			
        			     	  addScore2(StarRating, $("#fixture"));
        	   			
        	    	}); 
        </script>
<!-- Table -->
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script> 
<script src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.11.2/jquery-ui.min.js"></script>
<script type="text/javascript" src="/ServiceCleaner_5938/js/paging.js"></script> 
<script type="text/javascript">
            $(document).ready(function() {
                $('#tableData').paging({limit:2});
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
</body>
</html>