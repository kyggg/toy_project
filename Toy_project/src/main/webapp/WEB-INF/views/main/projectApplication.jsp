<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css" rel="stylesheet"
    integrity="sha384-KyZXEAg3QhqLMpG8r+8fhAXLRk2vvoC2f3B09zVXn8CA5QIVfZOJ3BCsw2P0p/We" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css">
<link rel="stylesheet" href="projectTool.css">

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


	function insertApprove() {
		
		var frm = document.getElementById("frm");
		
		frm.submit();
	
	//	window.open("about:blank","_self").close();
	}
	
	
</script>



<body>
<form action="./ApplicationProcess.do" method="post" id="frm">
    <div class="container-fluid">
        <div class="row">
            <!--메인 로우임 건들지마셈-->
            <div class="col"> </div>
            <div class="col-9">
                <div class="row" style="height: 100px;">
                    <div class="col" style="text-align: center; align-self: center;">
                        <h3>신청서</h3>
                    </div>
                </div>
                <div class="row">
                    <div class="col">
                        <div class="form-floating">
                            <textarea class="form-control" placeholder="Leave a comment here" style="height: 200px" name="application_content"></textarea>
                            <label for="floatingTextarea2">소개글</label>
                            	<input type="hidden" name="member_no" value="${member_no}">
								<input type="hidden" name="room_no" value="${room_no}">
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="form-col mt-3" style="text-align:end;">
                        <button type="button" class="btn btn-warning" onclick="self.close()" style="border-radius:5px;">취소</button>
                        <button type="button" class="btn btn-warning" onclick="insertApprove()" style="border-radius:5px; margin-left: 10px;">신청하기</button>
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