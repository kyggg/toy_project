<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- basic -->

<meta http-equiv="X-UA-Compatible" content="IE=edge">
<!-- mobile metas -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="viewport" content="initial-scale=1, maximum-scale=1">
<!-- site metas -->
<title>Main Page</title>
<meta name="keywords" content="">
<meta name="description" content="">
<meta name="author" content="">
<!-- bootstrap css -->
<link rel="stylesheet" href="../resources/css/bootstrap.min.css">
<!-- style css -->
<link rel="stylesheet" href="../resources/css/style.css">
<!-- Responsive-->
<link rel="stylesheet" href="../resources/css/responsive.css">
<!-- fevicon -->
<link rel="icon" href="../resources/img/fevicon.png" type="image/gif" />
<!-- Scrollbar Custom CSS -->
<link rel="stylesheet"
	href="../resources/css/jquery.mCustomScrollbar.min.css">
<!-- Tweaks for older IEs-->
<link rel="stylesheet"
	href="https://netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/fancybox/2.1.5/jquery.fancybox.min.css"
	media="screen">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-KyZXEAg3QhqLMpG8r+8fhAXLRk2vvoC2f3B09zVXn8CA5QIVfZOJ3BCsw2P0p/We"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css">

<!-- Link Swiper's CSS -->
<link rel="stylesheet"
	href="https://unpkg.com/swiper/swiper-bundle.min.css" />
<link
	href="https://fonts.googleapis.com/css2?family=Yanone+Kaffeesatz:wght@300&display=swap"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css2?family=Gowun+Batang&family=Nanum+Myeongjo:wght@700&family=Yanone+Kaffeesatz:wght@300&display=swap"
	rel="stylesheet">
	
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css">
<link rel="shortcut icon" type="image/x-icon" href="../resources/img/favicon.ico"/>
<link rel="stylesheet" href="path/to/font-awesome/css/font-awesome.min.css">

	
<!-- Demo styles -->
<style>
html, body {
	position: relative;
	height: 100%;
}

html:root {--swiper-theme-color: #1AAB8A;
}

body {
	background: #;
	font-family: Helvetica Neue, Helvetica, Arial, sans-serif;
	font-size: 14px;
	color: #000;
	margin: 0;
	padding: 0;
}

.swiper {
	width: 100%;
	height: 100%;
}

.swiper-slide {
	text-align: center;
	font-size: 18px;
	background: #1AAB8A;
	/* Center slide text vertically */
	display: -webkit-box;
	display: -ms-flexbox;
	display: -webkit-flex;
	display: flex;
	-webkit-box-pack: center;
	-ms-flex-pack: center;
	-webkit-justify-content: center;
	justify-content: center;
	-webkit-box-align: center;
	-ms-flex-align: center;
	-webkit-align-items: center;
	align-items: center;
}

.swiper-slide img {
	display: block;
	width: 100%;
	height: 100%;
	object-fit: cover;
}

* {
	font-family: 'Yanone Kaffeesatz', sans-serif; ! important;
	font-family: 'Nanum Myeongjo', serif;
}

html {
	height: 100vh;
}

body {
	margin: 0;
	padding: 0;
	height: 100%;
}

.page-link {
	background-color: transparent;
	color: #1AAB8A;
}

#wrapper {
	position: absolute;
	width: 100%;
	height: 100vh;
}

header {
	background-color: #ffffff;
}

#container {
	padding: 20px;
}

#main-row {
	height: 100vh;
	background-image: url('../resources/img/wallpaper.jpg');
	background-repeat: no-repeat;
	background-size: cover;
}

button {
	background: #1AAB8A;
	color: #fff;
	border: none;
	position: relative;
	height: 60px;
	font-size: 1.6em;
	padding: 0 2em;
	cursor: pointer;
	transition: 800ms ease all;
	outline: none;
}

button:hover {
	background: #fff;
	color: #1AAB8A;
}

button:before, button:after {
	content: '';
	position: absolute;
	top: 0;
	right: 0;
	height: 2px;
	width: 0;
	background: #1AAB8A;
	transition: 400ms ease all;
}

