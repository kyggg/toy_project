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
	<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
	
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


<script type="text/javascript">
	var room_no = ${room_no};
	


	function insertToDo() {

		var url = "./insertToDo.do?room_no=" + room_no;

		var insertToDo = window.open(url, "popUp", "width=500,height=700,top=100, left=500");
		
	}

	function viewToDo(index) {
		
		var room_no = ${room_no};

		var number = "tdboard_no" + index;
		var tdboard_no = document.getElementById(number).innerText;

		var url = "./detailViewToDo.do?room_no="+room_no + "&tdboard_no=" + tdboard_no;
		
		var viewToDo = window.open(url, "popUp", "width=700,height=400,top=150, left=500");
		
	}
	
	google.charts.load('current', {'packages':['gantt']});
	 
	 function getData(){
		//AJAX API 사용....
			var xmlhttp = new XMLHttpRequest();
			
			//서버에서 응답 후 처리 로직.
			xmlhttp.onreadystatechange = function(){
				if(xmlhttp.readyState==4 && xmlhttp.status==200){
					//alert("테스트");
					//alert(xmlhttp.responseText);
					
					var result = JSON.parse(xmlhttp.responseText);
					
					  var data = new google.visualization.DataTable();
					  data.addColumn('string', 'Task ID');
				      data.addColumn('string', 'Task Name');
				      data.addColumn('string', 'Resource');
				      data.addColumn('date', 'Start Date');
				      data.addColumn('date', 'End Date');
				      data.addColumn('number', 'D-Day');
				      data.addColumn('number', 'Percent Complete');
				      data.addColumn('string', 'Dependencies');

						for(todo of result.toDo){
							
						  var today = new Date();
						  var finish = new Date(`<fmt:formatDate value="${todov.finishDate }" pattern="yyyy.MM.dd" />`);
								  
						  var diffDays = Math.floor((today.getTime() - finish.getTime()) / (1000 * 60 * 60 * 24));
								  
						  data.addRow([todo.toDoVo.content,todo.toDoVo.content,todo.toDoVo.detailContent,new Date(todo.toDoVo.startDate),new Date(todo.toDoVo.finishDate),null,50,null]);
						 
						}
					  
					  var options = {
					    height: 500,
					    
					    gantt: {
					      trackHeight: 30,
					      fontSize: 19,
					      color: '#757575'
					    }
					  
					  
					  };

					  var chart = new google.visualization.Gantt(document.getElementById('chart_div'));

					  chart.draw(data, options);
					
				}
			};
			
			//get 방식으로 파라미터 보내는법...
			xmlhttp.open("get" , "./toDoData.do?room_no=" + ${room_no}); 
			xmlhttp.send();
	 }
	 
</script>

<script type="text/javascript">
function persent() {
	var total = ${countToDo }
	var yes = ${countYesToDo }
	
	var result = Math.ceil(yes/total* 100); 
	
	var per = document.getElementById('per')
	var pro = document.getElementById('pro')
	
	var result2 = result+'%';
	pro.style.setProperty('width', result2);
	
	per.innerText= result + '%'
	pro.innerText= result2;
} 

function init() {
	persent();
	getData();
}

</script>

</head>


