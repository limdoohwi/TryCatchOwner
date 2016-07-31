<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <style>
  	.main-sidebar span{
  		color:white;
  	}
  </style>
</head>
<body class="hold-transition skin-blue sidebar-mini">
	<div class="wrapper">
		<!-- Header -->
		<jsp:include page="../layout/Header.jsp" />
		 <section class="content-header">
      <!-- Title -->
      <h1>
                      주문 내역
      </h1>
    </section>

    <!-- Main content -->
    <section class="content">
      <div class="row">
        <div class="col-xs-12">
          <div class="box">
            <div class="box-header">
            <!-- Store-Name -->
              <h3 class="box-title">${store_dto.store_name}</h3>
              <!-- Search Purchase -->
			       <div class="input-group col-sm-2" style="margin-top: 5px">
			         <input type="text" name="q" id="Order-Search-Text" class="form-control" placeholder="주문자 입력">
			         <span class="input-group-btn">
			            <button type="button" name="search" id="Order-Search-btn" class="btn btn-flat" style="height:34px"><i class="fa fa-search"></i>
			            </button>
			         </span>
			       </div>
            </div>
            <div class="box-body">
              <table id="example2" class="table table-bordered table-hover">
                <thead>
                <tr>
                  <th>결제 시간</th>
                  <th>예약 시간
                  	<!-- 시간 내림차순 -->
                  	<div id="Reservation-Time-Levle-Down" class="pull-right" style="display:none">
                  		<a data-toggle="tooltip" title="내림차순"><i style="cursor:pointer;" class="fa fa-level-down" aria-hidden="true"></i></a>
                  	</div>
                  	<!-- 시간 오름차순 -->
                  	<div id="Reservation-Time-Levle-Up" class="pull-right">
                  		<a data-toggle="tooltip" title="오름차순"><i style="cursor:pointer;" class="fa fa-level-up" aria-hidden="true"></i></a>
                  	</div>
                  </th>
                  <th>총 결제액</th>
                  <th>상품</th>
                  <th>주문자</th>
                  <th>전화번호</th>
                </tr>
                </thead>
                <tbody>
                </tbody>
              </table>
              <!-- Page Move -->
                <div class="box-footer no-padding pull-right">
		              <div class="mailbox-controls">
		                <div class="btn-group"></div>
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
          </div>
	  </div>
	</div>
	</section>
</div>
 	
 		<!-- jQuery 2.2.0 -->
	<script src="/owner/resources/plugins/jQuery/jQuery-2.2.0.min.js"></script>
	<!-- jQuery UI 1.11.4 -->
	<script src="https://code.jquery.com/ui/1.11.4/jquery-ui.min.js"></script>
	<script src="/owner/resources/Owner_js/ListAjax.js"></script>
	<script>
	  $.widget.bridge('uibutton', $.ui.button);
	  
	  $(function(){
		  var search_order_info = $("#Order-Search-Text").val();
		  var pageNumber = 1;
		  var jsonData = {
			  start_Page : (pageNumber-1) * 5, search_order_info:search_order_info
		  };
		  callList_Ajax("/owner/client_order_list/order", orderListSuccess, null, jsonData);
		
		  //페이지 번호 초기화
		  $(".page_Order").eq(0).text("1");
		  $(".page_Order").eq(1).text("2");
		  $(".page_Order").eq(2).text("3");	 
		  
		  //페이지 버튼 클릭
		  $(".page_Order").click(function(){
			  pageNumber = $(this).text();
			  jsonData = {
					  start_Page : (pageNumber-1) * 5, search_order_info : search_order_info
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
		  
		  
		//예약 시간 내림 차순 Click
		$("#Reservation-Time-Levle-Down").click(function(){
			$(this).hide();
			$("#Reservation-Time-Levle-Up").show();
			jsonData = {
					  start_Page : (pageNumber-1) * 5, search_order_info : search_order_info
			};
			callList_Ajax("/owner/client_order_list/order", orderListSuccess, null, jsonData);
		});
		//예약 시간 오름 차순 Click
		$("#Reservation-Time-Levle-Up").click(function(){
			$(this).hide();
			$("#Reservation-Time-Levle-Down").show();
			jsonData = {
					  start_Page : (pageNumber-1) * 5, search_order_info : search_order_info, asce : true
			};
			callList_Ajax("/owner/client_order_list/order", orderListSuccess, null, jsonData);
		});
		
		//주문자 찾기 버튼 클릭
		$("#Order-Search-btn").click(function(){
			 search_order_info = $("#Order-Search-Text").val();
			 jsonData = {
					  start_Page : (pageNumber-1) * 5, search_order_info : search_order_info
				  };
			callList_Ajax("/owner/client_order_list/order", orderListSuccess, null, jsonData);
		});
	})
	
	function orderListSuccess(data){
	//초기화 후 내용 추가
	$("tbody").html("");
	  $.each(data.orderList, function(index, jsonData){
			$("tbody").append("<tr>" +
				                  "<td>2016년 "+jsonData.menu_payment_date+"</td>" + 
				                  "<td>"+jsonData.menu_reserve_time+"</td>" +
				                  "<td>"+jsonData.menu_total_price+"원</td>" +
				                  "<td>"+jsonData.menu_total_list+"</td>" +
				                  "<td>"+jsonData.order_name+"</td>" +
				                  "<td>"+jsonData.order_tel+"</td>" +
				                "</tr>");
	})
}
	</script>
	<!-- Footer -->
 	<jsp:include page="../layout/Footer.jsp" />
</body>
</html>