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
        <small>최근 3일간의 내용만 저장됩니다</small>
      </h1>
    </section>

    <!-- Main content -->
    <section class="content">
      <div class="row">
        <div class="col-xs-12">
          <div class="box">
            <div class="box-header">
            <!-- Store-Name -->
              <h3 class="box-title">종각점</h3>
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
                  <th>상품</th>
                  <th>주문자</th>
                  <th>전화번호</th>
                </tr>
                </thead>
                <tbody>
                <tr>
                  <td>2016년 7월 4일 14시 10분</td>
                  <td>2016년 7월 4일 14시 30분</td>
                  <td>아이스 아메리카노3/핫초코2</td>
                  <td>고객1</td>
                  <td>01011112222</td>
                </tr>
                </tbody>
              </table>
              <!-- Page Move -->
                <div class="box-footer no-padding">
		              <div class="mailbox-controls">
		                <div class="btn-group"></div>
		                <button type="button" class="btn btn-default btn-sm"><i class="fa fa-refresh"></i></button>
		                <div class="pull-right">
		                  1-50/200
		                  <div class="btn-group">
		                    <button type="button" class="btn btn-default btn-sm"><i class="fa fa-chevron-left"></i></button>
		                    <button type="button" class="btn btn-default btn-sm"><i class="fa fa-chevron-right"></i></button>
		                  </div>
		                </div>
		              </div>
		         </div>
            </div>
          </div>
	  </div>
	</div>
	</section>
</div>
 	<!-- Footer -->
 	<jsp:include page="../layout/Footer.jsp" />
	<script>
	  $.widget.bridge('uibutton', $.ui.button);
	  
	  $(function(){
		//예약 시간 내림 차순 Click
		$("#Reservation-Time-Levle-Down").click(function(){
			$(this).hide();
			$("#Reservation-Time-Levle-Up").show();
		});
		//예약 시간 오름 차순 Click
		$("#Reservation-Time-Levle-Up").click(function(){
			$(this).hide();
			$("#Reservation-Time-Levle-Down").show();
		});
		//Order-Search-btn Click Search Purchaser
		$("#Order-Search-btn").click(function(){
			if($("#Order-Search-Text").val() == ""){
				alert("값을 입력해주세요");
				return false;
			}
		});
	})
	</script>
</body>
</html>