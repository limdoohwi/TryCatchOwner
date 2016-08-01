<!-- 
/*
 * 	JSP: Header.jsp
 *  Description: Header JSP 페이지 
 *  Created: 2016­07­18
 *	Author: 김준혁
 *  Mail: heyKJ@gmail.com
 * 	Copyrights 2016-07-18 by Try{}Catch
 *
 *	Revisions:
 * 	1. When & Who : 2016-07-22 by 임두휘
 * 	2. What		  : Websocket을 연결에 관련된 JavaScript 추가
 *  
 * 	1. When & Who : 2016-07-23 by 임두휘
 * 	2. What		  : 1대1 채팅시 메시지를 뿌려주는 JavaScript함수 구현 
 *  
 * 	1. When & Who : 2016-07-27 by 임두휘
 * 	2. What		  : 메신져 알람 기능 구현 읽지 않은 알람을 Header의 messageAlarm에 띄워는 함수 구현 
 *
 * 	1. When & Who : 2016-07-28 by 임두휘
 * 	2. What		  : Ajax를 활용해 매번 화면이 바뀔때마다 messageAlarm을 가져오는 함수 구현 
 *
 * 	1. When & Who : 2016-07-29 by 임두휘
 * 	2. What		  : messageAlarm의 message내용을 클릭시 해당 Message-Div를 자동으로 실행 되게 해주는 기능 구현 
 */
 -->
