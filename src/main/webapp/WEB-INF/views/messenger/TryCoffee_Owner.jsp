<!-- 
/*
 * 	JSP: TryCoffee_Owner.jsp
 *  Description: Messenger를 사용할수 있게 진행해주는 JSP 페이지 
 *  Created: 2016­07­18
 *	Author: 김준혁
 *  Mail: heyKJ@gmail.com
 * 	Copyrights 2016-07-18 by Try{}Catch
 *
 *	Revisions:
 * 	1. When & Who : 2016-07-23 by 임두휘
 * 	2. What		  : Websocket을 이용한 다자간 채팅창 구현.. 
 *					// 1대1채팅 구현 필요 원하는 사람과의 채팅 구현 필요
 *					// 메신져 기능 구현 필요
 *  
 * 	1. When & Who : 2016-07-25 by 임두휘
 * 	2. What		  : Websocket을 이용한 1대 1 채팅 창 구현 
 *  
 * 	1. When & Who : 2016-07-27 by 임두휘
 * 	2. What		  : 메신져의 기본 기능 구현 DB에서 리스트를 가져오고 뿌려주는 기능 구현 
 *
 * 	1. When & Who : 2016-07-28 by 임두휘
 * 	2. What		  : 메신져를 연결시 리스트를 뿌리면 읽지 않은 알람 삭제 구현 
 *
 * 	1. When & Who : 2016-07-29 by 임두휘
 * 	2. What		  : Collapse 기능 간 connect 여부 구현, collapse로 닫혀 있을 시 메시지를 받으면 알람으로 추가되게 구현 
 */
 -->
