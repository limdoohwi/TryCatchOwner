<!-- 
/*
 *  Description :  메뉴 관리 페이지
 *  Created : 2016-06-29
 *  Author : 김준혁
 *  
 *  Revisions :
 */
 -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="author" content="Vitaliy Potapov">
<meta http-equiv="cache-control" content="max-age=0" />
<meta http-equiv="cache-control" content="no-cache" />
<meta http-equiv="expires" content="Tue, 01 Jan 1980 1:00:00 GMT" />
<meta http-equiv="pragma" content="no-cache" />
<link href="bootstrab_order_confirm/css/bootstrap.min.css" rel="stylesheet">

<!-- jQuery -->
<script src="bootstrab_order_confirm/js/jquery.js"></script>

<!-- Bootstrap Core JavaScript -->
<script src="bootstrab_order_confirm/js/bootstrap.min.js"></script>
<link rel="stylesheet" type="text/css"
	href="http://www.prepbootstrap.com/Content/shieldui-lite/dist/css/light/all.min.css" />
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.4.0/css/font-awesome.min.css"
	rel='stylesheet' type='text/css'>


<style type="text/css">
body {
	padding-top: 50px;
	padding-bottom: 30px;
}

table.table>tbody>tr>td {
	height: 30px;
	vertical-align: middle;
}

a{
	text-decoration: none !important;
}

</style>

</head>

<body>

	<div style="width: 80%; margin: auto;">
		<h1>주문 확인창</h1>
		<hr>

		<h2>배송 날짜 선택</h2>
		<form method="get" id="frm" class="form-inline" action="demo.html">

			<label> <span>연도 </span> 
				<select id="Select-Material-Order-Year" class="form-control">
						<option>선택</option>
						<option>2016</option>
						<option>2017</option>
				</select>
			</label> 
			<label style="margin-left: 30px">월 
				<select name="c"
					id="Select-Material-Order-Month" class="form-control">
						<option>선택</option>
						<option>1월</option>
				</select>
			</label>
			<label style="margin-left: 30px">일 
				<select name="Select-Material-Order-Day"
					id="c" class="form-control">
						<option>선택</option>
						<option>1</option>
				</select>
			</label>

			<button type="button" class="btn btn-success"
				style="margin-left: 30px">확인</button>
		</form>

		<hr>

		<h2>내역</h2><br/>
		<table id="Material-Order-Table" class="table table-bordered table-striped"
			style="clear: both">
			<tbody>
				<tr>
					<td width="35%">회사명</td>
					<td width="65%"><a href="#" id="username" data-type="text"
						data-pk="1" data-title="Enter username">TryCoffee Catch{}</a></td>
				</tr>
				<tr>
					<td>주문자</td>
					<td><a href="#" id="firstname" data-type="text" data-pk="1"
						data-placement="right" data-placeholder="Required"
						data-title="Enter your firstname">점장1</a></td>
				</tr>
				<tr>
					<td>매장명</td>
					<td><a href="#" id="sex" data-type="select" data-pk="1"
						data-value="" data-title="Select sex">종각점</a></td>
				</tr>
				<tr class="Address-tr">
					<td>주소</td>
					<td><a href="#" id="group" data-type="select" data-pk="1"
						data-value="5" data-source="/groups" data-title="Select group">서울특별시 중구 지하동 101</a></td>
				</tr>
				<tr>
					<td>계피가루</td>
					<td>33개/9900원</td>
				</tr>

				<tr>
					<td>송진가루</td>
					<td>33개/9900원</td>
				</tr>
				<tr>
					<td>배송 날짜</td>
					<td><a href="#" id="comments" data-type="textarea" data-pk="1"
						data-placeholder="Your comments here..."
						data-title="Enter comments">2016년 1월 1일</a></td>
				</tr>
				<tr>
					<td>총 결제액</td>
					<td>19800원</td>
				</tr>
			</tbody>
		</table>

		<div style="display:inline-block; width: 50%;">
			<h3>
				Memo <small>문의 사항을 입력해주세요</small>
			</h3>
		</div>
		<div>
				<textarea id="console" class="form-control" rows="8"
					style="width: 70%" autocomplete="off"></textarea>
		</div>

		<div style="display:inline-block; margin-top: 10%">
			<a class="btn btn-success">결제 완료</a>&nbsp;&nbsp;&nbsp;
			<a class="btn btn-default">결제 취소</a>		
		</div>
	</div>
</body>
</html>
