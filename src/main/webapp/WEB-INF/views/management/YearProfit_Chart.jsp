<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script type="text/javascript"
	src="https://www.gstatic.com/charts/loader.js"></script>
<script type="text/javascript">
	google.charts.setOnLoadCallback(drawChart);
	function drawChart() {
		var data = google.visualization.arrayToDataTable([
				['', 'coffee', 'drink', 'cake', {
					 		sourceColumn: 1,
							role : 'annotation'
						}], 
				[ '2014', 10, 24, 20 , ''],
				[ '2015', 16, 22, 23, '' ],
				[ '2016', 28, 19, 29, ''] 
				]);

		var options = {
			legend : {
				position : 'top',
				maxLines : 3
			},
			bar : {
				groupWidth : '75%'
			},
			colors : ['#DCEBFF'],
			isStacked : true,
		};

		var chart = new google.charts.Bar(document
				.getElementById('Year-Profit-Div'));

		 chart.draw(data, google.charts.Bar.convertOptions(options));
	}
</script>