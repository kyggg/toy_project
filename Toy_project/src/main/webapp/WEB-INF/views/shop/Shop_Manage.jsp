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
	<div class="row" id="main-row">
	
		<div class="col-2" style="margin-top: 100px;" >
            
      <div class="flex-shrink-0 p-3" style="width: 280px;  background-color:transparent;">
    <a  class="d-flex align-items-center pb-3 mb-3 link-dark text-decoration-none border-bottom">
      <svg class="bi me-2" width="30" height="24"><use xlink:href="#bootstrap"/></svg>
      <span class="fs-5 fw-semibold">MENU</span>
    </a>
    <ul class="list-unstyled ps-0">
      <li class="mb-1">
        <button class="btn btn-toggle align-items-center rounded collapsed" style="background-color:transparent;" onClick="location.href='./Shop_Main.do'">
          Home
        </button>
      
      </li>
      <li class="mb-1">
        <button class="btn btn-toggle align-items-center rounded collapsed" style="background-color:transparent;" onClick="location.href='./Shop_ClientShopView.do'">
          Client View
        </button>
      
     </li>
  					<li class="mb-1">
						<button style="background-color:transparent;"
							class="btn btn-toggle align-items-center rounded collapsed"
							onClick="location.href='./Shop_PurchaseHistory.do?member_no=${sessionUser.member_no }'">
							<img src="../resources/img/s_purchase.png" alt="">
							Purchase
						</button>
					</li>
      
     		 <li class="mb-1">
				<button style="background-color:transparent;"
					class="btn btn-toggle align-items-center rounded collapsed"
					onClick="location.href='./Shop_ShopLikeList.do?member_no=${sessionUser.member_no }'">
					<img src="../resources/img/s_home.png" alt=""> MyShopLike								
				</button>

			</li>
      
     
      <li class="border-top my-3"></li>
      
    </ul>
  </div>
             
            </div>
            
		<div class="col-8">
			<div class="row" style="height: 120px;">
                    <div class="col" style="text-align: center; align-self: center;">
                        <h1>Shop Manage Page</h1>
                    </div>
                </div>
               
                <div class="row">
                    <div class="col">
                        <table class="table" >
                            <thead>
                                <tr style="text-align: center;">
                                    <th scope="col" style="width: 10%;">NO</th>
                                   <!--  <th scope="col" style="width: 10%;">구분</th> -->                                   
                                    <th scope="col" style="width: 40%;">Shop List</th>                                
                                    <!-- <th scope="col" style="width: 15%;">판매자</th> -->
                                    <th scope="col" style="width: 10%;">Date</th>
                                </tr>
                            </thead>
                            <tbody style="text-align: center; back">
                               
                               <c:forEach items="${shoplist }" var="data">
								<tr>
									<td>${data.shopVo.shop_no }</td>
									<!-- <td>${data.skillName.skill_category_name }</td> -->
									<td><a style="text-decoration:none; color:black;" href="./Shop_View.do?shop_no=${data.shopVo.shop_no }">${data.shopVo.shop_name }</a></td>
									<!-- <td>${data.memberVo.member_name }</td> -->
									<td><fmt:formatDate value="${data.shopVo.shop_date }"
											pattern="MM.dd" /></td>
								</tr>
							</c:forEach>
            
                            </tbody>
                        </table>
                    </div>
                </div>
                <div class="row mt-2">
                    <div class="col-2 mt-2"></div>
                    <div class="col mt-2" style="display: flex; justify-content: center; ">
                        <nav aria-label="...">
							<ul class="pagination my-0" >
								<c:choose>
									<c:when test="${beginPage <= 1 }">
										<li class="page-item disabled"><a class="page-link" href="./Shop_Manage.do?page_num=${beginPage-1 }${addParam}">&lt;</a></li>										
									</c:when>
									<c:otherwise>
										<li class="page-item"><a class="page-link" href="./Shop_Manage.do?page_num=${beginPage-1 }${addParam}">&lt;</a></li>																				
									</c:otherwise>
								</c:choose>
								
								<c:forEach begin="${beginPage }" end="${endPage }" var="i">
									<c:choose>
										<c:when test="${currentPage == i }">
											<li class="page-item active"><a class="page-link" href="./Shop_Manage.do?page_num=${i}${addParam}">${i}</a></li>																														
										</c:when>
										<c:otherwise>
											<li class="page-item"><a class="page-link" href="./Shop_Manage.do?page_num=${i}${addParam}">${i}</a></li>																				
										</c:otherwise>
									</c:choose>
								</c:forEach>
								<c:choose>
									<c:when test="${endPage >= totalPageCount }">
										<li class="page-item dsabled"><a class="page-link" href="./Shop_Manage.do?page_num=${endPage+1 }${addParam}">&gt;</a>							
									</c:when>
									<c:otherwise>
										<li class="page-item"><a class="page-link" href="./Shop_Manage.do?page_num=${endPage+1 }${addParam}">&gt;</a>																
									</c:otherwise>
								</c:choose>
							</ul>
						</nav>
                    </div>
                    <div class="col-2 mt-2">
                            
                        
                     	<button class="btn-lg btn-info" onClick="location.href='./Shop_Register.do'" style="margin-left: 10px; padding: 7px; background-color:transparent; color:#1AAB8A;"><strong>Register</strong></button>                     
                       
                    </div>

                </div>

			</div>
			<div class="col-2"></div>
		
	</div>

</div>

		<footer>
			<div class="row mt-3">
				<img alt="" src="../resources/img/footer.png">
			</div>
		</footer>
</div>


<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-U1DAWAznBHeqEIlVSCgzq+c9gqGAJn5c/t99JyeKa9xxaYpSvHU5awsuZVVFIhvj"
		crossorigin="anonymous"></script>
</body>
</html>