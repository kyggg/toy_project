<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Document</title>
<!-- CSS only -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css">
<link rel="shortcut icon" type="image/x-icon" href="../resources/img/favicon.ico"/>

<style type="text/css">
html{
	height: 100vh;
}

body {
	margin: 0;
	padding: 0;
	height: 100vh;
	background-repeat: no-repeat;
	background-size: cover;
/* background-image: linear-gradient(120deg, #fdfbfb 0%, #ebedee 100%); */
/* 	background: linear-gradient(45deg, #fff, white 10%, #1E90FF); */
	background-attachment: fixed;
}

#wrapper {
	position: relative;
	width: 100%;
	height: 100%;
}

header {
	background-color: #ffffff;
}

#container {
	padding: 20px;
	height: auto;
}

footer {
	position: absolute;
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
<!-- body -->
<body>
	<div id="wrapper">
		<header>
			<nav class="navbar navbar-expand-lg navbar navbar-white bg-white" style="height: 80px; font-size: 21px;">
				<div class="container-fluid">
					<div class="col-1"></div>
					<div class="col" style="text-align: center; align-self: center;">
						<img alt="" src="../resources/img/Logo.png">
					</div>

					<div class="col-7">
						<div class="navbar-nav" id="xx">
							<a class="nav-link active" aria-current="page" href="#"
								style="margin-left: 20px;">Home</a>
							<div class="" id="navbarNavDarkDropdown">
								<ul class="navbar-nav">
									<li class="nav-item dropdown"><a
										class="nav-link dropdown-toggle" href="#"
										id="navbarDarkDropdownMenuLink" role="button"
										data-bs-toggle="dropdown" aria-expanded="false"
										style="margin-left: 20px;"> Board </a>
										<ul class="dropdown-menu dropdown-menu-dark"
											aria-labelledby="navbarDarkDropdownMenuLink">
											<li><a class="dropdown-item" href="../board/bulletinBoard_mainfr.do">Free Board</a></li>
											<li><a class="dropdown-item" href="../board/QnAList.do">QnA</a></li>
											<li><a class="dropdown-item" href="../board/Tech_Html.do">Skill	Information</a></li>
											<li><a class="dropdown-item" href="#">Project Gallery</a></li>
										</ul></li>
								</ul>
							</div>
							<a class="nav-link" href="../shop/Shop_Main.do" style="margin-left: 20px;">Shop</a>
							<a class="nav-link" href="../index/teamProjectPage.do" style="margin-left: 20px;">Team Project</a>
						</div>
					</div>

					<div class="col" style="text-align: center; align-self: center;">
						<a class="nav-link" href="../index/myPage.do" style="margin-left: 20px; padding-top: 3px"><i class="bi bi-person-circle fa-2x" style="color: #00C473;"></i></a>
					</div>
					<div class="col">
						<h3>
							<span class="rounded-pill badge bg-success">${sessionUser.member_name }</span>
						</h3>
					</div>
					<div class="col-1"></div>
				</div>
			</nav>
		</header>
		<!--content 시작 -->
		<div class="container-fulid" id="container">
			<div class="row">
				  <div class="col-2" style="padding-left: 20px; margin-right: 10px;"> 
		            <div class="row">
		            <div class="col">
			            <div class="card border-success mb-3" style="max-width: 14.5rem; align-self: center;">
						  <div class="card-header bg-transparent border-dark" style="font-size: 1rem;"><strong>${sessionUser.member_id }</strong></div>
							  <div class="card-body text-dark">
							    <p class="card-text"><i class="bi bi-person-bounding-box"></i> 닉네임: <strong>${sessionUser.member_name }</strong></p>
							    <p class="card-text"><i class="bi bi-chat-dots-fill"></i> 쪽지: <span style="color:green;">${readCount }</span></p>
							    <p class="card-text"><i class="bi bi-cash-coin"></i> 코인: <span style="color:green;">9999</span></p>
							  </div>
							  <div class="card" style="margin-bottom: 10px">
								  <ul class="list-group list-group-flush">
								    <li class="list-group-item"><a href="../message/messageList.do?member_name=${sessionUser.member_id }" style="color:#000000;">쪽지함</a></li>
								    <li class="list-group-item"><a href="../shop/Shop_PurchaseHistory.do?member_no=${sessionUser.member_no }" style="color:#000000;">구매내역</a></li>
								    <li class="list-group-item"><a href="../shop/Shop_ShopLikeList.do?member_no=${sessionUser.member_no }" style="color:#000000;">장바구니</a></li>
								    <li class="list-group-item"><a href="../shop/Shop_Manage.do" style="color:#000000;">Shop Management</a></li>
								    <li class="list-group-item"><a href="../index/myPage.do" style="color:#000000;">마이페이지</a></li>
								  </ul>
							</div>
						  <div class="card-footer bg-transparent border-dark" style="align-self: center;">
						  	<button class="btn-sm btn-danger" style="width: 163px" onClick="location.href='../member/logoutProcess.do'">로그아웃</button>
						  </div>
						</div>
						</div>
					</div>
					<div class="row">
						<div class="col">
							<ul class="nav flex-column">
							  <li class="nav-item" style="margin-bottom: 5px;">
							    <a class="nav-link btn btn-outline-success" style="text-align: start;" href="../board/bulletinBoard_mainfr.do"><i class="bi bi-filter-left"></i> Free Board</a>
							  </li>
							  <li class="nav-item" style="margin-bottom: 5px;">
							    <a class="nav-link btn btn-outline-success" style="text-align: start;" href="../board/QnAList.do"><i class="bi bi-sliders"></i> QnA</a>
							  </li>
							  <li class="nav-item" style="margin-bottom: 5px;">
							    <a class="nav-link btn btn-outline-success" style="text-align: start;" href="../board/Tech_Html.do"><i class="bi bi-tools" style="color: #1E90FF"></i> Skill Information</a>
							  </li>
							  <li class="nav-item" style="margin-bottom: 5px;">
						      	<a class="nav-link btn btn-outline-success" style="text-align: start;" href="../shop/Shop_Main.do"><i class="bi bi-cart-check-fill" style="color:#FF607F;"></i> Toy Shop</a>	
							  </li>
							    <li class="nav-item" style="margin-bottom: 5px;">
							    <a class="nav-link btn btn-outline-success" style="text-align: start;" href="../index/teamProjectPage.do"><i class="bi bi-cpu" style="color:#00C473;"></i> Team Project</a>
							  </li>
							</ul>						
						</div>	            	
	            	</div>
        	    </div>
				<div class="col">
					<div class="row mt-5">
						<div class="col" style="display: inline-block; text-align: center; color: black">
							<h3>
								<i class="bi bi-youtube" style="color: #FF0000;"> </i><strong>업무
									효율을 높여주는 협업툴 Best 5</strong>
							</h3>
						</div>
					</div>
					<div class="row mt-3">
						<div class="col"
							style="display: inline-block; text-align: center;">
							<div id="carouselExampleDark"
								class="carousel carousel-dark slide" data-bs-ride="carousel">
								<div class="carousel-inner">
									<div class="carousel-item active" data-bs-interval="10000">
										<div class="embed-responsive embed-responsive-21by9">
											<iframe width="660" height="415"
												src="https://www.youtube.com/embed/q19RtuCHt1Q"
												title="YouTube video player" frameborder="0"
												allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture"
												allowfullscreen></iframe>
										</div>
									</div>
									<div class="carousel-item" data-bs-interval="2000">
										<div class="embed-responsive embed-responsive-21by9">
											<iframe width="660" height="415"
												src="https://www.youtube.com/embed/Cwaj14naQ88"
												title="YouTube video player" frameborder="0"
												allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture"
												allowfullscreen></iframe>
										</div>

									</div>
									<div class="carousel-item">
										<div class="embed-responsive embed-responsive-21by9">
											<iframe width="660" height="415"
												src="https://www.youtube.com/embed/Vm-4wVEhQ9A"
												title="YouTube video player" frameborder="0"
												allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture"
												allowfullscreen></iframe>
										</div>
									</div>

									<div class="carousel-item">
										<div class="embed-responsive embed-responsive-21by9">
											<iframe width="660" height="415"
												src="https://www.youtube.com/embed/OA7bLWqIrZ8"
												title="YouTube video player" frameborder="0"
												allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture"
												allowfullscreen></iframe>
										</div>
									</div>

									<div class="carousel-item">
										<div class="embed-responsive embed-responsive-21by9">
											<iframe width="660" height="415"
												src="https://www.youtube.com/embed/SbhWatEkQkg"
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
					</div>
					<div class="row mt-3 mb-5">
						<div class="col" style="display: inline-block; text-align: center;">
							<!-- Button trigger modal -->
							<button type="button" class="btn btn-outline-success" data-bs-toggle="modal"
								data-bs-target="#staticBackdrop"
								style="background-color: #fff; color: balck; border-radius: 20px">
								자세히보기</button>

							<!-- Modal -->
							<div class="modal fade" id="staticBackdrop"
								data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1"
								aria-labelledby="staticBackdropLabel" aria-hidden="true">
								<div class="modal-dialog">
									<div class="modal-content">
										<div class="modal-header">
											<h5 class="modal-title" id="staticBackdropLabel">협업툴</h5>
											<button type="button" class="btn-close"
												data-bs-dismiss="modal" aria-label="Close"></button>
										</div>
										<div class="modal-body">
											<div class="col">
												<h5>
													<i class="bi bi-laptop" style="color: purple;"></i> Slack
												</h5>
												<p>
													<a href="https://slack.com/intl/ko-kr/"
														class="tooltip-test" style="color: purple;"
														target='_blank' title="Tooltip">슬랙 사용하기</a>
												</p>
											</div>
											<hr>
											<div class="col">
												<h5>
													<i class="bi bi-laptop" style="color: green;"></i> Jandi
												</h5>
												<p>
													<a href="https://www.jandi.com/landing/kr"
														class="tooltip-test" style="color: green;" target='_blank'
														title="Tooltip">잔디 사용하기</a>
												</p>
											</div>
											<hr>
											<div class="col">
												<h5>
													<i class="bi bi-laptop" style="color: goldenrod;"></i>
													Kakao work
												</h5>
												<p>
													<a
														href="https://www.kakaowork.com/?utm_source=google_pc&utm_medium=sa&utm_campaign=search_ad&utm_term=%EC%B9%B4%EC%B9%B4%EC%98%A4%EC%9B%8C%ED%81%AC&gclid=CjwKCAjw4KyJBhAbEiwAaAQbEwooH-rWhQccovvmNhJ-w0qAUcLGBb9Ct1hAYnkRnAcKs0cyBrX9qRoCbTYQAvD_BwE"
														style="color: goldenrod;" target='_blank'
														class="tooltip-test" title="Tooltip">카카오워크 사용하기</a>
												</p>
											</div>
											<hr>
											<div class="col">
												<h5>
													<i class="bi bi-laptop" style="color: red;"></i> Google
													Workspace
												</h5>
												<p>
													<a
														href="https://workspace.google.com/intl/ko/?utm_source=google&utm_medium=cpc&utm_campaign=1010746-Workspace-APAC-KR-ko-BKWS-PHR-Regular&utm_content=text-ad-none-none-DEV_c-CRE_539366113919-ADGP_Hybrid+%7C+BKWS+-+PHR+%7C+Txt+~+G+Suite-KWID_43700065817062309-kwd-1431657390154&userloc_1009871-network_g&utm_term=KW_%EA%B5%AC%EA%B8%80%20%EC%9B%8C%ED%81%AC&gclid=CjwKCAjw4KyJBhAbEiwAaAQbE9u3Uu_HfTW1koEbChAt_NKezN2uPd8cx_uNjEMiimXvzPHMistU5hoCDjYQAvD_BwE&gclsrc=aw.ds"
														style="color: red;" target='_blank' class="tooltip-test"
														title="Tooltip">구글 워크스페이스 사용하기</a>
												</p>
											</div>
											<hr>
											<div class="col">
												<h5>
													<i class="bi bi-laptop" style="color: blue;"></i> Microsoft
													Teams
												</h5>
												<p>
													<a
														href="https://www.microsoft.com/ko-kr/microsoft-teams/group-chat-software"
														target='_blank' style="color: blue;" class="tooltip-test"
														title="Tooltip">팀즈 사용하기</a>
												</p>
												<hr>
											</div>
										</div>
										<div class="modal-footer">

											<button type="button" class="btn btn-warning"
												data-bs-dismiss="modal">Close</button>

										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<hr>
					<div class="row mt-4">
							<div class="col" style="align-self:center;">
									<span style ="font-size:2em; font-weight: bold; "><i class="bi bi-gear-wide-connected" style="color: #1E90FF"></i> 현재 모집중인 프로젝트</span>
									<button type="button" onClick="location.href='../index/teamProjectPage.do'" class="btn btn-outline-success" style="margin-bottom: 14px; margin-left: 20px; align-self: end;">더보기</button>
							</div>
					</div>
						<div class="row mt-4" style="margin-bottom: 50px;">
							<c:forEach items="${roomList }" var="roomList" varStatus="status" end="2">
								<div class="col-3" style="align-self: center; margin-right: 80px;">
									<div class="card" style="width: 19rem; border-radius: 15px;">
										  <img src="../resources/img/signup.png" class="card-img-top" alt="..." style="height: 200px">
										  <div class="card-body">
										    <h5 class="card-title">프로젝트 : ${roomList.roomVo.title }</h5>
										    <p class="card-text"><i class="bi bi-brightness-alt-high" style="color:green;">프로젝트 소개</i><br> ${roomList.roomVo.simpleContent }</p>
										  </div>
										  <ul class="list-group list-group-flush">
										    <li class="list-group-item"><i class="bi bi-calendar-check"></i> 프로젝트 기간 <br> 
										    <fmt:formatDate var="startDate" value="${roomList.roomVo.startDate }" /> 
										    <fmt:formatDate var="lastDate" value="${roomList.roomVo.lastDate }" />
											${startDate } ~ ${lastDate }</li>
										    <li class="list-group-item"><i class="bi bi-stack" style="color:red;"></i> 
										    필요기술:
												    <c:forEach items="${roomList.loadStack }" var="loadStack">
						    					 	${loadStack.category_name }. 
						    						</c:forEach>
										     </li>
										    <li class="list-group-item"><i class="bi bi-people-fill"></i> 모집인원: ${roomList.people }/${roomList.roomVo.people }</li>
										  </ul>
										  <div class="card-body">
											<c:choose>
													<c:when test="${sessionUser.member_no eq roomList.doNotParticipation.member_no}">
														<form action="../project/enterProject.do" method="post">
															<button class="btn-lg btn-secondary form-control"><strong>참여하기</strong></button>
															<input type="hidden" name="room_no" value="${roomList.roomVo.room_no }"> 
															<input type="hidden" name="member_no" value="${sessionUser.member_no }">
														</form>
													</c:when>
													<c:when
														test="${sessionUser.member_no ne roomList.doNotParticipation.member_no && roomList.resultApprove.examination eq 'N' && roomList.people lt roomList.roomVo.people}">
														<button class="btn-lg btn-danger form-control" disabled="disabled">거절</button>
													</c:when>
													<c:when
														test="${sessionUser.member_no ne roomList.doNotParticipation.member_no && roomList.resultApprove.examination eq 'S' && roomList.people lt roomList.roomVo.people}">
														<button class="btn-lg btn-info form-control" disabled="disabled">심사중</button>
													</c:when>
													<c:otherwise>
														<c:choose>
															<c:when test="${roomList.people lt roomList.roomVo.people }">
																	<button class="btn-lg btn-success form-control" onclick="application(${status.index })">신청하기</button>
																	<input type="hidden" id="room_no${status.index }" value="${roomList.roomVo.room_no }"> 
																	<input type="hidden" id="member_no${status.index }" value="${sessionUser.member_no }">
															</c:when>
															<c:otherwise>
																<button class="btn-lg btn-dark form-control" disabled="disabled" style="color:#fff;"><strong>인원마감</strong></button>
															</c:otherwise>
														</c:choose>
													</c:otherwise>
												</c:choose>
												  </div>
											</div>
										</div>
							</c:forEach>
						</div>
						<hr>
				<div class="row mt-4" style="display: flex;">
					<section id="team">
					<div class="col" >
						<h2 style="margin-bottom: 20px;"><i class="bi bi-clipboard-data"></i>  New Post</h2>
						<table class="table">
							<thead>
								<tr style="text-align: center;">
									<th style="width: 10%;">No</th>
									<th style="width: 10%;">카테고리</th>
									<th style="width: 30%;">제목</th>
									<th style="width: 20%;">작성자</th>
									<th style="width: 20%;">작성일</th>
								</tr>
							</thead>
							<tbody>
								<tr style="text-align: center;">
									<th scope="row">4</th>
									<td>Skill</td>
									<td>Java 배열 API 추천</td>
									<td>Shark Jo</td>
									<td>2021-09-21</td>
								</tr>
								<tr style="text-align: center;">
									<th scope="row">3</th>
									<td>QnA</td>
									<td>JAVASCRIPT Submit이 안됩니다.</td>
									<td>Shark Jo</td>
									<td>2021-09-15</td>
								</tr>
								<tr style="text-align: center;">
									<th scope="row">2</th>
									<td>Free Board</td>
									<td>새로 나온 맥북프로 어떤가요?</td>
									<td>Joel Cho</td>
									<td>2021-09-13</td>
								</tr>
								<tr style="text-align: center;">
									<th scope="row">1</th>
									<td>QnA</td>
									<td>웹사이트 제작할때 순서 조언해주세요!</td>
									<td>Shark Jo</td>
									<td>2021-09-12</td>
								</tr>
							</tbody>
						</table>
					</div>
					</section>
				</div>
				
				<hr>
					<div class="row">
						<div class="col" style="align-self: center; text-align: center; margin: auto;" >
							<img src="../resources/img/f3.jpeg" style="height: 800px;">
						</div>
					</div>	
						
						
				<hr style="margin-top: 20px;">
						<div class="row">
							<div class="col">
						<section id="team">
							<div class="container my-3 py-2 text-start">
								<div class="row">
									<div class="col">
									<span style ="font-size:2em; font-weight: bold; "><i class="bi bi-cart-check-fill" style="color:#FF607F;"></i> NEW SHOP</span>
										<button type="button" onClick="location.href='../shop/Shop_Main.do'" class="btn btn-outline-success" style="margin-bottom: 14px; margin-left: 20px; align-self: end;">더보기</button>	
									</div>
									<div>
										<span style="font-size: 17px; color: gray; font-weight: bold;">Toy에 등록된 새로운 상점들입니다.</span>
										<hr align="center" style="border: solid 1px black; width: auto;">
									</div>
								</div>
							</div>

							<div class="row" style="margin-bottom: 250px;  justify-content: center;">
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
									    <h5 class="card-title"><a style="text-decoration:none; color:black;" href="../shop/Shop_ClientProductView.do?shop_no=${shoplist.shopVo.shop_no }">${shoplist.shopVo.shop_name }</a></h5>
									    <p class="card-text"><i class="bi bi-brightness-alt-high" style="color:green;">가게 소개</i><br> ${shoplist.shopVo.shop_content }</p>
									  </div>
									  <div class="card-footer" style="background-color:transparent;">
									    
									    <div><i class="bi bi-people-fill"></i> 판매자: ${shoplist.memberVo.member_name }</div>
										</div>
									
										</div>
									</div>
							</c:forEach>
								
							</div>
						</section>
						
						<section style="margin-top:-180px;">
							<div class="container my-3 py-2 text-start">
								<div class="row">
									<div class="col">
									<span style ="font-size:2em; font-weight: bold; "><i class="bi bi-cart-check-fill" style="color:#FF607F;"></i> NEW PRODUCT</span>
										<button type="button" onClick="location.href='../shop/Shop_Main.do'" class="btn btn-outline-success" style="margin-bottom: 14px; margin-left: 20px; align-self: end;">더보기</button>	
									</div>
									<div>
										<span style="font-size: 17px; color: gray; font-weight: bold;">Toy에 등록된 새로운 물품들입니다.</span>
										<hr align="center" style="border: solid 1px black; width: 100%;">
									</div>
								</div>
							</div>

							<div class="row" style="display: flex; justify-content: center;">
							
						<c:forEach items="${productlist }" var="productlist" end="2">
							<div class="col-3" style="align-self: center;width: 335px; height:530px; margin-top:0px;">
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
									    
									   <button class="btn-lg btn-info" onClick="location.href='../shop/Shop_BuyProduct.do?product_no=${productlist.toyProductVo.product_no }&&shop_no=${productlist.toyProductVo.shop_no }'" style="font-size:1rem; width: 250px; height:30px; margin-left:20px;padding: 0px 12px; background-color:transparent; color:#1AAB8A; border-radius: 10px;"><strong>상품구매</strong></button>
									  </div>
									
										</div>
									</div>
							</c:forEach>
							</div>
						</section>
							</div>
						</div>
						
						
				</div>
				<div class="col-2">
				
				</div>
			</div>
		</div>
		<footer>
			<div class="row mt-3">
				<img alt="" src="../resources/img/footer.png">
			</div>
		</footer>
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