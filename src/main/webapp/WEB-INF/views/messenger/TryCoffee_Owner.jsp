<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<style>
.main-sidebar span {
	color: white;
}

.Owner-Result-Div:hover{
	cursor : pointer;
	background-color: #CCE5FF;
}
</style>
</head>
<body class="hold-transition skin-blue sidebar-mini">
	<div class="wrapper">
		<!-- Header -->
		<jsp:include page="../layout/Header.jsp" />

		<!-- Search Owner -->
		<div class="row">
			<div class="input-group col-md-4" style="margin-top: 5px; margin-left: 30px">
				<input type="text" name="q" id="Owner-Search-Text"
					class="form-control" placeholder="Search..."> <span
					class="input-group-btn">
					<button type="button" name="search" id="Owner-Search-btn"
						class="btn btn-flat" style="height: 34px">
						<i class="fa fa-search"></i>
					</button>
				</span>
			</div>
			<!-- 자동 완성 -->
			<div id="Auto-Result-Div" style="margin-left: 30px; background-color: white; width:593px; padding-left: 10px; display:none">
				<!-- Search Result -->
				<div class="Owner-Result-Div">
					<i class="fa fa-user fa-2x"></i>
					<span style="font-weight: bold; font-size:10pt">owner@owner.com</span>
				</div>
				<div class="Owner-Result-Div">
					<i class="fa fa-user fa-2x"></i>
					<span style="font-weight: bold; font-size:10pt">owner@owner.com</span>
				</div>			
			</div>
		</div>
		<!-- First Div -->
		<div id="First-Guide-Div" class="row col-md-10" style="margin-top: 20px">
			<div class="box box-widget widget-user-2">
				<div class="widget-user-header bg-light-blue">
					<div class="widget-user-image">
						<i class="fa fa fa-exclamation-circle fa-5x"></i>
						<h3 class="widget-user-username">
							E-Mail 혹은 이름을 검색하여 원하시는 점장을 찾아보세요!
						</h3>
						<h5 class="widget-user-desc">TryCatchCommunity</h5>
					</div>
				</div>
			</div>
		</div>
		<!-- TryCoffee Owner List -->
		<div class="Owner-List-Div" style="display:none; margin-top: 10px">
			<div class="col-md-4" style="display: inline-block">
				<!-- Owner -->
				<div class="box box-widget widget-user-2">
					<div class="widget-user-header bg-yellow">
						<div class="widget-user-image">
							<i class="fa fa-user fa-5x"></i>
							<!-- Onwer Name -->
							<h3 class="widget-user-username">
								owner@owner.com<a class="Let-Message-Btn" style="color: white" href="#"
									data-toggle="tooltip" title="1:1 대화">&nbsp;<i
									class="Lets-Message-Btn fa fa-commenting-o"></i></a>
							</h3>
							<!-- Onwer Info -->
							<h5 class="widget-user-desc">26살, 종각점</h5>
						</div>
					</div>
				</div>
				<!-- Owner -->
				<div class="box box-widget widget-user-2">
					<div class="widget-user-header bg-yellow">
						<div class="widget-user-image">
							<i class="fa fa-user fa-5x"></i>
							<!-- Onwer Name -->
							<h3 class="widget-user-username">
								owner2@owner.com<a class="Let-Message-Btn" style="color: white" href="#"
									data-toggle="tooltip" title="1:1 대화">&nbsp;<i
									class="Lets-Message-Btn fa fa-commenting-o"></i></a>
							</h3>
							<!-- Onwer Info -->
							<h5 class="widget-user-desc">36살, 인천점</h5>
						</div>
					</div>
				</div>
			</div>
		</div>
		
		<!-- Message -->
			<div id="Message-Div" class="col-md-4 col-md-offset-6" style="position:fixed; display:none">
				<div class="box box-primary direct-chat direct-chat-primary">
					<div class="box-header with-border">
						<!-- 채팅하는 상대방 아이디 -->
						<h3 class="box-title">owner2@owner.com와의 대화</h3>
						<div class="box-tools pull-right">
							<span data-toggle="tooltip" title="3 New Messages"
								class="badge bg-light-blue">3</span>
							<button type="button" class="btn btn-box-tool"
								data-widget="collapse">
								<i class="fa fa-minus"></i>
							</button>
							<button type="button" class="btn btn-box-tool"
								data-toggle="tooltip" title="Contacts"
								data-widget="chat-pane-toggle">
								<i class="fa fa-comments"></i>
							</button>
							<button type="button" class="btn btn-box-tool"
								data-widget="remove">
								<i class="fa fa-times"></i>
							</button>
						</div>
					</div>
					<div class="box-body">
						<!-- Conversations are loaded here -->
						<div class="direct-chat-messages">
							<!-- Message. Default to the left -->
							<div class="direct-chat-msg">
								<div class="direct-chat-info clearfix">
									<span class="direct-chat-name pull-left">나</span><br /> <span
										class="direct-chat-timestamp pull-left">23 Jan 2:00 pm</span>
								</div>
								<!-- 나 -->
								<span><i class="fa fa-user fa-3x"></i></span>
								<div class="direct-chat-text">돈 좀 꿔져</div>
							</div>

							<!-- 상대방 -->
							<!-- Message to the right -->
							<div class="direct-chat-msg right">
								<div class="direct-chat-info clearfix">
									<span class="direct-chat-name pull-right">상대방</span><br /> <span
										class="direct-chat-timestamp pull-right">23 Jan 2:05 pm</span>
								</div>
								<div style="display: block">
									<span class="pull-right"><i class="fa fa-user fa-3x"></i></span>
								</div>
								<div style="display: block" class="direct-chat-text">
									ㄲㅈ ㅇㅈ?<br /> ㄲㅈ ㅇㅈ?<br /> ㄲㅈ ㅇㅈ?<br />
								</div>
							</div>
						</div>
					</div>

					<!-- Send Message -->
					<div class="box-footer">
						<form action="#" method="post">
							<div class="input-group">
								<input type="text" name="message" placeholder="Type Message ..."
									class="form-control"> <span class="input-group-btn">
									<button type="submit" class="btn btn-primary btn-flat">Send</button>
								</span>
							</div>
						</form>
					</div>
					<!-- /.box-footer-->
				</div>
			</div>
	</div>
	<!-- jQuery 2.2.0 -->
	<script src="/owner/resources/plugins/jQuery/jQuery-2.2.0.min.js"></script>
	<!-- jQuery UI 1.11.4 -->
	<script src="https://code.jquery.com/ui/1.11.4/jquery-ui.min.js"></script>
	<script>
	  $(function(){
		//Lets-Message-Btn Click 1:1 Message
		$(".Lets-Message-Btn").click(function(){
			var index = $(".Lets-Message-Btn").index(this);
		});
	  //Owner-Search-Text get Focus Hide First Div
	  $("#Owner-Search-Text").focus(function(){
		  $("#First-Guide-Div").fadeOut(400);
	  });
	  //Owner-Search-Text KeyUp Show Result
	  $("#Owner-Search-Text").keyup(function(){
		$("#Auto-Result-Div").show();
	  });
	  //Owner-Result-Div DoubleClick Show Owner Detail Info
	  $(".Owner-Result-Div").dblclick(function(){
		  var index = $(".Owner-Result-Div").index(this);
		  $(".Owner-List-Div").fadeIn(400);
	  });
	  //Let-Message-Btn Click Show Message
	  $(".Let-Message-Btn").click(function(){
		  $("#Message-Div").show();
	  });
	})
	</script>
		<!-- Footer -->
	<%@ include file="../layout/Footer.jsp" %>
</body>
</html>