button:after {
	right: inherit;
	top: inherit;
	left: 0;
	bottom: 0;
}

button:hover:before, button:hover:after {
	width: 100%;
	transition: 800ms ease all;
}

footer {
	position: relative;
	bottom: 0;
	width: 100%;
	height: 70px;
	background: #fff;
}

#xx {
	text-align: center;
	justify-content: center;
}

li ul li:hover {
	background: #00C473;
}

a {
	text-decoration-line: none;
}

.nav-link {
	color: black;
}

.nav-link:hover {
	color: #00C473;
}
</style>

</head>
<body>
	<div id="wrapper">
		<header>
			<nav class="navbar navbar-expand-lg navbar navbar-white bg-white"
				style="height: 80px; font-size: 21px;">
				<div class="container-fluid">
					<div class="col-2" style="text-align: start; align-self: center; margin-left: 26px;">
						<img alt="" src="../resources/img/ShopLogo.png"
							onClick="location.href='../index/home.do'" width="200"
							height="100" />
					</div>

					<div class="col">
						<div class="navbar-nav" id="xx">
							<a class="nav-link active" aria-current="page"
								href="../index/home.do" style="margin-left: 20px;">Home</a>
							<div class="" id="navbarNavDarkDropdown">
								<ul class="navbar-nav">
									<li class="nav-item dropdown"><a
										class="nav-link dropdown-toggle" href="#"
										id="navbarDarkDropdownMenuLink" role="button"
										data-bs-toggle="dropdown" aria-expanded="false"
										style="margin-left: 20px;"> Board </a>
										<ul class="dropdown-menu dropdown-menu-dark"
											aria-labelledby="navbarDarkDropdownMenuLink">
											<li><a class="dropdown-item" href="#">Free Board</a></li>
											<li><a class="dropdown-item" href="../board/QnAList.do">QnA</a></li>
											<li><a class="dropdown-item"
												href="../board/Tech_Main.do">Skill Information</a></li>
											<li><a class="dropdown-item" href="#">Project
													Gallery</a></li>
										</ul></li>
								</ul>
							</div>
							<a class="nav-link" href="./Shop_Main.do"
								style="margin-left: 20px;">Shop</a> <a class="nav-link"
								href="../index/teamProjectPage.do" style="margin-left: 20px;">Team
								Project</a>
						</div>
					</div>

					<div class="col-2" style="align-self: center; text-align: center; margin: auto;">
						<h3 style="margin: 0px; padding: 0px;">
							<span class="rounded-pill badge bg-success">${sessionUser.member_name }</span>
						</h3>
					</div>
				</div>
			</nav>
		</header>


		<!-- 메뉴-->
 <div class="container-fluid">
		<div class="row">

			<div class="col-2">
				<div class="flex-shrink-0 p-3 bg-white" style="width: 280px; position: sticky; top: 150px;">
					<a
						class="d-flex align-items-center pb-3 mb-3 link-dark text-decoration-none border-bottom">
						<svg class="bi me-2" width="30" height="24">
						<use xlink:href="#bootstrap" /></svg> <span class="fs-5 fw-semibold">
							MENU</span>
					</a>
					<ul class="list-unstyled ps-0">
						<li class="mb-1">
							<button
								class="btn btn-toggle align-items-center rounded collapsed"
								onClick="location.href='./Shop_Main.do'">
								<img src="../resources/img/s_home.png" alt=""> Home
							</button>

						</li>

						<li class="mb-1">
							<button
								class="btn btn-toggle align-items-center rounded collapsed"
								onClick="location.href='./Shop_ShopLikeList.do?member_no=${sessionUser.member_no }'">
								<img src="../resources/img/s_home.png" alt=""> MyShopLike								
							</button>

						</li>

						<li class="mb-1">
							<button
								class="btn btn-toggle align-items-center rounded collapsed"
								onClick="location.href='./Shop_PurchaseHistory.do?member_no=${sessionUser.member_no }'">
								<img src="../resources/img/s_purchase.png" alt="">
								Purchase
							</button>
						</li>
						<li class="mb-1">
							<button
								class="btn btn-toggle align-items-center rounded collapsed"
								onClick="location.href='./Shop_Manage.do'">
								<img src="../resources/img/s_shop_manage.png" alt=""> Shop
								Manage
							</button>

						</li>
						<li class="border-top my-3"></li>
						
					</ul>
				</div>
			</div>
			<!-- 사이드바 왼쪽 -->

			<div class="col-8">
				<div class="row-2" style="margin: 5% auto;">
					<div class="col">

						<!-- Swiper -->
						<div class="swiper mySwiper">
							<div class="swiper-wrapper">
								<div class="swiper-slide">
									<img src="../resources/img/c1.jpg" />
								</div>
								<div class="swiper-slide">
									<img src="../resources/img/c2.jpeg" />
								</div>
								<div class="swiper-slide">
									<img src="../resources/img/c3.jpg" />
								</div>
							</div>
							<div class="swiper-button-next"></div>
							<div class="swiper-button-prev"></div>
							<div class="swiper-pagination"></div>

						</div>

						<!-- Swiper JS -->
						<script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>

						<!-- Initialize Swiper -->
						<script>
							var swiper = new Swiper(".mySwiper", {
								pagination : {
									el : ".swiper-pagination",
									type : "progressbar",
								},
								navigation : {
									nextEl : ".swiper-button-next",
									prevEl : ".swiper-button-prev",
								},
							});
						</script>
						
						<br>
						<br>
						<br>
						<br>
										
						<!-- 카드 -->
						<section id="team">
							<div class="container my-3 py-2 text-start">
								<div class="row">
									<div class="col">
										<h1>New Shop</h1>
										<span style="font-size: 17px; color: gray; font-weight: bold;">Toy에
											등록된 새로운 상점들입니다.</span>
										<hr align="center"
											style="border: solid 1px black; width: 100%;">
									</div>
								</div>
							</div>

							<div class="row" style="margin-bottom: 250px;  justify-content: start;">
								<c:forEach items="${shoplist }" var="shoplist" end="2">
							<div class="col-3" style="align-self: center;width: 335px; height:530px; ">
								<div class="card" style=" width: 320px; height:510px;border-radius: 15px;  mergin-bottom:50px; ">									  
									  <c:choose>
											<c:when test="${empty shoplist.shopVo.shop_image_url}">
												<img src="../resources/img/noimg1.jpg" class="card-img-top" alt="..." style="																									    
																	    background-size: cover;
																	    background-repeat: no-repeat;
																	    display:block; margin:5px auto;
																	    background-position: center;width: 300px; height:350px;">
									    	</c:when>
									    	<c:otherwise>	
												<img src="/shopUpload/${shoplist.shopVo.shop_image_url }" class="card-img-top" alt="..." style=" background-size: cover;
																	    background-repeat: no-repeat;
																	    display:block; margin:5px auto;
																	    background-position: center;width: 300px; height:350px;" >
										    </c:otherwise>
									    </c:choose>	
									  <div class="card-body">
									    <h5 class="card-title"><a style="text-decoration:none; color:black;" href="./Shop_ClientProductView.do?shop_no=${shoplist.shopVo.shop_no }">${shoplist.shopVo.shop_name }</a></h5>
									    <p class="card-text"><i class="bi bi-brightness-alt-high" style="color:green;">가게 소개</i><br> ${shoplist.shopVo.shop_content }</p>
									  </div>
									  <div class="card-footer" style="background-color:transparent;">
									    
									    <div><i class="bi bi-people-fill"></i> 판매자: ${shoplist.memberVo.member_name }</div>
										</div>
									
										</div>
									</div>
							</c:forEach>
								<a href="./Shop_ClientShopView.do"><img src="../resources/img/plus.png" alt="" style="float: right; width: 50px; height: 50px;"></a>
								
							</div>
						</section>
						<!-- ################################################################################# -->				
						<section style="margin-top:-150px;">
							<div class="container my-3 py-2 text-start">
								<div class="row mb-5" >
									<div class="col">
										<h1>New Product</h1>
										<span style="font-size: 17px; color: gray; font-weight: bold;">Toy에
											등록된 새로운 상품입니다.</span>

										<hr align="center"
											style="border: solid 1px black; width: 100%;">
									</div>
								</div>
							</div>

							<div class="row" style="display: flex; justify-content: start;">
							
						<c:forEach items="${productlist }" var="productlist" end="2">
							<div class="col-3" style="align-self: center;width: 335px; height:530px; margin-top:40px;">
								<div class="card" style=" width: 320px; height:510px;border-radius: 15px;  mergin-bottom:50px; ">									  
									  <c:choose>
											<c:when test="${empty productlist.toyProductVo.product_image_url }">
												<img src="../resources/img/noimg1.jpg" class="card-img-top" alt="..." style="																									    
																	    background-size: cover;
																	    background-repeat: no-repeat;
																	    display:block; margin:5px auto;
																	    background-position: center;width: 290px; height:350px;">
									    	</c:when>
									    	<c:otherwise>	
												<img src="/productUpload/${productlist.toyProductVo.product_image_url }" class="card-img-top" alt="..." style=" background-size: cover;
																	    background-repeat: no-repeat;
																	    display:block; margin:5px auto;
																	    background-position: center;width: 290px; height:350px;" >
										    </c:otherwise>
									    </c:choose>	
									  <div class="card-body">
									    <h5 class="card-title">${productlist.toyProductVo.product_name }</h5>
									    <p class="card-text"><i class="bi bi-brightness-alt-high" style="color:green;">상품 수량: </i>${productlist.toyProductVo.product_count }</p><br>
									    <p >상품 가격: ${productlist.toyProductVo.product_price }</p>
									  </div>
									  <div class="card-footer" style="background-color:transparent;">
									    
									   <button class="btn-lg btn-info" onClick="location.href='./Shop_BuyProduct.do?product_no=${productlist.toyProductVo.product_no }&&shop_no=${productlist.toyProductVo.shop_no }'" style="font-size:1rem; width: 250px; height:30px; margin-left:20px;padding: 0px 12px; background-color:transparent; color:#1AAB8A; border-radius: 10px;"><strong>상품구매</strong></button>
									  </div>
									
										</div>
									</div>
							</c:forEach>
							<a href="./Shop_ClientProductView2.do"><img src="../resources/img/plus.png" alt="" style="float: right; width: 50px; height: 50px; margin-bottom: 50px;"></a>
							</div>
							
							
							<a href="./Shop_Manage.do"><img src="../resources/img/m1.jpg" alt="" /></a>


						</section>

					</div>
				</div>

			</div>
			<div class="col-2" style="width: 250px;">
			<img alt="" src="../resources/img/r_side.jpg"></div>
		</div>

		<div class="row" >
			
			<div class="col-2"></div>
			<div class="col-8" style="margin-top: 50px;">
				<h1>Tip</h1>
				<span style="font-size: 17px; color: gray; font-weight: bold;">This
					is a tip for your satisfactory purchase.</span>

				<hr align="center" style="border: solid 1px black; width: 100%;">
			</div>
			<div class="col-2"></div>
		</div>



		<div class="row" style="margin-bottom: 50px;">
			<div class="col-3"></div>
			<div class="col-6"
				style="display: inline-block; margin-top: 100px; text-align: center;">
				<!-- 강사님 물어보기 -->
				<div id="carouselExampleDark" class="carousel carousel-dark slide"
					data-bs-ride="carousel">
					<div class="carousel-inner">
						<div class="carousel-item active" data-bs-interval="10000">
							<div class="embed-responsive embed-responsive-21by9">
								<iframe width="640" height="360"
									src="https://www.youtube.com/embed/5aNClcWa7kY"
									title="YouTube video player" frameborder="0"
									allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture"
									allowfullscreen></iframe>
							</div>
						</div>
						<div class="carousel-item" data-bs-interval="2000">
							<div class="embed-responsive embed-responsive-21by9">
								<iframe width="640" height="360"
									src="https://www.youtube.com/embed/DEUoKeqhNWU"
									title="YouTube video player" frameborder="0"
									allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture"
									allowfullscreen></iframe>
							</div>

						</div>
						<div class="carousel-item">
							<div class="embed-responsive embed-responsive-21by9">
								<iframe width="640" height="360"
									src="https://www.youtube.com/embed/MVluFcg5yVE"
									title="YouTube video player" frameborder="0"
									allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture"
									allowfullscreen></iframe>
							</div>
						</div>

					</div>

					<button class="carousel-control-prev" type="button"
						data-bs-target="#carouselExampleDark" data-bs-slide="prev">
						<span class="carousel-control-prev-icon" aria-hidden="true"></span>
						<span class="visually-hidden">Previous</span>
					</button>
					<button class="carousel-control-next" type="button"
						data-bs-target="#carouselExampleDark" data-bs-slide="next">
						<span class="carousel-control-next-icon" aria-hidden="true"></span>
						<span class="visually-hidden">Next</span>
					</button>
				</div>
			</div>

			<div class="col-3"></div>

		</div>

		<div class="row" style="margin-bottom: 50px;">
			<div class="col-2"></div>
			<div class="col-8" style="text-align: center; align-self: center">

				<h4>안녕하세요 TOY 입니다. 위 영상에 다양한 정보들이 있습니다.</h4>
			</div>

			<div class="col-2"></div>
		</div>


		<!-- 이벤트 -->
		<div class="row" style="margin-bottom: 50px;">
			<div class="col-2"></div>
			<div class="col-8">
				<div class="container my-3 py-2 text-start">
					<div class="row mb-5">
						<div class="col">
							<h1>EVENT</h1>
							<span style="font-size: 17px; color: gray; font-weight: bold;">Toy는
								지금 EVENT 진행중~!!</span>
							<hr align="center" style="border: solid 1px black; width: 100%;">
						</div>
					</div>
				</div>

				<div class="row">
					<div class="col-2"></div>
					<div class="col-8">
						<div class="row">
						<div class="col-12" style="margin-bottom: 50px;" >
								<img src="../resources/img/f3.jpeg">
							</div>
							<div class="col-6">
								<img src="../resources/img/f1.jpg">
							</div>
							<div class="col-6">
								<img src="../resources/img/f2.jpg">
							</div>
							
						</div>
					</div>
					<div class="col-2"></div>
				</div>
			</div>
			
			<div class="col-2"></div>
		</div>



		<!-- 후기 사진 -->
		<div class="row">
			<div class="col-2"></div>
			<div class="col-8" style="text-align: start; align-self: center;">
				<div class="row">
					<div class="col-2"></div>
					<h1>Review</h1>
					<span style="font-size: 17px; color: gray; font-weight: bold;">고객님들의
						후기입니다~</span>

				</div>

				<hr align="center" style="border: solid 1px black; width: 100%;">
				<section id="team">
					<div class="row">
						<div class="col-lg-2 col-md-6">
							<div class="card-body">
								<img src="../resources/img/c1.jpg" alt=""
									class="img-fluid rounded-box w-200 mb-3">
								<h4>Mac Book</h4>
								<h5>Name</h5>
								<p>Content</p>
								<div class="d-flex flex-row justify-content-center">
									<div class="p-4">
										<a href="#"> <i class="bi bi-facebook"></i>
										</a>
									</div>

									<div class="p-4">
										<a href="#"> <i class="bi bi-instagram"></i>
										</a>
									</div>

									<div class="p-4">
										<a href="#"> <i class="bi bi-twitter"></i>
										</a>
									</div>
								</div>
							</div>
						</div>
						<div class="col-lg-2 col-md-6">
							<div class="card-body">
								<img src="../resources/img/c2.jpeg" alt=""
									class="img-fluid rounded-box w-200 mb-3">
								<h4>Speaker</h4>
								<h5>MarShall</h5>
								<p>MarShall Speaker</p>
								<div class="d-flex flex-row justify-content-center">
									<div class="p-4">
										<a href="#"> <i class="bi bi-facebook"></i>
										</a>
									</div>

									<div class="p-4">
										<a href="#"> <i class="bi bi-instagram"></i>
										</a>
									</div>

									<div class="p-4">
										<a href="#"> <i class="bi bi-twitter"></i>
										</a>
									</div>
								</div>
							</div>
						</div>

						<div class="col-lg-2 col-md-6">
							<div class="card-body">
								<img src="../resources/img/c3.jpg" alt=""
									class="img-fluid rounded-box w-200 mb-3">
								<h4>Headset</h4>
								<h5>SamSung</h5>
								<p>Marshall Speaker</p>
								<div class="d-flex flex-row justify-content-center">
									<div class="p-4">
										<a href="#"> <i class="bi bi-facebook"></i>
										</a>
									</div>

									<div class="p-4">
										<a href="#"> <i class="bi bi-instagram"></i>
										</a>
									</div>

									<div class="p-4">
										<a href="#"> <i class="bi bi-twitter"></i>
										</a>
									</div>
								</div>
							</div>
						</div>
						<div class="col-lg-2 col-md-6">
							<div class="card-body">
								<img src="../resources/img/c1.jpg" alt=""
									class="img-fluid rounded-box w-200 mb-3">
								<h4>Mac Book</h4>
								<h5>Apple</h5>
								<p>Apple MabBook</p>
								<div class="d-flex flex-row justify-content-center">
									<div class="p-4">
										<a href="#"> <i class="bi bi-facebook"></i>
										</a>
									</div>

									<div class="p-4">
										<a href="#"> <i class="bi bi-instagram"></i>
										</a>
									</div>

									<div class="p-4">
										<a href="#"> <i class="bi bi-twitter"></i>
										</a>
									</div>
								</div>
							</div>
						</div>
						<div class="col-lg-2 col-md-6">
							<div class="card-body">
								<img src="../resources/img/c2.jpeg" alt=""
									class="img-fluid rounded-box w-200 mb-3">
								<h4>Speaker</h4>
								<h5>MarShall</h5>
								<p>MarShall Speaker</p>
								<div class="d-flex flex-row justify-content-center">
									<div class="p-4">
										<a href="#"> <i class="bi bi-facebook"></i>
										</a>
									</div>

									<div class="p-4">
										<a href="#"> <i class="bi bi-instagram"></i>
										</a>
									</div>

									<div class="p-4">
										<a href="#"> <i class="bi bi-twitter"></i>
										</a>
									</div>
								</div>
							</div>
						</div>

						<div class="col-lg-2 col-md-6">
							<div class="card-body">
								<img src="../resources/img/c3.jpg" alt=""
									class="img-fluid rounded-box w-200 mb-3">
								<h4>Headset</h4>
								<h5>SamSung</h5>
								<p>Marshall Speaker</p>
								<div class="d-flex flex-row justify-content-center">
									<div class="p-4">
										<a href="#"> <i class="bi bi-facebook"></i>
										</a>
									</div>

									<div class="p-4">
										<a href="#"> <i class="bi bi-instagram"></i>
										</a>
									</div>

									<div class="p-4">
										<a href="#"> <i class="bi bi-twitter"></i>
										</a>
									</div>
								</div>
							</div>
						</div>



					</div>


				</section>
			</div>
			<div class="col-2"></div>



		</div>

		<!-- 		<hr align="center" style="border: solid 1px black; width: 100%;"> -->
		<!-- 		<ul><li><img src="../resources/img/facebook.png"></li> facebook</ul> -->
		<!-- 		<ul><li><img src="../resources/img/insta.png"></li> instagram</ul> -->
		<!-- 		<ul><li><img src="../resources/img/twitter.png"></li> twitter</ul> -->


		<footer>
			<div class="row mt-3">
				<img alt="" src="../resources/img/footer.png">
			</div>
		</footer>
</div>
	</div>
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.bundle.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js"></script>
	<script src="assets/demo/chart-area-demo.js"></script>
	<script src="assets/demo/chart-bar-demo.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest"></script>
	<script src="js/datatables-simple-demo.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js"></script>
</body>
</html>