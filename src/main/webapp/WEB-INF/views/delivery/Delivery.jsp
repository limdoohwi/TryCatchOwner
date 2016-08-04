<!-- 
/*
 * 	JSP: Order.jsp
 *  Description: DB¿¡ ÀúÀåµÇ¾î ÀÖ´Â Ä¿ÇÇ,ÄÉÀÌÅ© Àç·á ¸®½ºÆ®¸¦ È®ÀÎÇÏ°í Ä«Æ®¿¡ Ãß°¡,º¯°æ,»èÁ¦ÇÏ°í ÁÖ¹®³»¿ªÆäÀÌÁö·Î ÀÌµ¿ÇÒ ¼ö ÀÖ°Ô  ÁøÇàÇØÁÖ´Â JSP ÆäÀÌÁö 
 *  Created: 2016¡©08¡©04
 *	Author: ¼ÕÇö¹Î
 * 
 */
 -->
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">

<!-- Bootstrap Core CSS -->
<link href="/owner/resources/bootstrap_delivery/css/bootstrap.min.css"
	rel="stylesheet">

<!-- Custom CSS -->
<link
	href="/owner/resources/bootstrap_delivery/css/stylish-portfolio.css"
	rel="stylesheet">

<!-- Custom Fonts -->
<link
	href="/owner/resources/bootstrap_delivery/font-awesome/css/font-awesome.min.css"
	rel="stylesheet" type="text/css">
<link
	href="http://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,700,300italic,400italic,700italic"
	rel="stylesheet" type="text/css">

<!-- jQuery -->
<script src="/owner/resources/bootstrap_delivery/js/jquery.js"></script>

