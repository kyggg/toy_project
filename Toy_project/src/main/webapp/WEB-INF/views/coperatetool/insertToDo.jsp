<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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

function insert() {
	var ToDo = document.getElementById("ToDo");
	ToDo.submit();
	
	opener.parent.location.reload();
}
</script>
<body>
	 <div class="container-fluid">
        <div class="row">
            <!--메인 로우임 건들지마셈-->

            <div class="col">
                <div class="row" style="height: 100px;">
                    <div class="col" style="text-align: center; align-self: center;">
                        <h3>To_Do 추가하기</h3>
                    </div>
                </div>
                <form action="./insertToDoProcess.do" method="post" id="ToDo">
                <input type="hidden" name="room_no" value="${room_no }">
                    <div class="row">
                        <div class="col">
                            <div class="input-group mb-3">
                                <span class="input-group-text" id="inputGroup-sizing-default">To-Do</span>
                                <input type="text" class="form-control" name="content" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default">
                            </div>
                        </div>
                        <div class="col">
                            <select class="form-select" name="member_no" id="member_no">
                                <option selected>담당자</option>
                                <c:forEach items="${relationShipVo }" var="relationShipVo">
									<option value="${relationShipVo.member_no }">${relationShipVo.member_name }</option>
								</c:forEach>	
                            </select>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col">
                            <div class="input-group mb-3">
                                <span class="input-group-text" id="inputGroup-sizing-default">시작일</span>
                                <input type="date" class="form-control" name="startDate" aria-label="Sizing example input"
                                    aria-describedby="inputGroup-sizing-default">
                            </div>
                        </div>
                        <div class="col">
                            <div class="input-group mb-3">
                                <span class="input-group-text" id="inputGroup-sizing-default">종료일</span>
                                <input type="date" class="form-control" name="finishDate" aria-label="Sizing example input"
                                    aria-describedby="inputGroup-sizing-default">
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col">
                            <div class="form-floating">
                                <textarea class="form-control" placeholder="Leave a comment here" id="floatingTextarea2"
                                    style="height: 500px" name="detailContent"></textarea>
                                <label for="floatingTextarea2">To-Do content</label>
                            </div>
                        </div>
                    </div>
                <div class="row">
                    <div class="form-col mt-3" style="text-align:end;">
                        <button type="button" class="btn btn-warning" onclick="self.close()" style="border-radius:5px;">목록</button>
                        <button type="button" class="btn btn-warning" onclick="insert()" style="border-radius:5px; margin-left: 10px;">추가</button>
                    </div>
                </div>
                </form>
            </div>
        </div>
    </div>




</body>
</html>