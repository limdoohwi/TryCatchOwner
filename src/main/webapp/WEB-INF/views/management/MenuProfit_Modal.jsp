<!-- 
/*
 * 	JSP: MenuProfit_Modal
 *  Description: 매출엑 페이지에서 입력 연도 연도별 매출액 혹은 월별 매출액의 그래프 클릭시 해당 연도 또는 해당 연도의 선택 월의 카테고리별 판매율을 보여주는 제이쿼리 레이어 팝업
 *  Created: 2016­07­24
 *	Author: 김준혁
 *  Mail: iamheykj@gmail.com
 * 	Copyrights 2016-07-24 by Try{}Catch
 *
 *	Revisions:
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

