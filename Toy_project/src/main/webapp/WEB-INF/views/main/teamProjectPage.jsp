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

<style type="text/css">
html{
	height: 100vh;
}

body {
	margin: 0;
	width: 100vw;
	padding: 0;
	height: 100vh;
	background-repeat: no-repeat;
	background-size: cover;
/* 	background: linear-gradient(to right, #d7d2cc 0%, #304352 100%); */
	background-image: linear-gradient(135deg, #f5f7fa 0%, #c3cfe2 100%);
	background-attachment: fixed;
}
#wrapper {
    position: relative;
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
    bottom: 0;
    width: 100%;
    height: 30px;
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

.page-item.active .page-link{
background: #9D9D9D;
color: #00000;
}
.page-link{
color:#000000;
}
.page-item.active .page-link{
border-color:#fff;
}

}

</style>


<script type="text/javascript">
    
    function createRoom() {
    	var url = "../project/room.do";

		var insertToDo = window.open(url, "popUp", "width=900,height=550,top=150, left=200");

	}
    
    function application(index) {
    	
    	var number1 = "room_no" + index;
    	var number2 = "member_no" + index;
    	
		var room_no = document.getElementById(number1).value;
		var member_no = document.getElementById(number2).value;
    	
    	var url = "../project/ApplicationPage.do?room_no="+room_no+"&member_no="+member_no;
    	
		var insertToDo = window.open(url, "popUp", "width=600,height=400,top=150, left=400");
	}
    
	function ss() {
		//setTimeout('location.reload()', 5000);
	}
	
</script>
</head>
<!-- body -->
<body onload="ss()">
	<div id="wrapper">
		<header>
			<nav class="navbar navbar-expand-lg navbar navbar-white bg-white" style="height: 80px; font-size: 21px;">
				<div class="container-fluid">
					<div class="col-1"></div>
					<div class="col" style="text-align: center; align-self: center;">
						<img alt="" src="../resources/img/Logo.png" onClick="location.href='../index/home.do'">
					</div>

					<div class="col-7">
						<div class="navbar-nav" id="xx">
							<a class="nav-link active" aria-current="page" href="../index/home.do" style="margin-left: 20px;">Home</a>
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
											<li><a class="dropdown-item" href="#">QnA</a></li>
											<li><a class="dropdown-item" href="../board/Tech_Html.do">SkillInformation</a></li>
											<li><a class="dropdown-item" href="#">Project Gallery</a></li>
										</ul>
									</li>
								</ul>
							</div>
							<a class="nav-link" href="../shop/Shop_Main.do" style="margin-left: 20px;">Shop</a>
							<a class="nav-link" href="../index/teamProjectPage.do"
								style="margin-left: 20px;">Team Project</a>
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
		<div class="container-fulid" id="container" style="height: auto;">
			<div class="row mt-3" >
				<div class="col-1"></div>
					<div class="col">
					
						<div class="row">
							<div class="col" style="align-self:center;">
								<span style ="font-size:2em; font-weight: bold; "><i class="bi bi-bar-chart-line-fill" style="color:red"></i> My Project</span>
							</div>
						</div>
						<div class="row mt-3">
						
						<c:forEach items="${myPro }" var="myPro">
							<c:if test="${myPro.status eq 'S' }">
						 	 <div class="col-sm-5"  style="align-self: center; ">
							    <div class="card" style="border-radius: 30px;">
							      <div class="card-body">
							        <h5 class="card-title"><i class="bi bi-laptop" style="color: green"></i> 프로젝트 : ${myPro.title }</h5>
							        <p class="card-text"><i class="bi bi-calendar-check"></i> <strong>프로젝트 기간 :</strong>  <fmt:formatDate var="startDate" value="${myPro.startDate }" /> 
										    <fmt:formatDate var="lastDate" value="${myPro.lastDate }" />
											${startDate } ~ ${lastDate } </p>
									<form action="../project/enterProject.do" method="post">
										<input type="hidden" name="room_no" value="${myPro.room_no }">
										<input type="hidden" name="member_no" value="${member_no }">
										<button class="btn-lg btn-secondary form-control"><strong>Move My Project</strong></button>
									</form>
							      </div>
							    </div>
							  </div>
							  </c:if>
						  </c:forEach>
						  
						</div>
					
						<div class="row mt-3">
							<div class="col" style="align-self:center;">
								<span style ="font-size:2em; font-weight: bold; "><i class="bi bi-gear-wide-connected" style="color: #1E90FF"></i> Project List</span>
							</div>
							 	<div class="col" style="align-self: center; text-align: center; margin: auto;">
									<form class="d-flex float-end" action="">
										<select class="form-select" aria-label="Default select example" style="margin-right: 10px; border-radius: 10px;" >
											<option selected>지역</option>
											<option value="1">서울</option>
											<option value="2">경기</option>
											<option value="3">부산</option>
										</select> 
										<select class="form-select" aria-label="Default select example" style="border-radius: 10px;">
											<option selected>기술</option>
											<option value="1">Java</option>
											<option value="2">Javascript</option>
											<option value="3">Html</option>
											<option value="3">Go</option>
											<option value="3">Python</option>
										</select>
									<button class="btn btn-secondary" style="margin-left: 10px; padding: 7px; color:#fff; border-radius: 10px;">Search</button>
								</form>
							</div>
						</div>
						<div class="row mt-4">
							<c:forEach items="${roomList }" var="roomList" varStatus="status">
								<c:if test="${roomList.roomVo.status eq 'S' }">
								<div class="col-3" style="align-self: center;">
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
										</c:if>
							</c:forEach>
						</div>
						<div class="row mt-4 mb-3" >
							<div class="col-2 mt-2"></div>
									<div class="col mt-2" >
										<nav aria-label="Page navigation example">
											<ul class="pagination" style="justify-content: center; color:#000000;">
												<li class="page-item"><a class="page-link" href="#" aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
												</a></li>
												<li class="page-item active"><a class="page-link" href="#">1</a></li>
												<li class="page-item"><a class="page-link" href="#">2</a></li>
												<li class="page-item"><a class="page-link" href="#">3</a></li>
												<li class="page-item"><a class="page-link" href="#">4</a></li>
												<li class="page-item"><a class="page-link" href="#">5</a></li>
												<li class="page-item"><a class="page-link" href="#" aria-label="Next"> <span aria-hidden="true">&raquo;</span>
												</a></li>
											</ul>
										</nav>
									</div>
							
							
							<div class="col-2 mt-2" style="align-self: center; text-align: center; margin: auto;">
								<form class="d-flex float-end">
									<button type="button" onclick="createRoom()" class="btn btn-light" style="border-radius: 10px;">방만들기</button>
								</form>
							</div>
						</div>
					</div>
				<div class="col-1"></div>
			</div>
			
			
			
			
			
			
			
			
			
			
		</div>
		<footer>
			<div class="row mt-3" style="padding: 0px;">
				<img alt="" src="../resources/img/footer.png" style="padding: 0px 0px 0px 0px;">
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