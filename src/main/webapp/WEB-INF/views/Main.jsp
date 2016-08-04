<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<style>
.main-sidebar span {
	color: white;
}
</style>
</head>
<body class="hold-transition skin-blue sidebar-mini">
	<div class="wrapper">
		<!-- Header -->
		<jsp:include page="layout/Header.jsp" />
		<!-- Month Profit -->
		<div class="row">
			<!-- Left col -->
			<section class="col-lg-7 connectedSortable">
				<!-- Custom tabs (Charts with tabs)-->
				<div class="nav-tabs-custom">
					<div class="tab-content no-padding">
						<!-- Google Chart Month Profit -->
						<jsp:include page="management/MonthProfit_Chart.jsp" />
						<div class="chart tab-pane active" id="Month-Profit-Div"
							style="position: relative; width: 100%; height: 300px;"></div>
					</div>
				</div>
				<!-- Now Order List : Client가 온라인 상으로 주문한 예약을 확인 할 수 있는 box  -->
				<div class="box box-primary">
					<div id="Now-Order-List-Box-Header" class="box-header">
						<i class="ion ion-clipboard"></i>
						<!-- title -->
						<h3 class="box-title">Now Order List</h3>
						<!-- Now Order List Page -->
						<div class="box-tools pull-right">
							<ul class="pagination pagination-sm inline">
								<li><a href="#" class="pre_page_Order">&laquo;</a></li>
								<li><a href="#" class="page_Order"></a></li>
								<li><a href="#" class="page_Order"></a></li>
								<li><a href="#" class="page_Order"></a></li>
								<li><a href="#" class="next_page_Order">&raquo;</a></li>
							</ul>
						</div>
					</div>
				</div>
				<!-- quick email widget -->
				<div class="box box-info">
					<div class="box-header">
						<i class="fa fa-envelope"></i>

						<h3 class="box-title">Quick Email</h3>
						<!-- tools box -->
						<div class="pull-right box-tools">
							<button type="button" class="btn btn-info btn-sm"
								data-widget="remove" data-toggle="tooltip" title="Remove">
								<i class="fa fa-times"></i>
							</button>
						</div>
					</div>
					<div class="box-body">
						<form action="#" method="post">
							<div class="form-group">
								<input type="email" class="form-control" name="emailto"
									placeholder="Email to:">
							</div>
							<div class="form-group">
								<input type="text" class="form-control" name="subject"
									placeholder="Subject">
							</div>
							<div>
								<textarea class="textarea" placeholder="Message"
									style="width: 100%; height: 125px; font-size: 14px; line-height: 18px; border: 1px solid #dddddd; padding: 10px;"></textarea>
							</div>
						</form>
					</div>
					<div class="box-footer clearfix">
						<button type="button" class="pull-right btn btn-default"
							id="sendEmail">
							Send <i class="fa fa-arrow-circle-right"></i>
						</button>
					</div>
				</div>
			</section>
			<section class="col-lg-5 connectedSortable">
				<!-- solid sales graph -->
				<div class="box box-solid bg-teal-gradient">
					<div class="box-header">
						<i class="fa fa-th"></i>

						<h3 class="box-title">Year Graph</h3>
						<div class="box-tools pull-right">
							<!-- 최소화 버튼 -->
							<button type="button" class="btn bg-teal btn-sm"
								data-widget="collapse">
								<i class="fa fa-minus"></i>
							</button>
							<!-- 닫기 버튼 -->
							<button type="button" class="btn bg-teal btn-sm"
								data-widget="remove">
								<i class="fa fa-times"></i>
							</button>
						</div>
					</div>
					<div class="box-body border-radius-none">
						<!-- Google Year Profit Chart -->
						<jsp:include page="management/YearProfit_Chart.jsp" />
						<div class="chart" id="Year-Profit-Div" style="height: 250px;"></div>
					</div>
					<!-- 해당 연도 매출액에서 각 메뉴들이 차지하는 판매율을 %로 나타냄 -->
					<div class="box-footer no-border">
						<div id="Category-Percentage-div" class="row"></div>
					</div>
				</div>
			</section>
		</div>
	</div>
	<script src="/owner/resources/Owner_js/ListAjax.js"></script>
	<script>