<%@ page contentType="text/html; charset=UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
 
 <meta http-equiv="X-UA-Compatible" content="IE=edge">

  <!-- Tell the browser to be responsive to screen width -->
  <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
  <!-- Bootstrap 3.3.6 -->
  <link rel="stylesheet" href="/owner/resources/bootstrap/css/bootstrap.min.css">
  <!-- Font Awesome -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.5.0/css/font-awesome.min.css">
  <!-- Ionicons -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/ionicons/2.0.1/css/ionicons.min.css">
  <!-- Theme style -->
  <link rel="stylesheet" href="/owner/resources/dist/css/AdminLTE.min.css">
  <!-- AdminLTE Skins. Choose a skin from the css/skins
       folder instead of downloading all of them to reduce the load. -->
  <link rel="stylesheet" href="/owner/resources/dist/css/skins/_all-skins.min.css">
  <!-- iCheck -->
  <link rel="stylesheet" href="/owner/resources/plugins/iCheck/flat/blue.css">
  <!-- Morris chart -->
  <link rel="stylesheet" href="/owner/resources/plugins/morris/morris.css">
  <!-- jvectormap -->
  <link rel="stylesheet" href="/owner/resources/plugins/jvectormap/jquery-jvectormap-1.2.2.css">
  <!-- Date Picker -->
  <link rel="stylesheet" href="/owner/resources/plugins/datepicker/datepicker3.css">
  <!-- Daterange picker -->
  <link rel="stylesheet" href="/owner/resources/plugins/daterangepicker/daterangepicker-bs3.css">
  <!-- bootstrap wysihtml5 - text editor -->
  <link rel="stylesheet" href="/owner/resources/plugins/bootstrap-wysihtml5/bootstrap3-wysihtml5.min.css">
  <!-- Resolve conflict in jQuery UI tooltip with Bootstrap tooltip -->
  <!-- jQuery 2.2.0 -->
  <script src="/owner/resources/plugins/jQuery/jQuery-2.2.0.min.js"></script>
  <!-- jQuery UI 1.11.4 -->
  <script src="https://code.jquery.com/ui/1.11.4/jquery-ui.min.js"></script>
	<script>
		var count = 0;
		$(function() {
			connect();
			//newNoticeAlarm();
			//읽지않은 음료주문 알람을 띄움
			noReadMsgList();
			$(".Select-Store-Btn").click(function(){
				var index = $(".Select-Store-Btn").index(this);
				var store_no = $(".My-Store-No-List").eq(index).val();
				var jsonData = {store_no : store_no};
				callList_Ajax("/owner/set/owner_store", successSetStore, null, jsonData);
			});
		});
		// 읽지 않은 메시지 리스트를 서버에서 가져와 출력해주는 함수 
		function noReadMsgList() {
			$.ajax({
				url : "/owner/messenger/noreadmsglist",
				type : "post",
				data : {
					member_no : '${member_dto.member_no}'
				},
				success : function(data) {
					$("#messageAlarm").html("");
					count = 0;
					$.each(data.noReadMsgList, function(index, jsonData) {
						count = index + 1;
						msgshowAlarm(jsonData.messenger_content,
								jsonData.member_no, jsonData.member_name,
								jsonData.content_regdate);
					});
					$("#messageAlarmCount").text(count + "개의 알람이 있습니다.");
					$("#messageAlarmCount2").text(count);
				}
			});
		}
		/*
			WebSocket 연결을 진행해주는 함수
		 */
		function connect() {
			if ('WebSocket' in window) {
				console.log('Websocket supported');
				socket = new WebSocket('ws://' + document.location.hostname
						+ ':8080/owner//websocket');
				console.log('Connection attempted');
				socket.onopen = function() {
					console.log('Connection open!');
				}
				socket.onclose = function() {
					console.log('Disconnecting connection');
				}
				//데이터 받음
				socket.onmessage = function(evt) {
					var received_msg = evt.data;
					console.log(received_msg);
					console.log('message received!');
					var msg = JSON.parse(received_msg);
					if (msg.connect == "true") {
						msgshowMessage(msg.message, msg.member_no, msg.member_name,
								msg.content_regdate);
					} else {
						count = count + 1;
						msgshowAlarm(msg.message, msg.member_no, msg.member_name,
								msg.content_regdate);
					}
				}
			} else {
				console.log('Websocket not supported');
			}
		}
		function successSetStore(data){
			if(data==true){
				location.reload();
			}
			else if(data==false){
				alert("매장 설정중 오류가 발생하였습니다. 다시 시도해주세요.");
			}
		}
		/*
			message를 받았을 때 messenger에 접속해 있지 않다면 실행 되는 함수로 알람을 띄워주는 역할을 한다. 
		*/
		function msgshowAlarm(message, member_no, member_name, content_regdate) {
			var html = "";
			html += '<li><a class="alarm_class">';
			html += '<div class="pull-left"><img src="/owner/resources/dist/img/user2-160x160.jpg" class="img-circle" alt="User Image">';
			html += '</div><h4>';
			html += member_name;
			html += '<small><i class="fa fa-clock-o"></i>' + content_regdate
					+ '</small></h4>';
			html += '<p>' + message + '</p>';
			html += '</a></li>';
			html += '<input type="hidden" class="alarm_member_no" value="'+member_no+'"/>';
			html += '<input type="hidden" class="alarm_member_name" value="'+member_name+'"/>';
	
			$("#messageAlarm").append(html);
			$("#messageAlarmCount").text(count + "개의 알람이 있습니다.");
			$("#messageAlarmCount2").text(count);
		}
		/*
			alarm_class를 클릭시 해당 하는 member_name과 member_no을 가지고 messenger페이지로 넘어가 띄어준다.
		*/
		$(document).on('click',".alarm_class",function(){
			var eq = $(".alarm_class").index(this);
			$("#messenger_member_name").val($(".alarm_member_name").eq(eq).val());
			$("#messenger_member_no").val($(".alarm_member_no").eq(eq).val());
			$("#messenger_confirm").submit();
		});
  </script>
  
