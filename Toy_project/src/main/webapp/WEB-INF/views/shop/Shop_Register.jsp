<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">

	<!-- ---------------------------------------------------------------------------------------------- -->
	<!-- basic -->
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
	
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Yanone+Kaffeesatz:wght@300&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Gowun+Batang&family=Nanum+Myeongjo:wght@700&family=Yanone+Kaffeesatz:wght@300&display=swap" rel="stylesheet">

<style type="text/css">

* { 
	font-family: 'Yanone Kaffeesatz', sans-serif; !important; 
	font-family: 'Nanum Myeongjo', serif;
}

html{
	height: 100vh;

	
}

body {
	margin: 0;
	padding: 0;
	height: 100%;
	
}

.page-link{
	background-color:transparent;
	color:#1AAB8A;
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

#main-row{
		height: 100vh;
        background-image: url('../resources/img/wallpaper.jpg');
        background-repeat : no-repeat;
        background-size : cover;
        
}

button{
  background:#1AAB8A;
  color:#fff;
  border:none;
  position:relative;
  height:60px;
  font-size:1.6em;
  padding:0 2em;
  cursor:pointer;
  transition:800ms ease all;
  outline:none;
}
button:hover{
  background:#fff;
  color:#1AAB8A;
}
button:before,button:after{
  content:'';
  position:absolute;
  top:0;
  right:0;
  height:2px;
  width:0;
  background: #1AAB8A;
  transition:400ms ease all;
}
button:after{
  right:inherit;
  top:inherit;
  left:0;
  bottom:0;
}
button:hover:before,button:hover:after{
  width:100%;
  transition:800ms ease all;
}

.list{
  background:#1AAB8A;
  color:#fff;
  border:none;
  position:relative;
  height:60px;
  font-size:1.6em;
  padding:0 2em;
  cursor:pointer;
  transition:800ms ease all;
  outline:none;
}
.list:hover{
  background:#fff;
  color:#1AAB8A;
}
.list:before,.list:after{
  content:'';
  position:absolute;
  top:0;
  right:0;
  height:2px;
  width:0;
  background: #1AAB8A;
  transition:400ms ease all;
}
.list:after{
  right:inherit;
  top:inherit;
  left:0;
  bottom:0;
}
.list:hover:before,.list:hover:after{
  width:100%;
  transition:800ms ease all;
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
			<nav class="navbar navbar-expand-lg navbar navbar-white bg-white"
				style="height: 80px; font-size: 21px;">
				<div class="container-fluid">
					<div class="col-2" style="text-align: start; align-self: center; margin-left: 26px;">
						<img alt="" src="../resources/img/ShopLogo.png"
							onClick="location.href='../index/index.do'" width="200"
							height="100" />
					</div>

					<div class="col">
						<div class="navbar-nav" id="xx">
							<a class="nav-link active" aria-current="page"
								href="../index/home.do" style="margin-left: 20px;">Home</a>
							<div class="" id="navbarNavDarkDropdown">
								<ul class="navbar-nav">
									<li class="nav-item dropdown"><a
										class="nav-link dropdown-toggle" href="#"
										id="navbarDarkDropdownMenuLink" role="button"
										data-bs-toggle="dropdown" aria-expanded="false"
										style="margin-left: 20px;"> Board </a>
										<ul class="dropdown-menu dropdown-menu-dark"
											aria-labelledby="navbarDarkDropdownMenuLink">
											<li><a class="dropdown-item" href="#">Free Board</a></li>
											<li><a class="dropdown-item" href="../board/QnAList.do">QnA</a></li>
											<li><a class="dropdown-item"
												href="../board/Tech_Main.do">Skill Information</a></li>
											<li><a class="dropdown-item" href="#">Project
													Gallery</a></li>
										</ul></li>
								</ul>
							</div>
							<a class="nav-link" href="./Shop_Main.do"
								style="margin-left: 20px;">Shop</a> <a class="nav-link"
								href="../index/teamProjectPage.do" style="margin-left: 20px;">Team
								Project</a>
						</div>
					</div>

					<div class="col-2" style="align-self: center; text-align: center; margin: auto;">
						<h3 style="margin: 0px; padding: 0px;">
							<span class="rounded-pill badge bg-success">${sessionUser.member_name }</span>
						</h3>
					</div>
				</div>
			</nav>
		</header>
    <div class="container-fluid">
        <div class="row">
            <!--메인 로우임 건들지마셈-->

            <div class="col"></div>
	
            <div class="col-8">
            	<div class="row">
            		<div class="col" style="margin-top: 60px; margin-bottom: 5px;font-size: 30px; text-align: left;"> 가게등록</div>
            		<p>나만의 개성있는 가게를 등록하세요.</p>
            	</div>      
            	<hr style="border: 0; height: 3px; background: #1AAB8A;">
            	<form id="writeForm" action="./shopRegisterProcess.do" method="POST" enctype="multipart/form-data">
            	<div class="row" style="height: 200px;">
            		<div class="col-8" style="flex-direction: column;">            		       				
       				<div style="margin-bottom: 10px;"><span>가게 이름: </span><input type="text" class="form-control" name="shop_name" style="text-align: center; display: flex; justify-content: right; width: 400px;"></div>       			       			
       				<div><span>가게 이미지: </span><input type="file" id="iamge" name="shop_image" class="form-control" style="width: 400px;" accept="image/*"  onchange="setThumbnail(event);"></div>
       				</div>
       				<div class="col-4" id="image_container" style="
       															 object-fit: cover;
       															height: 200px;																								    
															    overflow: hidden;
													            display: flex;
													            align-items: center;
													            justify-content: center;" >
       				<script> 
       				function setThumbnail(event) { 
       					var reader = new FileReader(); 
       					reader.onload = function(event) { 
       						var img = document.createElement("img"); 
       						img.setAttribute("src", event.target.result); 
       						document.querySelector("div#image_container").appendChild(img); }; 
       						reader.readAsDataURL(event.target.files[0]); } 
       				</script>

					</div>
       			</div>

            	<div class="row">
            		<div class="col">
            	    	<hr style="border: 0; height: 3px; background: #1AAB8A; margin-bottom:0;">   
            			<textarea class="form-control" id="idContent" name="shop_content" placeholder="내용입력" style="height: 250px"></textarea>
            	 		<hr style="border: 0; height: 3px; background: #1AAB8A; margin-top:0;">     
            		</div>
            	</div>
            	<div class="row" >
            		<div class="col" style="display: flex; justify-content: center; ">            
            			<button class="btn-lg btn-info" value="submit" style="font-size:1rem; padding: 6px 12px; background-color:transparent;  color:#1AAB8A;"><strong>등록</strong></button>
            			</div>
            			<div class="col" style="display: flex; justify-content: center; ">  
            			<a onClick="location.href='./Shop_Manage.do'" class="list" style="font-size:1rem; line-height:50px; padding: 6px 12px; background-color:#fff; color:#696969;">목록</a>          
            		</div>
            	</div>   
           
            	</form>   
            </div>
            
            <div class="col"></div>
            
        </div>
    </div>
    <!-- 푸터 자리 -->
</div>
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