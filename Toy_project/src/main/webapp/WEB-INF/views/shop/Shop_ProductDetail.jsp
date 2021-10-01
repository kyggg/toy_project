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
</head>
<body>
<header>
			<nav class="navbar navbar-expand-lg navbar navbar-white bg-white"
				style="height: 80px; font-size: 21px;">
				<div class="container-fluid">
					<div class="col-2" style="text-align: start; align-self: center; margin-left: 26px;">
						<img alt="" src="../resources/img/ShopLogo.png"
							onClick="location.href='../index/index.do'" width="200"
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
<form action="">
	<div class="row">
		<div><h2>물품 상세보기 페이지</h2></div>
			<div class="col">
				<table>
					<tr>
						<td>상품명 : </td>
						<td>${productView.productVo.product_name }</td>		
					</tr>
					<tr>
						<td>상품 이미지 : </td>	
						<td style="text-align: center;">
						<c:choose>
						<c:when test="${empty productView.productVo.product_image_url }">
							<img src="../resources/img/noimg1.jpg" style="width: 450px;
																	    height: 300px;																									    
																	    background-size: cover;
																	    background-repeat: no-repeat;
																	    background-position: center;">
				    	</c:when>
				    	<c:otherwise>	
							<img src="/productUpload/${productView.productVo.product_image_url }" style="width: 450px;
																					    height: 300px;																									    
																					    background-size: cover;
																					    background-repeat: no-repeat;
																					    background-position: center;" >
					    </c:otherwise>
				    </c:choose>	</td> 			
						 		
					</tr>
					<tr>
						<td>상품 간략 소개 : </td>
						<td>${productView.productVo.product_content }</td>				
					</tr>
					<tr>
						<td>상품가격 : </td>
						<td>${productView.productVo.product_price } 원</td>				
					</tr>
					<tr>
						<td>남은 수량 : </td>
						<td>${productView.productVo.product_count } 개</td>
					</tr>
					<tr>
						<td><a href="./Shop_BuyProduct.do?product_no=${productView.productVo.product_no }">구매하기</a></td>
						<td><a href="./Shop_View.do?product_no=${productView.productVo.product_no }">목록</a></td>
					</tr>
				</table>
			</div>
	</div>
</form>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="../resoures/tool_js/scripts.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js"></script>
    <script src="assets/demo/chart-area-demo.js"></script>
    <script src="assets/demo/chart-bar-demo.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest"></script>
    <script src="js/datatables-simple-demo.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js"></script>
</body>
</html>