<body onload="init()">
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
            <div class="row mt-3">
               <div class="row">
					<!--여기까지 건들지마셈-->
				<div class="col">	
					<h3><i class="bi bi-bar-chart-line-fill" style="color: #911F27;"></i> To-Do Table</h3>	
				</div>
				<div class="col" style="align-self: center; text-align: end; margin: auto;">	
					<i class="bi bi-exclamation-lg" style="color:red; font-size: 15px;" >To_Do 추가는 리더에게 요청해주세요.</i>
				</div>
				<div class="container">
	  				<div class="row">
	  					<div class="col">
					    	<table class="table table-bordered" style="align-self: center;">
								<tr style="text-align: center;">
									<th class="table-success">전체</th>
									<td style="width: 15%;">${countToDo }</td>
	
									<th class="table-success">완료</th>
									<td style="color: goldenrod; width: 15%;">${countYesToDo }</td>
	
									<th class="table-success">미완료</th>
									<td style="color: green; width: 15%;">${countNoToDo }</td>
	
									<th class="table-danger">진행률</th>
									<td style="color: red; width: 15%;" id="per"><strong></strong></td>
								</tr>
					  	  </table>
						</div>
				  </div>
				  <div class="row mb-3">
				  	<div class="col">
						<div class="progress">
						  <div class="progress-bar" id="pro" role="progressbar"  aria-valuenow="25" aria-valuemin="" aria-valuemax="100"></div>
						</div>
					</div>
				  </div>
				</div>
					
                    <table class="table" >
                        <thead>
                          <tr style="text-align: center;">
                            <th style="width: 5%;" >No</th>
                            <th style="width: 15%;">담당자</th>
                            <th style="width: 50%;">To-Do</th>
                            <th style="width: 10%;">시작일</th>
                            <th style="width: 10%;">종료일</th>
                            <th style="width: 10%;">완료여부</th>
                          </tr>
                        </thead>
                        <tbody>
                        <c:forEach items="${toDo }" var="toDo" varStatus="status">
                        	<c:set var="i" value="${i+1 }"/>
		                          <tr style="text-align: center;"> 
									<td>${i }</td>
									<td><a style="text-decoration:none; color:black;" class="dropdown" href="#" role="button" data-bs-toggle="dropdown" >${toDo.memberName.member_name }</a>
										<ul class="dropdown-menu dropdown-menu-dark" aria-labelledby="navbarDarkDropdownMenuLink" style="background-color: #5B5A5A; border:1">
                                      		 <li><a class="dropdown-item" role="button" id="menu" data-bs-toggle="modal" data-bs-target="#messageModalre${status.index }" style="margin: 0;"> 메시지 보내기</a></li>
                                 		</ul> 
									</td>
									<td><a href="" onclick="viewToDo(${status.index })">${toDo.toDoVo.content }</a></td>
									<td><fmt:formatDate value="${toDo.toDoVo.startDate }" pattern="MM.dd" /></td>
									<td><fmt:formatDate value="${toDo.toDoVo.finishDate }" pattern="MM.dd" /></td>
									<td>${toDo.toDoVo.complete }</td>
									<td class="hideTable" id="tdboard_no${status.index }">${toDo.toDoVo.tdboard_no }</td>
		                          </tr>
		                          
		                          <div class="modal" id="messageModalre${status.index }" data-bs-backdrop="static" style="text-align: left;">
							          <div class="modal-dialog">
							              <div class="modal-content">
							                  <div class="modal-header" style="background-color: #F0FFF0;">
							                      <h3 class="fw-bold">메시지 작성하기</h3>
							                      <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
							                  </div>
							                  <div class="modal-body" style="background-color: #fff;">
							                      <form id="writeForm" action="../message/todowriteMessageProcess.do?room_no=${room_no }" method="post" >
							                          <div style="margin-bottom: 10px;">
							                              <label class="fw-bold"style="margin: 0 0 10px 0 ;">받는사람 이름 </label>
							                              <input type="text" id="idTitle" name="" class="form-control" aria-label="Sizing example input"
							                                               aria-describedby="inputGroup-sizing-default" value="${toDo.memberName.member_name }"> 
							                          </div>
							                          <div>
							                           	<input type="hidden" name ="member_send_name" value="${sessionUser.member_id }">
							                              <label class="fw-bold"style="margin: 0 0 10px 0 ;">받는사람 이메일 </label>
							                              <input type="text" id="idTitle" name="member_receive_name" class="form-control" aria-label="Sizing example input"
							                                               aria-describedby="inputGroup-sizing-default" value="${toDo.memberName.member_id }"> 
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
                        <div class="col-2 mt-2">
                            <form class="d-flex float-end">
<!--                                 <button type="button" class="btn btn-warning" style="border-radius:10px;">추가</button> -->
                                <c:choose>
									<c:when
										test="${!empty sessionUser && sessionUser.member_no==selectLeader.member_no }">
										 <button type="button" onclick="insertToDo()" class="btn btn-success" ><strong>추가</strong></button>
									</c:when>
									<c:otherwise>
										
									</c:otherwise>
								</c:choose>
                            </form>
                        </div>
				</div>
			</div>
				<div class="row">
						<!--여기까지 건들지마셈-->
						<h3><i class="bi bi-bar-chart-steps"></i> Gantt Chart</h3>
						<div class="col mt-3">
						   	 <div id="chart_div"></div>
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
            <!-- JavaScript Bundle with Popper -->
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.bundle.min.js"></script>
</body>

</html>