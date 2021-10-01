<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">

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
        .hideTable{
			display: none;
		}
		.progress-bar{
			background-color: #A45D5D;
		}
		
		hr{
			color:#444444;
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
    
	    
	<style>
	#xx {
		text-align: center;
		justify-content: center;
	}
	
	li ul li:hover {
		color: #00C473;
	}
		
	.modal-title{
		font-size: 40px;
	}
	.title{
		font-size:16px;
		color: gray;
		margin-bottom: 0;
	}
	
	.content{
		font-size:16px;
		color: gray;
		margin-bottom: 10px;
	}
	.title-box{
		width: 452px;
		border: 0;
		border-bottom: 1px solid rgba(0,0,0,0.2);
		margin-bottom: 10px;
	}
	
	.content-box{
		border: 1px solid rgba(0,0,0,0.2);
		width: 452px;
		height: 450px;
		padding: 14px
	}
	
	.write-box:focus-visible{
		outline: none;
	}
	.content-link{
		color: black;
		text-decoration: none;
	}
	.content-link:hover{
		color: black;
		cursor: pointer;
	}
	
	.modal-content{
/* 		background-color: #faebd7; */
	}
	
	.modal-header{
		border-bottom: 0;
	}
	
	.subtitle-box-title{
		text-align: left;
		font-size: 18px;
		font-family: 'Open Sans', sans-serif;
		color: darkred;
	}
	
	.detailBoard-title-box{
		text-align: center;
		margin-bottom: 10px;
	}
	
	.detailBoard-content-box{
		text-align: left;
	}
	.bi-pen{
		font-size: 15px;
		color: rgba(0,0,0,0.6);
		margin-left: 10px;
		cursor: pointer;
	}
	
	.bi-pen:hover{
		color: rgba(0,0,0,1);
	}
	.bi-x{
		font-size: 17px;
		color: rgba(0,0,0,0.6);
		margin-left: 5px;
		cursor: pointer;
	}
	
	.bi-x:hover{
		color: rgba(0,0,0,1);
	}
	</style>

<script type="text/javascript">
	function detailBoard(boardNo) {
		
		//AJAX API 사용....
		var xmlhttp = new XMLHttpRequest();
		
		//서버에서 응답 후 처리 로직.
		xmlhttp.onreadystatechange = function(){
			if(xmlhttp.readyState==4 && xmlhttp.status==200){
				var data = JSON.parse(xmlhttp.responseText)
				
				var boardTitle = document.getElementById("detailBoardLabel");
				boardTitle.innerText = data.readDetailBoard.title;
				
				var boardWriter = document.getElementById("boardWriter");
				boardWriter.innerText = data.memberName.member_name;
				
				var boardContent = document.getElementById("boardContent");
				boardContent.innerText = data.readDetailBoard.content;
				
				
			}
		};
		

		xmlhttp.open("get" , "./readDetailBoardProcess.do?board_no=" + boardNo); 
		xmlhttp.send();
		
	}
	
	function updateAndDeleteDisplay(e,boardNo) {
		
		var updateIcon = document.createElement("i")
		updateIcon.setAttribute("class","bi bi-pen")	
		updateIcon.setAttribute("onclick","updateBoard(this ,"+boardNo+")")
		
		var deleteIcon = document.createElement("i");
		deleteIcon.setAttribute("class","bi bi-x")
		deleteIcon.setAttribute("onclick","deleteBoard(this ,"+boardNo+")")
		
		e.appendChild(updateIcon)
		e.appendChild(deleteIcon)
		

	}
	
	function updateAndDeleteHide(e) {
		e.removeChild(e.lastElementChild)
		e.removeChild(e.lastElementChild)		
	}
	
	function updateBoard(e, boardNo) {
		alert("시간 남으면 하기")
	}
	
	function deleteBoard(e, boardNo) {
		
		//AJAX API 사용....
		var xmlhttp = new XMLHttpRequest();
		
		//서버에서 응답 후 처리 로직.
		xmlhttp.onreadystatechange = function(){
			if(xmlhttp.readyState==4 && xmlhttp.status==200){
				e.parentElement.parentElement.remove();
			}
		};
		
		xmlhttp.open("get" , "./deleteDetailBoardProcess.do?board_no=" + boardNo); 
		xmlhttp.send();
	}
</script>

</head>


