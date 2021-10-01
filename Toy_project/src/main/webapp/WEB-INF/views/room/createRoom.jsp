<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css">
<link rel="stylesheet" href="projectTool.css">

<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<style>
    #xx {
        text-align: center;
        justify-content: center;
    }

    li ul li:hover {
        background: goldenrod;
    }
</style>

<script type="text/javascript">
function ss() {
	
    new daum.Postcode({
        oncomplete: function(data) {
      
          var addr = document.getElementById("address").value = data.address; // 주소 넣기

        }
    }).open();
	
}


</script>

<body>
<form action="./createProjectRoomProcess.do" method="post" id="frm">
  <div class="container-fluid">
        <div class="row">
            <!--메인 로우임 건들지마셈-->

            <div class="col"> </div>

            <div class="col-9">
                <div class="row" style="height: 100px;">
                    <div class="col" style="text-align: center; align-self: center;">
                        <h3>Create Project</h3>
                    </div>
                </div>
              
                    <div class="row">
                        <div class="col">
                            <div class="input-group mb-3">
                                <span class="input-group-text" id="inputGroup-sizing-default">Name</span>
                                <input type="text" class="form-control"  name="title" aria-label="Sizing example input"
                                    aria-describedby="inputGroup-sizing-default">
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col mb-3">
                            <select class="form-select" aria-label="Default select example" name="people">
                                <option selected>모집인원</option>
                                <option value="1">1</option>
                                <option value="2">2</option>
                                <option value="3">3</option>
                                <option value="4">4</option>
                                <option value="5">5</option>
                                <option value="6">6</option>
                                <option value="7">7</option>
                                <option value="8">8</option>
                            </select>
                        </div>
                        <div class="col">
                           <div class="input-group mb-3" >
                                <span class="input-group-text" id="inputGroup-sizing-default">지역</span>
                                <input type="text" style="color:black;" class="form-control" id="address" value="(동)까지만 입력해주세요." onclick="ss()" name="address" readonly aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default">
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col">
                            <div class="input-group mb-3">
                                <span class="input-group-text" id="inputGroup-sizing-default">시작일</span>
                                <input type="date" class="form-control" aria-label="Sizing example input"
                                    aria-describedby="inputGroup-sizing-default" name="startDate">
                            </div>
                        </div>
                        <div class="col">
                            <div class="input-group mb-3">
                                <span class="input-group-text" id="inputGroup-sizing-default">종료일</span>
                                <input type="date" class="form-control" aria-label="Sizing example input"
                                    aria-describedby="inputGroup-sizing-default"  name="lastDate">
                            </div>
                        </div>
                    </div>

                    <div class="row mb-3">
                        <div class="col">
                           <h5 style="color: red;">필요스택: </h5>
                        </div>
                        <div class="col-10">
                            	<c:forEach items="${stackList }" var="stackList">
                            	<div class="form-check form-check-inline">
                            	 <input class="form-check-input" type="checkbox" name="stack_category_no"value="${stackList.stack_category_no }">
                               		 <label class="form-check-label" for="inlineCheckbox1">${stackList.category_name }</label>
                              	</div>
                                </c:forEach>
                     
                        </div>
                    </div>

                    <div class="row">
                        <div class="col">
                            <div class="form-floating">
                                <textarea class="form-control" name="simpleContent" placeholder="Leave a comment here" id="floatingTextarea2" style="height: 200px"></textarea>
                                <label for="floatingTextarea2">프로젝트 소개글</label>
                                <input type="hidden" name="member_no" value="${sessionUser.member_no }">
                            </div>
                        </div>
                    </div>
              
                <div class="row">
                    <div class="form-col mt-3" style="text-align:end;">
                        <button type="button" class="btn btn-warning"  onclick="self.close()" style="border-radius:5px;">목록</button>
                        <button class="btn btn-warning" type="submit" style="border-radius:5px; margin-left: 10px;">개설</button>
                    </div>
                </div>
         
            </div>
            <div class="col"></div>
        </div>
    </div>
    </form>



















    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="../resoures/tool_js/scripts.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js"></script>
    <script src="assets/demo/chart-area-demo.js"></script>
    <script src="assets/demo/chart-bar-demo.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest"></script>
    <script src="js/datatables-simple-demo.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js"></script>

</body>

</html>