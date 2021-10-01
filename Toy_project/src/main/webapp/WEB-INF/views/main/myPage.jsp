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
/* 	background-image: linear-gradient(120deg, #fdfbfb 0%, #ebedee 100%); */
	/* 	background: linear-gradient(45deg, #fff, white 10%, #1E90FF); */
	background-attachment: fixed;
	/* 추가한것 */
	 color: #555;
/* 	 background: #eeeeee; */
	 box-sizing: border-box;
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
	height: 100%;
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
/* 마이페이지 추가 */
      
      .mymain {
	width: 1000px;
	min-height: 500px;
	max-width: 1500px;
          padding: 50px;
          margin: 0 auto;
          background: #ffffff;}

      section {
          display: none;
          padding: 20px 0 0;
          border-top: 1px solid #ddd;}
 /*라디오버튼 숨김*/
 	input {
	      display: none;}
	label {
	    display: inline-block;
	    margin: 0 0 -1px;
	    padding: 15px 25px;
	    font-weight: 600;
	    text-align: center;
	    color: #bbb;
	    border: 1px solid transparent;}
	
	label:hover {
	    color: #2e9cdf;
	    cursor: pointer;}
	
	/*input 클릭시, label 스타일*/
	input:checked + label {
	      color: #555;
	      border: 1px solid #ddd;
	      border-top: 2px solid #2e9cdf;
	      border-bottom: 1px solid #ffffff;}
	
	#tab1:checked ~ #content1,
	#tab2:checked ~ #content2,
	#tab3:checked ~ #content3,
	#tab4:checked ~ #content4, 
#tab5:checked ~ #content5 {
          display: block;}
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
			<div class="row ">
				  <div class="col-2" style="padding-left: 20px; margin-right: 10px;"> 
		            <div class="row">
		            <div class="col">
			            <div class="card border-success mb-3" style="max-width: 14.5rem; align-self: center;">
						  <div class="card-header bg-transparent border-dark" style="font-size: 1rem;"><strong>${sessionUser.member_id }</strong></div>
							  <div class="card-body text-dark">
							    <p class="card-text"><i class="bi bi-person-bounding-box"></i> 닉네임: <strong>${sessionUser.member_name }</strong></p>
							    <p class="card-text"><i class="bi bi-chat-dots-fill"></i> 쪽지: <span style="color:green;">${newcount}</span></p>
							    <p class="card-text"><i class="bi bi-cash-coin"></i> 코인: <span style="color:green;">9999</span></p>
							  </div>
							  <div class="card" style="margin-bottom: 10px">
								  <ul class="list-group list-group-flush">
								    <li class="list-group-item"><a href="../message/messageList.do?member_name=${sessionUser.member_id }" style="color:#000000;">쪽지함</a></li>
								    <li class="list-group-item"><a href="" style="color:#000000;">구매내역</a></li>
								    <li class="list-group-item"><a href="" style="color:#000000;">장바구니</a></li>
								    <li class="list-group-item"><a href="" style="color:#000000;">Shop Management</a></li>
								    <li class="list-group-item"><a href="" style="color:#000000;">마이페이지</a></li>
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
							    <a class="nav-link btn btn-outline-success" style="text-align: start;" href="#"><i class="bi bi-filter-left"></i> Free Board</a>
							  </li>
							  <li class="nav-item" style="margin-bottom: 5px;">
							    <a class="nav-link btn btn-outline-success" style="text-align: start;" href="../board/QnAList.do"><i class="bi bi-sliders"></i> QnA</a>
							  </li>
							  <li class="nav-item" style="margin-bottom: 5px;">
							    <a class="nav-link btn btn-outline-success" style="text-align: start;" href="../board/Tech_Html.do"><i class="bi bi-tools" style="color: #1E90FF"></i> Skill Information</a>
							  </li>
							  <li class="nav-item" style="margin-bottom: 5px;">
							    <a class="nav-link btn btn-outline-success" style="text-align: start;" href="#"><i class="bi bi-images" ></i> Project Gallery</a>
							  </li>
							    <li class="nav-item" style="margin-bottom: 5px;">
							    <a class="nav-link btn btn-outline-success" style="text-align: start;" href="#"><i class="bi bi-cart-check-fill" style="color:#FF607F;"></i> Toy Shop</a>
							  </li>
							</ul>						
						</div>	            	
	            	</div>
        	    </div>
                <!-- 마이페이지-->
				<div class="col">
					<div class="row ">
						<div class="col bi bi-person-circle fa-5x" style="text-align: center;">
                            
                        </div>
							
                    <div class="row mt-3">
                        <div class="col" style="display: inline-block; text-align: center; color: black">
							<h3><strong>${sessionUser.member_id }</strong></h3>
						</div>
                    </div>
                    <div class="row" style="padding: 0px;">
                        <div class="col -2" style="text-align: center;">
                        <button type="button" class="btn" data-bs-toggle="modal"
							data-bs-target="#change"><strong> 비밀번호 변경 </strong> <img src="../resources/img/my.png" alt="" style="width: 20px;"> </button>
						<button type="button" class="btn" data-bs-toggle="modal"
							data-bs-target="#memberexit"><strong> 회원 탈퇴 </strong> <img src="../resources/img/my.png" alt="" style="width: 20px;"> </button>
                        </div>
                        <!-- Modal 비밀번호 변경-->
							<div class="modal fade" id="change"
                            data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1"
                            aria-labelledby="staticBackdropLabel" aria-hidden="true">
                            <div class="modal-dialog">
                                <div class="modal-content">
                                    <div class="modal-header" >
                                        <h3 class="fw-bold" style="color:green;">비밀번호 변경 </h3>
                                        <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                                    </div>
                                    <div class="modal-body">
                                        <div class="col">
                                            <input type="hidden" name ="member_send_name" value="${sessionUser.member_id }">
                                                <span class="fw-bold"style="margin: 0 0 10px 0 ;">이메일 : ${sessionUser.member_id }</span>
                                                
                                        </div>
                                        <hr>
                                        <div class="col">
                                            <input type="hidden" name ="change_member_pw" value="${sessionUser.member_id }">
                                            <span class="fw-bold"style="margin: 0 0 10px 0 ;">현재 비밀번호 확인</span>
                                            <input type="text" id="idTitle" name="member_receive_name" class="form-control" aria-label="Sizing example input"
                                           aria-describedby="inputGroup-sizing-default" value=""> 
                                        </div>
                                        <div class="col mt-3">
                                            <input type="hidden" name ="change_member_pwre" value="${sessionUser.member_id }">
                                            <span class="fw-bold"style="margin: 0 0 10px 0 ;">새 비밀번호</span>
                                            <input type="text" id="idTitle" name="member_receive_name" class="form-control" aria-label="Sizing example input"
                                           aria-describedby="inputGroup-sizing-default" value=""> 
                                        </div>
                                       
                                            <div class="col mt-3">
                                            <input type="hidden" name ="change_member_pwre" value="${sessionUser.member_id }">
                                            <span class="fw-bold"style="margin: 0 0 10px 0 ;">새 비밀번호 확인</span>
                                            <input type="text" id="idTitle" name="member_receive_name" class="form-control" aria-label="Sizing example input"
                                           aria-describedby="inputGroup-sizing-default" value=""> 
                                      
                                        </div>
                                       
                                        <div class="col">
                                            
                                        </div>
                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-primary"
                                        data-bs-dismiss="modal">변경</button>
                                        <button type="button" class="btn btn-dark"
                                        data-bs-dismiss="modal">Close</button>

                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="modal fade" id="memberexit"
                            data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1"
                            aria-labelledby="staticBackdropLabel" aria-hidden="true">
                            <div class="modal-dialog">
                                <div class="modal-content">
                                    <div class="modal-header" >
                                        <h3 class="fw-bold" style="color:green;">회원 탈퇴 확인 </h3>
                                        <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                                    </div>
                                    <div class="modal-body">
                                        <div class="col">
                                            <input type="hidden" name ="member_send_name" value="${sessionUser.member_id }">
                                                <span class="fw-bold"style="margin: 0 0 10px 0 ;">이메일 : ${sessionUser.member_id }</span>
                                                
                                        </div>
                                        <hr>
                                        <div class="col">
                                            <input type="hidden" name ="change_member_pw" value="${sessionUser.member_id }">
                                            <span class="fw-bold"style="margin: 0 0 10px 0 ;">현재 비밀번호</span>
                                            <input type="text" id="idTitle" name="member_receive_name" class="form-control" aria-label="Sizing example input"
                                           aria-describedby="inputGroup-sizing-default" value=""> 
                                        </div>
                                        
                                       
                                        <div class="col">
                                            
                                        </div>
                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-danger"
                                        data-bs-dismiss="modal">탈퇴</button>
                                        <button type="button" class="btn btn-dark"
                                        data-bs-dismiss="modal">Close</button>

                                    </div>
                                </div>
                            </div>
                        </div>
                        
                    </div>
                    <div class="row mt-5">
							<div class="col-1"></div>
							<div class="mymain" style="padding-top: 5px;">
								<input id="tab1" type="radio" name="tabs" checked> <!--디폴트 메뉴-->
								<label for="tab1" style="width:18%;"><img src="../resources/img/buylist.png" alt="" style="width: 15px;"> 구매 내역</label>
							
								<input id="tab2" type="radio" name="tabs">
								<label for="tab2"style="width: 18%;"><img src="../resources/img/send.png" alt="" style="width: 15px;"> 보낸 메시지</label>
							
								<input id="tab3" type="radio" name="tabs">
								<label for="tab3"style="width: 18%;"><img src="../resources/img/receive.png" alt="" style="width: 15px;"> 받은 메시지</label>
							
								<input id="tab4" type="radio" name="tabs">
								<label for="tab4"style="width: 19%;"><img src="../resources/img/project.png" alt="" style="width: 15px;"> MY Project</label>

								<input id="tab5" type="radio" name="tabs">
								<label for="tab5"style="width: 24.5%;"><img src="../resources/img/shop.png" alt="" style="width: 15px;"> Shop Management</label>
							
								<section id="content1">
								<div class="row" style="min-height: 400px;" >
				                 		  <table class="table">
											  <thead>
											  <tr style="text-align: center;">
											      <th scope="col">NO</th>
											      <th scope="col">구매 품목</th>
											      <th scope="col">수량</th>
											      <th scope="col">금액</th>
											    </tr>
											  </thead>
											  <tbody>
											 <tr style="text-align: center;">
											      <th scope="row">1</th>
											      <td>키보드</td>
											      <td>2</td>
											      <td>30,000</td>
											    </tr>
											    
											  </tbody>
											</table>
                              	 </div>
                              	 <div class="row">
                              	 <div class="col">
				                    <a href="#"><button type="button" class="btn btn-dark" style="float: right;">전체 보기</button></a>
                              	 </div>
                              	 </div>
								</section>
							
								<section id="content2">
								<div class="row" style="min-height: 400px;">
				                 		<table class="table">
											  <thead>
											   	 <tr style="text-align: center;">
											      <th scope="col">NO</th>
											      <th scope="col">받는 사람</th>
											      <th scope="col">제목</th>
											      <th scope="col">날짜</th>
											      <th scope="col">확인</th>
											    </tr>
											  </thead>
											  <tbody>
											  	 <tr style="text-align: center;">
											      <th scope="row">1</th>
											      <td>o@naver.com</td>
											      <td>안부인사</td>
											      <td>2021.09.18</td>
											      <td>X</td>
											    </tr>
											    
											  </tbody>
											</table>
                              	 </div>
                              	 <div class="row">
                              	 <div class="col">
				                    <a href="../message/sendMessageList.do?member_name=${sessionUser.member_id }"><button type="button" class="btn btn-dark" style="float: right;">전체 보기</button></a>
                              	 </div>
                              	 </div>
								</section>
							
								<section id="content3">
								 <div class="row" style="min-height: 400px;">
				                 		 <table class="table">
											  <thead>
												 <tr style="text-align: center;">
											      <th scope="col">NO</th>
											      <th scope="col">보낸 사람</th>
											      <th scope="col">제목</th>
											      <th scope="col">날짜</th>
											    </tr>
											  </thead>
											  <tbody>
											   	 <tr style="text-align: center;">
											      <th scope="row">1</th>
											      <td>o@naver.com</td>
											      <td>안부인사</td>
											      <td>2021.09.18</td>
											    </tr>
											    
											  </tbody>
											</table>
                              	 </div>
                              	 <div class="row">
                              	 <div class="col">
				                    <a href="../message/messageList.do?member_name=${sessionUser.member_id }"><button type="button" class="btn btn-dark" style="float: right;">전체 보기</button></a>
                              	 </div>
                              	 </div>
								</section>
							
								<section id="content4">
									<div class="row" style="min-height: 400px;">
									<table class="table">
											  <thead>
											 	 <tr style="text-align: center;">
											      <th scope="col">NO</th>
											      <th scope="col">프로젝트명</th>
											      <th scope="col">참여일</th>
											      <th scope="col">역할</th>
											    </tr>
											  </thead>
											  <tbody>
											 	 <tr style="text-align: center;">
											      <th scope="row">1</th>
											      <td>toy project</td>
											      <td>2021.09.18</td>
											      <td>리더</td>
											    </tr>
											  </tbody>
											</table>
                              	 </div>
                              	 <div class="row">
                              	 <div class="col">
				                    <a href="#"><button type="button" class="btn btn-dark" style="float: right;">전체 보기</button></a>
                              	 </div>
                              	 </div>
								</section>

								<section id="content5">
									<div class="row" style="min-height: 400px;">
				                 		<table class="table">
											  <thead>
											  	 <tr style="text-align: center;">
											      <th scope="col">NO</th>
											      <th scope="col">Shop Management</th>
											      <th scope="col">날짜</th>
											    </tr>
											  </thead>
											  <tbody>
											  	 <tr style="text-align: center;">
											      <th scope="row">1</th>
											      <td>toy project</td>
											      <td>2021.09.18</td>
											    </tr>
											  </tbody>
											</table>
                              	 </div>
                              	 <div class="row">
                              	 <div class="col">
				                    <a href="#"><button type="button" class="btn btn-dark" style="float: right;">전체 보기</button></a>
                              	 </div>
                              	 </div>
								</section>
							
							</div>
						</div>
	                    
	                    
					</div>
				</div>
				<div class="col-2"></div>
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