<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css">

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
	background: linear-gradient(45deg, #fff, white 10%, #1E90FF);
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
}

footer {
	position: absolute;
	bottom: 0;
	width: 100%;
	height: 70px;
	background: #fff;
}

#xx {
	text-align: center;
	justify-content: center;
}

li ul li:hover {
	background: #00C473;
}

a {
	text-decoration-line: none;
}

.nav-link {
	color: black;
}

.nav-link:hover {
	color: #00C473;
}
	
.balloon {
   position: fixed;
   top:475px;
   left:350px;
   display: inline-block;
}
 
.balloon span {
   display: inline-block;
   padding: 10px;
   color: red;
   background: white;
   border-radius: 10px;
}

.balloon:after {
   content: '';
   position: absolute;
   width: 0;
   height: 0;
   border-style: solid;
}

.balloon.top:after {
   border-width: 15px 10px;
   left: 50%;
   margin-left: -10px;
}

.balloon.top:after {
   border-color: white transparent transparent transparent;
   bottom: -25px;
}

</style>
  <script type="text/javascript">
    function verification(){

        var id = document.getElementById("email_id").value

        var xmlhttp = new XMLHttpRequest();

        xmlhttp.onreadystatechange = function(){
            if(xmlhttp.readyState==4 && xmlhttp.status==200){

                var result = JSON.parse(xmlhttp.responseText);

                var verificationId = document.getElementById("confirmId");

                if(result.verificationId == 0){
                    verificationId.innerText = "사용 가능한 아이디 입니다.";
                    verificationId.style.color = "green";
                }
                else{
                    verificationId.innerText = "이미 존재하는 아이디 입니다."
                    verificationId.style.color = "red";
                }
            }
        };

        xmlhttp.open("post" , "./verificationId.do");
        xmlhttp.setRequestHeader("Content-type","application/x-www-form-urlencoded");
        xmlhttp.send("member_id=" + id);
    }
    
    function comparePassword(){
        
        var password = document.getElementById("pass").value

        var checkPassword = document.getElementById("ckpass").value
        
        var checkpass = document.getElementById("checkPass")
        if(password == checkPassword){
            checkpass.innerText = "비밀번호 일치"
            checkpass.style.color = "green"
        } else{
            checkpass.innerText = "비밀번호 불일치"
            checkpass.style.color = "red"
        }

    }
    
    
    function checkPassword(){
        var memberPw = document.getElementById("memberPw").value;
        var frmSubmit = document.getElementById("frm");
        var checkPwBox = document.getElementById("checkPwBox");
        //AJAX API 사용....
        var xmlhttp = new XMLHttpRequest();
        
        //서버에서 응답 후 처리 로직.
        xmlhttp.onreadystatechange = function(){
           if(xmlhttp.readyState==4 && xmlhttp.status==200){
              var data = JSON.parse(xmlhttp.responseText)
              
              if(data.checkPassword == 0){
                 var inputBox = document.getElementById("inputBox")
                 var clncheckPwBox = checkPwBox.cloneNode(true);
                 clncheckPwBox.style.removeProperty("display");
                 inputBox.appendChild(clncheckPwBox);
                 setTimeout(function deleteBox() {
                    clncheckPwBox.remove();
                 },2000);
              }else{
                 frmSubmit.submit();
              }
           }
        };

        xmlhttp.open("post" , "../member/checkPassword.do");
        xmlhttp.setRequestHeader("Content-type","application/x-www-form-urlencoded");
        xmlhttp.send("member_pw=" + memberPw);
        
     }
   </script>

