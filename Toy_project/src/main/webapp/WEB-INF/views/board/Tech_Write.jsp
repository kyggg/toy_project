<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
	padding: 0;
	height: 100vh;
	background-repeat: no-repeat;
	background-size: cover;
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
background: green;
color: #00000;
}
.page-link{
color:#000000;
}
.page-item.active .page-link{
border-color:#fff;
}

#backimg{
	position:relative;
    z-index:1;
}
#backimg:after{
	background-image: urL(../resources/img/skill.jpeg);
	top:0;
    left:0;
    position:absolute;
    background-size:100%;
    opacity:0.9!important;
    filter:alpha(opacity=50);
    z-index:-1;
    content:"";
    width:100%;
    height:100%;
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
						<img alt="" src="../resources/img/Logo.png" onClick="location.href='../index/home.do'">
					</div>

					<div class="col-7">
						<div class="navbar-nav" id="xx">
							<a class="nav-link active" aria-current="page" href="../index/home.do"
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
											<li><a class="dropdown-item" href="#">Free Board</a></li>
											<li><a class="dropdown-item" href="../board/QnAList.do">QnA</a></li>
											<li><a class="dropdown-item" href="../board/Tech_Html.do">Skill	Information</a></li>
											<li><a class="dropdown-item" href="#">Project
													Gallery</a></li>
										</ul></li>
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
		<div class="container-fulid" id="container">
			  <div class="row">
            <!--메인 로우임 건들지마셈-->

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
                <div class="row" style="height: 120px;" id="backimg">
                    <div class="col" style="text-align: center; align-self: center;">
                        <h1 style="color:#ffffff; "><strong>Skill Information</strong></h1>
                    </div>
                </div>
                 <div class="row mt-3 mb-3">
				    <form id="writeForm" action="./techWriteContentProcess.do" method="post" enctype="multipart/form-data">
		                    <div class="row">
		                        <div class="col">
		                            <div class="input-group mb-3">
		                                <span class="input-group-text" id="inputGroup-sizing-default">이름</span>
		                                <span class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default" style="text-align: center">${sessionUser.member_name }</span>
		                            </div>
		                        </div>
		                        <div class="col">
		                            <select name ="skill_category_no" class="form-select" aria-label="Default select example">
		                                <option selected>카테고리</option>
		                        			<c:forEach items="${categoryList }" var="categoryList">
		                                		<option value="${categoryList.skill_category_no }">${categoryList.skill_category_name }</option>
		                          			 </c:forEach>
		                            </select>
		                        </div>
		                    </div>
		                    <div class="row">
		                        <div class="col">
		                            <div class="input-group mb-3">
		                                <span class="input-group-text" id="inputGroup-sizing-default">제목</span>
		                                <input type="text" id="idTitle" name="tech_title" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default">
		                            </div>
		                        </div>
		                    </div>
		                    <div class="row">
		                        <div class="col">
		                            <div class="form-floating">
		                                <textarea class="form-control" id="idContent" name="tech_content" placeholder="Leave a comment here" style="height: 400px"></textarea>
		                                <label for="floatingTextarea2"></label>
		                            </div>
		                        </div>
		                    </div>
		                    <div class="row">
		                        <div class="col">
		                            <div class="input-group mt-3">
		                                <input type="file" name="tech_files" class="form-control" accept="image/*" multiple  aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default">
		                            </div>
		                        </div>
		                    </div>
		                    <div class="row">
		                        <div class="form-col mt-3" style="text-align:end;">
		                            <a href="./Tech_Html.do"><button type="button" class="btn btn-success" style="border-radius:5px;">목록</button></a>
		                            <input type="submit" class="btn btn-success" value="작성" style="border-radius:5px; margin-left: 10px;width: 100px; ">
		                        </div>
		                    </div>
		                </form>
              </div>
            </div>
            <div class="col-2">
              <div class="col">
           			 <img alt="" src="../resources/img/ad1.jpg" style="margin-bottom: 50px;">
           		 </div>
           		   <div class="col">
           			 <img alt="" src="../resources/img/ad2.jpg" >
           		 </div>
            </div>
        </div>
		</div>
		<footer>
			<div class="row mt-3">
				<img alt="" src="../resources/img/2.png">
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