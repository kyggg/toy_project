<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">

	<!-- ---------------------------------------------------------------------------------------------- -->
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

#main-body{
	font-family: 'Yanone Kaffeesatz', sans-serif; !important; 
	font-family: 'Nanum Myeongjo', serif;
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
<!-- body -->
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
    <!--Header 끝!!!!-->
    <div class="container-fluid" id="main-body">
        <div class="row">
            <!--메인 로우임 건들지마셈-->

            <div class="col-2"></div>

            <div class="col-8">
            
                <div class="row" style="height: 150px;">
                    <div class="col" style="text-align: center; align-self: center;">
                        <h1>${shopView.shopVo.shop_name }</h1>
                    </div>
                </div>
                
                <div class="row-1">
                    <div class="col" style="color: #1AAB8A;">
                    	<h5>판매자 정보</h5>
                    </div>
                    	<hr>
				</div>
				
				<div class="row">
					<div class="col">
						<div class="row">
							<div class="col-2">이름 : </div>	
							<div class="col"><h5 >${shopView.memberVo.member_name }</h5></div>
						</div>
						<div class="row">
							<div class="col-2 mt-5">소개 : </div>
						</div>
						<div class="row-6">	
							<div class="col mt-3" style="border:1px solid #C0C0C0; border-radius:10px;padding:10px; height:180px">${shopView.shopVo.shop_content }</div>
						</div>
					</div>
					<div class="col-5">
					<c:choose>
						<c:when test="${empty shopView.shopVo.shop_image_url}">
							<img src="../resources/img/noimg1.jpg" style="width: 450px;
																	    height: 300px;																									    
																	    background-size: cover;
																	    background-repeat: no-repeat;
																	    background-position: center;">
				    	</c:when>
				    	<c:otherwise>	
							<img src="/shopUpload/${shopView.shopVo.shop_image_url }" style="width: 450px;
																					    height: 300px;																									    
																					    background-size: cover;
																					    background-repeat: no-repeat;
																					    background-position: center;" >
					    </c:otherwise>
				    </c:choose>	
					</div>
				</div>
                <div class="row mt-3">               
                    <div class="col" style="text-align:end;">     
                    	<c:if test="${!empty sessionUser && sessionUser.member_no == shopView.memberVo.member_no }">
                    	<button class="btn-lg btn-info" onClick="location.href='./Shop_Update.do?shop_no=${shopView.shopVo.shop_no }'" style="font-size:1rem; margin-left: 10px; padding: 6px 12px;; background-color:#fff; color:#696969; "><strong>수정</strong></button>
                    	<button class="btn-lg btn-info" onClick="location.href='./deleteShopProcess.do?shop_no=${shopView.shopVo.shop_no }'" style="font-size:1rem; margin-left: 10px; padding: 6px 12px; background-color:#fff; color:#FF7F50;"><strong>삭제</strong></button>	                       	
                        </c:if>                   
                    	<button class="btn-lg btn-info" onClick="location.href='./Shop_Manage.do'" style="font-size:1rem; margin-left: 10px; padding: 6px 12px; background-color:#fff; color:#696969;"><strong>목록</strong></button>	                       	
                    </div>
                </div>
                <div class="row">
                	<div class="col" style="color: #1AAB8A;">
                		<h5>Product LIST</h5>
                	</div>
                </div>
                
                <hr style="background-color:#000000; ">
                
                <div class="row">
                    <div class="col">                        
						<table class="table">
						<tbody style="text-align: center;">
                               <!-- 내가게 물품 리스트 -->
	                                 <tr style="text-align: center;">			                       
				                            <td style="width:20%; ">상품명</td>
				                            <td>가격</td>
				                            <td style="width:15%;">수량</td>
				                 		    <td>상품설명</td>
			                        </tr>
                            <c:if test="${!empty productlist }">
				  				<c:forEach items="${productlist}" var="com">
			                        <tr style="text-align: center;">			                       
			                            <td style="width:20%;"><a style="text-decoration:none; color:black;line-height:60px;" href="./Shop_BuyProduct.do?product_no=${com.toyProductVo.product_no }">${com.toyProductVo.product_name }</a></td>
			                            <td style="line-height:60px;">${com.toyProductVo.product_price }원</td>
			                            <td style="width:10%;line-height:60px;">${com.toyProductVo.product_count }개</td>			                            
			                            <td style="line-height:60px;">${com.toyProductVo.product_content }</td>			                            
			                 		                                              
			                        </tr>
			                    </c:forEach>
			  				</c:if>
								
                            </tbody>
                        </table>
                    </div>
                </div>
                    <div class="row" style="text-align:end;">     
                    <div class="col">               				
	               		 <c:if test="${!empty sessionUser && sessionUser.member_no == shopView.memberVo.member_no }">
	               		 <button class="btn-lg btn-info" onClick="location.href='./Shop_ProductRegister.do?shop_no=${shopView.shopVo.shop_no }'" style="font-size:1rem; margin-left: 10px; padding: 6px 12px; background-color:#fff; color:#1AAB8A; border-radius: 10px;"><strong>상품등록</strong></button>	                       

	               		</c:if>
	               		</div>
                    </div>

             </div>
            <div class="col-2"></div>
        </div>


    </div>
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