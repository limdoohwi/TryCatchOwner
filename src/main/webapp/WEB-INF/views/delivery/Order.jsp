
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!-- Bootstrap Core CSS - Uses Bootswatch Flatly Theme: http://bootswatch.com/flatly/ -->
<link
	href="/owner/resources/bootstrab_order_confirm/css/bootstrap.min.css"
	rel="stylesheet">

<!-- Custom CSS -->
<link href="/owner/resources/bootstrab_order_confirm/css/freelancer.css"
	rel="stylesheet">
<link
	href="/owner/resources/bootstrab_order_confirm/css/heroic-features.css"
	rel="stylesheet">
<!-- Custom Fonts -->
<link
	href="/owner/resources/bootstrab_order_confirm/font-awesome/css/font-awesome.min.css"
	rel="stylesheet" type="text/css">
<link href="http://fonts.googleapis.com/css?family=Montserrat:400,700"
	rel="stylesheet" type="text/css">
<link
	href="http://fonts.googleapis.com/css?family=Lato:400,700,400italic,700italic"
	rel="stylesheet" type="text/css">

<!-- jQuery -->
<script src="/owner/resources/bootstrab_order_confirm/js/jquery.js"></script>

<!-- Bootstrap Core JavaScript -->
<script
	src="/owner/resources/bootstrab_order_confirm/js/bootstrap.min.js"></script>

<!-- Plugin JavaScript -->
<script
	src="http://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.3/jquery.easing.min.js"></script>
<script src="/owner/resources/bootstrab_order_confirm/js/classie.js"></script>
<script
	src="/owner/resources/bootstrab_order_confirm/js/cbpAnimatedHeader.js"></script>

<!-- Contact Form JavaScript -->
<script
	src="/owner/resources/bootstrab_order_confirm/js/jqBootstrapValidation.js"></script>
<script src="/owner/resources/bootstrab_order_confirm/js/contact_me.js"></script>

<!-- Custom Theme JavaScript -->
<script src="/owner/resources/bootstrab_order_confirm/js/freelancer.js"></script>

<script>
	$(function() {
		$.ajax({
			url : "/owner/findownerstore",
			type : "POST",
			data : {
				member_no : "${member_dto.member_no}"
			},
			success : function(data) {
				//alert(data.storelist.length);
				$.each(data.storelist, function(index, store) {
					$("#selectstore").append(
							"<option value='"+store.store_no+"'>"
									+ store.store_name + "</option>");
				})
			}
		});
		$("#materialpayment_confirmbtn").click(function() {
			var store_no = $("#selectstore option:selected").val();
			if (store_no == "매장 선택") {
				alert("매장을 선택해주세요.");
				return false;
			}
			$("#select_store_hidden").val(store_no);
			$("#payment_form").submit();
			alert("물품이 신청 되었습니다.")
		});
	});
</script>
<!-- Header -->
<div class="row" style="color: black">
	<!-- Page Content -->
	<div class="col-lg-offset-3">
		<div class="row">
			<div class="col-sm-8"></div>
			<h2>주문서 작성 결제</h2>
			<hr />
			<h2 style="font-size: 15px; font-weight: bold; margin-top: -2px">주문
				정보</h2>

			<form id="payment_form" action="/owner/insert/materialpayment"
				method="post">
				<table class="table table-bordered">
					<tr>
						<td bgcolor="#ecf0f1"
							style="font-size: 10px; width: 140px; text-align: left; vertical-align: middle">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;주문자</td>
						<td colspan="3"><input type="text" name="member_name"
							style="width: 130px; height: 20px; text-align: center; vertical-align: middle"
							value="${member_dto.member_name}" /></td>
					</tr>

					<tr>
						<td bgcolor="#ecf0f1"
							style="font-size: 10px; width: 140px; text-align: left; vertical-align: middle">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;매장</td>
						<td colspan="3"><select id="selectstore">
								<option>매장 선택</option>
						</select></td>
					</tr>

					<tr>
						<td bgcolor="#ecf0f1"
							style="font-size: 10px; width: 140px; text-align: left; vertical-align: middle">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;휴대폰
							번호</td>
						<td colspan="3"><input type="text" name="member_tel"
							placeholder="휴대폰 번호 입력" style="width: 130px"
							value="${member_dto.member_tel}" /></td>
					</tr>

				</table>
				<div style="border-top: 1px solid #dedede; margin-top: -21px"></div>
				<br />
				<!-- 옵션 추가 내역 테이블 -->
				<h2 style="font-size: 15px; font-weight: bold; margin-top: -2px">최종
					주문 내역</h2>
				<table id="selected_option" class="table">
					<tr>
						<th>재료 이름</th>
						<th>주문 수량</th>
						<th>해당 가격</th>
					</tr>
					<c:set var="total_price" value="0"></c:set>
					<c:set var="total_count" value="0"></c:set>
					<c:forEach var="materialcart_material" items="${cartlist}">
						<tr>
							<td>${materialcart_material.material_name }</td>
							<td>${materialcart_material.material_count }</td>
							<td>${materialcart_material.material_count * materialcart_material.material_price}</td>
						<tr />
						<input type="hidden" name="material_nos"
							value="${materialcart_material.material_no}" />
						<input type="hidden" name="material_counts"
							value="${materialcart_material.material_count}" />
						<c:set var="total_price"
							value="${total_price+materialcart_material.material_count*materialcart_material.material_price}" />
						<c:set var="total_count"
							value="${total_count+materialcart_material.material_count}" />
					</c:forEach>
					<tr>
						<td>총 계</td>
						<td>${total_count}</td>
						<td>${total_price}</td>
					</tr>
				</table>
				<input type="hidden" name="material_total_price"
					value="${total_price}" /> <input type="hidden"
					id="select_store_hidden" name="store_no" /> <br />
				<div style="border-top: 1px solid #dedede;"></div>
				<br />

				<div style="border-top: 1px solid #dedede; margin-top: -20px"></div>
				<br />
				<div>
					<button class="btn">뒤로</button>
					<button id="materialpayment_confirmbtn" class="btn btn-danger"
						style="margin-left: 1000px;">신청하기</button>
				</div>
			</form>
		</div>
	</div>
</div>
