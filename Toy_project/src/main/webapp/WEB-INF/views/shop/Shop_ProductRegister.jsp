<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
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
            background-blend-mode: normal, lighten, soft-light;
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
            margin-left: 330px;
        }

        footer {
            position: absolute;
            bottom: 0;
            width: 100%;
            height: 30px;
            background: #fff;
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

/* MY CSS INPUT */
.title {
   text-align: center;
   height: 80px;
   background-image: linear-gradient(rgb(211, 211, 211), rgb(255, 255, 255));
   color: black;
   font-weight: bold;
   line-height: 80px;
}

.btnRegister {
   border: none;
   border-radius: 1.5rem;
   padding: 1%;
   width: 150px;
   cursor: pointer;
   background: #00C473;
   color: #fff;
   text-align: center;
}



.image-preview {
   width: 534px;
   min-height: 250px;
   border: 2px solid #dddddd;
   margin-top: 15px;
   
   display: flex;
   align-items: center;
   justify-content: center;
   font-weight: bold;
   color: #cccccc;
}

.image-preview__image {
   display: none;
   width: 100%;
}
        footer {
            position: absolute;
            bottom: 0;
            width: 100%;
            height: 30px;
            background: #fff;
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
      <div class="container-fluid">

         <div class="row">
            <div class="col-2"></div>
            <div class="col-8">
               <br>
               <div class="row">

                  <div class="title" style="font-family: Graphik, sans-serif;">
                     <h2 style="padding-top: 15px;">Register Product</h2>
                  </div>

                  <br> <br>
                  <hr>
                  <br>

                  <form action="./productRegisterProcess.do" method="post" enctype="multipart/form-data" style="padding-bottom: 20px;">
                     
                     <input type="hidden" name="shop_no" value="${content.shopVo.shop_no }">
                        
                     <!-- MY WORK -->
                     <div class="row">

                        <div class="col"></div>

                        <div class="col-5" style="padding-top: 15px; margin-top: 40px;">
                           <div class="input-group mb-3" style="padding-bottom: 30px;">
                              <span class="input-group-text">Product Name</span> 
                              <input type="text" class="form-control" name="product_name" placeholder="Name">
                           </div>

                           <div class="input-group mb-3" style="padding-bottom: 30px;">
                              <span class="input-group-text" style="width: 131px;">Product Price</span>
                              <input type="text" class="form-control" name="product_price"  placeholder="Price">   
                           </div>

                           <div class="input-group mb-3">
                              <span class="input-group-text">Product Count</span> 
                              <input type="text" class="form-control" name="product_count" placeholder="Count">
                           </div>
                        </div>

                        <div class="col-5" style="padding-top: 15px; margin-left: 30px;">
                           <div class="image-preview" id="imagePreview">
                              <img src="" alt="Image Preview" class="image-preview__image">
                              <span class="image-preview__default-text">Image Preview</span>                           
                           </div>
                           <input id="inpFile" class="form-control form-control-user" type="file" name="product_image" accept="image/*" style="margin-top: 35px;">
                        </div>            

                        <div class="col"></div>
                        
                     </div>


                     <br>
                     <hr>
                     <br> <br>

                     <div class="row">                     
                        <div class="col-1"></div>

                        <div class="col">
                           <div class="row">
                              <div class="input-group">
                                 <span class="input-group-text">Product Description</span>
                                 <textarea class="form-control" aria-label="With textarea"
                                    name="product_content"></textarea>
                              </div>
                           </div>
                        </div>

                        <div class="col-1"></div>

                        <div class="row" style="padding-top: 30px; padding-bottom: 20px;">                           
                           <div class="col"></div>
                           <div class="col-6 text-center">
                              <input type="submit" class="btnRegister" value="Register" style="margin-right: 30px;">
                           
                           </div>
                           <div class="col"></div>
                        </div>
                        
                     </div>
                     
                     
                     <hr>
                  </form>
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
   
         <!-- 이미지 미리보기 Image Preview -->
         <script>
            const inpFile = document.getElementById("inpFile");
            const previewContainer = document
                  .getElementById("imagePreview");
            const previewImage = previewContainer
                  .querySelector(".image-preview__image");
            const previewDefaultText = previewContainer
                  .querySelector(".image-preview__default-text");
            
         

            inpFile.addEventListener("change", function() {
               const file = this.files[0];

               if (file) {
                  const reader = new FileReader();

                  previewImage.style.display = "none";
                  previewDefaultText.style.display = "block";

                  reader.addEventListener("load", function() {
                     console.log(this);
                     previewImage.setAttribute("src", this.result);
                     previewImage.style.display = 'block';
                     previewDefaultText.style.display = "none"
                     
                     
                     document.getElementById("ttt2").setAttribute("src", this.result);
                  });

                  reader.readAsDataURL(file);
               }else {
                  previewDefaultText.style.display = null;
                  previewDefaultText.style.display = null;
                  previewImage.setAttribute("src","");
               }
            });
         </script>
   
      
   
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
</body>
</html>