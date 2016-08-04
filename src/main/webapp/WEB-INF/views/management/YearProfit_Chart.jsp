<%@ page contentType="text/html; charset=UTF-8"%>
<script type="text/javascript"
	src="https://www.gstatic.com/charts/loader.js"></script>
<script src="/owner/resources/Owner_js/ListAjax.js"></script>
<script type="text/javascript">
	var finalYearRow = new Array();
	var today = new Date();
	var year = String(today.getFullYear());
	var header_year_option = {
		sourceColumn : 1,
		role : 'annotation'
	};
	$(function() {
		callList_Ajax("/owner/year_profit/main/chart", successCallProfitYear,
				null, null);
	})
	function successCallProfitYear(data) {
		var category_percentage_name = new Array();
		var category_percentage_value = new Array();
		var header_year = new Array();
		header_year.push('');
		$.each(data.categoryList, function(index, category) {
			category_percentage_name.push(category);
			header_year.push(category);
		})
		header_year.push(header_year_option);
		finalYearRow.push(header_year);
		for (var i = 0; i < data.profitYearList.length; i++) {
			var categoryNameAndPrice = data.profitYearList[i].profitMenu
					.split("/");
			var categoryPrice;
			var finalResult = new Array();
			finalResult.push(String(data.profitYearList[i].year) + "년");
			for (var j = 0; j < categoryNameAndPrice.length - 1; j++) {
				categoryPrice = categoryNameAndPrice[j].split(",");
				finalResult.push(Number(categoryPrice[1]));
				if (data.profitYearList[i].year == year) {
					category_percentage_value.push(categoryPrice[1]);
				}
			}
			finalResult.push('');
			finalYearRow.push(finalResult);
		}
		var total_value = 0;
		for (var i = 0; i < category_percentage_name.length; i++) {
			total_value += Number(category_percentage_value[i]);
		}

		for (var i = 0; i < category_percentage_name.length; i++) {
			$("#Category-Percentage-div")
					.append(
							""
									+ "<div class='col-xs-4 text-center' style='border-right: 1px solid #f4f4f4'>"
									+ "<input type='text' class='knob' data-readonly='true' value='"
									+ ((Number(category_percentage_value[i])) / total_value)
									* 100
									+ "%' data-width='60' data-height='60' data-fgColor='#39CCCC' readonly='readonly' style='color:#39CCCC; border:none'>"
									+ "<div class='knob-label' style='font-weight:bold'>"
									+ category_percentage_name[i] + "</div>"
									+ "</div>");
		}
	}
	google.charts.setOnLoadCallback(drawChart);
	function drawChart() {
		var data = google.visualization.arrayToDataTable(finalYearRow);

		var options = {
			legend : {
				position : 'top',
				maxLines : 3
			},
			bar : {
				groupWidth : '75%'
			},
			colors : [ '#DCEBFF' ],
			isStacked : true,
		};

		var chart = new google.charts.Bar(document
				.getElementById('Year-Profit-Div'));

		chart.draw(data, google.charts.Bar.convertOptions(options));
	}
</script>