<header class="main-header">
	
    <!-- Logo -->
    <a href="index2.html" class="logo" style="background-color: black">
      <!-- mini logo for sidebar mini 50x50 pixels -->
      <span class="logo-mini"><b>TRY</b>Community</span>
      <!-- logo for regular state and mobile devices -->
      <span class="logo-lg"><b>TryCatch</b>Community</span>
    </a>
    <!-- Header Navbar: style can be found in header.less -->
    <nav class="navbar navbar-static-top" style="background-color:black">
      <!-- Sidebar toggle button-->
      <a href="#" class="sidebar-toggle" data-toggle="offcanvas" role="button">
        <span class="sr-only">Toggle navigation</span>
      </a>
	
		<!-- 페이지 우측상단 menu -->
      <div class="navbar-custom-menu">
        <ul class="nav navbar-nav" style="margin-right: 50px">
          <!-- Messages: style can be found in dropdown.less-->
          <li class="dropdown messages-menu">
            <!-- Message -->
            <a href="#" class="dropdown-toggle" data-toggle="dropdown">
              <i class="fa fa-envelope-o"></i>
              <!-- Receive Message count Number -->
              <span id="messageAlarmCount2" class="label label-success">0</span>
            </a>
            <ul class="dropdown-menu">
             <!-- Message 알람 부분 -->
              <li id="messageAlarmCount" class="header">0개의 메세지가 있습니다.</li>
              <li>
                <ul id="messageAlarm" class="menu">
                  <!-- Message 알람 받는곳 -->
                </ul>
              </li>
              <li class="footer"><a href="#">모두 보기</a></li>
            </ul>
            <form id="messenger_confirm" action="/owner/messenger/TryCoffee_Owner" method="post">
            	<input type="hidden" id="messenger_member_name" name="member_name" value=""/>
            	<input type="hidden" id="messenger_member_no" name="member_no" value=""/>
            </form>
          </li>
          
          <!-- Notifications: style can be found in dropdown.less -->
          <li class="dropdown notifications-menu">
            <a href="#" class="dropdown-toggle" data-toggle="dropdown">
              <i class="fa fa-bell-o"></i>
              <!-- Notifications Count Number -->
              <span id="Notification-Not-Read-Count-Span" class="label label-warning"></span>
            </a>
            <!-- Notifications Click Show Div -->
            <ul class="dropdown-menu">
              <li id="Notification-Header-li" class="header"></li>
              <li>
                <!-- inner menu: contains the actual data -->
                <ul id="Notification-Detail-Ul" class="menu"></ul>
              </li>
              <li class="footer"><a href="#">모두 보기</a></li>
            </ul>
          </li>
        </ul>
      </div>
    </nav>
  </header>
  <!-- 왼쪽 상단 접속한 점장 정보 -->
  <!-- Left side column. contains the logo and sidebar -->
  <aside class="main-sidebar" style="background-color: #18bc9c">
    <!-- sidebar: style can be found in sidebar.less -->
    <section class="sidebar">
      <!-- Sidebar Owner panel -->
      <div class="user-panel">
        <div class="pull-left image">
         <i class="fa fa-user fa-3x" aria-hidden="true"></i>
        </div>
        <div class="pull-left info">
        	<!-- Owner Name -->
          <p>${member_dto.member_name}</p>
          <a href="#"><i class="fa fa-circle text-success"></i> Online</a>
        </div>
      </div>

      <!-- /.search form -->
      <!-- sidebar menu: : style can be found in sidebar.less -->
      <ul class="sidebar-menu">
      <li class="header">MAIN</li>
        <!-- 공지 사항 Menu -->
        <li>
          <a href="/owner/notice/Notice">
            <i class="fa fa-newspaper-o"></i> <span>공지 사항</span> <i class="fa fa-angle-left pull-right"></i>
          </a>
        </li>
        <!-- My Store Menu -->
        <li class="treeview">
          <a href="#">
            <i class="fa fa-bank"></i>
            <span>My Store</span>
            <span class="label label-primary pull-right">4</span>
          </a>
          <ul id="My-Store-Ul" class="treeview-menu">
          	<c:forEach var="storeDto" items="${storeList}" varStatus="storeIndex">
		          		 <li>
		          		 	<a class="Select-Store-Btn" style="cursor:pointer;">
		          		 		<c:if test="${store_dto.store_no == storeDto.store_no}">
		          		 			<i style="color: red; text-shadow: 1px 1px 1px #ccc;" class="My-Store-Name-List fa fa-circle-o"></i><span>${storeDto.store_name}</span>
		          		 		<input type="hidden" class="My-Store-No-List" value="${storeDto.store_no}" />
		          		 		</c:if>
		          		 		<c:if test="${store_dto.store_no != storeDto.store_no}">
		          		 			<i class="My-Store-Name-List fa fa-circle-o"></i><span>${storeDto.store_name}</span>
		          		 		<input type="hidden" class="My-Store-No-List" value="${storeDto.store_no}" />
		          		 		</c:if>
		          		 	</a>
		          		 </li>
          	</c:forEach>
          	
          </ul>
        </li>
        <!-- Community Menu -->
        <li>
          <a href="/owner/community_list?limit=0">
            <i class="fa fa-commenting"></i> <span>Community</span>
            <small class="label pull-right bg-green">new</small>
          </a>
        </li>
        <!-- Coffee Order Menu : 사용자가 온라인 상에서 주문한 커피 내역을 확인  -->
        <li>
          <a href="/owner/management/TryCoffee_Order">
            <i class="fa fa-check-square"></i> <span>Coffee Order</span>
            <small class="label pull-right bg-green">new</small>
          </a>
        </li>
       	<!-- TryCoffee Owner : TryCoffee 매장을 갖고있는 점장들을 조회 및 chat -->
        <li class="treeview">
          <a href="/owner/messenger/TryCoffee_Owner">
            <i class="fa fa-users"></i>
            <span>TryCoffee Owner</span>
            <i class="fa fa-angle-left pull-right"></i>
          </a>
        </li>
        <!-- 매출액 관리 -->
        <li class="treeview">
          <a href="/owner/management/Profit_Owner">
            <i class="fa fa-bar-chart"></i> <span>매출액</span>
            <i class="fa fa-angle-left pull-right"></i>
          </a>
        </li>
        <li>
        <!-- 재료 주문 -->
          <a href="/owner/delivery/Delivery">
            <i class="fa fa-cart-plus"></i> <span>재료 주문</span>
            <i class="fa fa-angle-left pull-right"></i>
          </a>
        </li>
        <!-- MeetingRoom -->
        <li>
          <a href="/owner/management/MeetingRoom">
            <i class="fa fa-calendar"></i> <span>MeetingRoom</span>
            <small class="label pull-right bg-red">3</small>
          </a>
        </li>
      </ul>
    </section>
    <!-- /.sidebar -->
  </aside>

  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <!-- 접속한 점장의 매장명 -->
      <h1>
      	<span id="Main-Store-Name">
      		${store_dto.store_name}
      	</span>
        <small>반갑습니다.</small>
      </h1>
      <ol class="breadcrumb">
        <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
        <li class="active">Dashboard</li>
      </ol>
    </section>

    <!-- Main content -->
    <section class="content">
      <!-- Small boxes (Stat box) -->
      <div class="row">
        <!-- Client가 온라인 상으로 주문하고 아직 수령하지 않은 건수를 나타내는 box -->
        <div class="col-lg-3 col-xs-6">
          <!-- small box -->
          <div class="small-box bg-aqua">
            <div class="inner">
              <!-- Not Receive Count Number -->
              <h3>15<span style="font-size: 0.8em">건</span></h3>
              <!-- Title -->
              <p>Not Receive</p>
            </div>
            <div class="icon">
              <i class="ion ion-bag"></i>
            </div>
            <a href="#" class="small-box-footer">More info <i class="fa fa-arrow-circle-right"></i></a>
          </div>
        </div>
        <!-- 이번 연도 총매출액을 나타내 주는 box -->
        <div class="col-lg-3 col-xs-6">
          <!-- small box -->
          <div class="small-box bg-green">
            <div class="inner">
            <!-- Total Profit Amount -->
              <h3>530,000,000<span style="">원</span></h3>
              <!-- Title -->
              <p><span>2016&nbsp;</span>Total Profit</p>
            </div>
            <div class="icon">
              <i class="ion ion-stats-bars"></i>
            </div>
            <a href="#" class="small-box-footer">More info <i class="fa fa-arrow-circle-right"></i></a>
          </div>
        </div>
        <!-- 현재 TryCoffee 점장 수를 알려주는 box -->
        <div class="col-lg-3 col-xs-6">
          <!-- small box -->
          <div class="small-box bg-yellow">
            <div class="inner">
            <!-- TryCoffee Owner Count Number -->
              <h3>44<span style="font-size:0.8em">명</span></h3>
             <!-- Title -->
              <p>TryCoffee Onwer</p>
            </div>
            <div class="icon">
              <i class="ion ion-person-stalker"></i>
            </div>
            <a href="#" class="small-box-footer">More info <i class="fa fa-arrow-circle-right"></i></a>
          </div>
        </div>
        <!-- 오늘 MeetingRoom Reservation 수를 알려주는 box -->
        <div class="col-lg-3 col-xs-6">
          <!-- small box -->
          <div class="small-box bg-red">
            <div class="inner">
            <!-- Today MeetingRoom Reservation Count Number -->
              <h3>2<span style="font-size:0.8em">건</span></h3>
			<!-- Title -->
              <p>Today's MeetingRoom</p>
            </div>
            <div class="icon">
              <i class="ion ion-calendar"></i>
            </div>
            <a href="#" class="small-box-footer">More info <i class="fa fa-arrow-circle-right"></i></a>
          </div>
        </div>
      </div>