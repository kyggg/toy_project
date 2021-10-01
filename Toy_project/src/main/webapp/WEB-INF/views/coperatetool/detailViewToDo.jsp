<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css">
<link rel="stylesheet" href="../resources/css/projectTool.css">

<script type="text/javascript">


  function getDiff() {
	  
	  var today = new Date();
	  var finish = new Date(`<fmt:formatDate value="${todov.finishDate }" pattern="yyyy.MM.dd" />`);
	  var complete = document.getElementById('complete').value;
	  
	  var diffDays = Math.floor((today.getTime() - finish.getTime()) / (1000 * 60 * 60 * 24));
	
		  if(complete === '완료'){
			  document.getElementById("count").innerHTML = "종료";
		  }else if(today < finish){
			  document.getElementById("count").innerHTML = diffDays + "일";
		  }else{
			  document.getElementById("count").innerHTML = "마감";
		  }
	  }


	var room_no = ${room_no}
	var tdboard_no = ${tdboard_no}
	
	function clearToDo() {
		//AJAX API 사용....
		var xmlhttp = new XMLHttpRequest();
		
		//서버에서 응답 후 처리 로직.
		xmlhttp.onreadystatechange = function(){
			if(xmlhttp.readyState==4 && xmlhttp.status==200){
				//alert("테스트");
				//alert(xmlhttp.responseText);
				opener.parent.location.reload();
				window.close();
			}
		};
		
		//get 방식으로 파라미터 보내는법...
		xmlhttp.open("get" , "./clearToDoProcess.do?tdboard_no=" + tdboard_no); 
		xmlhttp.send();


	}
	
	function deleteToDo() {
		//AJAX API 사용....
		var xmlhttp = new XMLHttpRequest();
		
		//서버에서 응답 후 처리 로직.
		xmlhttp.onreadystatechange = function(){
			if(xmlhttp.readyState==4 && xmlhttp.status==200){
				//alert("테스트");
				//alert(xmlhttp.responseText);
				opener.parent.location.reload();
				window.close();
			}
		};
		
		//get 방식으로 파라미터 보내는법...
		xmlhttp.open("get" , "./deleteToDoProcess.do?tdboard_no=" + tdboard_no); 
		xmlhttp.send();
	}
	

	
	
</script>


<body onload="getDiff()">
 <div class="container-fluid">
            <div class="col mt-5">
                <table class="table table-bordered" style="width:auto; height: auto; align-self: center; margin: auto; text-align: center;" >
                      <tr>
                        <th style="width: 20%;">The Person</th>
                       	<td colspan="3" style="width:80%">${membername.member_name}</td>
                     </tr>
                      <tr>
                        <th>TO-DO</th>
                        <td colspan="3">${todov.content}</td>
                      </tr>
                      <tr>
                        <th>Explanation</th>
                        <td colspan="3" >${todov.detailContent}</td>
                      </tr>
                      <tr>
                        <th>Start</th>
                        <td colspan="3"><fmt:formatDate value="${todov.startDate }" pattern="yyyy.MM.dd" /></td>
                      </tr>
                      <tr>
                        <th>Finish</th>
                        <td colspan="3"><fmt:formatDate value="${todov.finishDate }" pattern="yyyy.MM.dd" />
                        <input type="hidden" id="finish" <fmt:formatDate value="${todov.finishDate }" pattern="yyyy.MM.dd" />>
                        <input type="hidden" id="complete" value="${todov.complete }">
                        </td>
                      </tr>
                      <tr>
                        <th style="color: red;">D-day</th>
	                      <td colspan="3" style="color: red;" >
								<div id="count">
								</div>
	                      </td>
                      </tr>
                  </table>
            </div>
            <div class="row" style="padding: 0px">
                <div class="col mt-3" style="text-align:center;">
                    <button type="button" class="btn btn-warning" onclick="self.close()" style="border-radius:5px;">목록</button>
                    <c:if test="${!empty sessionUser && sessionUser.member_no==selectLeader.member_no }">
                    <button type="button" onclick="clearToDo()" class="btn btn-warning" style="border-radius:5px; margin-left: 10px;">완료</button>
                    <button type="button" onclick="deleteToDo()" class="btn btn-danger" style="border-radius:5px; margin-left: 10px;">삭제</button>
                    </c:if>
                </div>
            </div>

        </div>


</body>
</html>