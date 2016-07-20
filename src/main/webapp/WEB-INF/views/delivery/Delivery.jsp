<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">

<!-- Bootstrap Core CSS -->
<link href="bootstrap/css/bootstrap.min.css" rel="stylesheet">

<!-- Custom CSS -->
<link href="bootstrap/css/stylish-portfolio.css" rel="stylesheet">

<!-- Custom Fonts -->
<link href="bootstrap/font-awesome/css/font-awesome.min.css"
	rel="stylesheet" type="text/css">
<link
	href="http://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,700,300italic,400italic,700italic"
	rel="stylesheet" type="text/css">

<!-- jQuery -->
<script src="bootstrap/js/jquery.js"></script>

<!-- Bootstrap Core JavaScript -->
<script src="bootstrap/js/bootstrap.min.js"></script>
<!-- Custom Theme JavaScript -->
<script>
	// Scrolls to the selected menu item on the page
	$(function() {
		//ToolTip
		$('[data-toggle="tooltip"]').tooltip();

		// Closes the sidebar menu
		$("#menu-close").click(function(e) {
			e.preventDefault();
			$("#sidebar-wrapper").toggleClass("active");
		});

		// Opens the sidebar menu
		$("#menu-toggle").click(function(e) {
			e.preventDefault();
			$("#sidebar-wrapper").toggleClass("active");
		});

		//Coffee-Material-Btn Click Show Coffee Product
		$("#Coffee-Material-Btn").click(function() {
			if ($("#Cake_Product").css("display") == "block") {
				$("#Cake_Product").slideUp(0);
				$("#Coffee_Product").slideDown(400);
				return false;
			}
			$("#Coffee_Product").slideDown(400);
		});
		//Cake-Material-Btn Click Show Cake Product
		$("#Cake-Material-Btn").click(function() {
			if ($("#Coffee_Product").css("display") == "block") {
				$("#Coffee_Product").slideUp(0);
				$("#Cake_Product").slideDown(400);
				return false;
			}
			$("#Cake_Product").slideDown(400);
		});
		//Material-Order-Cancel-Btn Click Hide Product Div
		$("#Material-Order-Cancel-Btn").click(function() {
			if ($("#Coffee_Product").css("display") == "block") {
				$("#Coffee_Product").slideUp(400);
				return false;
			}
			if ($("#Cake_Product").css("display") == "block") {
				$("#Cake_Product").slideUp(400);
				return false;
			}
		});
		//Change-Store-Btn Click Show Select Store Drop Down Menu
		$("#Change-Store-Btn").click(function() {
			$("#menu-toggle").trigger('click');
			$("#Select-Store-Btn").trigger('click');
		});
		//Coffee-Product-Order-Btn Click Show Confrim Order
		$("#Coffee-Product-Order-Btn").click(function(){
			if(confirm("이대로 주문하시겠습니까?")){
				$(this).attr("href", "front?cmd=material_order_confirm")
			}
		});
		//Cake-Product-Order-Btn Click Show Confrim Order
		$("#Cake-Product-Order-Btn").click(function(){
			if(confirm("이대로 주문하시겠습니까?")){
				$(this).attr("href", "front?cmd=material_order_confirm")
			}
		});
		//Material-Quantity-Plus-Btn Click Quantity +1
		$(".Material-Quantity-Plus-Btn").click(function(){
			var index = $(".Material-Quantity-Plus-Btn").index(this);
			var quantity = $(".Material-Quantity").eq(index);
			$(quantity).text(Number($(quantity).text()) + 1);
		});
		//Material-Quantity-Minus-Btn Click Quantity -1
		$(".Material-Quantity-Minus-Btn").click(function(){
			var index = $(".Material-Quantity-Minus-Btn").index(this);
			var quantity = $(".Material-Quantity").eq(index);
			if($(quantity).text() == 1){
				alert("더 이상 수량을 감소시킬 수 없습니다.");
				return false;
			}
			$(quantity).text(Number($(quantity).text()) -1);
		});
		//Material-Cart-List-Remove-Btn Click List Remove
		$(".Material-Cart-List-Remove-Btn").click(function(){
			var index = $(".Material-Cart-List-Remove-Btn").index(this);
			$(".Material-Cart-List-Remove-Btn").eq(index).parent().remove();
		});
		
		$(window).scroll(function () {
			var scroll = $(document).scrollTop();
			//Scroll In Services Area Show Cart Div 
			if(scroll > 825 && scroll < 1800){
				$("#Material-Cart-Div").show();
			}
			else{
				$("#Material-Cart-Div").hide();
			}
		}); 
	});
