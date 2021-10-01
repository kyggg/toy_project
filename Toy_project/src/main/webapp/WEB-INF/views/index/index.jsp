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
<link rel="shortcut icon" type="image/x-icon" href="../resources/img/favicon.ico"/>
<style type="text/css">

html{
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
	height: auto;
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
  
  .nav-link{
	   color:black;
  }
  
  .nav-link:hover{
     color:#00C473;
}

.balloon {
   position: fixed;
   top:475px;
   left:320px;
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

function checkId() {
	   
	   var memberId = document.getElementById("memberId").value;
	   var frmSubmit = document.getElementById("frm");
	   var checkIdBox = document.getElementById("checkIdBox");
	   
	   //AJAX API 사용....
	   var xmlhttp = new XMLHttpRequest();
	   
	   //서버에서 응답 후 처리 로직.
	   xmlhttp.onreadystatechange = function(){
	      if(xmlhttp.readyState==4 && xmlhttp.status==200){
	         var data = JSON.parse(xmlhttp.responseText)
	         
	         if(data.checkId == 0){
	            var inputBox = document.getElementById("inputBox")
	            var clncheckIdBox = checkIdBox.cloneNode(true);
	            clncheckIdBox.style.removeProperty("display");
	            inputBox.appendChild(clncheckIdBox);
	            setTimeout(function deleteBox() {
	               clncheckIdBox.remove();
	            },2000);
	         }else{
	            frmSubmit.submit();
	         }
	      }
	   };
	   //post 방식으로 파라미터 보내는법...
	   xmlhttp.open("post" , "../member/checkId.do");
	   xmlhttp.setRequestHeader("Content-type","application/x-www-form-urlencoded");
	   xmlhttp.send("member_id=" + memberId);
	   
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
					<div class="col" style="align-self: center; margin-left: 50px; text-align: center;" >
						<div class="row mt-5 mb-5" style="padding-top: auto;">
							<div class="col">
								<div class="row mt-5 mb-5">
									<div class="col" style="text-align: start;">
										<h1 style="color: #fff; font-weight: 700;" >TOY PROJECT</h1>
										<h4 style="font-weight: 600;">사람들과 함께하여 당신이 원하는 모든것을 만들어보세요.</h4>
									</div>
								</div>
								<form action="../member/signInPage.do" id="frm" method="post">
									<div class="row">
										<div class="col" id="inputBox" style="align-self: center; text-align: center;">
											<input type="email" name="member_id" class="form-control" style="border-radius: 10px; height: 50px" id="memberId" placeholder="Email을 입력해주세요.">
										</div>
										<div class="col-3" style="align-self: center; text-align: center; margin: auto;">
											<button type="button" class="btn-lg btn-info" style="padding: 7px; color:#fff; border-radius: 10px; text-align: center;" onclick="checkId()"><strong>Sign in</strong></button>
										</div>
									</div>
								</form>
							</div>
						</div>
					</div>
					<div class="col-6">
						<img alt="" src="../resources/img/mainmain.png" style="width: 700px">
					</div>
				</div>
		</div>
		<footer>
			<div class="row mt-3">
				<img alt="" src="../resources/img/footer.png">
			</div>
		</footer>
	</div>
	
	<div class="balloon top" id="checkIdBox" style="display: none;"><span>아이디가 존재하지 않거나 유효하지 않습니다.</span></div>
	<!-- Javascript files-->
	<script src="../resources/js/jquery.min.js"></script>
	<script src="../resources/js/popper.min.js"></script>
	<script src="../resources/js/bootstrap.bundle.min.js"></script>
	<script src="../resources/js/jquery-3.0.0.min.js"></script>
	<script src="../resources/js/plugin.js"></script>
</body>

</html>