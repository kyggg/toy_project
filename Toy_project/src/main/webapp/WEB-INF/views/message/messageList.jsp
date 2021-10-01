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
.hideTable{
	display: none;
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
						<a class="btn btn-outline-secondary btn-lg" role="button" id="menu"  data-bs-toggle="modal" data-bs-target="#messageModal"style="margin-left: 20px;"><strong> 메시지 작성</strong></a>
					</div>
	         	</div>
	           
                <div class="row mt-3" style="height: 100px;" id="backimg">
                    <div class="col" style="text-align: center; align-self: center;">
                        <h1 style="color:#000000; "><strong>Received Message</strong></h1>
                    </div>
                </div>
             
                <div class="row">
                    <div class="col">
                       <table class="table">
						<thead>
							<tr style="text-align: center;">
								<th scope="col" style = "width: 10%"><strong>No</strong></th>
								<th scope="col" style = "width: 20%"><strong>보낸 사람</strong></th>
								<th scope="col" style = "width: 50%"><strong>제목</strong></th>
								<th scope="col" style = "width: 20%"><strong>날짜</strong></th>
							</tr>
						</thead>
						<tbody style="text-align: center;">
							<c:forEach items="${messageList }" var="message" varStatus="vs">
	                        	<c:set var="i" value="${i+1 }"/>
								<tr>
									<td>${i }</td>
									
									<td><a style="text-decoration:none; color:black;" class="dropdown" href="#" role="button" data-bs-toggle="dropdown" >${message.memberVo.member_name }</a>
										<ul class="dropdown-menu dropdown-menu-dark" aria-labelledby="navbarDarkDropdownMenuLink" style="background-color: #5B5A5A; border:1">
                                      		 <li><a class="dropdown-item" role="button" id="menu" data-bs-toggle="modal" data-bs-target="#messageModalre${vs.index }" style="margin: 0;"> 메시지 보내기</a></li>
                                 		</ul> 
									</td>
									
									<td><a style="text-decoration:none; color:black" href="./readMessage.do?message_no=${message.messageVo.message_no}" >${message.messageVo.message_title}</a></td>
									<td><fmt:formatDate value="${message.messageVo.message_writedate}" pattern="yyyy.MM.dd"/></td>
								</tr>
									<!-- 메시지 답장 모달창-->
									<div class="modal" id="messageModalre${vs.index }" data-bs-backdrop="static" style="text-align: left;">
							          <div class="modal-dialog">
							              <div class="modal-content">
							                  <div class="modal-header" style="background-color: #F0FFF0;">
							                      <h3 class="fw-bold">메시지 작성하기</h3>
							                      <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
							                  </div>
							                  <div class="modal-body" style="background-color: #fff;">
							                      <form id="writeForm" action="./writeMessageProcess.do" method="post" >
							                       <div style="margin-bottom: 10px;">
							                              <label class="fw-bold"style="margin: 0 0 10px 0 ;">받는사람 이름 </label>
							                              <input type="text" id="idTitle" class="form-control" aria-label="Sizing example input"
							                                               aria-describedby="inputGroup-sizing-default" value="${message.memberVo.member_name }"> 
							                          </div>
							                          <div>
							                           	<input type="hidden" name ="member_send_name" value="${sessionUser.member_id }">
							                              <label class="fw-bold"style="margin: 0 0 10px 0 ;">받는사람 이메일 </label>
							                              <input type="text" id="idTitle" name="member_receive_name" class="form-control" aria-label="Sizing example input"
							                                               aria-describedby="inputGroup-sizing-default" value="${message.messageVo.member_send_name }"> 
							                          </div>
							                          <div>
							                              <label class="fw-bold" style="margin: 10px 0 10px 0 ;">제목</label>
							                              <input type="text" id="idTitle" name="message_title" class="form-control" aria-label="Sizing example input"
							                                               aria-describedby="inputGroup-sizing-default">
													<input type="hidden" name="member_no" value="${sessionUser.member_no }">
							                          </div>
							                          <div>
							                              <label class="fw-bold" style="margin:10px 0 10px 0 ;">내용</label>
							                              <textarea class="form-control" name="message_content" rows="15" style="resize:none;"></textarea>
							                          </div>
							                          <button type="submit" class="btn btn-success"
							                          	style="border:0; float:right; margin-top: 10px;"><strong>보내기</strong></button>
							                          <button type="button" class="btn btn-success" data-bs-dismiss="modal"
							                              style="border:0; float:right; margin-top: 10px;  margin-right:10px;" data-bs-dismiss="modal" ><strong>취소하기</strong></button>
							                      </form>
							                  </div>
							              </div>
							          </div>
							      </div>
							</c:forEach>
						</tbody>
					</table>
                    </div>
                    <div class="row mt-2">
						<div class="col mt-2">
							<nav aria-label="Page navigation example">
								<ul class="pagination" style="justify-content: center;">
									<li class="page-item"><a class="page-link" href="#"
										aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
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
	
	<!-- 메시지 답장 모달창-->
	<div class="modal" id="messageModalre" data-bs-backdrop="static">
          <div class="modal-dialog">
              <div class="modal-content">
                  <div class="modal-header" style="background-color: #F0FFF0;">
                      <h3 class="fw-bold">메시지 작성하기</h3>
                      <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                  </div>
                  <div class="modal-body" style="background-color: #fff;">
                      <form id="writeForm" action="./writeMessageProcess.do" method="post" >
                          <div>
                           	<input type="hidden" name ="member_send_name" value="${sessionUser.member_id }">
                              <label class="fw-bold"style="margin: 0 0 10px 0 ;">받는사람 </label>
                              <input type="text" id="idTitle" name="member_receive_name" class="form-control" aria-label="Sizing example input"
                                               aria-describedby="inputGroup-sizing-default" value="${message.messageVo.member_send_name }"> 
                          </div>
                          <div>
                              <label class="fw-bold" style="margin: 10px 0 10px 0 ;">제목</label>
                              <input type="text" id="idTitle" name="message_title" class="form-control" aria-label="Sizing example input"
                                               aria-describedby="inputGroup-sizing-default">
						<input type="hidden" name="member_no" value="${sessionUser.member_no }">
                          </div>
                          <div>
                              <label class="fw-bold" style="margin:10px 0 10px 0 ;">내용</label>
                              <textarea class="form-control" name="message_content" rows="15" style="resize:none;"></textarea>
                          </div>
                          <button type="submit" class="btn btn-success"
                          	style="border:0; float:right; margin-top: 10px;"><strong>보내기</strong></button>
                          <button type="button" class="btn btn-success" data-bs-dismiss="modal"
                              style="border:0; float:right; margin-top: 10px;  margin-right:10px;" data-bs-dismiss="modal" ><strong>취소하기</strong></button>
                      </form>
                  </div>
              </div>
          </div>
      </div>
	
	
	
	
	<!-- modal -->
	<div class="modal" id="messageModal" data-bs-backdrop="static">
            	<div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header" style="background-color: #F0FFF0;">
                        <h3 class="fw-bold">메시지 작성하기</h3>
                        <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                    </div>
                    <div class="modal-body" style="background-color: #fff;">
                        <form id="writeForm" action="./writeMessageProcess.do" method="post" >
                            <div>
                             	<input type="hidden" name ="member_send_name" value="${sessionUser.member_id }">
                                <label class="fw-bold"style="margin: 0 0 10px 0 ;">받는사람</label>
                                <input type="text" id="idTitle" name="member_receive_name" class="form-control" aria-label="Sizing example input"
                                                 aria-describedby="inputGroup-sizing-default">
                            </div>
                            <div>
                                <label class="fw-bold" style="margin: 10px 0 10px 0 ;">제목</label>
                                <input type="text" id="idTitle" name="message_title" class="form-control" aria-label="Sizing example input"
                                                 aria-describedby="inputGroup-sizing-default">
                                        
								<input type="hidden" name="member_no" value="${sessionUser.member_no }">
                            </div>
                            <div>
                                <label class="fw-bold" style="margin:10px 0 10px 0 ;">내용</label>
                                <textarea class="form-control" name="message_content" rows="15" style="resize:none;"></textarea>
                            </div>
                            <button type="submit" class="btn btn-success"
                            	style="border:0; float:right; margin-top: 10px;"><strong>보내기</strong></button>
                            <button type="button" class="btn btn-success" data-bs-dismiss="modal"
                                style="border:0; float:right; margin-top: 10px;  margin-right:10px;" data-bs-dismiss="modal" ><strong>취소하기</strong></button>
                        </form>
                    </div>
                </div>
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