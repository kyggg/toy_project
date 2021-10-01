<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">

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


<link href="https://fonts.googleapis.com/css2?family=Varela+Round&display=swap" rel="stylesheet">
<style type="text/css">



* {
   font-family: 'Yanone Kaffeesatz', sans-serif; ! important;
   font-family: 'Nanum Myeongjo', serif;
}

html {
   height: 100vh;
}

body {
   margin: 0;
   padding: 0;
   height: 100%;
}

.page-link {
   background-color: transparent;
   color: #1AAB8A;
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

#main-row {
   height: 100vh;
   background-image: url('../resources/img/wallpaper.jpg');
   background-repeat: no-repeat;
   background-size: cover;
}

button {
   background: #1AAB8A;
   color: #fff;
   border: none;
   position: relative;
   height: 60px;
   font-size: 1.6em;
   padding: 0 2em;
   cursor: pointer;
   transition: 800ms ease all;
   outline: none;
}

button:hover {
   background: #fff;
   color: #1AAB8A;
}

button:before, button:after {
   content: '';
   position: absolute;
   top: 0;
   right: 0;
   height: 2px;
   width: 0;
   background: #1AAB8A;
   transition: 400ms ease all;
}

button:after {
   right: inherit;
   top: inherit;
   left: 0;
   bottom: 0;
}

