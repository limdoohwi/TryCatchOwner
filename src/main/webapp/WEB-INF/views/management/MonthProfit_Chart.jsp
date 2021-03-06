<!-- 
/*
 * 	JSP: MonthProfit_Chart
 *  Description: 메인 페이지에서 설정된 매장의 이번 연도 월별 매출액을 보여주는 그래프 JSP
 *  Created: 2016­07­24
 *	Author: 김준혁
 *  Mail: iamheykj@gmail.com
 * 	Copyrights 2016-07-24 by Try{}Catch
 *
 *	Revisions:
 *  1. When & Who : 2016-07-31 by 김준혁
 *  2. What		  : 설정된 매장의 이번 연도 월별 매출액을 호출하는 ajax 생성
 */
 -->

<%@ page contentType="text/html; charset=UTF-8"%>
<script type="text/javascript"
	src="https://www.gstatic.com/charts/loader.js"></script>
<script src="/owner/resources/Owner_js/ListAjax.js"></script>
<script type="text/javascript">
	var finalRow = new Array();
	var today = new Date();
	var year = String(today.getFullYear());
	$(function() {
		callList_Ajax("/owner/month_profit/main/chart", successCallProfitMonth,
				null, null);
	})
	function successCallProfitMonth(data) {
		var header = new Array();
		header.push("Month");
		$.each(data.categoryList, function(index, category) {
			header.push(category);
		})
		finalRow.push(header);
		for (var i = 0; i < data.profitMonthList.length; i++) {
			var categoryNameAndPrice = data.profitMonthList[i].profitMenu
					.split("/");
			var categoryPrice;
			var finalResult = new Array();
			finalResult.push(data.profitMonthList[i].month + "월");
			for (var j = 0; j < categoryNameAndPrice.length - 1; j++) {
				categoryPrice = categoryNameAndPrice[j].split(",");
				finalResult.push(Number(categoryPrice[1]));
			}
			finalRow.push(finalResult);
		}
	}
	google.charts.load('current', {
		'packages' : [ 'corechart', 'bar' ]
	});
	google.charts.setOnLoadCallback(drawChart);
	function drawChart() {
		var data = google.visualization.arrayToDataTable(finalRow);
		var options = {
			title : year + ' Month Profit',
			hAxis : {
				title : 'Month',
				titleTextStyle : {
					color : '#333'
				}
			},
			vAxis : {
				minValue : 0
			}
		};

		var chart = new google.visualization.AreaChart(document
				.getElementById('Month-Profit-Div'));
		chart.draw(data, options);
	}
</script>