

<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="author" content="Vitaliy Potapov">
<meta http-equiv="cache-control" content="max-age=0" />
<meta http-equiv="cache-control" content="no-cache" />
<meta http-equiv="expires" content="Tue, 01 Jan 1980 1:00:00 GMT" />
<meta http-equiv="pragma" content="no-cache" />
<link href="/owner/resources/bootstrap_delivery/css/bootstrap.min.css"
	rel="stylesheet">

<!-- jQuery -->
<script src="/owner/resources/bootstrap_delivery/js/jquery.js"></script>

<!-- Bootstrap Core JavaScript -->
<script src="/owner/resources/bootstrap_delivery/js/bootstrap.min.js"></script>
<link rel="stylesheet" type="text/css"
	href="http://www.prepbootstrap.com/Content/shieldui-lite/dist/css/light/all.min.css" />
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.4.0/css/font-awesome.min.css"
	rel='stylesheet' type='text/css'>
<script>
var store_no = 0;
var date = "";
var orderList_page = 0;
var pagePer_num = 5;
$(function(){
	$(".pagination").html("");
	var prebtn =  '<li class="page_pre_next_li"><a id="pre_btn" href="#" aria-label="Previous"><span aria-hidden="true">&laquo;</span></a></li>';
	var nextbtn = '<li class="page_pre_next_li"><a id="next_btn" href="#" aria-label="Next"><span aria-hidden="true">&raquo;</span></a></li>';

	
	//페이지 블록 생성
	$(".pagination").append(prebtn);
	for(var i=orderList_page; i<pagePer_num; i++){
		$(".pagination").append('<li class="orderList_pageNum active"><a style="cursor:pointer" class="pageNum">'+(i+1)+'</a></li>');
	}
	$(".pagination").append(nextbtn);
	//페이지 버튼 클릭
	$(document).on("click", ".pageNum", function(){
		var page_no = $(this).text();
		orderList_page = (Number(page_no)-1) * Number(pagePer_num);
		$("#Material-Order-Table tr").not("#material_order_header_tr").remove();
		callMaterialOrderList();
	});
	//페이지 뒤로 가기 버튼 클릭
	$(document).on("click", "#pre_btn", function(){
		if($(".pageNum").eq(0).text() == 1)
			alert("더이상 뒤로갈 페이지가 없습니다.");
		else{
				var start = Number($(".pageNum").eq(0).text())-5;
				var end = start+5;
				$(".pagination").html("");
				$(".pagination").append(prebtn);
				for(var i=start; i<end; i++){
					$(".pagination").append('<li class="orderList_pageNum active"><a class="pageNum">'+(i)+'</a></li>');
			}
				$(".pagination").append(nextbtn);
		}
	});
		//페이지 앞으로 가기 버튼 클릭
	$(document).on("click", "#next_btn", function(){
		var start = Number($(".pageNum").eq(4).text());
		var end = start+5;
		$(".pagination").html("");
		$(".pagination").append(prebtn);
		for(var i=start; i<end; i++){
			$(".pagination").append('<li class="orderList_pageNum active"><a class="pageNum">'+(i+1)+'</a></li>');
	}
		$(".pagination").append(nextbtn);
	});
		$("#Show-Order-List").hide();
	$(".Show-Order-List-Btn").click(function(){
		var index = $(".Show-Order-List-Btn").index(this);
		$("#Show-Order-List").show();
	});
	//Show-Detail-Purchase-List-Modal-Hide-Btn Click Hide Modal
	$("#Show-Order-List-Modal-Hide-Btn").click(function(){
	   $("#Show-Order-List").hide();
	 });
	
	$("#orderlist-Store-Btn").click(function() {
		$("#order-list").css("display","block");
	});
	
	//매장 선택
	$(".select_store_btn").click(function(){
		var index = $(".select_store_btn").index(this);
		store_no = $(".select_store_no").eq(index).val();
		$(".material_list_tr").remove();
		$(".material_detail_list_tr").remove();
		callMaterialOrderList();
	});
	
	//날짜 선택 후 확인 클릭
	$("#show_material_list_btn").click(function(){
		$("select").each(function(){
			if($(this).find("option:selected").val() == "선택"){
				alert("날짜 선택을 확인해주세요");
				$(this).focus();
				return false;
			}
			var year = $("#Select-Material-Order-Year option:selected").val();
			var month = $("#Select-Material-Order-Month option:selected").val();
			var day = $("#Select-Material-Order-Day option:selected").text();
			date = year + "-" + month + "-" + day;
		});
	});
	
	//상세보기 클릭
	$(document).on("click", ".Show-Order-List-Btn", function(){
		$(".material_detail_list_tr").remove();
		var index = $(".Show-Order-List-Btn").index(this);
		var material_payment_no = $(".Show-Order-List-Btn").eq(index).attr("id");
		$.ajax({
			url:"/owner/delivery/payment/detail/list",
			type:"post",
			data:{material_payment_no:material_payment_no},
			success:function(data){
				//alert(data);
				//alert(data.materialPaymentDetailList.length)
				var materialPaymentlength = data.materialPaymentDetailList.length;
				$("#material_detail_table tbody").html("");
				$.each(data.materialPaymentDetailList, function(index, list){
					var html = '<tr class="material_detail_list_tr"><td>'+list.material_name+'</td><td>'+list.material_price+'</td><td>'+list.material_count+'</td><td>'+list.material_total_price+'</td></tr>';
					$("#material_detail_table tbody").append(html);
				});
			}
		});
		$("#Show-Order-List").show();
	});
});

