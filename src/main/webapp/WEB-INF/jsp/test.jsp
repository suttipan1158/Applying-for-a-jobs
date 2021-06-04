<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

	<title>Medex - Free Bootstrap 4 Template by Colorlib</title>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

		<script type="text/javascript" src="${pageContext.request.contextPath}/js/paginationlist/paginga.jquery.js"></script>

<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<!------ Include the above in your HEAD tag ---------->
<link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet">
<link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.6/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rwoIResjU2yc3z8GV/NPeZWAv56rSmLldC3R/AZzGRnGxQQKnKkoFVhFQhNUwEyJ" crossorigin="anonymous">
	

	<!------ Carousel ---------->

<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
		<style>
			*
			{
				font-family: sans-serif;
			}

			.items div 
			{
				border: 1px solid gray;
				margin: 5px;
				padding: 10px;
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
				height: 100%;
			}
	
		</style>
<style>

</style>

</head>
<body>

<!-- FOOTER -->
		<jsp:include page="../navbar/navbar.jsp"></jsp:include>
	<!-- END FOOTER -->

	
	<!-- Hero section -->
	<section class="hero-section">
		<div class="hero-slider owl-carousel" >
			<div class="hs-item"  style="background-image: url('${pageContext.request.contextPath }/imagestem/bg_1.jpg');">
				<div class="container">
					<div class="row" >
						<div class="col-lg-6 ">
						</div>
						<div class="col-lg-6">
							<div class="hs-text">
								<h1 style="color:#F4D03F;">Cleaner Services</h1>
								<h1><span>Cleaner</span> <span>Services</span></h1>
								<h4 style="font-size: 18px;">ศูนย์กลางการให้บริการทำความสะอาด </h4>
								
								<a href="#" class="site-btn">Download Now</a>
								<a href="#" class="site-btn sb-c2">Start free trial</a>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- Hero section end -->
  <%String[] s ={"Item 1","Item 2","Item 3","Item 4","Item 5"}; %>
 <div class="paginate 1">
			
				<%for(int i = 0; i < s.length ; i++){ %>
					<div class="items">
						<div>
						<div><%=s[i]%></div>
						<div><%=s[i]%></div>
						<div><%=s[i]%></div>
						<div><%=s[i]%></div>
						<div><%=s[i]%></div>
						<div><%=s[i]%></div>
						</div>
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
		
<h2>Example 2 (no first/last page buttons)</h2>
		<div class="paginate 2">
			<div class="items">
				<div>Item 1</div>
				<div>Item 2</div>
				<div>Item 3</div>
				<div>Item 4</div>
				<div>Item 5</div>
				<div>Item 6</div>
			</div>
			<div class="pager">
				<div class="firstPage">&laquo;</div>
				<div class="previousPage">&lsaquo;</div>
				<div class="pageNumbers"></div>
				<div class="nextPage">&rsaquo;</div>
				<div class="lastPage">&raquo;</div>
			</div>
		</div>
<h2>Example 2 (no first/last page buttons)</h2>
		<div class="paginate 3">
			<div class="items">
				<div>Item 1</div>
				<div>Item 2</div>
				<div>Item 3</div>
				<div>Item 4</div>
				<div>Item 5</div>
				<div>Item 6</div>
			</div>
			<div class="pager">
				<div class="firstPage">&laquo;</div>
				<div class="previousPage">&lsaquo;</div>
				<div class="pageNumbers"></div>
				<div class="nextPage">&rsaquo;</div>
				<div class="lastPage">&raquo;</div>
			</div>
		</div>
		<h2>Example 2 (no first/last page buttons)</h2>
		<div class="paginate 4">
			<div class="items">
				<div>Item 1</div>
				<div>Item 2</div>
				<div>Item 3</div>
				<div>Item 4</div>
				<div>Item 5</div>
				<div>Item 6</div>
			</div>
			<div class="pager">
				<div class="firstPage">&laquo;</div>
				<div class="previousPage">&lsaquo;</div>
				<div class="pageNumbers"></div>
				<div class="nextPage">&rsaquo;</div>
				<div class="lastPage">&raquo;</div>
			</div>
		</div>

<h1 class="text-center" alt="Simple">Simple Pure CSS Star Rating Widget Bootstrap 4</h1>
 
<div class="container">
        <div class="starrating risingstar d-flex justify-content-center flex-row-reverse">
            <input type="radio" id="star5" name="rating" value="5" /><label for="star5" title="5 star">5</label>
            <input type="radio" id="star4" name="rating" value="4" /><label for="star4" title="4 star">4</label>
            <input type="radio" id="star3" name="rating" value="3" /><label for="star3" title="3 star">3</label>
            <input type="radio" id="star2" name="rating" value="2" /><label for="star2" title="2 star">2</label>
            <input type="radio" id="star1" name="rating" value="1" /><label for="star1" title="1 star">1</label>
        </div>
  </div>	

<h2 class="text-center" alt="Simple"><a href="http://themastercut.co">Check also WordPress Plugins on TheMasterCut.co</h2>

<!--====== Javascripts & Jquery ======-->
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/js.template02/bootstrap.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/js.template02/jquery.slicknav.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/js.template02/owl.carousel.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/js.template02/main2.js"></script>

<script>
			$(function() {
				$(".paginate").paginga({
					// use default options
				});
			  
				$(".paginate-page-2").paginga({
					page: 3
				});

				$(".paginate-no-scroll").paginga({
					scrollToTop: false
				});
			});
			
		</script>

</html>