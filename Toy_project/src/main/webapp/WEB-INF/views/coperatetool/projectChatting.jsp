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
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/fullcalendar@5.7.0/main.min.css">
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/fullcalendar@5.7.0/main.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=e34b8c3b63f85572a6832b1fa540ccd4&libraries=services,clusterer,drawing"></script>


<script>
	var chatting_no = 0;
	var member_no = ${member_no}
	var channel_no = ${channel.channel_no}
	var channel_name = '${channel.channel_name}'
	var today = new Date();
	var year = today.getFullYear();
	var month = today.getMonth()+1;
	var date = ("00"+today.getDate()).slice(-2);
	var hour = today.getHours()+"";
	var minutes = ("00"+today.getMinutes()).slice(-2)+"";
	var time = hour+":"+minutes
	var week = ['일', '월', '화', '수', '목', '금', '토'];
	var day = week[today.getDay()];
	function chattingDate(){
		

		var chattingHeadToday = year + "년 " + month + "월 " + date + "일 " + day + "요일";

		var chattingToday = document.getElementById("chattingTodayDateBox");

		var chattingSpace = document.getElementById("chattingSpace");

        if(chattingToday === null){
            var todayBox = document.createElement("div")
            todayBox.setAttribute("class","row")
            todayBox.setAttribute("id","chattingTodayDateBox")
            
            var hrSect = document.createElement("div")
            hrSect.setAttribute("class", "col-12 system hr-sect")

            var systemMessage = document.createElement("span")
            systemMessage.setAttribute("class","system-message")
            systemMessage.innerText = chattingHeadToday

            hrSect.appendChild(systemMessage)
            todayBox.appendChild(hrSect)
            chattingSpace.appendChild(todayBox)
        } else if(chattingToday.lastElementChild.lastElementChild.innerText.substring(9,11) !== date ){
        	chattingToday.removeAttribute("id")
            var todayBox = document.createElement("div")
            todayBox.setAttribute("class","row")
            todayBox.setAttribute("id","chattingTodayDateBox")
            
            var hrSect = document.createElement("div")
            hrSect.setAttribute("class", "col-12 system hr-sect")

            var systemMessage = document.createElement("span")
            systemMessage.setAttribute("class","system-message")
            systemMessage.innerText = chattingHeadToday

            hrSect.appendChild(systemMessage)
            todayBox.appendChild(hrSect)
            chattingSpace.appendChild(todayBox)
        }

	}

	function sendText(e){
		var content = document.getElementById("message-content").textContent
		if(!event.shiftKey && event.keyCode === 13 && content !== ""){
			
			//AJAX API 사용....
			var xmlhttp = new XMLHttpRequest();
			
			//서버에서 응답 후 처리 로직.
			xmlhttp.onreadystatechange = function(){
				if(xmlhttp.readyState==4 && xmlhttp.status==200){
					document.getElementById("message-content").innerHTML = "";
					getChatting();
				}
			};
			
			//post 방식으로 파라미터 보내는법...
			xmlhttp.open("post" , "./insertChattingProcess.do");
			xmlhttp.setRequestHeader("Content-type","application/x-www-form-urlencoded");
			xmlhttp.send("channel_no=" + channel_no+"&content="+content+"&member_no="+member_no+"&content_date="+time);
		} else if(content != "") {
			var sendButton = document.getElementById("button-box");
			sendButton.style.setProperty("background-color","#B6FFBD")
			sendButton.style.setProperty("color","darkslateblue")
		} else{
			var sendButton = document.getElementById("button-box");
			sendButton.style.setProperty("background-color","#F2F4F8")
			sendButton.style.setProperty("color","#c2c2c2")
		}
	}
	
	function getChatting(){
		
		var chattingSpace = document.getElementById("chattingSpace");

        

		//AJAX API 사용....
		var xmlhttp = new XMLHttpRequest();
		
		//서버에서 응답 후 처리 로직.
		xmlhttp.onreadystatechange = function(){
			if(xmlhttp.readyState==4 && xmlhttp.status==200){
				var result = JSON.parse(xmlhttp.responseText);
				//document.getElementById("chattingSpace").innerHTML = "";
				
                for(data of result){
                	var chatMessageWithProfile = document.getElementById("chat-message-with-profile");
                	
    				chattingDate()
               		if(chatMessageWithProfile == null){
                        var chatMessage = document.createElement("div")
                        chatMessage.setAttribute("class","row chat-message")
                        chatMessage.setAttribute("id","chat-message-with-profile")

                        var chatProfile = document.createElement("div")
                        chatProfile.setAttribute("class","col-1 chat-profile")

                        var profileIcon = document.createElement("i")
                        profileIcon.setAttribute("class","bi bi-person-circle icon")
                        
                        var chatNameTimeBox = document.createElement("div")
                        chatNameTimeBox.setAttribute("class","col-11")

                        var nameBox = document.createElement("div")

                        var chatName = document.createElement("span")
                        chatName.innerText = data.memberName.member_name

                        var chatBox = document.createElement("div")
                        chatBox.setAttribute("class","chat-box")
                        if(data.sessionMember_name == data.memberName.member_name){
                        	chatBox.style.setProperty("background-color","yellow")
                        }

                        var chat = document.createElement("div")
                        chat.setAttribute("class","chat")
                        chat.innerText = data.chattingVo.content

                        var chatTime = document.createElement("span")
                        chatTime.setAttribute("class","chat-time")
                        chatTime.innerText = data.chattingVo.content_date

                        chatBox.appendChild(chat)
                        nameBox.appendChild(chatName)
                        chatNameTimeBox.appendChild(nameBox)
                        chatNameTimeBox.appendChild(chatBox)
                        chatNameTimeBox.appendChild(chatTime)

                        chatProfile.appendChild(profileIcon)

                        chatMessage.appendChild(chatProfile)
                        chatMessage.appendChild(chatNameTimeBox)

                        chattingSpace.appendChild(chatMessage);
                        
                   		}else if(chatMessageWithProfile.lastElementChild.firstElementChild.firstElementChild.innerText == data.memberName.member_name){
                   			var chatOnlymessageBox = document.getElementById("only-chat")
                            clnChatOnlyMessageBox = chatOnlymessageBox.cloneNode(true)
                            clnChatOnlyMessageBox.style.removeProperty("display")
                            if(data.sessionMember_name == data.memberName.member_name){
                            	clnChatOnlyMessageBox.firstElementChild.firstElementChild.style.setProperty("background-color","yellow")
                            }
                            clnChatOnlyMessageBox.removeAttribute("id")

                            clnChatOnlyMessageBox.firstElementChild.firstElementChild.firstElementChild.innerText = data.chattingVo.content
                            clnChatOnlyMessageBox.firstElementChild.lastElementChild.innerText = data.chattingVo.content_date
                            chattingSpace.appendChild(clnChatOnlyMessageBox)
                        }else if(chatMessageWithProfile.lastElementChild.firstElementChild.firstElementChild.innerText !== data.memberName.member_name){
                        	chatMessageWithProfile.removeAttribute("id");
                        	
                        	var chatMessage = document.createElement("div")
                            chatMessage.setAttribute("class","row chat-message")
                            chatMessage.setAttribute("id","chat-message-with-profile")

                            var chatProfile = document.createElement("div")
                            chatProfile.setAttribute("class","col-1 chat-profile")

                            var profileIcon = document.createElement("i")
                            profileIcon.setAttribute("class","bi bi-person-circle icon")
                            
                            var chatNameTimeBox = document.createElement("div")
                            chatNameTimeBox.setAttribute("class","col-11")

                            var nameBox = document.createElement("div")

                            var chatName = document.createElement("span")
                            chatName.innerText = data.memberName.member_name

                            var chatBox = document.createElement("div")
                            chatBox.setAttribute("class","chat-box")
							if(data.sessionMember_name == data.memberName.member_name){
                            	chatBox.style.setProperty("background-color","yellow")
                            }

                            var chat = document.createElement("div")
                            chat.setAttribute("class","chat")
                            chat.innerText = data.chattingVo.content

                            var chatTime = document.createElement("span")
                            chatTime.setAttribute("class","chat-time")
                            chatTime.innerText = data.chattingVo.content_date

                            chatBox.appendChild(chat)
                            nameBox.appendChild(chatName)
                            chatNameTimeBox.appendChild(nameBox)
                            chatNameTimeBox.appendChild(chatBox)
                            chatNameTimeBox.appendChild(chatTime)

                            chatProfile.appendChild(profileIcon)

                            chatMessage.appendChild(chatProfile)
                            chatMessage.appendChild(chatNameTimeBox)

                            chattingSpace.appendChild(chatMessage);
                            
                            
                        }
    				
    				chatting_no = data.chattingVo.chatting_no;
                	}
                
                	//스크롤 맨 밑으로 내리자....
	            	var ttt = document.getElementById("chat-main");
            		ttt.scrollTop = ttt.scrollHeight;
				}
			
				
			};
		
		//post 방식으로 파라미터 보내는법...
		xmlhttp.open("post" , "./selectChattingProcess.do");
		xmlhttp.setRequestHeader("Content-type","application/x-www-form-urlencoded");
		xmlhttp.send("channel_no=" + channel_no + "&chatting_no=" + chatting_no);
	}
	
	function calender() {
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
                  initialView: 'dayGridWeek', 
                  events: items, //JSON 데이터
                  editable: false, 
                  locale: 'ko',
                  eventColor: '#00C473',
                  height:350
              });
              calendar.render();
        }
     };
   //get 방식으로 파라미터 보내는법...
     xmlhttp.open("get" , "./toDoData.do?room_no=" + ${room_no}); 
     xmlhttp.send();
     
  }

	
	setInterval(getChatting, 1000);

	

	function init(){
	      calender();
	      kakaoMap();
	   }
	

	
	
	