button:hover:before, button:hover:after {
   width: 100%;
   transition: 800ms ease all;
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

.card-footer{
    text-align: center;
}

/* <!-- ********************* CSS Style 동현 Input ************************ --> */
.btnRegister {
   border: none;
   border-radius: 1.5rem;
   padding: 1%;
   width: 20%;
   cursor: pointer;
   background: #00C473;
   color: #fff;
   text-align: center;
}

.icon {
 display: inline-block;
 font-size: 35px;
 color: #ffC977;
 vertical-align: middle;
}

.titletext{
  display: inline-block;
  vertical-align: middle;
}

.card-img-top {
    width: 100%;
    height: 9vw;
    object-fit: cover;
}

</style>

<body>
   <div id="wrapper">
     <header>
			<nav class="navbar navbar-expand-lg navbar navbar-white bg-white"
				style="height: 80px; font-size: 21px;">
				<div class="container-fluid">
					<div class="col-2" style="text-align: start; align-self: center; margin-left: 26px;">
						<img alt="" src="../resources/img/ShopLogo.png"
							onClick="location.href='../index/home.do'" width="200"
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
      <!-- Header 끝 -->

      <div class="container-fluid" style="padding-top: 0px;">

         <div class="row">
         
         <!-- Column Advertisement -->
            <div class="col-2"></div>   
            
            <div class="col-8" style="padding-bottom: 50px;">
            
               <div class="row">
               <!-- PRODUCT IMAGE -->
                  <div class="col" style="justify-content:center;display:felx;">
                     <div>
                        <img src="/productUpload/${productView.productVo.product_image_url }"
                           class=" img-responsive center-block d-block mx-auto;"
                           style="width: 525px; height: 600px; background-size: cover; background-repeat: no-repeat; background-position: center;">
                     </div>
                  </div>
                  
               <!-- PRODUCT BUY/구매 -->
                  <div class="col">
                     <hr>
                     <div class="row">
                        <div class="col">
                           <img class="icon" src="../resources/img/handcurser.png"
                              style="width: 30px; padding-bottom: 4px; margin-right: 5px; padding-top: 6px;">
                           <h3 class="titletext" style="margin-bottom: 0px; font-family: Graphik, sans-serif;">Check Out</h3>
                        </div>
                     </div>
                     <hr>                     
                     <br>
                     <form id="writeForm" action="./buyProductProcess.do"
                        method="post">
                        <input type="hidden" name="product_no"
                           value="${productView.productVo.product_no }">
                        <div class="row">
                           
                           <div class="col">
                              <table class="table table-sm table-borderless"
                                 style="text-align: center; margin-left: 30px; margin-right: auto;font-size: 21px;">
                                 <tr>
                                    <td style="padding-bottom: 30px;">
                                       <div class="row">
                                          <label for="colFormLabelLg" class="col-sm-2 col-form-label col-form-label-lg" style="padding-bottom: 25px; font-family: Graphik, sans-serif;">
                                            	이름
                                          </label>
                                          <div class="col-sm-15" style="padding-bottom: 25px; width: 454px;">
                                             <input type="text" class="form-control form-control-lg" id="colFormLabelLg" placeholder="Name">                                             
                                          </div>                                       
                                       </div>   
                                    </td>
                                 </tr>
                                 <tr>
                                    <td style="padding-bottom: 30px;">
                                       <div class="row">   
                                          <label for="colFormLabelLg" class="col-sm-2 col-form-label col-form-label-lg" style="padding-bottom: 40px; font-family: Graphik, sans-serif;">
                                             주소
                                          </label>
                                          <div class="col-sm-15" style="padding-bottom: 25px; width: 454px;">
                                                <input type="text" class="form-control form-control-lg" name="buy_address" id="colFormLabelLg" placeholder="Address">   
                                          </div>
                                       </div>
                                    </td>
                                 </tr>
                                 <tr>
                                    <td>
                                       <div class="md-form md-outline" style="padding-left: 2px;">
                                          <label style="padding-right: 20px; padding-left: 13px; font-family: Graphik, sans-serif;">수량</label>
                                          <input class="quantity" min="0" name="buy_count" value="1"
                                             type="number" style="width: 108px; height: 31px;">
                                       </div>
                                    </td>
                                 </tr>
                                 <tr>
                                    <td style="padding-top: 40px;">
                                       <input type="submit"
                                       class="btnRegister" value="Buy" style="width: 166px;">

                                    </td>
                                 </tr>
                              </table>
                           </div>                           
                        </div>
                     </form>

                  </div>
               </div>
               
               <!-- PRODUCT DESCRIPTION -->
               <div class="row" style="margin-top: 20px;">
                  <hr>
                  <div class="row">                  
                  <div class="col" style="padding-bottom: 8px;">
                     <img class="icon" src="../resources/img/description.png" style="height: 30px; width: 30px; margin-bottom: 7px; margin-right: 5px; margin-top: 5px;">
                     <h3 class="titletext" style="font-family: Graphik, sans-serif;">Product Description</h3>
                  </div>
                  </div>
                  <hr><br>
                  
                  <div class="col">
                     <div class="tab-pane fade show active" id="nav-home" role="tabpanel" aria-labelledby="nav-home-tab" style="font-family: Graphik, sans-serif; font-size: 25px; ">            
                        <table class="table table-sm table-borderless" style="text-align: center; margin-bottom: 25px; text-align: left;">                           
                           <tr>
                              <td style="padding-top: 25px;">가격 :</td>
                              <td style="padding-top: 25px;">$ ${productView.productVo.product_price }</td>
                           </tr>
                           <tr>
                              <td style="padding-top: 25px;">상품명 :</td>
                              <td style="padding-top: 25px;">${productView.productVo.product_name }</td>
                           </tr>
                           <tr>
                              <td style="padding-top: 25px;">상품 설명 :</td>
                              <td style="padding-top: 25px;">${productView.productVo.product_content }</td>
                           </tr>
                        </table>
                     </div>
                  </div>
               </div>
               
               <!-- Related Product / You Might Also Like -->
               <div class="row" style="margin-top: 40px;">
                  <hr>
                  <div class="row">
                  <div class="col" style="padding-bottom: 8px;">
                     <img class="icon" src="../resources/img/relatedproduct.png" style="height: 30px; width: 30px; margin-bottom: 7px; margin-right: 5px; margin-top: 5px;">
                     <h3 class="titletext" style="font-family: Graphik, sans-serif;">연관 상품</h3>
                  </div>
                  </div>
                  <hr><br><br><br>
                  <div class="row">
                  <div class="col">                     
                     <div class="row row-cols-1 row-cols-md-3 g-4" id="myCard" style="justify-content: center;" >
        
                       <div class="col-3" style="width: 225px; margin-left: 20px;">
                         <div class="card border-light mb-3" style="max-width: 13rem;">
                         <div class="card-header" style="text-align: center; font-family: Graphik, sans-serif;"><b>B&O Headphone</b></div>
                         <div class="box">
                           <img src="../resources/img/b.jpg" class="card-img-top img-fluid">
                         </div>  
                           <div class="card-footer">
                              <a href="###"><img src="../resources/img/order.png" style="width: 30px;"></a>
                           </div>
                         </div>
                       </div>
                       
                       <div class="col-3" style="width: 225px; margin-left: 20px;">
                         <div class="card border-light mb-3" style="max-width: 13rem;">
                         <div class="card-header" style="text-align: center; font-family: Graphik, sans-serif;"><b>Marshall Speaker</b></div>
                         <div class="box">
                           <img src="../resources/img/SPEAKER.jpeg" class="card-img-top img-fluid"  >
        
                         </div>  
                           <div class="card-footer">
                              <a href="###"><img src="../resources/img/order.png" style="width: 30px;"></a>
                           </div>
                         </div>
                       </div>
                       
                       <div class="col-3" style="width: 225px; margin-left: 20px;">
                         <div class="card border-light mb-3" style="max-width: 13rem;">
                         <div class="card-header" style="text-align: center; font-family: Graphik, sans-serif;"><b>Mouse</b></div>
                         <div class="box">
                           <img src="../resources/img/MOUSE.jpeg" class="card-img-top img-fluid"  >
                         </div>  
                           <div class="card-footer">
                              <a href="###"><img src="../resources/img/order.png" style="width: 30px;"></a>
                           </div>
                         </div>
                       </div>     
                       
                       <div class="col-3" style="width: 225px; margin-left: 20px;">
                         <div class="card border-light mb-3" style="max-width: 13rem;">
                         <div class="card-header" style="text-align: center; font-family: Graphik, sans-serif;"><b>Keyboard</b></div>
                         <div class="box">
                           <img src="../resources/img/keyboard.jpg" class="card-img-top"  >
                         </div>  
                           <div class="card-footer">
                               <a href="###"><img src="../resources/img/order.png" style="width: 30px;"></a>
                           </div>
                         </div>
                       </div>
                                      
                     </div>
                  </div>
                  </div>
               </div>
            
            </div>
            
         <!-- Column Advertisement -->
            <div class="col-2"></div>   
         
         </div>
      </div>   
      
      <!-- FOOTER -->
      <footer>
         <div class="row mt-3">
            <img alt="" src="../resources/img/footer.png">
         </div>
      </footer>   
   </div>   
         
         
         
         
         
         
         
         
         
         
         
         
         
         
         
         
         
         


   <script
      src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.bundle.min.js"></script>
   <script src="../resoures/tool_js/scripts.js"></script>
   <script
      src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js"></script>
   <script src="assets/demo/chart-area-demo.js"></script>
   <script src="assets/demo/chart-bar-demo.js"></script>
   <script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest"></script>
   <script src="js/datatables-simple-demo.js"></script>
   <script
      src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js"></script>

   <script
      src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.bundle.min.js"
      integrity="sha384-U1DAWAznBHeqEIlVSCgzq+c9gqGAJn5c/t99JyeKa9xxaYpSvHU5awsuZVVFIhvj"
      crossorigin="anonymous"></script>

</body>
</html>