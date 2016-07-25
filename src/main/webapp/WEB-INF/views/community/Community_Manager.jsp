<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
</head>
<body class="hold-transition skin-blue sidebar-mini">
<div class="wrapper">
	<!-- Header -->
	<jsp:include page="../layout/Header.jsp" />
	<!-- Community -->
    <section class="content-header">
      <!-- Title -->
      <h1>Community</h1>
    </section>
	<!-- My Commnunity Info -->
    <section class="content">
      <div class="row">
        <div class="col-md-3">
          <div class="box box-solid">
            <div class="box-header with-border">
              <h3 class="box-title">정보</h3>

              <div class="box-tools">
                <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i>
                </button>
              </div>
            </div>
            <div class="box-body no-padding">
              <ul class="nav nav-pills nav-stacked">
                <li class="active"><a href="#"><i class="fa fa-inbox"></i> 내가 쓴 글
                  <span class="label label-primary pull-right">12</span></a></li>
                <li class="active"><a href="#"><i class="fa fa-inbox"></i> 내가 단 댓글
                  <span class="label label-primary pull-right">12</span></a></li>
              </ul>
            </div>
          </div>
        </div>
        <div class="col-md-9">
          <div class="box box-primary">
            <div class="box-header with-border">
              <h3 class="box-title"></h3>
              <!-- 특정 게시글 찾기 -->
              <div class="box-tools pull-right">
                <div class="has-feedback">
                  <input type="text" class="form-control input-sm" placeholder="제목 & 작성자 입력">
                  <span class="glyphicon glyphicon-search form-control-feedback"></span>
                </div>
              </div>
            </div>
            <div class="box-body no-padding">
              <!-- Header -->
              <div class="mailbox-controls">
                <!-- Check all button -->
                <button type="button" class="btn btn-default btn-sm checkbox-toggle"><i class="fa fa-check"></i>
                </button>
                <!-- Delete button -->
                <div class="btn-group">
                  <button type="button" class="btn btn-default btn-sm"><i class="fa fa-trash-o"></i></button>
                </div>
                <!-- Refresh button -->
                <button type="button" class="btn btn-default btn-sm"><i class="fa fa-refresh"></i></button>
                <!-- Page Move button -->
                <div class="pull-right">
                  1-50/200
                  <div class="btn-group">
                    <button type="button" class="btn btn-default btn-sm"><i class="fa fa-chevron-left"></i></button>
                    <button type="button" class="btn btn-default btn-sm"><i class="fa fa-chevron-right"></i></button>
                  </div>
                </div>
              </div>
              <div class="table-responsive mailbox-messages">
                <table class="table table-hover table-striped">
                  <tbody>
                  <tr>
                    <!-- Check Box -->
                    <td>&nbsp;&nbsp;&nbsp;<input type="checkbox"></td>
                    <td>&nbsp;&nbsp;&nbsp;</td>
                    <!-- 작성자 -->
                    <td class="mailbox-name"><a href="read-mail.html">점장1</a></td>
                    <td>&nbsp;&nbsp;&nbsp;</td>
                    <!-- Subject -->
                    <td style="cursor:pointer;" class="mailbox-subject"><b>제목 - </b>  나 저번달에 400 벌엇다 ㅇㅈ?
                    </td>
                    <td class="mailbox-attachment"></td>
                    <!-- 작성 시간 -->
                    <td class="mailbox-date">5 mins ago</td>
                  </tr>
                  </tbody>
                </table>
              </div>
            </div>
            <!-- Footer -->
            <div class="box-footer no-padding">
              <div class="mailbox-controls">
                <!-- Check all button -->
                <button type="button" class="btn btn-default btn-sm checkbox-toggle"><i class="fa fa-check"></i>
                </button>
                <!-- Delete button -->
                <div class="btn-group">
                  <button type="button" class="btn btn-default btn-sm"><i class="fa fa-trash-o"></i></button>
                </div>
                <!-- Refrsh button -->
                <button type="button" class="btn btn-default btn-sm"><i class="fa fa-refresh"></i></button>
                <!-- Page Move button -->
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
    </section>
  </div>
  	<!-- jQuery 2.2.0 -->
	<script src="/owner/resources/plugins/jQuery/jQuery-2.2.0.min.js"></script>
	<!-- jQuery UI 1.11.4 -->
	<script src="https://code.jquery.com/ui/1.11.4/jquery-ui.min.js"></script>
 	<script>
	  $.widget.bridge('uibutton', $.ui.button);
	</script>
	<!-- Footer -->
 	<jsp:include page="../layout/Footer.jsp" />
</body>
</html>