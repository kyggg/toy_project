<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <!-- basic -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <!-- mobile metas -->
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="viewport" content="initial-scale=1, maximum-scale=1">
    <!-- site metas -->
    <title>Toy Project</title>
      <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css">
		<link rel="stylesheet" href="../resources/css/projectTool.css">
    <style type="text/css">
        html {
            height: 100vh;
        }

        body {
            margin: 0;
            padding: 0;
            height: 100%;
            background-repeat: no-repeat;
            background-size: cover;
            background-blend-mode: normal, lighten, soft-light;
            background-attachment: fixed;
        }

        #wrapper {
            position: relative;
            min-height: 100%;
        }

        header {
            background-color: #ffffff;
        }

        #container {
            padding: 20px;
            height: auto;
            margin-left: 330px;
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
            color: #00C473;
        }

        a {
            text-decoration-line: none;
            color: #000000;
        }

        .nav-link {
            color: black;
        }

        .nav-link:hover {
            color: #00C473;
        }

        .sidenav {
            background:#fff;
            background-size: contain;
            position: fixed;
            width: 290px;
            height: 100%;
        }

        .sidenavli {
            list-style-type: none;
            text-transform: uppercase;
            font-weight: bold;
            flex-grow: 1;
            color: black;
        }
 
   .mymain {
	width: 1100px;
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
    <script type="text/javascript">
    function viewToDo(index) {
		
		var room_no = ${room_no};

		var number = "tdboard_no" + index;
		var tdboard_no = document.getElementById(number).value;

		var url = "./detailViewToDo.do?room_no="+room_no + "&tdboard_no=" + tdboard_no;
		
		var viewToDo = window.open(url, "popUp", "width=700,height=400,top=150, left=500");
		
	}
    
    function coviewToDo(index) {
		
		var room_no = ${room_no};

		var number = "tdboard_no_co" + index;
		var tdboard_no= document.getElementById(number).value;

		var url = "./detailViewToDo.do?room_no="+room_no + "&tdboard_no=" + tdboard_no;
		
		var viewToDo = window.open(url, "popUp", "width=700,height=400,top=150, left=500");
		
	}

    </script>

</head>

<body>
    <div id="wrapper">
        <nav class="col-sm-6 sidenav" style="border-right:1px solid #BBBBBB;position: absolute; ">
            <h5 style="padding-top: 20px; padding-left: 55px; font-weight:800;"><i class="bi bi-stack" style="color: #00C473;"></i> TOY PROJECT</h5>
            <hr>
           
            <div class="row">
                <div class="col-3" style="align-self: center; text-align: center; margin-left: 20px; margin-right: 10px;">
                    <i class="bi bi-person-bounding-box" style="font-size: 50px;"></i>
                </div>
                <div class="col" style="display:inline-grid; font-size: 0.8rem; padding: 0px; align-self: center ">
                    <span style="font-weight: bold;"><i class="bi bi-person-fill" style="color:#911F27"></i> ${sessionUser.member_name }</span> 
                    <span style="font-weight: bold; color: green;"><i class="bi bi-envelope"></i> ${sessionUser.member_id }</span>
                   	<c:choose>
						<c:when test="${sessionUser.member_no eq memberNoByRoomNo }">
							<i class="bi bi-award" style="color:red;"><strong>리더</strong></i>
						</c:when>
						<c:otherwise>
							<strong>팀원</strong>
						</c:otherwise>
					</c:choose>
                </div>
            </div>
            <hr>
           <ul class="sidenavli">
                <li><span style="font-weight:900; color: #acacac;"> Menu</span></li>
                <li style="margin-top: 10px; margin-bottom: 10px;"><a href="./coperate.do?room_no=${room_no }"><i class="bi bi-house-door"></i> Home</a></li>
                
                <li class="dropdown" style="margin-top: 10px; margin-bottom: 10px;">
                <a href="#board2" data-bs-toggle="collapse"><i class="bi bi-clipboard-data"></i> Board <i class="bi bi-arrow-down"></i></a>
                   <div class="collapse" id="board2">
                   <ul class="btn-toggle-nav list-unstyled fw-normal small">
                     <c:forEach items="${pbcCategory }" var="boardCategory">
                     <li><a class="nav-link" href="./projectBoardPage.do?category_no=${boardCategory.categoryVo.category_no }&ca_name=${boardCategory.categoryVo.ca_name }&room_no=${room_no}"> <i class="bi bi-clipboard-data">
                     </i> ${boardCategory.categoryVo.ca_name }</a></li>
                  </c:forEach> 
                   </ul>
                 </div>
                </li>

				<li class="dropdown" style="margin-top: 10px; margin-bottom: 10px;">
                   <a href="#channel" data-bs-toggle="collapse"><i class="bi bi-chat-dots-fill" style="color: #FFC93C;">
                      </i> <span>Chatting Room</span> <i class="bi bi-arrow-down"></i>
                   </a>
                     <div class="collapse" id="channel">
                       <ul class="btn-toggle-nav list-unstyled fw-normal small">
                        <c:forEach items="${selectChannel }" var="selectChannel">
                        <a class="nav-link" href="./chattingPage.do?channel_no=${selectChannel.channelVo.channel_no }&channel_name=${selectChannel.channelVo.channel_name }&room_no=${room_no}"> <i class="bi bi-chat-dots-fill" style="color: #FFC93C;">
                      </i> ${selectChannel.channelVo.channel_name }</a>
                     </c:forEach> 
                      </ul>
                 </div>
                </li>
            </ul>

            <ul class="sidenavli" style="margin-top: 30px;">
                <li><span style="font-weight:900; color: #acacac;">Plan</span></li>
                <li style="margin-top: 10px; margin-bottom: 10px;"><a href="./planPage.do?room_no=${room_no}"><i class="bi bi-bar-chart-line-fill" style="color: #911F27;"></i> To-Do</a></li>
                <li style="margin-top: 10px; margin-bottom: 10px;"><a href="./calendarPage.do?room_no=${room_no}"><i class="bi bi-calendar-check" style="color: #290FBA;"></i> Calendar</a></li>
            </ul>

            <ul class="sidenavli" style="margin-top: 30px;">
                <li><span style="font-weight:900; color: #acacac;">Information</span></li>
                <li style="margin-top: 10px; margin-bottom: 10px;"><a href="./projectMyPage.do?room_no=${room_no }&member_no=${sessionUser.member_no}"><i class="bi bi-info-square-fill"></i> My Page</a></li>
            </ul>

			<c:if test="${sessionUser.member_no eq memberNoByRoomNo }">
	            <ul class="sidenavli" style="margin-top: 30px;">
	                <li><span style="font-weight:900; color: #acacac;">Management</span></li>
	                <li style="margin-top: 10px; margin-bottom: 10px;"><a href="./boardManagement.do?room_no=${room_no }"><i class="bi bi-gear-wide-connected" style="color: #00C473;"></i> Project Management </a></li>
	            </ul>
            </c:if>
            <hr>
            <div class="col" id="sidebarFooter">
				<div class="row mt-3">
					<div class="col" style="align-self: center; text-align: center; margin: auto;">
			         	<a href="../index/home.do"><button type="button" class="btn btn-success" style="border-radius:5px; width: 250px">프로젝트 나가기</button></a>
					</div>
				</div>
            </div>
        </nav>
        <div class="container-fulid" id="container">
            <div class="row">
				<div class="col">
					<div class="row">
						<div class="col bi bi-person-circle fa-8x" style="text-align: center;font-size: -webkit-xxx-large;">
                            
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
							<div class="mymain" style="padding-top: 5px">
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
				<div class="col-4"></div>
            </div>
        </div>
        <footer>
            <div class="row mt-3">
                <img alt="" src="../resources/img/footer.png">
            </div>
        </footer>
    </div>
    
    
    

      
      
    <!-- Javascript files-->
    <script src="../resources/js/jquery.min.js"></script>
    <script src="../resources/js/popper.min.js"></script>
    <script src="../resources/js/bootstrap.bundle.min.js"></script>
    <script src="../resources/js/jquery-3.0.0.min.js"></script>
    <script src="../resources/js/plugin.js"></script>
        <!-- JavaScript Bundle with Popper -->
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.bundle.min.js"></script>
</body>

</html>