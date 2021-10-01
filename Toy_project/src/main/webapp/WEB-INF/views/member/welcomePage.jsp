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
</style>

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
        <div class="row mt-0">
            <div class="col-10 mt-0" style="align-self: center; text-align: center; margin: auto;" > 
             <img src="../resources/img/loginSu.png" alt=""> 
            </div>
        </div>
        <div class="row">
            <div class ="col-5 mt-3" style="align-self: center; text-align: center; margin: auto;" >
                 <button type="submit" onclick="location.href='../index/index.do'" class="w-100 btn btn-info" style="padding: 7px; color:#fff; border-radius: 10px; text-align: center;">login</button>
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