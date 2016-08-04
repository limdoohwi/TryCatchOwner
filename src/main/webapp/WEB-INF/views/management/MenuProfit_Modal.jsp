<!-- 
/*
 *  Description :  회원 구매 내역 상품 리스트 모달
 *  Created : 2016-07-08
 *  Author : 김준혁
 *  
 *  Revisions :
 */
 -->

<%@ page contentType="text/html; charset=UTF-8"%>

<script>
	$(function(){
		$("#Menu-Percentage-Modal-Hide-Btn").click(function(){
			menuPercentageFinalChart.length = 0;
		});
	})
</script>

<style>
#Menu-Percentage-Modal {
	padding: 20px;
	border: 4px solid #ddd;
	position: absolute;
	left: 600px;
	top: 300px;
	background: #fff;
}

#Show-Detail-Purchase-List button {
	cursor: pointer;
}
</style>

<div id="Menu-Percentage-Modal">
	<div id="Menu-Chart" style="width: 500px; height: 500px"></div>
	<div class="col-sm-offset-5">
		<button id="Menu-Percentage-Modal-Hide-Btn" type="button"
			class="btn btn-default">닫기</button>
	</div>
</div>

