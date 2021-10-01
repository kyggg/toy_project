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
	background-attachment: fixed;
}

#wrapper {
	position: absolute;
	width: 100%;
	height: 100%;
}

header {
	background-color: #ffffff;
}

#container {
	padding: 20px;
	height: 80%;
}

footer {
	position: relative;
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
											<li><a class="dropdown-item" href="../board/QnAList.do">QnA</a></li>
											<li><a class="dropdown-item" href="../board/Tech_Html.do">Skill	Information</a></li>
											<li><a class="dropdown-item" href="#">Project Gallery</a></li>
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
							<span class="rounded-pill badge bg-success">닉네임</span>
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
	            
	           <div class="col-8">
	         	<div class="row mt-3">
	         		<div class="col" style="text-align: center;">
						<a class="btn btn-outline-secondary btn-lg" href="./messageList.do?member_name=${sessionUser.member_id }" role="button" id="menu" style="margin-left: 20px;"><strong> 받은 메시지</strong></a>
						<a class="btn btn-outline-secondary btn-lg" href="./sendMessageList.do?member_name=${sessionUser.member_id }" role="button" id="menu" style="margin-left: 20px;"><strong> 보낸 메시지</strong></a> 
					</div>
	         	</div>
	           
                <div class="row mt-3" id="backimg">
                    <div class="col" style="text-align: center; align-self: center;">
                        <h1 style="color:#000000; "><strong>Read Send Message</strong></h1>
                    </div>
                </div>
             
                <div class="row mt-3">
                    <div class="card w-95">
					  <div class="card-body">
				              <input type="hidden" name="message_no" value="${content.messageVo.message_no }">
							  <input type="hidden" name="member_no" value="${sessionUser.member_no }">
						    <h5 class="card-title"> 	&nbsp;받는사람: ${content.messageVo.member_receive_name }</h5>
						    <div class="col mt-3">
						     <h5 class="card-title"> 	&nbsp;제목: ${content.messageVo.message_title}</h5>
						     </div>
						     <div class="col mt-4">
						 	 <div class="card">
								  <div class="card-header"> 내용</div>
								  <div class="card-body">
								    <blockquote class="blockquote mb-0"><p>${content.messageVo.message_content}</p></blockquote>
							  </div>
							</div>	
							</div>
					       <div class="form-col mt-3" style="text-align:end; padding :0px;">
                              <a href="./deletesendMessageProcess.do?message_no=${content.messageVo.message_no }"><button type="button" class="btn btn-danger" style="border-radius:5px; margin-left: 10px; width: 100px;">삭제</button></a>
                               <a href="./sendMessageList.do?member_name=${sessionUser.member_id }"><button type="button" class="btn btn-secondary" style="border-radius:5px; color: white; margin-left: 10px; width: 100px;">목록</button></a>
                           </div>
					 	 </div>
					</div>
              </div>
            </div>
        	<div class="col" style="align-self: center; text-align: center; height: auto; margin-top: -5.5px;">
            	<div class="row">
					<div class="col">            
	            		<img alt="" src="../resources/img/Ad.jpeg">
	            	</div>
            	</div>
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