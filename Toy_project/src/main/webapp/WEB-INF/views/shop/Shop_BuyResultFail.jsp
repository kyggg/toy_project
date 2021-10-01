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

@font-face {
    font-family: 'GmarketSansBold';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2001@1.1/GmarketSansBold.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}

html {
	height: 100vh;
}

body {
	font-family: 'GmarketSansBold';
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
</style>
</head>

<body>
	<div id="wrapper">
		
		<div class="container-fluid">

			<div class="row">
				<div class="col-8" style="margin-top: 60px; margin-bottom: 30px; margin-left:70px;font-size: 30px;">
					구매실패</div>
				<div class="col" style="margin-top: 60px;text-align: center; "><span">01장바구니> 02주문/결제></span> <span style="font-size: 20px;color: #DC143C;">03구매실패</span></div>
				<hr>
			</div>

			<div class="row">
				<div class="col-3"></div>

				<div class="col-6">
					<div class="row">
						<div class="col" style="margin-top: 40px; display: flex; justify-content: center;">
							<img src="../resources/img/bus.png"
								style="width: 350px; height: 250px; background-size: cover; background-repeat: no-repeat; background-position: center;">
						</div>
						<div style="text-align: center; font-size: 40px;">주문이 정상적으로 완료되지않았습니다.</div>
						<div style="text-align: center; margin-bottom: 20px;">자세한 구매내역 확인은 주문내역에서 확인하실 수 있습니다.</div>
						<hr>
					</div>
					<div class="row" style="margin-top:20px;margin-bottom: 10px;">
						<div class="col" style="text-align: center; font-size: 20px; color: #DC143C;">구매실패사유
							<p style="margin-top:20px; color: #000000;font-size: 25px; ">수량부족</p>
						</div>																			
					</div>
					<hr>
					<div class="row">
						<div class="col" style="display: flex; justify-content: center;">
							<button class="btn-lg btn-info" onClick="location.href='./Shop_Main.do'" style="font-size:1rem; margin-left: 10px; padding: 6px 12px; background-color:#fff; color:#696969; border-radius: 10px;"><strong>홈으로</strong></button>	                       
						</div>					
						<div class="col" style="display: flex; justify-content: center;">
							<button class="btn-lg btn-info" onClick="location.href='./Shop_PurchaseHistory.do?member_no=${sessionUser.member_no }'" style="font-size:1rem; margin-left: 10px; padding: 6px 12px; background-color:#fff; color:#696969; border-radius: 10px;"><strong>구매내역</strong></button>	                       
						</div>					
					</div>				
				</div>

				<div class="col-3"></div>

			</div>

		</div>
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
</body>
</html>