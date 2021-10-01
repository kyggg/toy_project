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
    <!-- CSS only -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css">
	<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
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
		
		th, td {
			vertical-align: middle;
		}
		.boardTitle {
			border: none;
			width:50%;
		}
		.boardTitle:focus{
			border: 1px solid #B6FFBD;
		}
		.boardTitle:focus-visible{
			outline: none;
		}
		
		.bi-check-circle{
			font-size: 20px;
			margin-left: 10px;
			color:green;
		}
		.bi-x-circle{
			font-size: 20px;
			margin-left: 10px;
			color:red;
		}
    </style>

<script type="text/javascript">
	var room_no = ${room_no};
	var today = new Date();
	var yyyy = today.getFullYear();
	var mm = ("00" + (today.getMonth() + 1)).slice(-2);
	var dd = ("00" + today.getDate()).slice(-2);
	today = yyyy+'-'+mm+'-'+dd;
	
	function writeBoard() {
		
		var boardListBox = document.getElementById("boardListBox");
		var tableR = document.createElement("tr");
		
		var tableH = document.createElement("th");
		tableH.setAttribute("scope", "row");
		
		
		var tableD1 = document.createElement("td");
		var moveTableD = document.createElement("td");
		var deleteTableD = document.createElement("td");
		
		var caNameBox = document.createElement("input");
		caNameBox.setAttribute("class", "boardTitle");
		caNameBox.setAttribute("id","ca_name");
		caNameBox.setAttribute("type", "text");
		caNameBox.setAttribute("required","");
		caNameBox.setAttribute("onkeydown","insertCaName()");
		
		var tableD2 = document.createElement("td");
		tableD2.innerText = today;
		
		boardListBox.appendChild(tableR);
		tableR.appendChild(tableH);
		tableR.appendChild(tableD1);
		tableD1.appendChild(caNameBox);
		tableR.appendChild(tableD2);
		tableR.appendChild(moveTableD);
		tableR.appendChild(deleteTableD);
		
	}
	
	function insertCaName(){
		if(document.getElementById("ca_name").value != ""){
		    if(event.keyCode == 13){
		    	var caName = document.getElementById("ca_name").value
		    	
				var xmlhttp = new XMLHttpRequest();
				
				
				xmlhttp.onreadystatechange = function(){
					if(xmlhttp.readyState==4 && xmlhttp.status==200){
						var categoryBox = document.getElementById("boardListBox");
						categoryBox.removeChild(
						    categoryBox.firstChild
						);
						selectBoardList()
					}
					
				};
				
				
				xmlhttp.open("post" , "./PBCategoryProcess.do");
				xmlhttp.setRequestHeader("Content-type","application/x-www-form-urlencoded");
				xmlhttp.send("ca_name=" + caName+"&room_no="+room_no);
		    }
		}
	}
	
	function selectBoardList() {
		
		//AJAX API 사용....
		var xmlhttp = new XMLHttpRequest();
		
		var selectBox = document.getElementById("boardListBox");
		
		selectBox.innerText = "";
		
		//서버에서 응답 후 처리 로직.
		xmlhttp.onreadystatechange = function(){
			if(xmlhttp.readyState==4 && xmlhttp.status==200){
				var result = JSON.parse(xmlhttp.responseText);
				for(data of result){
					
					var listGroup = document.createElement("tr");
					

					var listNumber = document.createElement("th");
					listNumber.setAttribute("scope","row");
					listNumber.innerText = data.categoryVo.category_no;
					
					var caNameBox = document.createElement("td");
					caNameBox.innerText= data.categoryVo.ca_name;
					
					var dateBox = document.createElement("td");
					dateBox.innerText = today;
					
					var moveTableD = document.createElement("td");
					
					var movebutton = document.createElement("button");
					movebutton.setAttribute("class", "btn btn btn-warning btn-sm");
					movebutton.setAttribute("style", "padding: 5px;");
					movebutton.setAttribute("onclick", "location.href='./projectBoardPage.do?category_no="+data.categoryVo.category_no+"&ca_name="+data.categoryVo.ca_name+"&room_no="+room_no+"'");
					movebutton.innerText = "이동"
					
					var deleteTableD = document.createElement("td");
					
					var deletebutton = document.createElement("button");
					deletebutton.setAttribute("class", "btn btn btn-danger btn-sm");
					deletebutton.setAttribute("style", "padding: 5px;");
					deletebutton.setAttribute("name", "category_no")
					deletebutton.setAttribute("value", data.categoryVo.category_no)
					deletebutton.setAttribute("onclick", "deleteCategory(this , "+data.categoryVo.category_no+")")
					deletebutton.innerText = "삭제"

					moveTableD.appendChild(movebutton)
					deleteTableD.appendChild(deletebutton)
					
					listGroup.appendChild(listNumber)
					listGroup.appendChild(caNameBox)
					listGroup.appendChild(dateBox)
					listGroup.appendChild(moveTableD)
					listGroup.appendChild(deleteTableD)
					
					selectBox.appendChild(listGroup)
				}
			}
		};
		
		//post 방식으로 파라미터 보내는법...
		xmlhttp.open("post" , "./selectPBCategory.do");
		xmlhttp.setRequestHeader("Content-type","application/x-www-form-urlencoded");
		xmlhttp.send("room_no=" + room_no);
		
	}
	
	function deleteCategory(e, categoryNo) {
		var removeBox = e.parentElement.parentElement

		var xmlhttp = new XMLHttpRequest();
		
		xmlhttp.onreadystatechange = function(){
			if(xmlhttp.readyState==4 && xmlhttp.status==200){
				removeBox.remove();
			}
		};
		
		
		xmlhttp.open("post" , "./deletePBCategoryProcess.do");
		xmlhttp.setRequestHeader("Content-type","application/x-www-form-urlencoded");
		xmlhttp.send("category_no=" + categoryNo);
	  }
	
	function writeChannel() {
	    var channelListBox = document.getElementById("ChannelListBox");
	    
		var tableR = document.createElement("tr");
		
		var tableH = document.createElement("th");
		tableH.setAttribute("scope", "row");
		
		
		var tableD1 = document.createElement("td");
		var moveTableD = document.createElement("td");
		var deleteTableD = document.createElement("td");
		
		var caNameBox = document.createElement("input");
		caNameBox.setAttribute("class", "boardTitle");
		caNameBox.setAttribute("id","channel_name");
		caNameBox.setAttribute("type", "text");
		caNameBox.setAttribute("required","");
		caNameBox.setAttribute("onkeydown","insertChannelName()");
		
		var tableD2 = document.createElement("td");
		tableD2.innerText = today;
		
		channelListBox.appendChild(tableR);
		tableR.appendChild(tableH);
		tableR.appendChild(tableD1);
		tableD1.appendChild(caNameBox);
		tableR.appendChild(tableD2);
		tableR.appendChild(moveTableD);
		tableR.appendChild(deleteTableD);
	    
	}

	function insertChannelName(){
	    if(document.getElementById("channel_name").value != ""){
	        if(event.keyCode == 13){
	            var channelName = document.getElementById("channel_name").value
	            
	            var xmlhttp = new XMLHttpRequest();
	            
	            
	            xmlhttp.onreadystatechange = function(){
	                if(xmlhttp.readyState==4 && xmlhttp.status==200){
	                    var channelBox = document.getElementById("ChannelListBox");
	                    channelBox.removeChild(
	                        channelBox.firstChild
	                    );
	                    selectChannelList()
	                }
	                
	            };
	            
	            
	            xmlhttp.open("post" , "./createChannelProcess.do");
	            xmlhttp.setRequestHeader("Content-type","application/x-www-form-urlencoded");
	            xmlhttp.send("channel_name=" + channelName+"&room_no="+room_no);
	        }
	    }
	}

	function selectChannelList() {
	    
	    //AJAX API 사용....
	    var xmlhttp = new XMLHttpRequest();
	    
	    var selectBox = document.getElementById("ChannelListBox");
	    
	    selectBox.innerText = "";
	    
	    //서버에서 응답 후 처리 로직.
	    xmlhttp.onreadystatechange = function(){
	        if(xmlhttp.readyState==4 && xmlhttp.status==200){
	            var result = JSON.parse(xmlhttp.responseText);
	            for(data of result){
					var listGroup = document.createElement("tr");
					
					var listNumber = document.createElement("th");
					listNumber.setAttribute("scope","row");
					listNumber.innerText = data.channelVo.channel_no;
					
					var channelNameBox = document.createElement("td");
					channelNameBox.innerText= data.channelVo.channel_name;
					
					var dateBox = document.createElement("td");
					dateBox.innerText = today;
					
					var moveTableD = document.createElement("td");
					
					var movebutton = document.createElement("button");
					movebutton.setAttribute("class", "btn btn btn-warning btn-sm");
					movebutton.setAttribute("style", "padding: 5px;");
					movebutton.setAttribute("onclick", "location.href='./chattingPage.do?channel_no="+data.channelVo.channel_no+"&channel_name="+data.channelVo.channel_name+"&room_no="+room_no+"'");
					movebutton.innerText = "이동"
					
					var deleteTableD = document.createElement("td");
					
					var deletebutton = document.createElement("button");
					deletebutton.setAttribute("class", "btn btn btn-danger btn-sm");
					deletebutton.setAttribute("style", "padding: 5px;");
					deletebutton.setAttribute("name", "channel_no")
					deletebutton.setAttribute("value", data.channelVo.channel_no)
					deletebutton.setAttribute("onclick", "deleteChannel(this , "+data.channelVo.channel_no+")")
					deletebutton.innerText = "삭제"

					moveTableD.appendChild(movebutton)
					deleteTableD.appendChild(deletebutton)
					
					listGroup.appendChild(listNumber)
					listGroup.appendChild(channelNameBox)
					listGroup.appendChild(dateBox)
					listGroup.appendChild(moveTableD)
					listGroup.appendChild(deleteTableD)
					
					selectBox.appendChild(listGroup)
	            }
	        }
	    };
	    
	    //post 방식으로 파라미터 보내는법...
	    xmlhttp.open("post" , "./selectChannelProcess.do");
	    xmlhttp.setRequestHeader("Content-type","application/x-www-form-urlencoded");
	    xmlhttp.send("room_no=" + room_no);
	    
	}

	function deleteChannel(e, channelNo) {
	    var removeBox = e.parentElement.parentElement
	    
	    
	    var xmlhttp = new XMLHttpRequest();
	    
	    xmlhttp.onreadystatechange = function(){
	        if(xmlhttp.readyState==4 && xmlhttp.status==200){
	             removeBox.remove();
	            }
	    }
	    xmlhttp.open("post" , "./deleteChannelProcess.do");
	    xmlhttp.setRequestHeader("Content-type","application/x-www-form-urlencoded");
	    xmlhttp.send("channel_no=" + channelNo);
	};
	
	function modalButton(e) {

	    var approve_no = e.value;

	    var decisionButton = document.getElementById("decisionButton");

	    while(decisionButton.hasChildNodes()){
	        decisionButton.removeChild(decisionButton.firstChild)
	    }
	    
	    var approveButton = document.createElement("button")
	    approveButton.setAttribute("data-bs-dismiss", "modal")
	    approveButton.setAttribute("class", "btn btn btn-warning btn-sm")
	    approveButton.setAttribute("onclick", "approve(this, "+approve_no+")")
	    approveButton.innerText = "수락"

	    

	    var refusalButton = document.createElement("button")
	    refusalButton.setAttribute("data-bs-dismiss", "modal")
	    refusalButton.setAttribute("class", "btn btn btn-danger btn-sm")
	    refusalButton.setAttribute("onclick", "refusal(this, "+approve_no+")")
	    refusalButton.innerText = "거절"

	    decisionButton.appendChild(approveButton);
	    decisionButton.appendChild(refusalButton);
	}
	
	function approve(e, approveNo) {
		var examination = "Y";
		
		var xmlhttp = new XMLHttpRequest();
		
		//서버에서 응답 후 처리 로직.
		xmlhttp.onreadystatechange = function(){
			if(xmlhttp.readyState==4 && xmlhttp.status==200){
				var obj = document.getElementsByName("buttons");
                for (var i=0; i<obj.length; i++) {
                    if(document.getElementsByName("buttons")[i].value == approveNo){
                        var grandParent = document.getElementsByName("buttons")[i].parentElement.parentElement
                        document.getElementsByName("buttons")[i].parentElement.remove();

                        var approveBox = document.getElementById("approve")
                        
                        var clnApprove = approveBox.cloneNode(true);
                        clnApprove.removeAttribute("id");
                        clnApprove.style.removeProperty("display");

                        grandParent.appendChild(clnApprove)
                    }
                }
			}
		};
		
		xmlhttp.open("post" , "./updateApproveProcess.do");
		xmlhttp.setRequestHeader("Content-type","application/x-www-form-urlencoded");
		xmlhttp.send("approve_no=" + approveNo+ "&examination=" + examination+"&room_no="+room_no);
	}
	
	function refusal(e, approveNo) {
		var examination = "N"
		
		var xmlhttp = new XMLHttpRequest();
		
		//서버에서 응답 후 처리 로직.
		xmlhttp.onreadystatechange = function(){
			if(xmlhttp.readyState==4 && xmlhttp.status==200){
				var obj = document.getElementsByName("buttons");
                for (var i=0; i<obj.length; i++) {
                    if(document.getElementsByName("buttons")[i].value == approveNo){
                        var grandParent = document.getElementsByName("buttons")[i].parentElement.parentElement
                        document.getElementsByName("buttons")[i].parentElement.remove();

                        var refusalBox = document.getElementById("refusal")
                        
                        var clnRefusal = refusalBox.cloneNode(true);
                        clnRefusal.removeAttribute("id");
                        clnRefusal.style.removeProperty("display");

                        grandParent.appendChild(clnRefusal)
                    }
                }
			}
		};
		
		xmlhttp.open("post" , "./updateApproveProcess.do");
		xmlhttp.setRequestHeader("Content-type","application/x-www-form-urlencoded");
		xmlhttp.send("approve_no=" + approveNo+ "&examination=" + examination+"&room_no="+room_no);
	}
	
	function init() {
		selectBoardList();
		selectChannelList();
	}
	
	
