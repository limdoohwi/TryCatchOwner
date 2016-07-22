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
<script>
		google.charts.load("current", {packages : [ 'corechart' ]});
		//Year Chart
		function YearChart() {
			var data = google.visualization
					.arrayToDataTable([
							[ '연도', '총 매출액', {
								role : 'style'
							} ],

							[
									'2016',
									280000000,
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
		//Years Chart
		 function YearsChart() {
			 var data = google.visualization.arrayToDataTable([
			       ['연도', '총 매출액', { role: 'style' } ],
			       ['2014', 220000, 'stroke-color: #703593; stroke-width: 4; fill-color: #C5A5CF'],
			       ['2015', 2200000, 'stroke-color: #703593; stroke-width: 4; fill-color: #C5A5CF'],
			       ['2016', 22000000, 'stroke-color: #703593; stroke-width: 4; fill-color: #C5A5CF'],
		]);

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
			//Month-Chart를 선택 
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
			  alert('You selected ' + year);
			  $("#Menu-Percentage-Modal").show();
			  google.charts.setOnLoadCallback(MenuChart);
		}	
  }
		
		//Month Chart
		function MonthChart() {
			 var data = google.visualization.arrayToDataTable([
			         ['Month', '월별 매출액', { role: 'style' } ],
			         ['1월', 22000, 'stroke-color: #703593; stroke-width: 4; fill-color: #C5A5CF'],
			         ['2월', 2200, 'stroke-color: #703593; stroke-width: 4; fill-color: #C5A5CF'],
			         ['3월', 33333, 'stroke-color: #703593; stroke-width: 4; fill-color: #C5A5CF'],
			         ['4월',	4444, 'stroke-color: #703593; stroke-width: 4; fill-color: #C5A5CF'],
			         ['5월', 555555, 'stroke-color: #703593; stroke-width: 4; fill-color: #C5A5CF'],
			         ['6월', 66666, 'stroke-color: #703593; stroke-width: 4; fill-color: #C5A5CF'],
			         ['7월', 7777, 'stroke-color: #703593; stroke-width: 4; fill-color: #C5A5CF'],
			         ['8월', 888888, 'stroke-color: #703593; stroke-width: 4; fill-color: #C5A5CF'],
			         ['9월', 999, 'stroke-color: #703593; stroke-width: 4; fill-color: #C5A5CF'],
			         ['10월', 111111, 'stroke-color: #703593; stroke-width: 4; fill-color: #C5A5CF'],
			         ['11월', 222323, 'stroke-color: #703593; stroke-width: 4; fill-color: #C5A5CF'],
			         ['12월', 2211, 'stroke-color: #703593; stroke-width: 4; fill-color: #C5A5CF'],
		]);

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
        var data = google.visualization.arrayToDataTable([
          ['Category', 'Hours per Day'],
          ['커피', 33],
          ['케이크', 27],
          ['음료', 40],
        ]);

        var options = {
          title: '각 메뉴별 판매율(%)',
          pieHole: 0.4,
        };

        var chart = new google.visualization.PieChart(document.getElementById('Menu-Chart'));
        chart.draw(data, options);
      }
		
		//예약 YearChart
		function Year_Order_Chart() {
			var data = google.visualization
					.arrayToDataTable([
							[ '연도', '총 예약건', {
								role : 'style'
							} ],

							[
									'2016',
									40000,
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
		//예약 Month Chart
		function Month_Order_Chart() {
			 var data = google.visualization.arrayToDataTable([
			         ['Month', '월별 예약건', { role: 'style' } ],
			         ['1월', 22000, 'stroke-color: #703593; stroke-width: 4; fill-color: #871B47'],
			         ['2월', 2200, 'stroke-color: #703593; stroke-width: 4; fill-color: #871B47'],
			         ['3월', 33333, 'stroke-color: #703593; stroke-width: 4; fill-color: #871B47'],
			         ['4월',	4444, 'stroke-color: #703593; stroke-width: 4; fill-color: #871B47'],
			         ['5월', 555555, 'stroke-color: #703593; stroke-width: 4; fill-color: #871B47'],
			         ['6월', 66666, 'stroke-color: #703593; stroke-width: 4; fill-color: #871B47'],
			         ['7월', 7777, 'stroke-color: #703593; stroke-width: 4; fill-color: #871B47'],
			         ['8월', 888888, 'stroke-color: #703593; stroke-width: 4; fill-color: #871B47'],
			         ['9월', 999, 'stroke-color: #703593; stroke-width: 4; fill-color: #871B47'],
			         ['10월', 111111, 'stroke-color: #703593; stroke-width: 4; fill-color: #871B47'],
			         ['11월', 222323, 'stroke-color: #703593; stroke-width: 4; fill-color: #871B47'],
			         ['12월', 2211, 'stroke-color: #703593; stroke-width: 4; fill-color: #871B47'],
		]);

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
		
		//예약 일 시간 평균 Chart
		function Day_Order_Chart() {
        var data = google.visualization.arrayToDataTable([
          ['Time', '예약건수'],
          ['10',  1000],
          ['11',  1170],
          ['12',  660],
          ['13',  1030],
          ['14',  1020],
          ['15',  1000],
          ['16',  1300],
          ['17',  1310],
          ['18',  1300],
          ['19',  1320],
          ['20',  1400],
          ['21',  800],
          ['22',  200]
        ]);

        var options = {
          title: '2016년 일일 평균 예약 시간(건)',
          curveType: 'function',
          legend: { position: 'bottom' },
          width: 600,
          height: 400
        };

        var chart = new google.visualization.LineChart(document.getElementById('Day-Order-Chart'));

        chart.draw(data, options);
      }
		$.widget.bridge('uibutton', $.ui.button);
		$(function() {
			$("#Menu-Percentage-Modal").draggable();
			//Menu Percengate Modal은 처음에 hide
			$("#Menu-Percentage-Modal").hide();
			$("#Menu-Percentage-Modal-Hide-Btn").click(function(){
				$("#Menu-Percentage-Modal").hide();
			});
			//확인 버튼을 누르면 확인 버튼 Graph 생성 
			$("#Show-Owner-Store-Profit-Btn")
					.click(
							function() {
								var year = $("#Select-Year-Profit").val();
								if(year == ""){
									alert("연도를 입력해주세요");
									$("#Select-Year-Profit").focus();
									return false;
								} 
								$("#Year-Chart").css("display", "inline-block");							
								$("#Years-Chart").css("display", "inline-block");
								$("#Month-Chart").css("display", "inline-block");
								$("#Year-Order-Chart").css("display", "inline-block");
								$("#Month-Order-Chart").css("display", "inline-block");
								$("#Day-Order-Chart").css("display", "inline-block");
								google.charts.setOnLoadCallback(YearChart);
								google.charts.setOnLoadCallback(YearsChart);
								google.charts.setOnLoadCallback(MonthChart);								
								google.charts.setOnLoadCallback(Year_Order_Chart);								
								google.charts.setOnLoadCallback(Month_Order_Chart);								
								google.charts.setOnLoadCallback(Day_Order_Chart);								
								$("#More-Detail-Profit-First-Head").show();
							});
			
			//매출액 상세 보기 클릭시 Table 생성
			$("#Want-More-Detail-Profit-Btn").click(function(){
				$("#More-Detail-Profit-First-Head").hide();
				$("#More-Detail-Profit-Table-Div").slideDown(400);
			});
		})
	</script>
	<!-- Footer -->
	<jsp:include page="../layout/Footer.jsp" />
</body>
</html>