<%@ page contentType="text/html; charset=UTF-8"%>
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
		</div>
		<!-- First Div -->
		<div id="First-Guide-Div" class="row col-md-10" style="margin-top: 20px">
			<div class="box box-widget widget-user-2">
				<div class="widget-user-header bg-light-blue">
					<div class="widget-user-image">
						<i class="fa fa fa-exclamation-circle fa-5x"></i>
						<h3 class="widget-user-username">
							지점을 검색하여 원하시는 점장을 찾아보세요!
						</h3>
						<h5 class="widget-user-desc">TryCatchCommunity</h5>
					</div>
				</div>
			</div>
		</div>
		<!-- TryCoffee Owner List -->
		<div class="row">
			<div class="Owner-List-Div col-md-4" style="margin-top: 10px">
				<div id="owner_list_div">
				</div>
			</div>
			
			<div id="Message-List-Div" class="col-md-5 col-md-offset-2"></div>
		</div>
	</div>
	<!-- jQuery 2.2.0 -->
	<script src="/owner/resources/plugins/jQuery/jQuery-2.2.0.min.js"></script>
	<!-- jQuery UI 1.11.4 -->
	<script src="https://code.jquery.com/ui/1.11.4/jquery-ui.min.js"></script>
	<script>
	  $(function(){
		  if('${param.member_no}'!=''){
			sendConnect('${param.member_name}','${param.member_no}');
		  }
	  //Owner-Search-Text get Focus Hide First Div
	  $("#Owner-Search-Text").focus(function(){
		  $("#First-Guide-Div").fadeOut(400);
	  });
	  //Owner-Search-Text KeyUp Show Result
	  $("#Owner-Search-Text").keyup(function(){
		  $.ajax({
				url:"/owner/store/search",
				type:"post",
				data:{store_name:$(this).val()},
				success:function(data){
					var html ="";
					$.each(data.storeList, function(index,jsonData){
						var member_name = "'" + jsonData.member_name + "'";
						html +='<div class="box box-widget widget-user-2">';
						html += '<div class="widget-user-header bg-yellow">';
						html += '<div class="widget-user-image"><i class="fa fa-user fa-5x"></i>'
						html += '<h3 class="widget-user-username">';
						html += jsonData.store_name+'<a class="Let-Message-Btn" style="color: white" onclick="sendConnect('+member_name+','+jsonData.member_no+')" data-toggle="tooltip" title="1:1 대화">&nbsp;<i class="Lets-Message-Btn fa fa-commenting-o"></i></a>';
						html += '</h3>';
						html += '<h5 class="widget-user-desc">'+jsonData.member_name+'</h5>';
						html +=	'</div></div></div>';
					});
					$("#owner_list_div").html(html);
				}
			});	
	  });
	})
	
	
	
	// Web-socket 관련 메서드 
	function sendConnect(member_name,member_no){
		var html = "";
		html += '<div id="Message-Div-'+member_no+'"class="Message-Div">';
		html += '<div class="box box-primary direct-chat direct-chat-primary">'
		html += '<div class="box-header with-border"><h3 class="box-title">'
		html += member_name +'과의 대화</h3>';
		html += '<input type="hidden" class="Messenger_member_no" value="'+member_no+'"/>';
		html += '<div class="box-tools pull-right">';
		html += '<button type="button" class="collapse_btn btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button>';
		html += '<button type="button" class="btn btn-box-tool"	data-toggle="tooltip" title="Contacts" data-widget="chat-pane-toggle"><i class="fa fa-comments"></i></button>';
		html += '<button type="button" class="remove_btn btn btn-box-tool"	onclick="messengerdisconnect('+member_no+')" data-widget="remove"><i class="fa fa-times"></i></button>';
		html += '</div>	</div>';
		html += '<div class="box-body">	<div class="direct-chat-messages"></div></div>';
		html += '<div class="box-footer"><div class="input-group">';
		html += '<input type="text" id="message-'+member_no+'" placeholder="Type Message ..." class="form-control"> <span class="input-group-btn">	<button type="button" onclick="msgsendMessage('+member_no+')" class="btn btn-primary btn-flat">Send</button>';
		html += '</span></div></div></div></div>'
		$("#Message-List-Div").append(html);
		connectajax(member_no);
		
		
	}
	function connectajax(member_no){
		$.ajax({
			url:"/owner/messenger/connect",
			type:"post",
			data:{member_no:'${member_dto.member_no}',send_member_no:member_no },
			success:function(data){
				$.each(data.contentList, function(index,jsonData){
					if(jsonData.member_no=='${member_dto.member_no}'){
						msgshowmyMessage(jsonData.messenger_content,member_no,jsonData.content_regdate);
					}else{
						msgshowMessage(jsonData.messenger_content,member_no,jsonData.member_name,jsonData.content_regdate);
					}
				});
				noReadMsgList();
			}
		});	
	}
	  
 	$(document).on('click',".collapse_btn",function(){
 		var eq = $(".collapse_btn").index(this);
 		var member_no = $(".Messenger_member_no").eq(eq).val();
 		if($(this).html()=='<i class="fa fa-minus"></i>'){
 			messengerdisconnect(member_no);
 		}
 		else{
 			$("#Message-Div-"+member_no+" .direct-chat-messages").html("");
 			connectajax(member_no);
 		}
	});
	function messengerdisconnect(member_no){
		$.ajax({
			url:"/owner/messenger/disconnect",
			type:"post",
			data:{member_no:'${member_dto.member_no}',send_member_no:member_no },
			success:function(data){
				
			}
		});	
	}
	function msgsendMessage(member_no) {
		var message = document.getElementById('message-'+member_no).value;
		var d = new Date();
		  var s =
		    leadingZeros(d.getFullYear(), 4) + '-' +
		    leadingZeros(d.getMonth() + 1, 2) + '-' +
		    leadingZeros(d.getDate(), 2) + ' ' +

		    leadingZeros(d.getHours(), 2) + ':' +
		    leadingZeros(d.getMinutes(), 2) + ':' +
		    leadingZeros(d.getSeconds(), 2);
		msgshowmyMessage(message, member_no,s);
		socket.send(JSON.stringify({'message' : message,'member_no':'${member_dto.member_no}','send_member_no':member_no,'type':'messenger' }));
		document.getElementById('message-'+member_no).value = "";
	}
	function leadingZeros(n, digits) {
		  var zero = '';
		  n = n.toString();

		  if (n.length < digits) {
		    for (i = 0; i < digits - n.length; i++)
		      zero += '0';
		  }
		  return zero + n;
		}


	function msgshowMessage(message, member_no,member_name, content_regdate) {
		var html = "";
		html += '<div class="direct-chat-msg right">';
		html += '<div class="direct-chat-info clearfix">';
		html +=	'<span class="direct-chat-name pull-right">'+member_name+'</span><br /> <span class="direct-chat-timestamp pull-right">'+content_regdate+'</span>';
		html += '</div>';
		html += '<div style="display: block">'
		html += '<span class="pull-right"><i class="fa fa-user fa-3x"></i></span>';
		html += '</div>';
		html += '<div style="display: block" class="direct-chat-text">';
		html += message;	
		html += '</div></div>';
		$("#Message-Div-"+member_no+" .direct-chat-messages").prepend(html);
		
	}
	function msgshowmyMessage(message,member_no,content_regdate){
		var html = "";
		html += '<div class="direct-chat-msg">';
		html += '<div class="direct-chat-info clearfix">';
		html +=	'<span class="direct-chat-name pull-left">나<span><br /> <span class="direct-chat-timestamp pull-left">'+content_regdate+'</span>';
		html += '</div>';
		html += '<div style="display: block">'
		html += '<span class="pull-left"><i class="fa fa-user fa-3x"></i></span>';
		html += '</div>'
		html += '<div style="display: block"  class="direct-chat-text">';
		html += message;
		html += '</div></div>';
		$("#Message-Div-"+member_no+" .direct-chat-messages").prepend(html);
		

	}
	</script>
		<!-- Footer -->
	<%@ include file="../layout/Footer.jsp" %>
</body>
</html>