<body>
    <div id="wrapper">
        <nav class="col-sm-6 sidenav" style="border-right:1px solid #BBBBBB; position: absolute;">
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
        <!-- NAV 끝 -->
        <div class="container-fulid" id="container">
            <div class="row">
          	  <div class="col-1" style="align-self: center;"></div>
            <div class="col">
                <div class="row" style="height: 100px;">
                    <div class="col" style="text-align: center; align-self: center;">
                        <h1><i class="bi bi-view-list" style="color:green;"></i> ${ca_name }</h1>
                    </div>
                </div>
                <div class="row mt-3 mb-3">
                    <div class="col">
                        <form class="d-flex float-end" action="" method="get">
                        	<select name="search_type" class="btn btn-outline-secondary">
								<option value="name" selected>작성자</option>
								<option value="title">제목</option>
								<option value="content">작성일</option>
							</select>
							<input name="search_word" type="search" placeholder="Search" aria-label="Search" style="margin-left: 10px;">
                            <input class="btn btn-success" type="submit" value ="검색" style="margin-left: 5px;">
                        </form>
                    </div>
                </div>
                <div class="row">
                    <div class="col">
                        <table class="table table-hover">
                            <thead>
                                <tr style="text-align: center;">
                                    <th scope="col" style="width: 10%;">NO</th>
                                    <th scope="col" style="width: 20%;">작성자</th>
                                    <th scope="col" style="width: 50%;">제목</th>
                                    <th scope="col" style="width: 20%;">작성일</th>
                                </tr>
                            </thead>
                            <tbody style="text-align: center;">
                            <c:forEach items="${selectProjectBoard }" var="projectBoard">
                                <tr>
                                    <th scope="row">${projectBoard.boardList.board_no}</th>
                                    <td>${projectBoard.memberVo.member_name }</td>
                                    <td onmouseenter="updateAndDeleteDisplay(this,${projectBoard.boardList.board_no})" onmouseleave="updateAndDeleteHide(this)"><a class="content-link" data-bs-toggle="modal" data-bs-target="#detailBoard" onclick="detailBoard(${projectBoard.boardList.board_no})">${projectBoard.boardList.title}</a></td>
                                    <td><fmt:formatDate value="${projectBoard.boardList.content_date}" pattern="yyyy-MM-dd"/></td>
                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>
                <div class="row mt-2">
                    <div class="col-2 mt-2"></div>
                    <div class="col mt-2">
                        <nav aria-label="Page navigation example">
                            <ul class="pagination" style="justify-content: center;">
                                <li class="page-item">
                                    <a class="page-link" href="#" aria-label="Previous">
                                        <span aria-hidden="true">&laquo;</span>
                                    </a>
                                </li>
                                <li class="page-item active"><a class="page-link" href="#">1</a></li>
                                <li class="page-item"><a class="page-link" href="#">2</a></li>
                                <li class="page-item"><a class="page-link" href="#">3</a></li>
                                <li class="page-item"><a class="page-link" href="#">4</a></li>
                                <li class="page-item"><a class="page-link" href="#">5</a></li>
                                <li class="page-item">
                                    <a class="page-link" href="#" aria-label="Next">
                                        <span aria-hidden="true">&raquo;</span>
                                    </a>
                                </li>
                            </ul>
                        </nav>
                    </div>
                    <!-- Button trigger modal -->
                     <div class="col-2 mt-2" style="align-self: center; text-align: end; margin: auto;">
                    	<button type="button" class="btn btn-success" style="border-radius:10px;" data-bs-toggle="modal" data-bs-target="#writeBoard">글쓰기</button>
                    </div>
                    <!-- Modal -->
					<div class="modal fade" id="writeBoard" tabindex="-1" aria-labelledby="writeBoardLabel" aria-hidden="true">
					  <div class="modal-dialog">
					    <div class="modal-content">
					      <div class="modal-header">
					       <h4 class="modal-title" id="exampleModalLabel"> <i class="bi bi-pencil-square" style="color:green;"></i> 게시글 등록</h4>
					        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
					      </div>
					      <div class="modal-body">
							 <div class="col">
								<form action="./insertProjectBoardProcess.do" method="POST" accept-charset="utf-8">
									 <input type="hidden" name="room_no" value="${room_no }">
									 <input type="hidden" name="ca_name" value="${ca_name }">
								    <div class="row">
										<div class="col">
											<div class="row">
						            			<div class="col">
							                		<h5 class="title">제목</h5>
									            </div>
									        </div>
									        <div class="row" style="margin-bottom: 10px;">
								            	<div class="col">
								            	    <input type="hidden" name="member_no" value="${sessionUser.member_no }">
				                 				    <input type="hidden" name="category_no" value="${category_no }">
							                		<input name="title" class="write-box title-box" type="text">
								            	</div>
									        </div>
									    </div>
									</div>
									<div class="row">
										<div class="col">
									    	<div class="row">
									        	<div class="col">
									            	<h5 class="content">내용</h5>
										        </div>
										    </div>
										    <div class="row">
										        <div class="col">
										            <textarea name="content" class="write-box content-box"></textarea>
										        </div>
										    </div>
										</div>
									</div>
								    <div class="row">
				                       <div class="form-col mt-3" style="align-self: end; text-align: center; margin: auto;">
				                            <button class="btn btn-success" style="border-radius:5px; width: 200px;">작성</button>
				                       </div>
				                   </div>
				          
								</form>
							 </div>
					      </div>
					    </div>
					  </div>
					</div>
                </div>
            </div>
            <div class="col-1"></div>
            
            <!-- Modal -->
			<div class="modal fade" id="detailBoard" tabindex="-1" aria-labelledby="detailBoardLabel" aria-hidden="true">
			  <div class="modal-dialog">
			    <div class="modal-content">
			      <div class="modal-header">
								      	
			        <h6 class="modal-title" style="font-size: xx-large; font-weight: bold;">제목: &nbsp;</h6>
			        <h6 class="modal-title" id="detailBoardLabel" style="font-size: xx-large;"></h6>
			        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
			      </div>
			      <div class="modal-body">
					<div class="row detailBoard-title-box">
					  <div class="col-2" style="align-self: center; text-align: center; margin: auto;">작성자:</div>
					   <div class="col subtitle-box-title" id="boardWriter">
					   </div>
					</div>
					<div class="row detailBoard-content-box">
					 <div class="col-2" style="align-self: center; text-align: center; margin: auto;"> 내용:</div>
					   <div class="col" id="boardContent">
					   </div>
					</div>
			      </div>
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
    <!-- Javascript files-->
    <script src="../resources/js/jquery.min.js"></script>
    <script src="../resources/js/popper.min.js"></script>
    <script src="../resources/js/bootstrap.bundle.min.js"></script>
    <script src="../resources/js/jquery-3.0.0.min.js"></script>
    <script src="../resources/js/plugin.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.bundle.min.js"></script>
  	<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest"></script>
     <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js"></script>
             <!-- JavaScript Bundle with Popper -->
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.bundle.min.js"></script>
</body>

</html>