<!-- Bootstrap Core JavaScript -->
<script src="/owner/resources/bootstrap_delivery/js/bootstrap.min.js"></script>
<!-- Custom Theme JavaScript -->
<script>
	$(function() {
		$.ajax({
			url : "/owner/list.cart",
			type : "post",
			success : function(data) {
				cart_list(data);
			},
			error : function() {
				alert("ë¦¬ì?¤í??  ?¤í??")
			}
		});

		$(".btn-cart-material").click(function() {
			var index = $(".btn-cart-material").index(this);
			var material_no = $(".btn-cart-material").eq(index).val();
			if ($(".form-count").eq(index).val() == '') {
				alert("?????? ???¥í???¸ì??.");
			} else {
				var material_cnt = $(".material_cnt").eq(index).val();
				$.ajax({
					url : "/owner/insert.cart",
					type : "post",
					data : {
						material_no : material_no,
						material_cnt : material_cnt,
					},
					success : function(data) {
						cart_list(data);
					},
					error : function() {
						alert("?¸ì???? ?¤í??")
						return false;
					}
				});
			}
		});
		//
		function cart_list(data) {

			var html = "<h4>?¥ë?êµ¬ë??</h4>";
			$
					.each(
							data.cartlist,
							function(index, jsonData) {
								html += '<ul class="list-group" style="color:black">'
								html += '<div>';
								html += '<li class="list-group-item">'
								html += '<input class="material_no_hidden" type="hidden" name="material_name" value='+jsonData.material_no + ' />'
								html += '<span class="Material-Quantity badge">'
										+ jsonData.material_count + '</span>'
								html += jsonData.material_name
								html += '</li>'
								html += '<a data-toggle="tooltip" data-placement="top" title="???? +1" class="Material-Quantity-Plus-Btn btn btn-success"><em class="fa fa-plus-circle" aria-hidden="true"></em></a>'
								html += '<a data-toggle="tooltip" data-placement="top" title="???? -1" class="Material-Quantity-Minus-Btn btn btn-primary"><em class="fa fa-minus-circle" aria-hidden="true"></em></a>'
								html += '<a data-toggle="tooltip" data-placement="top" title="???? ì·¨ì??" class="Material-Cart-List-Remove-Btn btn btn-danger"><em class="fa fa-times" aria-hidden="true"></em></a>'
								html += '</div>'
								html += '</ul>'
							});
			$("#cart_list").html(html);
		}

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
		$("#Coffee-Product-Order-Btn").click(function() {
			var size = $(".list-group").length;
			if (size == 0) {
				alert("?¥ë?êµ¬ë?? ?????? ???µë????.");
				return false;
			}
			if (confirm("?´ë??ë¡? ì£¼ë¬¸????ê²??µë??ê¹??")) {
				location.href = "/owner/delivery/Order";
			}
		});
		//Cake-Product-Order-Btn Click Show Confrim Order
		$("#Cake-Product-Order-Btn").click(function() {
			if (confirm("?´ë??ë¡? ì£¼ë¬¸????ê²??µë??ê¹??")) {
				//alert("?? ????ë¯¿ì???")
				$(this).attr("href", "front?cmd=material_order_confirm")
			}
		});
		//Material-Quantity-Plus-Btn Click Quantity +1
		$(document).on('click', ".Material-Quantity-Plus-Btn", function() {
			var eq = $(".Material-Quantity-Plus-Btn").index(this);
			$.ajax({
				url : "/owner/update.cart",
				type : "post",
				data : {
					param : "plus",
					material_no : $(".material_no_hidden").eq(eq).val(),
				},
				success : function(data) {
					cart_list(data);
				},
				error : function() {
					alert("plus update ?¤í??");
					return false;
				}
			});
		});

		$(document).on('blur', ".Material-Quantity badge", function() {
			var eq = $(".Material-Quantity badge").index(this);
			$.ajax({
				url : "/owner/update.cart",
				type : "post",
				data : {
					param : "count",
					material_no : $(".material_no_hidden").eq(eq).val(),
					material_count : $(".Material-Quantity badge").eq(eq).val()
				},
				success : function(data) {
					cart_list(data);
				},
				error : function() {
					alert("update ?¤ë?");
					return false;
				}
			});
		});

		//Material-Quantity-Minus-Btn Click Quantity -1
		//$(".Material-Quantity-Minus-Btn").click(function(){
		$(document).on('click', ".Material-Quantity-Minus-Btn", function() {
			var eq = $(".Material-Quantity-Minus-Btn").index(this);
			if ($(".Material-Quantity").eq(eq).text() == '1') {
				alert("?? ?´ì?? ì¤??? ?? ???µë????.");
				return false;
			} else {
				$.ajax({
					url : "/owner/update.cart",
					type : "post",
					data : {
						param : "minus",
						material_no : $(".material_no_hidden").eq(eq).val(),
					},
					success : function(data) {
						cart_list(data);
					},
					error : function() {
						alert("minus update ?¤ë?");
						return false;
					}
				});
			}
		});

		//Material-Cart-List-Remove-Btn Click List Remove
		$(document).on('click', ".Material-Cart-List-Remove-Btn", function() {
			var eq = $(".Material-Cart-List-Remove-Btn").index(this);
			alert($(".material_no_hidden").eq(eq).val());
			$.ajax({
				url : "/owner/delete.cart",
				type : "post",
				data : {
					material_no : $(".material_no_hidden").eq(eq).val(),
				},
				success : function(data) {
					cart_list(data);
					alert("ë¬¼í???? ???? ?????µë????.")
				},
				error : function() {
					alert("delet ?¤ë?");
					return false;
				}
			});
		});

		$(window).scroll(function() {
			var scroll = $(document).scrollTop();
			//Scroll In Services Area Show Cart Div 
			if (scroll > 825 && scroll < 1800) {
				$("#cart_list").show();
			} else {
				$("#cart_list").hide();
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
	<div id="cart_list" class="col-sm-2"
		style="color: white; background-color: black; opacity: 0.5; margin-right: 0px !important; position: fixed;">
	</div>
	<!-- Navigation -->
	<a id="menu-toggle" href="#" class="btn btn-dark btn-lg toggle"><i
		class="fa fa-bars"></i></a>
	<nav id="sidebar-wrapper">
		<ul class="sidebar-nav">
			<a id="menu-close" href="#"
				class="btn btn-light btn_link btn-lg pull-right toggle"> <i
					class="fa fa-times"></i>
			</a>
			<li class="sidebar-brand"><a href="#top">TryCatch Delivery</a></li>
			<li><a href="/owner/delivery/Order_list">ì£¼ë¬¸ ?´ì?? ë³´ê¸°</a></li>
			<li>
				<div class="dropdown">
					<a id="Select-Store-Btn" href="#" data-toggle="dropdown"
						aria-haspopup="ture" aria-expanded="true">ë§¤ì?? ????<span
						class="caret"></span></a>
					<ul class="dropdown-menu" role="menu"
						aria-labelledby="Select-Store-Btn"
						style="color: white; background-color: black;">
						<li><a href="#">?¸ì???</a></li>
						<li><a href="#">??ì²???</a></li>
						<li><a href="#">?°ì????</a></li>
					</ul>
				</div>
			</li>
			<li><a href="#services">??ë¹??? ????</a></li>
			<li><a href="#contact">Contact</a></li>
			<li><a href="#top">ë§? ??ë¡?</a></li>
			<li><a href="/owner">ë©??¸ì?¼ë?</a></li>
		</ul>
	</nav>

	<!-- Header -->
	<header id="top" class="header">
		<div class="text-vertical-center">
			<h1>TryCatch Delivery</h1>
			<h3>ê³?ê°???ê²? ìµ?ê³??? ì»¤í?? ?¬ë?ë¥? ??ê³µí?©ë????</h3>
			<h4>
				<em class="fa fa-male fa-lg" aria-hidden="true"></em>
			</h4>
			<h4 style="font-weight: bold;">
				<span>????1</span>??
			</h4>
			<h4>
				<a id="Change-Store-Btn" class="btn btn-success"
					style="margin-left: 12px" data-toggle="tooltip"
					data-placement="right" title="ë§¤ì?¥ì?? ë°?ê¿? ?? ???µë????."><em
					class="fa fa-bank" aria-hidden="true"></em></a>&nbsp;&nbsp;&nbsp;&nbsp;
			</h4>
			<h4>
				<span style="font-size: 13pt; font-weight: bold;">ì¢?ê°???</span>
			</h4>
			<br> <a href="#services" class="btn btn-dark btn-lg">ì£¼ë¬¸ ??????ê¸?</a>
		</div>
	</header>
	<!-- Services -->
	<!-- The circle icons use Font Awesome's stacked icon classes. For more information, visit http://fontawesome.io/examples/ -->
	<section id="services" class="services bg-primary">
		<div class="container">
			<div class="col-lg-12 text-center">
				<div class="col-lg-12">
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
									<strong>ì»¤í?? ?¬ë?</strong>
								</h4>
								<p>ê³??¼ê?ë£?, ???? ?? ?¬ë?¬ê?ì§? ?¬ë?ë¥? ì£¼ë¬¸ ?? ?? ???µë????.</p>
								<button id="Coffee-Material-Btn" class="btn btn-light">????</button>
							</div>
						</div>
						<div class="col-md-3 col-sm-6">
							<div class="service-item">
								<span class="fa-stack fa-4x"> <i
									class="fa fa-circle fa-stack-2x"></i> <i
									class="fa fa-birthday-cake fa-stack-1x text-primary"></i>
								</span>
								<h4>
									<strong>ì¼??´í?? ?¬ë?</strong>
								</h4>
								<p>???¬ë¦¼, ë°?ê°?ë£? ?? ?¬ë?¬ê?ì§? ?¬ë?ë¥? ì£¼ë¬¸ ?? ?? ???µë????.</p>
								<button id="Cake-Material-Btn" class="btn btn-light">????</button>
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
								<!-- ?´ê¸° -->
								<div class="row" style="margin-top: 5px">
									<c:set var="material_coffee" value="${materialcoffee}" />
									<c:forEach items="${material_coffee}" var="coffeelist"
										varStatus="material_status">
										<form class="form-horizontal" method="post" action="add">
											<div style="display: inline-block;">
												<!-- Material Name -->
												<div class="form-group">
													<h3>${coffeelist.material_name}</h3>
												</div>
												<!-- Material Price -->
												<div class="form-group">
													<h4>${coffeelist.material_price}??</h4>
												</div>
												<!-- Material Quantity -->
												<div class="form-group">
													<label class="col-sm-2 control-label"></label>
													<div class="col-sm-8">
														<input class="form-count material_cnt" placeholder="???? ????">
													</div>
												</div>

												<!-- ?´ê¸° button -->
												<div class="form-group">
													<div class="col-sm-2 col-sm-offset-2">
														<button id="Cart-add-btn" type="button"
															class="btn btn-danger btn-cart-material"
															value="${coffeelist.material_no}">?´ê¸°</button>
														&nbsp;&nbsp;
													</div>
												</div>
											</div>
											<c:if test="${material_status.count == 3}">
												<br />
											</c:if>
										</form>
									</c:forEach>
								</div>
							</div>
						</div>
					</div>
					<a id="Coffee-Product-Order-Btn" class="btn btn-success btn-lg">ì£¼ë¬¸</a>
					<button id="Coffee-Order-Cancel-Btn" class="btn btn-dark btn-lg">ì·¨ì??</button>
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
								<!-- ?´ê¸° -->
								<div class="row" style="margin-top: 5px">
									<c:set var="material_cake" value="${materialcake}" />
									<c:forEach items="${material_cake}" var="cakelist"
										varStatus="material_status">
										<form class="form-horizontal">
											<!-- Material Name -->
											<div class="form-group">
												<h3>${cakelist.material_name}</h3>
											</div>
											<!-- Material Price -->
											<div class="form-group">
												<h4>${cakelist.material_price}??</h4>
											</div>
											<!-- Material Quantity -->
											<div class="form-group">
												<label for="inputEmail3" class="col-sm-2 control-label"></label>
												<div class="col-sm-8">
													<input type="email" class="form-count material_cnt"
														id="inputEmail3" placeholder="???? ????">
												</div>
											</div>
											<!-- ?´ê¸° button -->
											<div class="form-group">
												<div style="margin-left: 95px"
													class="col-sm-2 col-sm-offset-2">
													<button id="Cart-add-btn" type="button"
														class="btn btn-danger btn-cart-material"
														value="${cakelist.material_no}">?´ê¸°</button>
													&nbsp;&nbsp;
												</div>
											</div>
										</form>
									</c:forEach>
								</div>
							</div>
						</div>
					</div>
					<a id="Cake-Product-Order-Btn" class="btn btn-success btn-lg">ì£¼ë¬¸</a>
					<button id="Cake-Order-Cancel-Btn" class="btn btn-dark btn-lg">ì·¨ì??</button>
				</div>
				<!-- /.col-lg-10 -->
			</div>
			<!-- /.row -->
		</div>
	</div>
	<br />
	<br />
	<!-- Map -->
	<section id="contact" class="map">
		<iframe width="100%" height="100%" frameborder="0" scrolling="no"
			marginheight="0" marginwidth="0"
			src="https://maps.google.com/maps?f=q&amp;source=s_q&amp;hl=en&amp;geocode=&amp;q=Twitter,+Inc.,+Market+Street,+San+Francisco,+CA&amp;aq=0&amp;oq=twitter&amp;sll=28.659344,-81.187888&amp;sspn=0.128789,0.264187&amp;ie=UTF8&amp;hq=Twitter,+Inc.,+Market+Street,+San+Francisco,+CA&amp;t=m&amp;z=15&amp;iwloc=A&amp;output=embed"></iframe>
		<br /> <small> <a
			href="https://maps.google.com/maps?f=q&amp;source=embed&amp;hl=en&amp;geocode=&amp;q=Twitter,+Inc.,+Market+Street,+San+Francisco,+CA&amp;aq=0&amp;oq=twitter&amp;sll=28.659344,-81.187888&amp;sspn=0.128789,0.264187&amp;ie=UTF8&amp;hq=Twitter,+Inc.,+Market+Street,+San+Francisco,+CA&amp;t=m&amp;z=15&amp;iwloc=A"></a>
		</small>
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
