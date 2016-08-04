<%@ page contentType="text/html; charset=UTF-8"%>
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
						<li role="presentation" class="active"><a class="Select-Year"
							href="#More-Detail-Profit-Table-Div"></a></li>
						<li role="presentation"><a href="#" class="Select-Year"
							id="1">1월</a></li>
						<li role="presentation"><a href="#" class="Select-Year"
							id="2">2월</a></li>
						<li role="presentation"><a href="#" class="Select-Year"
							id="3">3월</a></li>
						<li role="presentation"><a href="#" class="Select-Year"
							id="4">4월</a></li>
						<li role="presentation"><a href="#" class="Select-Year"
							id="5">5월</a></li>
						<li role="presentation"><a href="#" class="Select-Year"
							id="6">6월</a></li>
						<li role="presentation"><a href="#" class="Select-Year"
							id="7">7월</a></li>
						<li role="presentation"><a href="#" class="Select-Year"
							id="8">8월</a></li>
						<li role="presentation"><a href="#" class="Select-Year"
							id="9">9월</a></li>
						<li role="presentation"><a href="#" class="Select-Year"
							id="10">10월</a></li>
						<li role="presentation"><a href="#" class="Select-Year"
							id="11">11월</a></li>
						<li role="presentation"><a href="#" class="Select-Year"
							id="12">12월</a></li>
					</ul>
					<br />
					<table id="Material-Order-Table"
						class="table table-bordered table-striped" style="clear: both">
						<tbody>
							<tr>
								<td width="35%">매장명</td>
								<td width="65%"><a href="#">${store_dto.store_name}</a></td>
							</tr>
							<tr>
								<td>담당자</td>
								<td><a href="#">${member_dto.member_name}</a></td>
							</tr>
							<tr>
								<td>조회 날짜</td>
								<td><a href="#" class="Select-Year-Search"></a></td>
							</tr>
							<tr class="Address-tr">
								<td>온라인 예약건수</td>
								<td><a href="#"
									class="Select-Year-Online-Reservation-Count"></a></td>
							</tr>
							<tr class="Day-Average-Tr Address-tr">
								<td>하루 평균 예약건수</td>
								<td><a href="#"
									class="Select-Year-Online-Day-Average-Reservation-Count"></a></td>
							</tr>

							<tr class="Address-tr">
								<td>매출액</td>
								<td><a href="#" class="Select-Year-Total-Profit"></a></td>
							</tr>
						</tbody>
					</table>
				</div>
				<div id="More-Detail-Profit-Hide-Div" class="text-center"
					style="display: none">
					<button type="button" class="btn btn-success">닫기</button>
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
		var selectYear;

		var monthReservationCount = new Array();
		var yearsFinalChart = new Array();
		var monthFinalChart = new Array();
		var dayReservationFinalChart = new Array();
		var yearReservationDrinkCount;
		var monthReservationFinalChart = new Array();
		var menuPercentageFinalChart = new Array();
		var dayAverageReservationDrinkCount;
		var selectYearMenuProfit = new Array();
		var today = new Date();
		var thisYear = String(today.getFullYear());
		$(function() {
			$("#Wait-Modal").hide();
			google.charts.load("current", {
				packages : [ 'corechart' ]
			});
			$("#Menu-Percentage-Modal").draggable();
			//Menu Percengate Modal은 처음에 hide
			$("#Menu-Percentage-Modal").hide();
			$("#Menu-Percentage-Modal-Hide-Btn").click(function() {
				$("#Menu-Percentage-Modal").hide();
			});

			//매출액 상세 보기 클릭시 Table 생성
			$("#Want-More-Detail-Profit-Btn").click(function() {
				$("#More-Detail-Profit-Hide-Div").show();
				$("#Wait-Modal").show();
				//첫 시작시 해당 연도 상세보기
				anotherMonthDetailProfit(selectYear);
			});

			//매출액 상세 보기 닫기 클릭
			$("#More-Detail-Profit-Hide-Div button").click(function() {
				$("#More-Detail-Profit-Hide-Div").hide();
				$("#More-Detail-Profit-First-Head").show();
				$("#More-Detail-Profit-Table-Div").slideUp(400);
			});

			//Select-Year 클릭
			$(".Select-Year").click(function() {
				var index = $(".Select-Year").index(this);
				var month = $(".Select-Year").eq(index).attr("id");
				anotherMonthDetailProfit(month);
			});
			//상세 보기 테이블의 다른 월 클릭시 이벤트 발생
			function anotherMonthDetailProfit(date) {
				var select_year;
				var month;
				var reservationCount;
				var detailDayReservationDrinkCount;
				//연도일 때
				if (date.length == 4) {
					select_year = {
						year : selectYear,
						month : 0
					};
					month = "";
					reservationCount = yearReservationDrinkCount;
					detailDayReservationDrinkCount = dayAverageReservationDrinkCount;

				}
				//월일 때
				else if (date.length < 4) {
					select_year = {
						year : selectYear,
						month : date
					};
					month = date;
					for (var i = 0; i < monthReservationCount.length; i++) {
						if (i == date - 1) {
							reservationCount = monthReservationCount[i];
						}
					}
					detailDayReservationDrinkCount = Math
							.ceil(reservationCount / 13);
				}
				$("#Wait-Modal").show();
				$("#More-Detail-Profit-First-Head").hide();
				$("#More-Detail-Profit-Table-Div").slideDown(400);
				$(".Select-Year").eq(0).text(select_year.year + "년 ");
				$(".Select-Year-Search").text(
						select_year.year + "년 " + month + "월");
				$(".Select-Year-Online-Reservation-Count").text(
						reservationCount + "건");
				$(".Select-Year-Online-Day-Average-Reservation-Count").text(
						detailDayReservationDrinkCount + "건");
				//해당 연도 혹은 월별 예약 건수

				//카테고리별 판매액
				callList_Ajax("/owner/year_menu_percentage/profit_owner",
						successYearMenuPrice, errorYearProfitOwner, select_year);
				function successYearMenuPrice(data) {
					var Total_Profit = 0;
					//초기화
					$(".Category-Menu-Price-tr").remove();
					$.each(data.yearMenuPercentage, function(index, data) {
						Total_Profit += Number(data.percentage);
						var html = "<tr class='Category-Menu-Price-tr'><td>"
								+ data.category_name + "</td><td><a href='#'>"
								+ data.percentage + "원</a></td></tr>";
						$(".Day-Average-Tr").after(html);
					});
					$(".Select-Year-Total-Profit").text(Total_Profit + "원`");
				}
				//메뉴별 판매액				
				callList_Ajax("/owner/menu_countAndPrice/profit_owner",
						successMenucountAndPrice, errorYearProfitOwner,
						select_year);
				function successMenucountAndPrice(data) {
					//초기화
					$(".Menu-Count-Price-Panel").remove();
					$
							.each(
									data.menuCountAndPrice,
									function(index, data1) {
										var panel = '<div class="Menu-Count-Price-Panel panel panel-default panel-table"></div>';
										$("#Material-Order-Table").after(panel);
										var panel_head = '<div class="panel-heading"><div class="row"><div class="col col-xs-6"><h3 class="panel-title">'
												+ data1.categroy_name
												+ '</h3></div></div></div>';
										$(".Menu-Count-Price-Panel").eq(index)
												.append(panel_head);
										var panel_body = '<div class="panel-body"><div class="row"><table class="Menu-Count-Price-Table table table-bordered table-striped" style="clear: both"><tbody></tbody></table></div></div>';
										$(".Menu-Count-Price-Panel").eq(index)
												.append(panel_body);
										$
												.each(
														data1.menu_List,
														function(count, menu) {
															var tr = '<tr><td width="35%">'
																	+ menu.menu_name
																	+ '</td><td width="35%"><a href="#">'
																	+ menu.menu_count
																	+ '회 주문</a></td><td width="30%"><a href="#">'
																	+ menu.menu_total_price
																	+ '원</a></td></tr>';
															$(
																	".Menu-Count-Price-Table")
																	.eq(index)
																	.append(tr);
														})
									});
					$("#Wait-Modal").hide();
				}
			}

			//연도 입력 후 확인 버튼 클릭
			$("#Show-Owner-Store-Profit-Btn").click(
					function() {
						year = String($("#Select-Year-Profit").val());
						if (year == "") {
							alert("입력되지 않았습니다.");
							$("#Select-Year-Profit").focus();
							return false;
						}
						var isExistYear = {
							year : year
						};
						callList_Ajax("/owner/isExistProfit/profit_owner",
								successIsExisProfit, errorYearProfitOwner,
								isExistYear);
					});
		})

		function successIsExisProfit(data) {
			alert(data.isExist);
			if (data.isExist == true) {
				//배열 초기화	
				yearsFinalChart.length = 0;
				monthFinalChart.length = 0;
				dayReservationFinalChart.length = 0;
				yearReservationDrinkCount = 0;
				monthReservationFinalChart.length = 0;
				menuPercentageFinalChart.length = 0;
				dayAverageReservationDrinkCount = 0;
				selectYearMenuProfit.length = 0;
				monthReservationCount.length = 0;
				$("#More-Detail-Profit-First-Head").show();
				selectYear = String(data.selectYear);
				var jsonData = {
					year : selectYear
				};
				callList_Ajax("/owner/year_profit/profit_owner",
						successYearProfitOwner, errorYearProfitOwner, jsonData);
				callList_Ajax("/owner/years_profit/profit_owner",
						successYearsProfitOwner, errorYearProfitOwner, jsonData);
				callList_Ajax("/owner/month_profit/profit_owner",
						successMonthProfitOwner, errorYearProfitOwner, jsonData);
				callList_Ajax("/owner/year_reservation_drink/profit_owner",
						successYearReservationDrink, errorYearProfitOwner,
						jsonData);
				callList_Ajax("/owner/month_reservation_drink/profit_owner",
						successMonthReservationDrink, errorYearProfitOwner,
						jsonData);
				callList_Ajax("/owner/day_reservation_drink/profit_owner",
						successDayReservationDrink, errorYearProfitOwner,
						jsonData);
			} else if (data.isExist == false) {
				alert("해당연도와 일치하는 데이터가 없습니다.");
			}
		}

		function successYearProfitOwner(data) {
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

							[ year, yearTotalPrice,
									'stroke-color: #703593; stroke-width: 4; fill-color: #C5A5CF' ] ]);

			var view = new google.visualization.DataView(data);
			view.setColumns([ 0, 1, {
				calc : "stringify",
				sourceColumn : 1,
				type : "string",
				role : "annotation"
			}, 2 ]);

			var options = {
				title : selectYear + "년 매출액(원)",
				width : 420,
				height : 400,
				bar : {
					groupWidth : "95%"
				},
				legend : {
					position : "none"
				},
			};
			var chart = new google.visualization.ColumnChart(document
					.getElementById("Year-Chart"));
			chart.draw(view, options);
		}

		function errorYearProfitOwner() {
			alert("연도별 매출액 그래프를 불러오는데 실패하였습니다.");
		}

		function successYearsProfitOwner(data) {
			var yearsHeadr = new Array();
			yearsHeadr.push('연도');
			yearsHeadr.push('총 매출액');
			yearsHeadr.push({
				role : 'style'
			});
			yearsFinalChart.push(yearsHeadr);
			$
					.each(
							data.yearPriceList,
							function(index, yearsPrice) {
								var yearsTempChart = new Array();
								yearsTempChart.push(String(Number(selectYear)
										- 2 + index));
								yearsTempChart.push(yearsPrice);
								yearsTempChart
										.push('stroke-color: #703593; stroke-width: 4; fill-color: #C5A5CF');
								yearsFinalChart.push(yearsTempChart);
							});
			$("#Years-Chart").css("display", "inline-block");
			google.charts.setOnLoadCallback(YearsChart);
		}
		//Years Chart
		function YearsChart() {
			var data = google.visualization.arrayToDataTable(yearsFinalChart);

			var view = new google.visualization.DataView(data);
			view.setColumns([ 0, 1, {
				calc : "stringify",
				sourceColumn : 1,
				type : "string",
				role : "annotation"
			}, 2 ]);

			var options = {
				title : "최근 2년간 매출액 그래프(원)",
				width : 600,
				height : 400,
				bar : {
					groupWidth : "95%"
				},
				legend : {
					position : "none"
				},
			};
			var chart = new google.visualization.BarChart(document
					.getElementById("Years-Chart"));
			chart.draw(view, options);

			//Chart 클릭 event
			google.visualization.events.addListener(chart, 'select',
					selectHandler);

			//연도별 매출액 bar 클릭시 해당 연도 메뉴 매출액 보여줌
			function selectHandler() {
				var yearProfit;
				var year;
				var selection = chart.getSelection();
				for (var i = 0; i < selection.length; i++) {
					var item = selection[i];
					if (item.row != null && item.column != null) {
						yearProfit = data.getFormattedValue(item.row,
								item.column);
						year = data.getFormattedValue(item.row, 0);
					} else if (item.row != null) {
						var str = data.getFormattedValue(item.row, 0);
					} else if (item.column != null) {
						var str = data.getFormattedValue(0, item.column);
					}
				}
				var select_year = {
					year : year
				};
				callList_Ajax("/owner/year_menu_percentage/profit_owner",
						successYearMenuPercentage, errorYearProfitOwner,
						select_year);
			}
		}
		function successYearMenuPercentage(data) {
			var menuPercentagHeader = new Array();
			menuPercentagHeader.push('Category');
			menuPercentagHeader.push('Hours per Day');
			menuPercentageFinalChart.push(menuPercentagHeader);
			$.each(data.yearMenuPercentage, function(index, data) {
				var menuPercenategeTempChart = new Array();
				menuPercenategeTempChart.push(data.category_name);
				menuPercenategeTempChart.push(data.percentage);
				menuPercentageFinalChart.push(menuPercenategeTempChart);
			});
			$("#Menu-Percentage-Modal").show();
			google.charts.setOnLoadCallback(MenuChart);
		}
		function successMonthProfitOwner(data) {
			var monthHeader = new Array();
			monthHeader.push('Month');
			monthHeader.push('월별 매출액');
			monthHeader.push({
				role : 'style'
			});
			monthFinalChart.push(monthHeader);
			$
					.each(
							data.monthPriceList,
							function(index, data) {
								var monthTmepChart = new Array();
								monthTmepChart.push(String(data.month));
								monthTmepChart.push(data.total_price);
								monthTmepChart
										.push('stroke-color: #703593; stroke-width: 4; fill-color: #C5A5CF');
								monthFinalChart.push(monthTmepChart);
							});
			$("#Month-Chart").css("display", "inline-block");
			google.charts.setOnLoadCallback(MonthChart);
		}
		//Month Chart
		function MonthChart() {
			var data = google.visualization.arrayToDataTable(monthFinalChart);

			var view = new google.visualization.DataView(data);
			view.setColumns([ 0, 1, {
				calc : "stringify",
				sourceColumn : 1,
				type : "string",
				role : "annotation"
			}, 2 ]);

			var options = {
				title : selectYear + "년 월별 매출액(원)",
				width : 600,
				height : 400,
				bar : {
					groupWidth : "95%"
				},
				legend : {
					position : "none"
				},
			};
			var chart = new google.visualization.ColumnChart(document
					.getElementById("Month-Chart"));
			chart.draw(view, options);

			//Chart 클릭 event
			google.visualization.events.addListener(chart, 'select',
					selectHandler);

			//월별 매출액 bar 클릭시 해당 월 메뉴 매출액 보여줌
			function selectHandler() {
				var monthProfit;
				var month;
				//Month-Chart를 선택 
				var selection = chart.getSelection();
				for (var i = 0; i < selection.length; i++) {
					var item = selection[i];
					if (item.row != null && item.column != null) {
						monthProfit = data.getFormattedValue(item.row,
								item.column);
						month = data.getFormattedValue(item.row, 0);
					} else if (item.row != null) {
						var str = data.getFormattedValue(item.row, 0);
					} else if (item.column != null) {
						var str = data.getFormattedValue(0, item.column);
					}
				}
				var select_month = {
					month : month
				};
				callList_Ajax("/owner/month_menu_percentage/profit_owner",
						successMonthMenuPercentage, errorYearProfitOwner,
						select_month);
			}
		}

		function successMonthMenuPercentage(data) {
			var menuPercentagHeader = new Array();
			menuPercentagHeader.push('Category');
			menuPercentagHeader.push('Hours per Day');
			menuPercentageFinalChart.push(menuPercentagHeader);
			$.each(data.monthMenuPercentage, function(index, data) {
				var menuPercenategeTempChart = new Array();
				menuPercenategeTempChart.push(data.category_name);
				menuPercenategeTempChart.push(data.percentage);
				menuPercentageFinalChart.push(menuPercenategeTempChart);
			});
			$("#Menu-Percentage-Modal").show();
			google.charts.setOnLoadCallback(MenuChart);
		}
		//Menu-Chart
		function MenuChart() {
			var data = google.visualization
					.arrayToDataTable(menuPercentageFinalChart);

			var options = {
				title : '각 메뉴별 판매율(%)',
				pieHole : 0.4,
			};

			var chart = new google.visualization.PieChart(document
					.getElementById('Menu-Chart'));
			chart.draw(data, options);
		}
		function successYearReservationDrink(data) {
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

							[ selectYear, yearReservationDrinkCount,
									'stroke-color: #703593; stroke-width: 4; fill-color: #871B47' ] ]);

			var view = new google.visualization.DataView(data);
			view.setColumns([ 0, 1, {
				calc : "stringify",
				sourceColumn : 1,
				type : "string",
				role : "annotation"
			}, 2 ]);

			var options = {
				title : selectYear + "년 예약(건)",
				width : 420,
				height : 400,
				bar : {
					groupWidth : "95%"
				},
				legend : {
					position : "none"
				},
			};
			var chart = new google.visualization.ColumnChart(document
					.getElementById("Year-Order-Chart"));
			chart.draw(view, options);
		}
		function successMonthReservationDrink(data) {
			var monthReservationHeader = new Array();
			monthReservationHeader.push('Month');
			monthReservationHeader.push('월별 예약건');
			monthReservationHeader.push({
				role : 'style'
			});
			monthReservationFinalChart.push(monthReservationHeader);
			$
					.each(
							data.monthReservationCount,
							function(index, data) {
								var monthReservationChart = new Array();
								monthReservationChart.push((index + 1) + "월");
								monthReservationChart.push(data);
								monthReservationCount.push(data);
								monthReservationChart
										.push('stroke-color: #703593; stroke-width: 4; fill-color: #871B47');
								monthReservationFinalChart
										.push(monthReservationChart);
							});
			$("#Month-Order-Chart").css("display", "inline-block");
			google.charts.setOnLoadCallback(Month_Order_Chart);
		}
		//예약 Month Chart
		function Month_Order_Chart() {
			var data = google.visualization
					.arrayToDataTable(monthReservationFinalChart);

			var view = new google.visualization.DataView(data);
			view.setColumns([ 0, 1, {
				calc : "stringify",
				sourceColumn : 1,
				type : "string",
				role : "annotation"
			}, 2 ]);

			var options = {
				title : selectYear + "년 월별 예약(건)",
				width : 600,
				height : 400,
				bar : {
					groupWidth : "95%"
				},
				legend : {
					position : "none"
				},
			};
			var chart = new google.visualization.ColumnChart(document
					.getElementById("Month-Order-Chart"));
			chart.draw(view, options);

		}
		function successDayReservationDrink(data) {
			var dayReservationHeader = new Array();
			dayReservationHeader.push('Time');
			dayReservationHeader.push('예약건수');
			dayReservationFinalChart.push(dayReservationHeader);
			$.each(data.dayHourReservationCount, function(index, data) {
				if (data != 0) {
					dayAverageReservationDrinkCount++;
				}
				var dayReservationTempChart = new Array();
				dayReservationTempChart.push(String(index + 10));
				dayReservationTempChart.push(data);
				dayReservationFinalChart.push(dayReservationTempChart);
			});
			$("#Day-Order-Chart").css("display", "inline-block");
			google.charts.setOnLoadCallback(Day_Order_Chart);
		}
		//예약 일 시간 평균 Chart
		function Day_Order_Chart() {
			var data = google.visualization
					.arrayToDataTable(dayReservationFinalChart);

			var options = {
				title : selectYear + '년 일일 평균 예약 시간(건)',
				curveType : 'function',
				legend : {
					position : 'bottom'
				},
				width : 600,
				height : 400
			};

			var chart = new google.visualization.LineChart(document
					.getElementById('Day-Order-Chart'));

			chart.draw(data, options);
		}
		$.widget.bridge('uibutton', $.ui.button);
	</script>
	<jsp:include page="DetailProfit_Wait_Modal.jsp" />
	<!-- Footer -->
	<jsp:include page="../layout/Footer.jsp" />
</body>
</html>