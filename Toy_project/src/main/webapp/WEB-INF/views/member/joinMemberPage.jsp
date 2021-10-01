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
                    document.getElementById("email_id").classList.add('is-valid');
                }
                else{
                    verificationId.innerText = "이미 존재하는 아이디 입니다."
                    verificationId.style.color = "red"; 
                    document.getElementById("email_id").classList.add('is-invalid');
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
            document.getElementById("pass").classList.add('is-valid');
        }else{
            checkpass.innerText = "비밀번호 불일치"
            checkpass.style.color = "red"
        }

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
						<img alt="" src="../resources/img/Logo.png" onClick="location.href='../index/index.do'">
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
							<a class="nav-link" href="#" style="margin-left: 20px;">Shop</a>
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
								<form action="./signUpProcess.do" method="post" id="checkInput">
									<div class="col mb-3" style="text-align: center;">
										<span style="font-weight: bold" > JOIN MEMBER </span>
									</div>
									<div class="row">
										<div class="input-group mb-3" style="align-self: center; text-align: center; margin: auto;">
											<div class="col-3" style="align-self: center; text-align: center; margin: auto;">
												<span style="font-weight: bold" >E-mail</span>&nbsp;&nbsp;
											</div>
											<div class="col">
												<input type="email" id="email_id" name="member_id"
													class="form-control" style="border-radius: 10px;"
													placeholder="E-mail을 입력해주세요." onblur="verification()" required>
											</div>
										</div>
										<div class="row mb-3">
										<div class="col" style="align-self: center; text-align: center; margin: auto;">
											<span id="confirmId" style="font-weight: bold" ></span>
										</div>
										</div>
										<div class="input-group mb-3">
											<div class="col-3" style="align-self: center; text-align: center; margin: auto;">
												<span style="font-weight: bold" >Password</span>&nbsp;&nbsp;
											</div>
											<div class="col" style="align-self: center; text-align: center; margin: auto;">
												<input type="password" name="member_pw" id="pass"
													class="form-control" style="border-radius: 10px;"
													placeholder="Password를 입력해주세요." required>
											</div>
										</div>
										<div class="input-group mb-3">
											<div class="col-3" style="align-self: center; text-align: center; margin: auto;">
												<span style="font-weight: bold" >Pw-check</span>&nbsp;&nbsp;
											</div>
											<div class="col" style="align-self: center; text-align: center; margin: auto;">
												<input type="password" class="form-control" id="ckpass"
													style="border-radius: 10px;"
													placeholder="Password를 확인해주세요." onkeyup="comparePassword()" required>
											</div>
										</div>
										<div class="row mb-3">
											<div class="col" style="align-self: center; text-align: center; margin: auto;">
												<span id="checkPass" style="font-weight: bold" ></span>
											</div>
										</div>
										<div class="input-group mb-3">
											<div class="col-3" style="align-self: center; text-align: center; margin: auto;">
												<span style="font-weight: bold" >Name</span>&nbsp;&nbsp;
											</div>
											<div class="col" style="align-self: center; text-align: center; margin: auto;" >
												<input type="text" name="member_name" class="form-control"
													style="border-radius: 10px;" placeholder="Name를 입력해주세요." required>
											</div>
										</div>
									</div>
									<input type="hidden" name="member_date">
									<div class="d-grid col-8 mb-3 mx-auto" style="padding: 10px;">
										<button class="w-100 btn btn-info" style="padding: 7px; color:#fff; border-radius: 10px; text-align: center;" value="submit"><strong>Sign Up</strong></button>
									</div>
								</form>
							</div>
							<div class="col-1"></div>
								<div class="col-6">
									<img alt="" src="../resources/img/join.png" style="width: 700px">
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
</body>

</html>