</script>


<style type="text/css">
html {
	height: 100vh;
	/* overflow-x: hidden; */
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
	height: 100%;
	display: flex;
}

header {
	background-color: #ffffff;
}

#container {
   margin-left: 270px;
   padding: 0 0 20px 20px;
   height: 100%;
}

footer {
	position: absolute;
	bottom: 0;
	width: 100%;
	height: 30px;
	background: #fff;
	border: 1px solid rgba(0,0,0,0.35);
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
	background: #fff;
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

.hideTable {
	display: none;
}

.progress-bar {
	background-color: #A45D5D;
}

hr {
	color: #444444;
}

.page-item.active .page-link {
	background: green;
	color: #00000;
}

.page-link {
	color: #000000;
}

.page-item.active .page-link {
	border-color: #fff;
}

.modal-title {
	font-size: 40px;
}

.title {
	font-size: 16px;
	color: gray;
	margin-bottom: 0;
}

.content {
	font-size: 16px;
	color: gray;
	margin-bottom: 10px;
}

.title-box {
	width: 400px;
	border: 0;
	border-bottom: 1px solid rgba(0, 0, 0, 0.2);
	margin-bottom: 10px;
}

.content-box {
	border: 1px solid rgba(0, 0, 0, 0.2);
	width: 400px;
	height: 450px;
	padding: 14px
}

.write-box:focus-visible {
	outline: none;
}

.content-link {
	color: black;
	text-decoration: none;
}

.content-link:hover {
	color: black;
	cursor: pointer;
}

.modal-content {
	background-color: #faebd7;
}

.modal-header {
	border-bottom: 0;
}

.subtitle-box-title {
	text-align: left;
	font-size: 18px;
	font-family: 'Open Sans', sans-serif;
	color: darkred;
}

.detailBoard-title-box {
	text-align: center;
	margin-bottom: 10px;
}

.detailBoard-content-box {
	text-align: left;
}

.bi-pen {
	font-size: 15px;
	color: rgba(0, 0, 0, 0.6);
	margin-left: 10px;
	cursor: pointer;
}

.bi-pen:hover {
	color: rgba(0, 0, 0, 1);
}

.bi-x {
	font-size: 17px;
	color: rgba(0, 0, 0, 0.6);
	margin-left: 5px;
	cursor: pointer;
}

.bi-x:hover {
	color: rgba(0, 0, 0, 1);
}

.mainChat {
   margin:0px;
   height: 100%;
   width: 900px;
   padding: 0px;
   box-sizing: border-box;
   border-right: 1px solid rgba(0, 0, 0, 0.2);
}

.messageBox {
	margin-top: 40px;
	padding-left: 0px;
}

.mainRow {
	margin: 0px;
	width: 100%;
	height: 83%;
	overflow-y: auto;
	padding-bottom: 20px;
}

.system-message {
	background-color: #f2f2f2;
	border-radius: 25px;
	padding: 4px 16px;
	color: #333;
}

.hr-sect {
	min-height: 15px;
	margin-top: 30px;
	margin-bottom: 15px;
	padding: 8px 12px;
	line-height: 20px;
	font-size: 1rem;
	text-align: center;
	display: flex;
	flex-basis: 100%;
	align-items: center;
	color: rgba(0, 0, 0, 0.35);
}

.hr-sect::before, .hr-sect::after {
	content: "";
	flex-grow: 1;
	background: rgba(0, 0, 0, 0.35);
	height: 1px;
	font-size: 0px;
	line-height: 0px;
	margin: 0px 16px;
}

.chat-message {
	display: flex;
	padding-left: 18px;
	margin-top: 20px;
}

.chat-only-message-box {
	margin-top: 5px;
	padding-left: 18px;
}

.chat-profile {
	width: 40px;
}

.chat-only-message {
	padding-left: 50px;
}

.chat-box:hover {
	filter: brightness(85%);
}

.chat-box {
	display: inline-block;
	margin-top: 2px;
	padding: 6px 12px;
	background-color: #EBF5F1;
	border: 1px solid rgba(5, 35, 60, .1);
	border-radius: 0 8px 8px;
	font-size: 14px;
}

.input-message-wrapper {
	border-top: 1px solid rgba(0, 0, 0, 0.35);
	position: relative;
	bottom: 0;
	width: 100%;
	margin: 0px;
}

.input-message-box {
   display: flex;
   padding-right: 0px;
   border: 1px solid rgba(0, 0, 0, 0.2);
   margin: 10px 10px 8px 8px;
   height: 130px;
   border-radius: 10px;
   box-shadow: 0 3px 6px rgb(0 0 0 / 8%);
}

.input-message-box:focus-within {
	border: 2px solid #B6FFBD;
}

.input-message {
	padding: 8px;
	outline: none;
	overflow-y: auto;
	width: 100%;
	height: 80px;
	word-break: keep-all;
	word-wrap: break-word;
	line-height: 19px;
	vertical-align: middle;
	resize: none !important;
	box-sizing: border-box;
}

.send-button {
	width: 100%;
	height: 100%;
	background-color: #F2F4F8;
	color: #c2c2c2;
	border: 0;
	font-weight: 700;
	font-size: 14px;
}

.icon {
	font-size: 2rem;
	position: relative;
	bottom: 5px;
}

.channelHeadName {
	position: fixed;
	top: 0;
	width: 899px;
	height: 50px;
	background-color: #B6FFBD;
	padding: 4px 16px;
	line-height: 40px;
	font-size: 20px;
	font-weight: bolder;
	border-bottom: 1px solid lightgray;
}

.chat-time {
	height: 100%;
	font-size: 6px;
	vertical-align: bottom;
}

.send-button-Box {
	width: 5%;
}
::-webkit-scrollbar {
  width: 10px;
  height: 10px;
  border-radius: 0 4px 4px 0;
}
::-webkit-scrollbar-thumb {
  background-color: #d0cfd4;
  border: 1px solid transparent;
  border-radius: 10px;
  background-clip: content-box;
}
.right-sideBox{
   height: inherit;
   width:100%;

}

.fc-col-header-cell-cushion {color:black}
.fc-col-header-cell-cushion {text-decoration: none}
.fc-daygrid-day-number{color:black}
.fc-daygrid-day-number{text-decoration: none}

.calenderSpace{
   padding-top:12px;
   padding-bottom:12px;
   margin-left:0;
   margin-right:0;
   height: 35%;
}

.mapSpace{
   margin-top:25px!important;
   padding:12px!important;
   margin-left:0!important;
   margin-right:0!important;
   height: 70%;
}
.fc .fc-toolbar-title {
    font-size: 1.2rem!important;
    margin: 0;
}

.map_wrap, .map_wrap * {margin:0;padding:0;font-family:'Malgun Gothic',dotum,'돋움',sans-serif;font-size:12px;}
.map_wrap a, .map_wrap a:hover, .map_wrap a:active{color:#000;text-decoration: none;}
.map_wrap {position:relative;width:100%;height:500px;}
#menu_wrap {position:absolute;top:0;left:0;bottom:0;width:250px;margin:10px 0 30px 10px;padding:5px;overflow-y:auto;background:rgba(255, 255, 255, 0.7);z-index: 1;font-size:12px;border-radius: 10px;}
.bg_white {background:#fff;}
#menu_wrap hr {display: block; height: 1px;border: 0; border-top: 2px solid #5F5F5F;margin:3px 0;}
#menu_wrap .option{text-align: center;}
#menu_wrap .option p {margin:10px 0;}  
#menu_wrap .option button {margin-left:5px;}
#placesList li {list-style: none;}
#placesList .item {position:relative;border-bottom:1px solid #888;overflow: hidden;cursor: pointer;min-height: 65px;}
#placesList .item span {display: block;margin-top:4px;}
#placesList .item h5, #placesList .item .info {text-overflow: ellipsis;overflow: hidden;white-space: nowrap;}
#placesList .item .info{padding:10px 0 10px 55px;}
#placesList .info .gray {color:#8a8a8a;}
#placesList .info .jibun {padding-left:26px;background:url(https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/places_jibun.png) no-repeat;}
#placesList .info .tel {color:#009900;}
#placesList .item .markerbg {float:left;position:absolute;width:36px; height:37px;margin:10px 0 0 10px;background:url(https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png) no-repeat;}
#placesList .item .marker_1 {background-position: 0 -10px;}
#placesList .item .marker_2 {background-position: 0 -56px;}
#placesList .item .marker_3 {background-position: 0 -102px}
#placesList .item .marker_4 {background-position: 0 -148px;}
#placesList .item .marker_5 {background-position: 0 -194px;}
#placesList .item .marker_6 {background-position: 0 -240px;}
#placesList .item .marker_7 {background-position: 0 -286px;}
#placesList .item .marker_8 {background-position: 0 -332px;}
#placesList .item .marker_9 {background-position: 0 -378px;}
#placesList .item .marker_10 {background-position: 0 -423px;}
#placesList .item .marker_11 {background-position: 0 -470px;}
#placesList .item .marker_12 {background-position: 0 -516px;}
#placesList .item .marker_13 {background-position: 0 -562px;}
#placesList .item .marker_14 {background-position: 0 -608px;}
#placesList .item .marker_15 {background-position: 0 -654px;}
#pagination {margin:10px auto;text-align: center;}
#pagination a {display:inline-block;margin-right:10px;}
#pagination .on {font-weight: bold; cursor: default;color:#777;}
</style>

</head>


<body onload="init()">
	<div id="wrapper">
		<nav class="col-sm-6 sidenav" style="border-right: 1px solid #BBBBBB;position: absolute;">
			<h5 style="padding-top: 20px; padding-left: 55px; font-weight: 800;">
				<i class="bi bi-stack" style="color: #00C473;"></i> TOY PROJECT
			</h5>
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
				<li><span style="font-weight: 900; color: #acacac;">Plan</span></li>
				<li style="margin-top: 10px; margin-bottom: 10px;"><a
					href="./planPage.do?room_no=${room_no}"><i
						class="bi bi-bar-chart-line-fill" style="color: #911F27;"></i>
						To-Do</a></li>
				<li style="margin-top: 10px; margin-bottom: 10px;"><a
					href="./calendarPage.do?room_no=${room_no}"><i
						class="bi bi-calendar-check" style="color: #290FBA;"></i> Calendar</a></li>
			</ul>

			<ul class="sidenavli" style="margin-top: 30px;">
				<li><span style="font-weight: 900; color: #acacac;">Information</span></li>
				<li style="margin-top: 10px; margin-bottom: 10px;"><a href="./projectMyPage.do?room_no=${room_no }&member_no=${sessionUser.member_no}"><i class="bi bi-info-square-fill"></i> My Page</a></li>

			</ul>

			<c:if test="${sessionUser.member_no eq memberNoByRoomNo }">
				<ul class="sidenavli" style="margin-top: 30px;">
					<li><span style="font-weight: 900; color: #acacac;">Management</span></li>
					<li style="margin-top: 10px; margin-bottom: 10px;"><a
						href="./boardManagement.do?room_no=${room_no }"><i
							class="bi bi-gear-wide-connected" style="color: #00C473;"></i>
							Project Management </a></li>
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
			<div class="container mainChat">
				<div class="row mainRow" id="chat-main">
					<div class="channelHeadName"><i class="bi bi-chat-dots-fill" style="color: #FFC93C;"></i> ${channel.channel_name}</div>
					<div class="col messageBox" id="chattingSpace"></div>
				</div>
				<div class="row input-message-wrapper">
					<div class="col input-message-box">
						<div style="width: 95%;">
							<div contenteditable="true" id="message-content"
								class="input-message" onkeydown="sendText(this)"></div>
						</div>
						<div class="send-button-Box">
							<button class="send-button" type="button" id="button-box">전송</button>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- right-sidebox -->
		      <div class="container-fulid right-sideBox">
		         <div class="row calenderSpace">
		            <div id="calendarBox" class="col-12" style="font-size: 0.9rem!important; margin-bottom: 10px;">
		                 <div id="calendar"></div>
		             </div>
		            <div class="col-1"></div>
		         </div>
		         <div class="row mapSpace map_wrap">
		            <div class="col-12" id="map"></div>
		            <div id="menu_wrap" class="bg_white">
		               <div class="option">
		                   <div>
		                       <form onsubmit="searchPlaces(); return false;">
		                           키워드 : <input type="text" value="카카오" id="keyword" size="15"> 
		                           <button type="submit">검색하기</button> 
		                       </form>
		                   </div>
		               </div>
		               <hr>
		               <ul id="placesList"></ul>
		               <div id="pagination"></div>
		           </div>
         </div>
		      </div>
		<div class="row chat-only-message-box" id="only-chat"
			style="display: none;">
			<div class="col-12 chat-only-message">
				<div class="chat-box">
					<span class="chat">채팅내용</span>
				</div>
				<span class="chat-time"></span>
			</div>
		</div>

		<footer>
			<div class="row mt-3">
				<img alt="" src="../resources/img/footer.png">
			</div>
		</footer>
	</div>

	<!-- Javascript files-->
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js"></script>
                <!-- JavaScript Bundle with Popper -->
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.bundle.min.js"></script>
	
	<script type="text/javascript">
   // 마커를 담을 배열입니다
   var markers = [];

   var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
       mapOption = {
           center: new kakao.maps.LatLng(37.566826, 126.9786567), // 지도의 중심좌표
           level: 3 // 지도의 확대 레벨
       };  

   // 지도를 생성합니다    
   var map = new kakao.maps.Map(mapContainer, mapOption); 

   // 장소 검색 객체를 생성합니다
   var ps = new kakao.maps.services.Places();  

   // 검색 결과 목록이나 마커를 클릭했을 때 장소명을 표출할 인포윈도우를 생성합니다
   var infowindow = new kakao.maps.InfoWindow({zIndex:1});

   // 키워드로 장소를 검색합니다
   searchPlaces();

   // 키워드 검색을 요청하는 함수입니다
   function searchPlaces() {

       var keyword = document.getElementById('keyword').value;

       if (!keyword.replace(/^\s+|\s+$/g, '')) {
           alert('키워드를 입력해주세요!');
           return false;
       }

       // 장소검색 객체를 통해 키워드로 장소검색을 요청합니다
       ps.keywordSearch( keyword, placesSearchCB); 
   }

   // 장소검색이 완료됐을 때 호출되는 콜백함수 입니다
   function placesSearchCB(data, status, pagination) {
       if (status === kakao.maps.services.Status.OK) {

           // 정상적으로 검색이 완료됐으면
           // 검색 목록과 마커를 표출합니다
           displayPlaces(data);

           // 페이지 번호를 표출합니다
           displayPagination(pagination);

       } else if (status === kakao.maps.services.Status.ZERO_RESULT) {

           alert('검색 결과가 존재하지 않습니다.');
           return;

       } else if (status === kakao.maps.services.Status.ERROR) {

           alert('검색 결과 중 오류가 발생했습니다.');
           return;

       }
   }

   // 검색 결과 목록과 마커를 표출하는 함수입니다
   function displayPlaces(places) {

       var listEl = document.getElementById('placesList'), 
       menuEl = document.getElementById('menu_wrap'),
       fragment = document.createDocumentFragment(), 
       bounds = new kakao.maps.LatLngBounds(), 
       listStr = '';
       
       // 검색 결과 목록에 추가된 항목들을 제거합니다
       removeAllChildNods(listEl);

       // 지도에 표시되고 있는 마커를 제거합니다
       removeMarker();
       
       for ( var i=0; i<places.length; i++ ) {

           // 마커를 생성하고 지도에 표시합니다
           var placePosition = new kakao.maps.LatLng(places[i].y, places[i].x),
               marker = addMarker(placePosition, i), 
               itemEl = getListItem(i, places[i]); // 검색 결과 항목 Element를 생성합니다

           // 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
           // LatLngBounds 객체에 좌표를 추가합니다
           bounds.extend(placePosition);

           // 마커와 검색결과 항목에 mouseover 했을때
           // 해당 장소에 인포윈도우에 장소명을 표시합니다
           // mouseout 했을 때는 인포윈도우를 닫습니다
           (function(marker, title) {
               kakao.maps.event.addListener(marker, 'mouseover', function() {
                   displayInfowindow(marker, title);
               });

               kakao.maps.event.addListener(marker, 'mouseout', function() {
                   infowindow.close();
               });

               itemEl.onmouseover =  function () {
                   displayInfowindow(marker, title);
               };

               itemEl.onmouseout =  function () {
                   infowindow.close();
               };
           })(marker, places[i].place_name);

           fragment.appendChild(itemEl);
       }

       // 검색결과 항목들을 검색결과 목록 Elemnet에 추가합니다
       listEl.appendChild(fragment);
       menuEl.scrollTop = 0;

       // 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
       map.setBounds(bounds);
   }

   // 검색결과 항목을 Element로 반환하는 함수입니다
   function getListItem(index, places) {

       var el = document.createElement('li'),
       itemStr = '<span class="markerbg marker_' + (index+1) + '"></span>' +
                   '<div class="info">' +
                   '   <h5>' + places.place_name + '</h5>';

       if (places.road_address_name) {
           itemStr += '    <span>' + places.road_address_name + '</span>' +
                       '   <span class="jibun gray">' +  places.address_name  + '</span>';
       } else {
           itemStr += '    <span>' +  places.address_name  + '</span>'; 
       }
                    
         itemStr += '  <span class="tel">' + places.phone  + '</span>' +
                   '</div>';           

       el.innerHTML = itemStr;
       el.className = 'item';

       return el;
   }

   // 마커를 생성하고 지도 위에 마커를 표시하는 함수입니다
   function addMarker(position, idx, title) {
       var imageSrc = 'https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png', // 마커 이미지 url, 스프라이트 이미지를 씁니다
           imageSize = new kakao.maps.Size(36, 37),  // 마커 이미지의 크기
           imgOptions =  {
               spriteSize : new kakao.maps.Size(36, 691), // 스프라이트 이미지의 크기
               spriteOrigin : new kakao.maps.Point(0, (idx*46)+10), // 스프라이트 이미지 중 사용할 영역의 좌상단 좌표
               offset: new kakao.maps.Point(13, 37) // 마커 좌표에 일치시킬 이미지 내에서의 좌표
           },
           markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imgOptions),
               marker = new kakao.maps.Marker({
               position: position, // 마커의 위치
               image: markerImage 
           });

       marker.setMap(map); // 지도 위에 마커를 표출합니다
       markers.push(marker);  // 배열에 생성된 마커를 추가합니다

       return marker;
   }

   // 지도 위에 표시되고 있는 마커를 모두 제거합니다
   function removeMarker() {
       for ( var i = 0; i < markers.length; i++ ) {
           markers[i].setMap(null);
       }   
       markers = [];
   }

   // 검색결과 목록 하단에 페이지번호를 표시는 함수입니다
   function displayPagination(pagination) {
       var paginationEl = document.getElementById('pagination'),
           fragment = document.createDocumentFragment(),
           i; 

       // 기존에 추가된 페이지번호를 삭제합니다
       while (paginationEl.hasChildNodes()) {
           paginationEl.removeChild (paginationEl.lastChild);
       }

       for (i=1; i<=pagination.last; i++) {
           var el = document.createElement('a');
           el.href = "#";
           el.innerHTML = i;

           if (i===pagination.current) {
               el.className = 'on';
           } else {
               el.onclick = (function(i) {
                   return function() {
                       pagination.gotoPage(i);
                   }
               })(i);
           }

           fragment.appendChild(el);
       }
       paginationEl.appendChild(fragment);
   }

   // 검색결과 목록 또는 마커를 클릭했을 때 호출되는 함수입니다.
   // 인포윈도우에 장소명을 표시합니다
   function displayInfowindow(marker, title) {
       var content = '<div style="padding:5px;z-index:1;">' + title + '</div>';

       infowindow.setContent(content);
       infowindow.open(map, marker);
   }

    // 검색결과 목록의 자식 Element를 제거하는 함수입니다
   function removeAllChildNods(el) {   
       while (el.hasChildNodes()) {
           el.removeChild (el.lastChild);
       }
   }
   </script>
	
	
	
</body>
</html>