function callMaterialOrderList(){
	$.ajax({
		url:"/owner/delivery/payment/list",
		type:"post",
		data:{store_no : store_no, date:date, start_page : orderList_page},
		success:function(data){
			$.each(data.materialPaymentList, function(index, list){
				var html = '<tr class="material_list_tr"><td>'+list.member_name+'</td><td>'+list.material_payment_date+'</td><td>'+list.store_name+'</td><td><a id="'+list.material_payment_no+'" class="Show-Order-List-Btn" href="#" style="cursor:pointer;">목록 보기</a></td><td>'+list.material_total_price+'원</td></tr>';
				$("#Material-Order-Table tbody").append(html);
			});
		}
	});
}
</script>

<style type="text/css">
body {
	padding-top: 50px;
	padding-bottom: 30px;
}

table.table>tbody>tr>td {
	height: 30px;
	vertical-align: middle;
}

a {
	text-decoration: none !important;
}
</style>

</head>

<body>

	<div style="width: 80%; margin: auto;">
		<h1>주문 내역보기</h1>
		<a href="/owner/delivery/Delivery" type="button"
			class="btn btn-success" style="margin-left: 1400px">홈으로 가기</a>
		<hr>
		<div class="dropdown">
			<a href="#" data-toggle="dropdown" aria-haspopup="ture"
				aria-expanded="true">매장을 선택하세요.<span class="caret"></span></a>
			<ul id="orderlist-Store-Btn" class="dropdown-menu" role="menu"
				aria-labelledby="Select-Store-Btn">
				<c:forEach var="storeDto" items="${storeList}">
					<li><a class="select_store_btn" href="#">${storeDto.store_name}</a>
						<input class="select_store_no" type="hidden"
						value="${storeDto.store_no}" /></li>
				</c:forEach>
			</ul>
		</div>
		<div id="order-list" style="display: none;">
			<h2>날짜를 선택하세요.</h2>
			<form method="get" id="frm" class="form-inline" action="demo.html">
				<label> <span>연도 </span> <select
					id="Select-Material-Order-Year" class="form-control">
						<option>선택</option>
						<option>2016</option>
						<option>2017</option>
						<option>2018</option>
						<option>2019</option>
						<option>2020</option>
				</select>
				</label> <label style="margin-left: 30px">월 <select name="c"
					id="Select-Material-Order-Month" class="form-control">
						<option>선택</option>
						<option value="1">1월</option>
						<option value="2">2월</option>
						<option value="3">3월</option>
						<option value="4">4월</option>
						<option value="5">5월</option>
						<option value="6">6월</option>
						<option value="7">7월</option>
						<option value="8">8월</option>
						<option value="9">9월</option>
						<option value="10">10월</option>
						<option value="11">11월</option>
						<option value="12">12월</option>
				</select>
				</label> <label style="margin-left: 30px">일 <select
					id="Select-Material-Order-Day" class="form-control">
						<option>선택</option>
						<option>1</option>
						<option>2</option>
						<option>3</option>
						<option>4</option>
						<option>5</option>
						<option>6</option>
						<option>7</option>
						<option>8</option>
						<option>9</option>
						<option>10</option>
						<option>11</option>
						<option>12</option>
						<option>13</option>
						<option>14</option>
						<option>15</option>
						<option>16</option>
						<option>17</option>
						<option>18</option>
						<option>19</option>
						<option>20</option>
						<option>21</option>
						<option>22</option>
						<option>23</option>
						<option>24</option>
						<option>25</option>
						<option>26</option>
						<option>27</option>
						<option>28</option>
						<option>29</option>
						<option>30</option>
						<option>31</option>
				</select>
				</label>
				<button id="show_material_list_btn" type="button"
					class="btn btn-success" style="margin-left: 30px">확인</button>
			</form>
			<hr>
			<h2>내역</h2>
			<br />
			<table id="Material-Order-Table"
				class="table table-bordered table-striped" style="clear: both;">
				<tbody>
					<tr id="material_order_header_tr">
						<td width="10%">주문자</td>
						<td width="10%">주문날짜</td>
						<td width="10%">매장명</td>
						<td width="10%">상품목록</td>
						<td width="10%">결제금액</td>
					</tr>
				</tbody>
			</table>
			<nav>
				<ul class="pagination" style="margin-left: 600px">
				</ul>
			</nav>
		</div>
	</div>

	<jsp:include page="Order_List_Modal.jsp"></jsp:include>
</body>
</html>