</script>

</head>


<body onload="init()">
    <div id="wrapper">
        <nav class="col-sm-6 sidenav" style="border-right:1px solid #BBBBBB;position: absolute;">
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
	            <div class="col" style="align-self: center; text-align: center; margin: auto;">
					<div class="btn-group" role="group" aria-label="Basic mixed styles example" >
					<div class="col" style="margin-right: 10px;">
						<button class="btn btn-danger" style="width: 100px;" data-bs-toggle="modal" data-bs-target="#stopProject">중단</button>
						</div>
						<button class="btn btn-primary" style="width: 100px;" data-bs-toggle="modal" data-bs-target="#completionProject">완료</button>
					<div class="col" >	
						<input type="hidden" name="room_no" value="${room_no }">
						</div>
					</div>
				</div>
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
					<div class="col">
						<h2>
							<i class="bi bi-person-check"></i> 프로젝트 신청서 
						</h2>
						<hr>
					</div>
				</div>

				<div class="row">
					<div class="col">
						<table class="table table-bordered" style="align-self: center;">
							<tr style="text-align: center;">
								<th class="table-success">요청</th>
								<td style="width: 15%;">20</td>

								<th class="table-success">승인</th>
								<td style="color: goldenrod; width: 15%;">5</td>

								<th class="table-success">거절</th>
								<td style="color: red; width: 15%;">14</td>

								<th class="table-success">대기</th>
								<td style="color: green; width: 15%;">1</td>
							</tr>
						</table>
					</div>
				</div>

				<div class="row mt-3">
					<div class="col">
						<form class="d-flex float-start" action="">
							<select class="form-select" aria-label="Default select example">
								<option selected>검색</option>
								<option value="1">이름</option>
								<option value="2">신청일</option>
								<option value="3">거절</option>
								<option value="3">승인</option>
								<option value="3">대기</option>
							</select>
							<button class="btn btn-outline-dark" type="" style="margin-left: 5px;">Search</button>
						</form>
					</div>
				</div>
				<div class="row">
					<div class="col">
						<table class="table table-hover" style="align-self: center;">
							<thead>
								<tr style="text-align: center;">
									<th scope="col" style="width: 10%;">NO</th>
									<th scope="col" style="width: 20%;">Name</th>
									<th scope="col" style="width: 40%;">제목</th>
									<th scope="col" style="width: 10%;">신청일</th>
									<th scope="col" style="width: 20%;">심사결과</th>
								</tr>
							</thead>
							<tbody style="text-align: center;">
								<c:forEach items="${approve }" var="approve">
									<c:set var="i" value="${i+1}" />
									<tr>
										<th scope="row">${i}</th>
										<td>${approve.memberName.member_name}</td>
										<td>${approve.approveVo.application_content }</td>
										<td><fmt:formatDate pattern="MM-dd" value="${approve.approveVo.approve_date}"></fmt:formatDate></td>
										<td>
											<button type="button" data-bs-toggle="modal" name="buttons"
												data-bs-target="#staticBackdrop"
												class="btn btn-outline-success btn-sm" style="padding: 5px;" onclick="modalButton(this)"
												value="${approve.approveVo.approve_no }">심사하기
											</button>
											<c:choose>
												<c:when test="${approve.approveVo.examination eq 'Y' }">
													<i class="bi bi-check-circle"></i>
												</c:when>
												<c:when test="${approve.approveVo.examination eq 'N' }">
													<i class="bi bi-x-circle"></i>
												</c:when>
												<c:otherwise></c:otherwise>
											</c:choose>
										</td>
									</tr>
									<!-- Modal -->
									<div class="modal fade" id="staticBackdrop"
										data-bs-backdrop="static" data-bs-keyboard="false"
										tabindex="-1" aria-labelledby="staticBackdropLabel"
										aria-hidden="true">
										<div class="modal-dialog">
											<div class="modal-content">
												<div class="modal-header">
													<h5 class="modal-title" id="staticBackdropLabel">프로젝트 심사결정</h5>
													<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
												</div>
												<div class="modal-footer" id="decisionButton">
												</div>
											</div>
										</div>
									</div>
									<td id="refusal" style="display: none;">
											<button type="button" class="btn btn btn-danger btn-sm"
												style="padding: 5px;">거절</button>
									</td>
									<td id="approve" style="display: none;">
											<button type="button" class="btn btn btn-warning btn-sm"
												style="padding: 5px;">승인</button>
									</td>
								</c:forEach>
							</tbody>
						</table>
					</div>
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
								<li class="page-item"><a class="page-link" href="#"
									aria-label="Next"> <span aria-hidden="true">&raquo;</span>
								</a></li>
							</ul>
						</nav>
					</div>
				</div>

				<div class="row">
					<div class="col" style="margin: auto;">
						<h2>
							New Board
							<button type="button" onclick="writeBoard()" class="btn btn btn-dark btn-sm">
								<i class="bi bi-plus-lg"></i>
							</button>
						</h2>
						<hr>
					</div>
					<div class="row">
						<div class="col">
							<table class="table table-hover" style="align-self: center;">
								<thead>
									<tr style="text-align: center;">
										<th scope="col" style="width: 10%;">NO</th>
										<th scope="col" style="width: 50%;">게시판 이름</th>
										<th scope="col" style="width: 20%;">개설일</th>
										<th scope="col" style="width: 10%;">이동</th>
										<th scope="col" style="width: 10%;">삭제</th>
									</tr>
								</thead>
								<tbody style="text-align: center;" id="boardListBox">
								</tbody>
							</table>
						</div>
					</div>
				</div>
				<div class="row mt-3">
					<div class="col" >
						<h2>
							New Channel
							<button type="button" class="btn btn btn-dark btn-sm" onclick="writeChannel()">
								<i class="bi bi-plus-lg"></i>
							</button>
						</h2>
						<hr>
					</div>
					<div class="row">
						<div class="col">
							<table class="table table-hover" style="align-self: center;">
								<thead>
									<tr style="text-align: center;">
										<th scope="col" style="width: 10%;">NO</th>
										<th scope="col" style="width: 50%;">채널 이름</th>
										<th scope="col" style="width: 20%;">개설일</th>
										<th scope="col" style="width: 10%;">이동</th>
										<th scope="col" style="width: 10%;">삭제</th>
									</tr>
								</thead>
								<tbody style="text-align: center;" id="ChannelListBox">
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
            
            <!-- 완료Modal -->
         <div class="modal fade" id="completionProject" tabindex="-1" aria-labelledby="completionProjectLabel" aria-hidden="true">
           <div class="modal-dialog modal-sm">
             <div class="modal-content">
               <div class="modal-header">
                 <h5 class="modal-title" id="completionProjectLabel">완료하시겠습니까?</h5>
                 <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
               </div>
               <div class="modal-footer">
              <form action="./finishProject.do" method="post">
                 <button class="btn btn-primary" data-bs-dismiss="modal">확인</button>
                 <input type="hidden" name="room_no" value="${room_no }">
               <input type="hidden" name="status" value="Y">
              </form>
               </div>
             </div>
           </div>
         </div>
            
            <!-- 중단Modal -->
            <div class="modal fade" id="stopProject" tabindex="-1" aria-labelledby="stopProjectLabel" aria-hidden="true">
           <div class="modal-dialog modal-sm">
             <div class="modal-content">
               <div class="modal-header">
                 <h5 class="modal-title" id="stopProjectLabel">중단하시겠습니까?</h5>
                 <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
               </div>
               <div class="modal-footer">
              <form action="./finishProject.do" method="post">
                 <button class="btn btn-danger">확인</button>
               <input type="hidden" name="room_no" value="${room_no }">
               <input type="hidden" name="status" value="N">
             </form>
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