</script>
<style>
.btn-success {
	background-color: #18bc9c !important;
}
</style>
</head>

<body>
	<!-- Cart -->
	<div id="Material-Cart-Div" class="col-sm-2" style="color:white; display:none; background-color:black; opacity: 0.5; margin-right: 0px !important; position: fixed;">
		<h4>장바 구니</h4>
		<ul class="list-group" style="color:black">
		  <div>
			  <li class="list-group-item">
			    <span class="Material-Quantity badge">14</span>
			    계피가루
			  </li>
			  <a data-toggle="tooltip" data-placement="top" title="수량 +1" class="Material-Quantity-Plus-Btn btn btn-success"><em class="fa fa-plus-circle" aria-hidden="true"></em></a>
			  <a data-toggle="tooltip" data-placement="top" title="수량 -1" class="Material-Quantity-Minus-Btn btn btn-primary"><em class="fa fa-minus-circle" aria-hidden="true"></em></a>
			  <a data-toggle="tooltip" data-placement="top" title="상품 취소" class="Material-Cart-List-Remove-Btn btn btn-danger"><em class="fa fa-times" aria-hidden="true"></em></a>
		  </div>
		  <div>
			  <li class="list-group-item">
			    <span class="Material-Quantity badge">14</span>
			    송진가루
			  </li>
			  <a data-toggle="tooltip" data-placement="top" title="수량 +1" class="Material-Quantity-Plus-Btn btn btn-success"><em class="fa fa-plus-circle" aria-hidden="true"></em></a>
			  <a data-toggle="tooltip" data-placement="top" title="수량 -1" class="Material-Quantity-Minus-Btn btn btn-primary"><em class="fa fa-minus-circle" aria-hidden="true"></em></a>
			  <a data-toggle="tooltip" data-placement="top" title="상품 취소" class="Material-Cart-List-Remove-Btn btn btn-danger"><em class="fa fa-times" aria-hidden="true"></em></a>
		  </div>
		  <div>
			  <li class="list-group-item">
			    <span class="Material-Quantity badge">14</span>
			    원두
			  </li>
			  <a data-toggle="tooltip" data-placement="top" title="수량 +1" class="Material-Quantity-Plus-Btn btn btn-success"><em class="fa fa-plus-circle" aria-hidden="true"></em></a>
			  <a data-toggle="tooltip" data-placement="top" title="수량 -1" class="Material-Quantity-Minus-Btn btn btn-primary"><em class="fa fa-minus-circle" aria-hidden="true"></em></a>
			  <a data-toggle="tooltip" data-placement="top" title="상품 취소" class="Material-Cart-List-Remove-Btn btn btn-danger"><em class="fa fa-times" aria-hidden="true"></em></a>
		  </div>
		</ul>
	</div>
	<!-- Navigation -->
	<a id="menu-toggle" href="#" class="btn btn-dark btn-lg toggle"><i
		class="fa fa-bars"></i></a>
	<nav id="sidebar-wrapper">
		<ul class="sidebar-nav">
			<a id="menu-close" href="#"
				class="btn btn-light btn-lg pull-right toggle"><i
				class="fa fa-times"></i></a>
			<li class="sidebar-brand"><a href="#top">TryCatch Delivery</a></li>
			<li><a href="#top">주문 내역 보기</a></li>
			<li>
			<div class="dropdown">
				<a id="Select-Store-Btn" href="#" data-toggle="dropdown" aria-haspopup="ture" aria-expanded="true">매장 선택<span class="caret"></span></a>
				 <ul class="dropdown-menu" role="menu" aria-labelledby="Select-Store-Btn" style="color:white; background-color:black;">
				    <li><a href="#">인천점</a></li>
				    <li><a href="#">시청점</a></li>
				    <li><a href="#">연수점</a></li>
				 </ul>
			</div>
			</li>
			<li><a href="#services">서비스 시작</a></li>
			<li><a href="#contact">Contact</a></li>
			<li><a href="#top">맨 위로</a></li>
		</ul>
	</nav>

	<!-- Header -->
	<header id="top" class="header">
		<div class="text-vertical-center">
			<h1>TryCatch Delivery</h1>
			<h3>고객에게 최고의 커피 재료를 제공합니다</h3>
			<h4>
				<em class="fa fa-male fa-lg" aria-hidden="true"></em>
			</h4>
			<h4 style="font-weight:bold;">
				<span>점장1</span>님
			</h4>
			<h4>
				<a id="Change-Store-Btn" class="btn btn-success"
					style="margin-left: 12px" data-toggle="tooltip"
					data-placement="right" title="매장을 바꿀 수 있습니다."><em
					class="fa fa-bank" aria-hidden="true"></em></a>&nbsp;&nbsp;&nbsp;&nbsp;
			</h4>
			<h4>
				<span style="font-size: 13pt; font-weight:bold;">종각점</span>
			</h4>
			<br> <a href="#services" class="btn btn-dark btn-lg">주문 시작하기</a>
		</div>
	</header>
	<!-- Services -->
	<!-- The circle icons use Font Awesome's stacked icon classes. For more information, visit http://fontawesome.io/examples/ -->
	<section id="services" class="services bg-primary">
		<div class="container">
			<div class="row text-center">
				<div class="col-lg-10 col-lg-offset-1">
					<h2>Our Services</h2>
					<hr class="small">
					<div class="row col-md-offset-4">
						<div class="col-md-3 col-sm-6">
							<div class="service-item">
								<span class="fa-stack fa-4x"> <i
									class="fa fa-circle fa-stack-2x"></i> <i
									class="fa fa-coffee fa-stack-1x text-primary"></i>
								</span>
								<h4>
									<strong>커피 재료</strong>
								</h4>
								<p>계피가루, 원두 등 여러가지 재료를 주문 할 수 있습니다.</p>
								<button id="Coffee-Material-Btn" class="btn btn-light">시작</button>
							</div>
						</div>
						<div class="col-md-3 col-sm-6">
							<div class="service-item">
								<span class="fa-stack fa-4x"> <i
									class="fa fa-circle fa-stack-2x"></i> <i
									class="fa fa-birthday-cake fa-stack-1x text-primary"></i>
								</span>
								<h4>
									<strong>케이크 재료</strong>
								</h4>
								<p>생크림, 밀가루 등 여러가지 재료를 주문 할 수 있습니다.</p>
								<button id="Cake-Material-Btn" class="btn btn-light">시작</button>
							</div>
						</div>
					</div>
					<!-- /.row (nested) -->
				</div>
				<!-- /.col-lg-10 -->
			</div>
			<!-- /.row -->
		</div>
		<!-- /.container -->
	</section>

	<!-- Coffee Product -->
	<div id="Coffee_Product" class="product" style="display: none">
		<div class="container">
			<div class="row">
				<div class="col-lg-10 col-lg-offset-1 text-center">
					<h2>Coffee</h2>
					<hr class="small">
					<div class="row">
						<!-- Material -->
						<div class="col-md-4">
							<div class="portfolio-item">
								<div class="row">
									<img class="img-portfolio img-responsive"
										src="bootstrap/img/portfolio-1.jpg">
								</div>
								<div class="row" style="margin-top: 5px">
									<form class="form-horizontal">
										<!-- Material Name -->
										<div class="form-group">
											<h3>계피 가루(20kg)</h3>
										</div>
										<!-- Material Price -->
										<div class="form-group">
											<h4>300원</h4>
										</div>
										<!-- Material Quantity -->
										<div class="form-group">
											<label for="inputEmail3" class="col-sm-2 control-label">수량</label>
											<div class="col-sm-8">
												<input type="email" class="form-control" id="inputEmail3"
													placeholder="상품 수량">
											</div>
										</div>
										<!-- 담기 button -->
										<div class="form-group">
											<div class="col-sm-2 col-sm-offset-2">
												<button id="User-Log-In-Btn" type="button"
													class="btn btn-danger btn-cart-material">담기</button>
												&nbsp;&nbsp;
											</div>
										</div>
									</form>
								</div>
							</div>
						</div>
					</div>
					<a id="Coffee-Product-Order-Btn" class="btn btn-success btn-lg">주문</a>
					<button id="Coffee-Order-Cancel-Btn" class="btn btn-dark btn-lg">취소</button>
				</div>
				<!-- /.col-lg-10 -->
			</div>
			<!-- /.row -->
		</div>
		<!-- /.container -->
	</div>
	<!-- Cake Product -->
	<div id="Cake_Product" class="product" style="display: none">
		<div class="container">
			<div class="row">
				<div class="col-lg-10 col-lg-offset-1 text-center">
					<h2>Cake</h2>
					<hr class="small">
					<div class="row">
						<!-- Material -->
						<div class="col-md-4">
							<div class="portfolio-item">
								<div class="row">
									<img class="img-portfolio img-responsive"
										src="bootstrap/img/portfolio-1.jpg">
								</div>
								<div class="row" style="margin-top: 5px">
									<form class="form-horizontal">
										<!-- Material Name -->
										<div class="form-group">
											<h3>밀가루(20kg)</h3>
										</div>
										<!-- Material Price -->
										<div class="form-group">
											<h4>300원</h4>
										</div>
										<!-- Material Quantity -->
										<div class="form-group">
											<label for="inputEmail3" class="col-sm-2 control-label">수량</label>
											<div class="col-sm-8">
												<input type="email" class="form-control" id="inputEmail3"
													placeholder="상품 수량">
											</div>
										</div>
										<!-- 담기 button -->
										<div class="form-group">
											<div class="col-sm-2 col-sm-offset-2">
												<button id="User-Log-In-Btn" type="button"
													class="btn btn-danger btn-cart-material">담기</button>
												&nbsp;&nbsp;
											</div>
										</div>
									</form>
								</div>
							</div>
						</div>
					</div>
					<a id="Cake-Product-Order-Btn" class="btn btn-success btn-lg">주문</a>
					<button id="Cake-Order-Cancel-Btn" class="btn btn-dark btn-lg">취소</button>
					<input id="test" type="text" />
				</div>
				<!-- /.col-lg-10 -->
			</div>
			<!-- /.row -->
		</div>
	</div>
	<br/><br/>
	<!-- Map -->
	<section id="contact" class="map">
		<iframe width="100%" height="100%" frameborder="0" scrolling="no"
			marginheight="0" marginwidth="0"
			src="https://maps.google.com/maps?f=q&amp;source=s_q&amp;hl=en&amp;geocode=&amp;q=Twitter,+Inc.,+Market+Street,+San+Francisco,+CA&amp;aq=0&amp;oq=twitter&amp;sll=28.659344,-81.187888&amp;sspn=0.128789,0.264187&amp;ie=UTF8&amp;hq=Twitter,+Inc.,+Market+Street,+San+Francisco,+CA&amp;t=m&amp;z=15&amp;iwloc=A&amp;output=embed"></iframe>
		<br /> <small> <a
			href="https://maps.google.com/maps?f=q&amp;source=embed&amp;hl=en&amp;geocode=&amp;q=Twitter,+Inc.,+Market+Street,+San+Francisco,+CA&amp;aq=0&amp;oq=twitter&amp;sll=28.659344,-81.187888&amp;sspn=0.128789,0.264187&amp;ie=UTF8&amp;hq=Twitter,+Inc.,+Market+Street,+San+Francisco,+CA&amp;t=m&amp;z=15&amp;iwloc=A"></a>
		</small>
		</iframe>
	</section>

	<!-- Footer -->
	<footer>
		<div class="container">
			<div class="row">
				<div class="col-lg-10 col-lg-offset-1 text-center">
					<h4>
						<strong>Start Bootstrap</strong>
					</h4>
					<p>
						3481 Melrose Place<br>Beverly Hills, CA 90210
					</p>
					<ul class="list-unstyled">
						<li><i class="fa fa-phone fa-fw"></i> (123) 456-7890</li>
						<li><i class="fa fa-envelope-o fa-fw"></i> <a
							href="mailto:name@example.com">name@example.com</a></li>
					</ul>
					<br>
					<ul class="list-inline">
						<li><a href="#"><i class="fa fa-facebook fa-fw fa-3x"></i></a>
						</li>
						<li><a href="#"><i class="fa fa-twitter fa-fw fa-3x"></i></a>
						</li>
						<li><a href="#"><i class="fa fa-dribbble fa-fw fa-3x"></i></a>
						</li>
					</ul>
					<hr class="small">
					<p class="text-muted">Copyright &copy; Your Website 2014</p>
				</div>
			</div>
		</div>
	</footer>
</body>

</html>
