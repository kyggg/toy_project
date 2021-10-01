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
	    
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/fullcalendar@5.7.0/main.min.css">
	<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/fullcalendar@5.7.0/main.min.js"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script src='fullcalendar/core/locales/ko.js'></script>
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
		
		#calendarBox{
            width: 80%;
            padding: 0px;
            margin-left: 20px;
            color: red:
        }
	        
		
		.fc-col-header-cell-cushion {color:black}
		.fc-col-header-cell-cushion {text-decoration: none}
		.fc-daygrid-day-number{color:black}
		.fc-daygrid-day-number{text-decoration: none}
		
		.row>* {
		    padding: inherit;
		}
		
	   #hideTable{
		display: none;
		}
    </style>


<script type="text/javascript">
var room_no = ${room_no};
function insertToDo() {

	var url = "./insertToDo.do?room_no=" + room_no;

	var insertToDo = window.open(url, "popUp", "width=500,height=700,top=100, left=500");
	
}

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

function data() {
	
	   //AJAX API 사용....
	var xmlhttp = new XMLHttpRequest();
	
	//서버에서 응답 후 처리 로직.
	xmlhttp.onreadystatechange = function(){
		if(xmlhttp.readyState==4 && xmlhttp.status==200){
			//alert("테스트");
			//alert(xmlhttp.responseText);
		result = JSON.parse(xmlhttp.responseText);

		items = [];

		for(todo of result.toDo){
			var xxx = {title : todo.toDoVo.content , start : todo.toDoVo.startDate , end : todo.toDoVo.finishDate};
			items.push(xxx);
		}
			
            var calendarEl = document.getElementById('calendar');
            var calendar = new FullCalendar.Calendar(calendarEl, {
            	displayEventTime: false,
            	eventBorderColor: 'white',
                initialView: 'dayGridMonth', 
                events: items, //JSON 데이터
                editable: false, 
                locale: 'ko',
                eventColor: '#00C473',
                
            });
            calendar.render();
		}
	};
	
	//get 방식으로 파라미터 보내는법...
	xmlhttp.open("get" , "./toDoData.do?room_no=" + ${room_no}); 
	xmlhttp.send();
	
}

function init() {
	
	data();
	persent();
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
                    <span style="font-weight: bold;"><i class="bi bi-person-fill" style="color:#911F27"></i> 조타미</span> 
                    <span style="font-weight: bold; color: green;"><i class="bi bi-envelope"></i> sungsin1030@gmail.com</span>
                    <span style="font-weight:inherit">팀원</span>
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
            	<div class="row">
            		<div class="col" style="align-self: center; text-align: center; margin: auto;">
                      <c:choose>
							<c:when test="${!empty sessionUser && sessionUser.member_no==selectLeader.member_no }">
								 <button type="button" onclick="insertToDo()" style="border-radius:10px; width: 200px; height: 50px; background-color: #C9CCD5; border: none; color:#000000;" >Add Plan</button>
							</c:when>
							<c:otherwise>
						
							</c:otherwise>
						</c:choose>
               		</div>
               </div>
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
	  					<div class="col">
					    	<table class="table table-bordered" style="align-self: center;" id="hideTable">
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
       	 	 <div class="col-1" style="align-self: center; text-align: center; margin: auto;">
       	 		<h5 style="margin-bottom: 0;"><span class="badge rounded-pill bg-danger">달성율</span></h5>
       	 	 </div>
			  	<div class="col" style="align-self: center; text-align: center; margin: auto;">
					<div class="progress">
					  <div class="progress-bar" id="pro" role="progressbar"  aria-valuenow="25" aria-valuemin="" aria-valuemax="100"></div>
					</div>
				</div>
				 <div class="col-1"></div>
			  </div>
			  
            <div class="row">
					 <div id="calendarBox" class="col">
				        <div id="calendar"></div>
				    </div>
									
				<div class="col-1">
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