function orderListSuccess(data){
	//초기화 후 내용 추가
	$(".Now-Order-List-Box-Body").remove();
	  $.each(data.orderList, function(index, jsonData){
			$("#Now-Order-List-Box-Header").append("" + 
			"<div class='Now-Order-List-Box-Body box-body'>" +
		         "<ul class='todo-list'>" +
	        		"<li>" +
	              		"<span class='handle'>" +
	                		"<i class='fa fa-coffee'></i>" + 
	              		"</span>" +
	          			"<span class='text'>"+jsonData.menu_simple_list+"</span>" +
	          			"<span class='text' style='color:blue'>"+jsonData.order_name+"</span>" +
	          			"<small class='label label-danger'><i class='fa fa-clock-o'></i>"+jsonData.menu_reserve_time+"</small>" +
	          			"<a class='New-Order-List-Show-Btn btn btn-primary btn-xs'>내역 보기</a>" +
	          			"<div class='New-Order-List-Modal' style='display:none;'>" +
	          				"<div class='row' style='margin-top: 10px'>" + 
								"<form class='form-horizontal'>" +
									"<div class='form-group'>" +
										"<label for='inputEmail3' class='col-sm-2 control-label'>주문자</label>" + 
										"<div class='col-sm-6'>" +
											"<input type='text' class='form-control' value='"+jsonData.order_name+"' readonly='readonly' style='border:none; background-color:transparent;'>" +
										"</div>" +
									"</div>" +
									"<div class='form-group'>" +
										"<label for='inputEmail3' class='col-sm-2 control-label'>연락처</label>" + 
										"<div class='col-sm-6'>" +
											"<input type='text' class='form-control' value='"+jsonData.order_tel+"' readonly='readonly' style='border:none; background-color:transparent;'>" +
										"</div>" +
									"</div>" +
									"<div class='form-group'>" +
										"<label for='inputEmail3' class='col-sm-2 control-label'>매장명</label>" + 
										"<div class='col-sm-6'>" +
											"<input type='text' class='form-control' value='"+jsonData.store_name+"' readonly='readonly' style='border:none; background-color:transparent;'>" +
										"</div>" +
									"</div>" +
	
									"<div class='form-group'>" +
										"<label for='inputPassword3' class='col-sm-2 control-label'>주문 정보</label>" +
										"<div class='col-sm-6'>" +
											"<input type='text' class='form-control' value='"+jsonData.menu_total_list+"' readonly='readonly' style='border:none; background-color:transparent;'>" +
										"</div>" +
									"</div>" +
									"<div class='form-group'>" +
										"<label for='inputEmail3' class='col-sm-2 control-label'>총 결제액</label>" + 
										"<div class='col-sm-6'>" +
											"<input type='text' class='form-control' value='"+jsonData.menu_total_price+"원' readonly='readonly' style='border:none; background-color:transparent;'>" +
										"</div>" +
									"</div>" +
									"<div class='form-group'>" +
										"<div class='col-sm-offset-2 col-sm-10'>" +
											"<button type='button' class='Hide-New-Order-List-Modal-Btn btn btn-primary'>닫기</button>" +
										"</div>" +
								"</div>" +
							"</div>" +
						"</div>" +
					"</form>" +
				"</div>" +
	          "</div>" +
	        "</li>" +
	      "</ul>" +
	    "</div>");
	})
}
  $.widget.bridge('uibutton', $.ui.button);
  $(function(){
	  var pageNumber = 1;
	  var jsonData = {
		  start_Page : (pageNumber-1) * 5
	  };
	  //주문 내역 불러옴
	  callList_Ajax("/owner/client_order_list/order", orderListSuccess, null, jsonData);
	
	  //페이지 번호 초기화
	  $(".page_Order").eq(0).text("1");
	  $(".page_Order").eq(1).text("2");
	  $(".page_Order").eq(2).text("3");	 
	  
	  //페이지 버튼 클릭
	  $(".page_Order").click(function(){
		  pageNumber = $(this).text();
		  jsonData = {
				  start_Page : (pageNumber-1) * 5
		  };
		  callList_Ajax("/owner/client_order_list/order", orderListSuccess, null, jsonData);
	  });
	  
	  //페이지 이전 블록 버튼 클릭
	  $(".pre_page_Order").click(function(){
		  var startPageNumber = Number($(".page_Order").eq(0).text()) - 3;
		  if(startPageNumber > 0){
			  $(".page_Order").eq(0).text(startPageNumber);
			  $(".page_Order").eq(1).text(startPageNumber+1);
			  $(".page_Order").eq(2).text(startPageNumber+2);
		  }
	  });
	  
	  //페이지 다음 블록 버튼 클릭
	  $(".next_page_Order").click(function(){
		  var startPageNumber = Number($(".page_Order").eq(2).text()) + 1;
		  $(".page_Order").eq(0).text(startPageNumber);
		  $(".page_Order").eq(1).text(startPageNumber+1);
		  $(".page_Order").eq(2).text(startPageNumber+2);	
	  });
	  
	  //New-Order-List-Show-Btn Click Show Modal
	  $(".New-Order-List-Show-Btn").click(function(){
		  var index = $(".New-Order-List-Show-Btn").index(this);
		  var btn = $(".New-Order-List-Show-Btn").eq(index);
		$(".New-Order-List-Modal").eq(index).slideDown(400);
	  });
	  //Hide-New-Order-List-Modal-Btn Click Hide Modal
	  $(".Hide-New-Order-List-Modal-Btn").click(function(){
		  var index = $(".Hide-New-Order-List-Modal-Btn ").index(this);
		  var modal = $(".New-Order-List-Modal").eq(index);
		  $(modal).slideUp(400);
	  });
	  
	  
	  //내역보기 클릭
	  $(document).on("click", '.New-Order-List-Show-Btn', function(){
		 var index = $(".New-Order-List-Show-Btn").index(this); 
		 $(".New-Order-List-Modal").eq(index).fadeIn(400);
	  });
	  //내역보기 닫기 클릭
	  $(document).on("click", ".Hide-New-Order-List-Modal-Btn", function(){
		 var index = $(".Hide-New-Order-List-Modal-Btn").index(this);
		 $(".New-Order-List-Modal").eq(index).fadeOut(400);
	  });
  })
</script>

	<!-- Footer -->
	<jsp:include page="layout/Footer.jsp" />

	
</body>
</html>