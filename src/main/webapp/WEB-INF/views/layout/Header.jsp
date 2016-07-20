<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <meta charset="utf-8">
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
              <span class="label label-success">4</span>
            </a>
            <ul class="dropdown-menu">
             <!-- Message Click Show Div -->
              <li class="header">4개의 메세지가 있습니다.</li>
              <li>
                <ul class="menu">
                  <li><!-- start message -->
                    <a href="#">
                      <div class="pull-left">
                        <img src="/owner/resources/dist/img/user2-160x160.jpg" class="img-circle" alt="User Image">
                      </div>
                      <!-- 발신자 -->
                      <h4>
                                                         점장2
                        <small><i class="fa fa-clock-o"></i> 5 mins</small>
                      </h4>
                      <!-- Content -->
                      <p>돈좀있어?</p>
                    </a>
                  </li>
                </ul>
              </li>
              <li class="footer"><a href="#">모두 보기</a></li>
            </ul>
          </li>
          
          <!-- Notifications: style can be found in dropdown.less -->
          <li class="dropdown notifications-menu">
            <a href="#" class="dropdown-toggle" data-toggle="dropdown">
              <i class="fa fa-bell-o"></i>
              <!-- Notifications Count Number -->
              <span class="label label-warning">10</span>
            </a>
            <!-- Notifications Click Show Div -->
            <ul class="dropdown-menu">
              <li class="header">10건의 알람이 있습니다.</li>
              <li>
                <!-- inner menu: contains the actual data -->
                <ul class="menu">
                  <li>
                    <a href="#">
                      <i class="fa fa-thumbs-o-up text-aqua"></i> 점장3이 좋아요를 눌렀습니다.
                    </a>
                  </li>
                  <li>
                    <a href="#">
                      <i class="fa fa-pencil text-yellow"></i> 점장4가 댓글을 달았습니다.
                    </a>
                  </li>
                </ul>
              </li>
              <li class="footer"><a href="#">모두 보기</a></li>
            </ul>
          </li>
        </ul>
      </div>
    </nav>
  </header>
  <!-- Left side column. contains the logo and sidebar -->
  <aside class="main-sidebar" style="background-color: #18bc9c">
    <!-- sidebar: style can be found in sidebar.less -->
    <section class="sidebar">
      <!-- Sidebar Owner panel -->
      <div class="user-panel">
        <div class="pull-left image">
          <img src="/owner/resources/dist/img/user2-160x160.jpg" class="img-circle" alt="User Image">
        </div>
        <div class="pull-left info">
        	<!-- Owner Name -->
          <p>점장1</p>
          <a href="#"><i class="fa fa-circle text-success"></i> Online</a>
        </div>
      </div>

      <!-- /.search form -->
      <!-- sidebar menu: : style can be found in sidebar.less -->
      <ul class="sidebar-menu">
      <li class="header">MAIN</li>
        <!-- 공지 사항 Menu -->
        <li>
          <a href="Notice.jsp">
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
          <ul class="treeview-menu">
            <li><a href="/owner/resources/pages/layout/top-nav.html"><i class="fa fa-circle-o"></i> 인천점</a></li>
            <li><a href="/owner/resources/pages/layout/boxed.html"><i class="fa fa-circle-o"></i> 연수점</a></li>
            <li><a href="/owner/resources/pages/layout/fixed.html"><i class="fa fa-circle-o"></i> 창동점</a></li>
            <li><a href="/owner/resources/pages/layout/collapsed-sidebar.html"><i class="fa fa-circle-o"></i> 의정부점</a></li>
          </ul>
        </li>
        <!-- Community Menu -->
        <li>
          <a href="Community_Owner.jsp">
            <i class="fa fa-commenting"></i> <span>Community</span>
            <small class="label pull-right bg-green">new</small>
          </a>
        </li>
        <!-- Coffee Order Menu : 사용자가 온라인 상에서 주문한 커피 내역을 확인  -->
        <li>
          <a href="TryCoffee_Order.jsp">
            <i class="fa fa-check-square"></i> <span>Coffee Order</span>
            <small class="label pull-right bg-green">new</small>
          </a>
        </li>
       	<!-- TryCoffee Owner : TryCoffee 매장을 갖고있는 점장들을 조회 및 chat -->
        <li class="treeview">
          <a href="TryCoffee_Owner.jsp">
            <i class="fa fa-users"></i>
            <span>TryCoffee Owner</span>
            <i class="fa fa-angle-left pull-right"></i>
          </a>
        </li>
        <!-- 매출액 관리 -->
        <li class="treeview">
          <a href="#">
            <i class="fa fa-bar-chart"></i> <span>매출액</span>
            <i class="fa fa-angle-left pull-right"></i>
          </a>
          <ul class="treeview-menu">
            <li><a href="/owner/resources/pages/forms/general.html"><i class="fa fa-circle-o"></i> General Elements</a></li>
            <li><a href="/owner/resources/pages/forms/advanced.html"><i class="fa fa-circle-o"></i> Advanced Elements</a></li>
            <li><a href="/owner/resources/pages/forms/editors.html"><i class="fa fa-circle-o"></i> Editors</a></li>
          </ul>
        </li>
        <li>
        <!-- 재료 주문 -->
          <a href="#">
            <i class="fa fa-cart-plus"></i> <span>재료 주문</span>
            <i class="fa fa-angle-left pull-right"></i>
          </a>
        </li>
        <!-- MeetingRoom -->
        <li>
          <a href="pages/calendar.html">
            <i class="fa fa-calendar"></i> <span>MeetingRoom</span>
            <small class="label pull-right bg-red">3</small>
          </a>
        </li>
        <li class="header">LABELS</li>
        <li><a href="#"><i class="fa fa-circle-o text-red"></i> <span>Important</span></a></li>
        <li><a href="#"><i class="fa fa-circle-o text-yellow"></i> <span>Warning</span></a></li>
        <li><a href="#"><i class="fa fa-circle-o text-aqua"></i> <span>Information</span></a></li>
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
                   종각점
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