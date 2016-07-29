<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<style>
.main-sidebar span {
	color: white;
}

.Select-Profit {
	margin-right: 10px;
}
</style>
</head>
<body class="hold-transition skin-blue sidebar-mini">
	<div class="wrapper">
		<!-- Header -->
		<jsp:include page="../layout/Header.jsp" />

		<!-- 점장이 원하는 연도 혹은 월별을 선택하는 Panel -->
		<div class="panel panel-default panel-table">
			<div class="panel-heading" style="background-color: #18bc9c">
				<div class="row">
					<div class="col col-xs-6">
						<h3 class="panel-title">매출액</h3>
					</div>
				</div>
			</div>
			<div class="panel-body">
				<!-- Member Info Panel -->
				<div class="row" style="padding-left: 15px">
					<form id="Select-Profit-Form" class="form-inline">
						<div class="form-group Select-Profit">
							<label for="Select-Year-Profit">연도 입력</label> <input type="text"
								class="form-control" id="Select-Year-Profit"
								placeholder="1999년 입력 : 1999">
						</div>

						<button type="button" id="Show-Owner-Store-Profit-Btn"
							class="btn btn-default">확인</button>
					</form>
				</div>
				<!-- Chart -->
				<div class="row">
					<div id="Year-Chart" style="display: none"></div>
					<div id="Years-Chart" style="display: none"></div>
					<div id="Month-Chart" style="display: none"></div>
				</div>
				<!-- 예약 Chart -->
				<div class="row">
					<div id="Year-Order-Chart" style="display: none"></div>
					<div id="Month-Order-Chart" style="display: none"></div>
					<div id="Day-Order-Chart" style="display: none"></div>
				</div>
				<div id="More-Detail-Profit-First-Head" class="row text-center"
					style="display: none">
					<h3>더 상세한 자료를 원한다면 아래의 아이콘을 클릭해주세요</h3>
					<a id="Want-More-Detail-Profit-Btn" class="btn btn-default"><em
						class="fa fa-exclamation" aria-hidden="true"></em></a>
				</div>
				<div id="More-Detail-Profit-Table-Div" class="row"
					style="display: none">
					<hr />
					<h2>상세 정보</h2>
					<ul class="nav nav-tabs">
						<li role="presentation" class="active"><a href="#">2016년</a></li>
						<li role="presentation"><a href="#">1월</a></li>
						<li role="presentation"><a href="#">2월</a></li>
						<li role="presentation"><a href="#">3월</a></li>
						<li role="presentation"><a href="#">4월</a></li>
						<li role="presentation"><a href="#">5월</a></li>
						<li role="presentation"><a href="#">6월</a></li>
						<li role="presentation"><a href="#">7월</a></li>
						<li role="presentation"><a href="#">8월</a></li>
						<li role="presentation"><a href="#">9월</a></li>
						<li role="presentation"><a href="#">10월</a></li>
						<li role="presentation"><a href="#">11월</a></li>
						<li role="presentation"><a href="#">12월</a></li>
					</ul>
					<br />
					<table id="Material-Order-Table"
						class="table table-bordered table-striped" style="clear: both">
						<tbody>
							<tr>
								<td width="35%">매장명</td>
								<td width="65%"><a href="#" id="username" data-type="text"
									data-pk="1" data-title="Enter username">종각점</a></td>
							</tr>
							<tr>
								<td>담당자</td>
								<td><a href="#" id="firstname" data-type="text" data-pk="1"
									data-placement="right" data-placeholder="Required"
									data-title="Enter your firstname">점장1</a></td>
							</tr>
							<tr>
								<td>조회 날짜</td>
								<td><a href="#" id="sex" data-type="select" data-pk="1"
									data-value="" data-title="Select sex">2016년</a></td>
							</tr>
							<tr class="Address-tr">
								<td>온라인 예약건수</td>
								<td><a href="#" id="group" data-type="select" data-pk="1"
									data-value="5" data-source="/groups" data-title="Select group">4,000회</a></td>
							</tr>
							<tr class="Address-tr">
								<td>하루 평균 예약건수</td>
								<td><a href="#" id="group" data-type="select" data-pk="1"
									data-value="5" data-source="/groups" data-title="Select group">5회</a></td>
							</tr>
							<tr class="Address-tr">
								<td>커피</td>
								<td><a href="#" id="group" data-type="select" data-pk="1"
									data-value="5" data-source="/groups" data-title="Select group">23,000,000원</a></td>
							</tr>
							<tr class="Address-tr">
								<td>케이크</td>
								<td><a href="#" id="group" data-type="select" data-pk="1"
									data-value="5" data-source="/groups" data-title="Select group">23,000,000원</a></td>
							</tr>
							<tr class="Address-tr">
								<td>음료</td>
								<td><a href="#" id="group" data-type="select" data-pk="1"
									data-value="5" data-source="/groups" data-title="Select group">23,000,000원</a></td>
							</tr>
							<tr class="Address-tr">
								<td>매출액</td>
								<td><a href="#" id="group" data-type="select" data-pk="1"
									data-value="5" data-source="/groups" data-title="Select group">99,000,000원</a></td>
							</tr>
						</tbody>
					</table>
					<!-- Coffee Detail  -->
					<div class="panel panel-default panel-table">
						<div class="panel-heading">
							<div class="row">
								<div class="col col-xs-6">
									<h3 class="panel-title">커피</h3>
								</div>
							</div>
						</div>
						<div class="panel-body">
							<!-- Coffee Info Panel -->
							<div class="row">
								<table id="Material-Order-Table"
									class="table table-bordered table-striped" style="clear: both">
									<tbody>

										<tr>
											<td width="35%">핫초코</td>
											<td width="35%"><a href="#" id="username"
												data-type="text" data-pk="1" data-title="Enter username">1711회
													주문</a></td>
											<td width="30%"><a href="#" id="username"
												data-type="text" data-pk="1" data-title="Enter username">3,000,000원</a></td>
										</tr>
										<tr>
											<td width="35%">아메리카노</td>
											<td width="35%"><a href="#" id="username"
												data-type="text" data-pk="1" data-title="Enter username">1711회
													주문</a></td>
											<td width="30%"><a href="#" id="username"
												data-type="text" data-pk="1" data-title="Enter username">3,000,000원</a></td>
										</tr>
										<tr>
											<td width="35%">카페모카</td>
											<td width="35%"><a href="#" id="username"
												data-type="text" data-pk="1" data-title="Enter username">1711회
													주문</a></td>
											<td width="30%"><a href="#" id="username"
												data-type="text" data-pk="1" data-title="Enter username">3,000,000원</a></td>
										</tr>
									</tbody>
								</table>
							</div>
						</div>
					</div>
					<!-- Cake -->
					<div class="panel panel-default panel-table">
						<div class="panel-heading">
							<div class="row">
								<div class="col col-xs-6">
									<h3 class="panel-title">케이크</h3>
								</div>
							</div>
						</div>
						<div class="panel-body">
							<!-- Cake Info Panel -->
							<div class="row">
								<table id="Material-Order-Table"
									class="table table-bordered table-striped" style="clear: both">
									<tbody>

										<tr>
											<td width="35%">허니 브레드</td>
											<td width="35%"><a href="#" id="username"
												data-type="text" data-pk="1" data-title="Enter username">1711회
													주문</a></td>
											<td width="30%"><a href="#" id="username"
												data-type="text" data-pk="1" data-title="Enter username">3,000,000원</a></td>
										</tr>
										<tr>
											<td width="35%">허니 버터 브레드</td>
											<td width="35%"><a href="#" id="username"
												data-type="text" data-pk="1" data-title="Enter username">1711회
													주문</a></td>
											<td width="30%"><a href="#" id="username"
												data-type="text" data-pk="1" data-title="Enter username">3,000,000원</a></td>
										</tr>
										<tr>
											<td width="35%">허니 버터 갈릭 브레드</td>
											<td width="35%"><a href="#" id="username"
												data-type="text" data-pk="1" data-title="Enter username">1711회
													주문</a></td>
											<td width="30%"><a href="#" id="username"
												data-type="text" data-pk="1" data-title="Enter username">3,000,000원</a></td>
										</tr>
									</tbody>
								</table>
							</div>
						</div>
					</div>
					<!-- Drink -->
					<div class="panel panel-default panel-table">
						<div class="panel-heading">
							<div class="row">
								<div class="col col-xs-6">
									<h3 class="panel-title">음료</h3>
								</div>
							</div>
						</div>
						<div class="panel-body">
							<!-- Drink Info Panel -->
							<div class="row">
								<table id="Material-Order-Table"
									class="table table-bordered table-striped" style="clear: both">
									<tbody>

										<tr>
											<td width="35%">아이스티</td>
											<td width="35%"><a href="#" id="username"
												data-type="text" data-pk="1" data-title="Enter username">1711회
													주문</a></td>
											<td width="30%"><a href="#" id="username"
												data-type="text" data-pk="1" data-title="Enter username">3,000,000원</a></td>
										</tr>
										<tr>
											<td width="35%">딸기 스무디</td>
											<td width="35%"><a href="#" id="username"
												data-type="text" data-pk="1" data-title="Enter username">1711회
													주문</a></td>
											<td width="30%"><a href="#" id="username"
												data-type="text" data-pk="1" data-title="Enter username">3,000,000원</a></td>
										</tr>
										<tr>
											<td width="35%">립톤</td>
											<td width="35%"><a href="#" id="username"
												data-type="text" data-pk="1" data-title="Enter username">1711회
													주문</a></td>
											<td width="30%"><a href="#" id="username"
												data-type="text" data-pk="1" data-title="Enter username">3,000,000원</a></td>
										</tr>
									</tbody>
								</table>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- MenuProfit Modal -->
	<jsp:include page="MenuProfit_Modal.jsp" />
		<!-- jQuery 2.2.0 -->
	<script src="/owner/resources/plugins/jQuery/jQuery-2.2.0.min.js"></script>
	<!-- jQuery UI 1.11.4 -->
	<script src="https://code.jquery.com/ui/1.11.4/jquery-ui.min.js"></script>
	<!-- Google Chart -->