</head>
<body>
	<div id="wrapper">
			<header>
			<nav class="navbar navbar-expand-lg navbar navbar-white bg-white" style="height: 80px; font-size: 21px;">
				<div class="container-fluid">
					<div class="col-1"></div>
					<div class="col" style="text-align: center; align-self: center;">
						<img alt="" src="../resources/img/Logo.png">
					</div>

					<div class="col-7">
						<div class="navbar-nav" id="xx">
							<a class="nav-link active" aria-current="page" href="#" style="margin-left: 20px;">Home</a>
							<div class="" id="navbarNavDarkDropdown">
								<ul class="navbar-nav">
									<li class="nav-item dropdown"><a class="nav-link dropdown-toggle" href="#" id="navbarDarkDropdownMenuLink" role="button"
										data-bs-toggle="dropdown" aria-expanded="false"
										style="margin-left: 20px;"> Board </a>
										<ul class="dropdown-menu dropdown-menu-dark"
										aria-labelledby="navbarDarkDropdownMenuLink">
										<li><a class="dropdown-item" href="#">Free Board</a></li>
										<li><a class="dropdown-item" href="#">QnA</a></li>
										<li><a class="dropdown-item" href="#">Skill Information</a></li>
										<li><a class="dropdown-item" href="#">Project Gallery</a></li>
									</ul></li>
								</ul>
							</div>
							<a class="nav-link" href="#" style="margin-left: 20px;">Auction</a>
							<a class="nav-link" href="../index/teamProjectPage.do"
								style="margin-left: 20px;">Team Project</a>
						</div>
					</div>

					<div class="col" style="text-align: center; align-self: center;">
						<a class="nav-link" href="#" style="margin-left: 20px; padding-top: 3px"></a>
					</div>
					<div class="col-1">
						<h3>
							<button class="btn-lg btn-info" onClick="location.href='../member/signUpPage.do'" style="margin-left: 10px; padding: 7px; color:#fff; border-radius: 10px;"><strong>Sign Up</strong></button>
						</h3>
					</div>
					<div class="col"></div>
				</div>
			</nav>
		</header>
		<!--content 시작 -->
		<div class="container-fulid" id="container">
				<div class="row mt-2">
					<div class="col-1"></div>
							<div class="col" style="align-self: center; text-align: center; margin: auto;">
								<form action="./loginProcess.do" id="frm" method="post">
		                        	<input type="hidden" name="member_id" value="${member_id}">
		                            <div class="col position-relative">
		                                <div class="col mb-3" style="justify-content: center;">
		                                    <img src="../resources/img/book.png" alt="" style="width: 200px; margin-left: 30px;">
		                                </div>
		                                <div class="col mb-3 mt-1" style="text-align: center;">
		                                    <span style="font-weight: bold">PASSWORD</span>
		                                </div>
		                                <div class="col" id="inputBox" style="text-align: center;">
		                                    <input type="password" name="member_pw" class="form-control" id="memberPw" placeholder="Password" style="border-radius: 10px; height: 50px">
		                                </div>
		                                <div class="d-grid col-8 mx-auto mt-2" style="padding: 10px;">
		                                    <button class="w-100 btn btn-info" style="padding: 7px; color:#fff; border-radius: 10px; text-align: center;" type="button" onclick="checkPassword()"><strong>Sign in</strong></button>
		                                </div>
		                            </div>
		                        </form>	
							</div>
							<div class="col-1"></div>
								<div class="col-6">
									<img alt="" src="../resources/img/joinMember.png" style="width: 700px">
								</div>
							</div>
					</div>
		<footer>
		<div class="row mt-3">
				<img alt="" src="../resources/img/footer.png">
			</div>
		</footer>
	</div>
	
	<div class="balloon top" id="checkPwBox" style="display: none;"><span>비밀번호가 유효하지 않습니다.</span></div>
	<!-- Javascript files-->
	<script src="../resources/js/jquery.min.js"></script>
	<script src="../resources/js/popper.min.js"></script>
	<script src="../resources/js/bootstrap.bundle.min.js"></script>
	<script src="../resources/js/jquery-3.0.0.min.js"></script>
	<script src="../resources/js/plugin.js"></script>
</body>

</html>