<script type="text/javascript"
	src="https://www.gstatic.com/charts/loader.js"></script>
<script src="/owner/resources/Owner_js/ListAjax.js"></script>
<script>
	var yearTotalPrice;
	var year;
	
	var yearsFinalChart = new Array();
	var monthFinalChart = new Array();
	var dayReservationFinalChart = new Array();
	var yearReservationDrinkCount;
	var monthReservationFinalChart = new Array();
	var menuPercentageFinalChart = new Array();
	
	var today = new Date();
	var thisYear = String(today.getFullYear());
		$(function(){
			google.charts.load("current", {packages : [ 'corechart' ]});
			
			$("#Menu-Percentage-Modal").draggable();
			//Menu Percengate Modal은 처음에 hide
			$("#Menu-Percentage-Modal").hide();
			$("#Menu-Percentage-Modal-Hide-Btn").click(function(){
				$("#Menu-Percentage-Modal").hide();
			});
			
			//매출액 상세 보기 클릭시 Table 생성
			$("#Want-More-Detail-Profit-Btn").click(function(){
				$("#More-Detail-Profit-First-Head").hide();
				$("#More-Detail-Profit-Table-Div").slideDown(400);
			});
			
			//연도 입력 후 확인 버튼 클릭
			$("#Show-Owner-Store-Profit-Btn").click(function(){
				year = String($("#Select-Year-Profit").val());
				if(year == ""){
					alert("입력되지 않았습니다.");
					$("#Select-Year-Profit").focus();
					return false;
				}
				//배열 초기화	
				yearsFinalChart.length = 0;
				monthFinalChart.length = 0;
				dayReservationFinalChart.length = 0;
				yearReservationDrinkCount = 0;
				monthReservationFinalChart.length = 0;
				menuPercentageFinalChart.length = 0;
				$("#More-Detail-Profit-First-Head").show();
				var jsonData = {
						year : year
				};
				callList_Ajax("/owner/year_profit/profit_owner", successYearProfitOwner, errorYearProfitOwner, jsonData);
				callList_Ajax("/owner/years_profit/profit_owner", successYearsProfitOwner, errorYearProfitOwner, null);
				callList_Ajax("/owner/month_profit/profit_owner", successMonthProfitOwner, errorYearProfitOwner, null);
				callList_Ajax("/owner/year_reservation_drink/profit_owner", successYearReservationDrink, errorYearProfitOwner, null);
				callList_Ajax("/owner/month_reservation_drink/profit_owner", successMonthReservationDrink, errorYearProfitOwner, null);
				callList_Ajax("/owner/day_reservation_drink/profit_owner", successDayReservationDrink, errorYearProfitOwner, null);
			});
		})
		function successYearProfitOwner(data){
			yearTotalPrice = data.year_total_price;
			$("#Year-Chart").css("display", "inline-block");							
			google.charts.setOnLoadCallback(YearChart);
		}
		//Year Chart
		function YearChart() {
			var data = google.visualization
					.arrayToDataTable([
							[ '연도', '총 매출액', {
								role : 'style'
							} ],

							[
									year,
									yearTotalPrice,
									'stroke-color: #703593; stroke-width: 4; fill-color: #C5A5CF' ] ]);

			var view = new google.visualization.DataView(
					data);
			view.setColumns([ 0, 1, {
				calc : "stringify",
				sourceColumn : 1,
				type : "string",
				role : "annotation"
			}, 2 ]);

			var options = {
				title : "2016년 매출액(원)",
				width : 420,
				height : 400,
				bar : {
					groupWidth : "95%"
				},
				legend : {
					position : "none"
				},
			};
			var chart = new google.visualization.ColumnChart(
					document
							.getElementById("Year-Chart"));
			chart.draw(view, options);
	}
		
		function errorYearProfitOwner(){
			alert("연도별 매출액 그래프를 불러오는데 실패하였습니다.");
		}
		
		function successYearsProfitOwner(data){
			var yearsHeadr = new Array();
			yearsHeadr.push('연도');
			yearsHeadr.push('총 매출액');
			yearsHeadr.push({ role: 'style' });
			yearsFinalChart.push(yearsHeadr);
			$.each(data.yearPriceList, function(index, yearsPrice){
				var yearsTempChart = new Array();
				yearsTempChart.push(String(Number(thisYear)-2 + index));
				yearsTempChart.push(yearsPrice);
				yearsTempChart.push('stroke-color: #703593; stroke-width: 4; fill-color: #C5A5CF');
				yearsFinalChart.push(yearsTempChart);
			});
			$("#Years-Chart").css("display", "inline-block");
			google.charts.setOnLoadCallback(YearsChart);
		}
		//Years Chart
		 function YearsChart() {
			 var data = google.visualization.arrayToDataTable(yearsFinalChart);

      var view = new google.visualization.DataView(data);
      view.setColumns([0, 1,
                       { calc: "stringify",
                         sourceColumn: 1,
                         type: "string",
                         role: "annotation" },
                       2]);

      var options = {
        title: "최근 2년간 매출액 그래프(원)",
        width: 600,
        height: 400,
        bar: {groupWidth: "95%"},
        legend: { position: "none" },
      };
      var chart = new google.visualization.BarChart(document.getElementById("Years-Chart"));
      chart.draw(view, options);
      
    	//Chart 클릭 event
		google.visualization.events.addListener(chart, 'select', selectHandler);
		
		//연도별 매출액 bar 클릭시 해당 연도 메뉴 매출액 보여줌
		function selectHandler() {
			 var yearProfit;
			 var year;
			 var selection = chart.getSelection();
			  for (var i = 0; i < selection.length; i++) {
			    var item = selection[i];
			    if (item.row != null && item.column != null) {
			    	yearProfit = data.getFormattedValue(item.row, item.column);
			    	year = data.getFormattedValue(item.row, 0);
			    } else if (item.row != null) {
			      var str = data.getFormattedValue(item.row, 0);
			    } else if (item.column != null) {
			      var str = data.getFormattedValue(0, item.column);
			    }
			  }
			  alert(year);
			  var select_year = {year:year, yearProfit:yearProfit};
			  callList_Ajax("/owner/year_menu_percentage/profit_owner", successYearMenuPercentage, errorYearProfitOwner, select_year);
		}	
  }		
		function successYearMenuPercentage(data){
			var menuPercentagHeader = new Array();
			menuPercentagHeader.push('Category');
			menuPercentagHeader.push('Hours per Day');
			menuPercentageFinalChart.push(menuPercentagHeader);
			$.each(data.yearMenuPercentage, function(index, data){
				var menuPercenategeTempChart = new Array();
				menuPercenategeTempChart.push(data.category_name);
				menuPercenategeTempChart.push(data.percentage);
				menuPercentageFinalChart.push(menuPercenategeTempChart);
			});
			$("#Menu-Percentage-Modal").show();
			  google.charts.setOnLoadCallback(MenuChart);
		}
		function successMonthProfitOwner(data){
			var monthHeader = new Array();
			monthHeader.push('Month');
			monthHeader.push('월별 매출액');
			monthHeader.push({ role: 'style' });
			monthFinalChart.push(monthHeader);
			$.each(data.monthPriceList, function(index, data){
				var monthTmepChart = new Array();
				monthTmepChart.push(String(data.month));
				monthTmepChart.push(data.total_price);
				monthTmepChart.push('stroke-color: #703593; stroke-width: 4; fill-color: #C5A5CF');
				monthFinalChart.push(monthTmepChart);
			});
			$("#Month-Chart").css("display", "inline-block");
			google.charts.setOnLoadCallback(MonthChart);		
		}
		//Month Chart
		function MonthChart() {
			 var data = google.visualization.arrayToDataTable(monthFinalChart);

			 var view = new google.visualization.DataView(
						data);
				view.setColumns([ 0, 1, {
					calc : "stringify",
					sourceColumn : 1,
					type : "string",
					role : "annotation"
				}, 2 ]);
				
			 var options = {
						title : "2016년 월별 매출액(원)",
						width : 600,
						height : 400,
						bar : {
							groupWidth : "95%"
						},
						legend : {
							position : "none"
						},
					};
					var chart = new google.visualization.ColumnChart(
							document
									.getElementById("Month-Chart"));
					chart.draw(view, options);
					
					//Chart 클릭 event
					google.visualization.events.addListener(chart, 'select', selectHandler);
					
					//월별 매출액 bar 클릭시 해당 월 메뉴 매출액 보여줌
					function selectHandler() {
						 var monthProfit;
						 var month;
						//Month-Chart를 선택 
						var selection = chart.getSelection();
						  for (var i = 0; i < selection.length; i++) {
						    var item = selection[i];
						    if (item.row != null && item.column != null) {
						      monthProfit = data.getFormattedValue(item.row, item.column);
						      month = data.getFormattedValue(item.row, 0);
						    } else if (item.row != null) {
						      var str = data.getFormattedValue(item.row, 0);
						    } else if (item.column != null) {
						      var str = data.getFormattedValue(0, item.column);
						    }
						  }
						  alert('You selected ' + month);
						  $("#Menu-Percentage-Modal").show();
						  google.charts.setOnLoadCallback(MenuChart);
					}
		}
		//Menu-Chart
		function MenuChart() {
        var data = google.visualization.arrayToDataTable(menuPercentageFinalChart);

        var options = {
          title: '각 메뉴별 판매율(%)',
          pieHole: 0.4,
        };

        var chart = new google.visualization.PieChart(document.getElementById('Menu-Chart'));
        chart.draw(data, options);
      }
		function successYearReservationDrink(data){
			yearReservationDrinkCount = Number(data.yearReservationDrinkCount);
			$("#Year-Order-Chart").css("display", "inline-block");
			google.charts.setOnLoadCallback(Year_Order_Chart);		
		}
		//예약 YearChart
		function Year_Order_Chart() {
			var data = google.visualization
					.arrayToDataTable([
							[ '연도', '총 예약건', {
								role : 'style'
							} ],

							[
									thisYear,
									yearReservationDrinkCount,
									'stroke-color: #703593; stroke-width: 4; fill-color: #871B47' ] ]);

			var view = new google.visualization.DataView(
					data);
			view.setColumns([ 0, 1, {
				calc : "stringify",
				sourceColumn : 1,
				type : "string",
				role : "annotation"
			}, 2 ]);

			var options = {
				title : "2016년 예약(건)",
				width : 420,
				height : 400,
				bar : {
					groupWidth : "95%"
				},
				legend : {
					position : "none"
				},
			};
			var chart = new google.visualization.ColumnChart(
					document
							.getElementById("Year-Order-Chart"));
			chart.draw(view, options);
	}
		function successMonthReservationDrink(data){
			var monthReservationHeader = new Array();
			monthReservationHeader.push('Month');
			monthReservationHeader.push('월별 예약건');
			monthReservationHeader.push({ role: 'style' });
			monthReservationFinalChart.push(monthReservationHeader);
			$.each(data.monthReservationCount, function(index, data){
				var monthReservationChart = new Array();
				monthReservationChart.push((index+1)+"월");
				monthReservationChart.push(data);
				monthReservationChart.push('stroke-color: #703593; stroke-width: 4; fill-color: #871B47');
				monthReservationFinalChart.push(monthReservationChart);
			});
			$("#Month-Order-Chart").css("display", "inline-block");
			google.charts.setOnLoadCallback(Month_Order_Chart);				
		}
		//예약 Month Chart
		function Month_Order_Chart() {
			 var data = google.visualization.arrayToDataTable(monthReservationFinalChart);

			 var view = new google.visualization.DataView(
						data);
				view.setColumns([ 0, 1, {
					calc : "stringify",
					sourceColumn : 1,
					type : "string",
					role : "annotation"
				}, 2 ]);
				
			 var options = {
						title : "2016년 월별 예약(건)",
						width : 600,
						height : 400,
						bar : {
							groupWidth : "95%"
						},
						legend : {
							position : "none"
						},
					};
					var chart = new google.visualization.ColumnChart(
							document
									.getElementById("Month-Order-Chart"));
					chart.draw(view, options);
	
		}
		
		function successDayReservationDrink(data){
			var dayReservationHeader = new Array();
			dayReservationHeader.push('Time');
			dayReservationHeader.push('예약건수');
			dayReservationFinalChart.push(dayReservationHeader);
			$.each(data.dayHourReservationCount, function(index, data){
				var dayReservationTempChart = new Array();
				dayReservationTempChart.push(String(index+10));
				dayReservationTempChart.push(data);
				dayReservationFinalChart.push(dayReservationTempChart);
			});
			$("#Day-Order-Chart").css("display", "inline-block");
			google.charts.setOnLoadCallback(Day_Order_Chart);				
		}
		//예약 일 시간 평균 Chart
		function Day_Order_Chart() {
        var data = google.visualization.arrayToDataTable(dayReservationFinalChart);

        var options = {
          title: thisYear+'년 일일 평균 예약 시간(건)',
          curveType: 'function',
          legend: { position: 'bottom' },
          width: 600,
          height: 400
        };

        var chart = new google.visualization.LineChart(document.getElementById('Day-Order-Chart'));

        chart.draw(data, options);
      }
		$.widget.bridge('uibutton', $.ui.button);
	</script>
	<!-- Footer -->
	<jsp:include page="../layout/Footer.jsp" />
</body>
</html>