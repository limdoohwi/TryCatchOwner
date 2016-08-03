<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
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
	<c:forEach items="${mycommunity_like}" var ="mycommunitylike">
		<c:if test="${mycommunitylike.community_no == communityDTO.community_no}">
			<c:set var="community_like" value="${mycommunitylike }"></c:set>
		</c:if>
	</c:forEach>
	<div class="wrapper">
		<!-- Header -->
		<jsp:include page="../layout/Header.jsp" />
		<!-- Community -->

		<!-- Content Wrapper. Contains page content -->
		<!-- Content Header (Page header) -->
		<section class="content-header">
			<h1>Read</h1>
		</section>

		<!-- 왼쪽 패널  -->
		<section class="content">
			<div class="row">
				<jsp:include page="Community_Include.jsp" />
				<div class="col-md-9">
					<div class="box box-primary">
						<div class="box-header with-border">
							<h3 class="box-title">READ</h3>

							<div class="box-tools pull-right">
								<a
									href="/owner/community_prev?community_no=${communityDTO.community_no}"
									class="btn btn-box-tool" data-toggle="tooltip" title="Previous"><i
									class="fa fa-chevron-left"></i></a> <a
									href="/owner/community_next?community_no=${communityDTO.community_no}"
									class="btn btn-box-tool" data-toggle="tooltip" title="Next"><i
									class="fa fa-chevron-right"></i></a>
							</div>
						</div>
						<div class="box-body no-padding">
							<div class="mailbox-read-info">
								<!-- Board Subject -->
								<input type="hidden" class="community_number"
									value="${communityDTO.community_no}" /> <input type="hidden"
									class="community_title" value="${communityDTO.community_title}" />
								<h3>${communityDTO.community_title}</h3>
								<h2>${communityDTO.community_writer}</h2>
								<!-- Board Writer -->
								<h5>
									<span class="mailbox-read-time pull-right">${communityDTO.community_regdate}</span>
								</h5>
							</div>
							<div class="mailbox-controls with-border text-center">
								<div class="btn-group">
									<!-- Delte -->
									<button type="button" class="btn btn-default btn-sm"
										data-toggle="tooltip" id="community_del" data-container="body"
										title="삭제">
										<i class="fa fa-trash-o"></i>										
									</button>
									<!-- 즐겨찾기 -->
									<button type="button" class="btn btn-default btn-sm"
										data-toggle="tooltip" data-container="body" title="즐겨찾기">
										<div class="Book-Mark-Before" style="<c:if test='${community_like != null}'>display: none</c:if>">
											<i class="fa fa-star-o text-yellow"></i>
										</div>
										<div class="Book-Mark-After" style="<c:if test='${community_like == null}'>display: none</c:if>">
											<i class="fa fa-star text-yellow"></i>
										</div>
									</button>
									<button type="button" class="btn btn-default btn-sm" id="refresh"><i class="fa fa-refresh"></i></button>
								</div>
							</div>
						</div>
						<!-- Board Content -->
						<div class="mailbox-read-message">
							${communityDTO.community_content}</div>
					</div>
					<!-- Reply -->
					<div class="box-footer box-comments">
						<div class="box-comment">
							<div class="comment-text">
							</div>
						</div>
					</div>
	
					<!-- Reply 작성하는 곳 -->
					<div class="box-footer">
							<div class="img-push">
								<input type="text" id="community_reply_comment"
									class="form-control input-sm"
									placeholder="Press enter to post comment">
					</div>
				</div>
			</div>
		</section>
	</div>

	<script>
	  $.widget.bridge('uibutton', $.ui.button);
	  $(function(){
		  	bookmarkList();
		  	community_reply_list();
		  	replyList();
		  	
			//즐겨찾기 추가
			 $(".Book-Mark-Before").click(function(){	
				 var divB = $(".Book-Mark-Before").eq(0);
				 var community_no = "${communityDTO.community_no}";
				 var community_title = $(".community_title").val();
				 var divA = $(divB).siblings(".Book-Mark-After");
				 var member_no = "${member_dto.member_no}";
				 
				 if($(divB).show()){
					 $.ajax({
						 type:"post",
						 url:"/owner/community_like",
						 data:{community_no:community_no , community_title:community_title , member_no:member_no},
						 dataType : "json",
						 success: function(data){
							 if(data==true){
									$(divB).hide();
									$(divA).show();
								alert("즐겨찾기가 추가되었습니다.");
								$("#Book-Mark-List-Div").html("");
								bookmarkList();
							 }
						 },
						 error:function(){
							 alert("ajax실패");
						 }
					 }) 
				 }
			  });
			  //즐겨찾기 해제
			  $(".Book-Mark-After").click(function(){
					 var divA = $(".Book-Mark-After").eq(0);
					 var community_no = "${communityDTO.community_no}"
					 var divB = $(divA).siblings(".Book-Mark-Before");
					 var member_no1 = "${member_dto.member_no}";
				  $.ajax({
					 type:"post",
					 url:"/owner/community_like",
					 data:{community_no:community_no},
					 dataType:"json",
					 success:function(data){
						if($(divA).show()){
							alert("즐겨찾기 해제되었습니다");
							$(divA).hide();
							$(divB).show();
							$("#Book-Mark-List-Div").html("");
							bookmarkList();
						}
					 }
				  })	  
			  })
		  // 해당 커뮤니티 삭제	  
		  $("#community_del").click(function(){
			  var conf = confirm("본인만 삭제가능합니다 삭제하시겠습니까?");
			  if(conf){
				 location.href="/owner/community_del?community_no=${communityDTO.community_no}";
			  }
			  else{
				 
			  }
		  })
		  $("#refresh").click(function(){
			  location.href="/owner/community_list?limit=0";
		  });
	  })
	  	
	  
	  	 //댓글 쓰기
	  	 $(document).on("keyup",$("#community_reply_comment"),function community_reply_insert(e){
	  		 if(e.keyCode == 13){
			  	var community_reply_comment =  $("#community_reply_comment").val();
			  	var community_no =  $(".community_number").val();
			  	$.ajax({
			  		type:"post",
			  		url:"/owner/community_reply",
			  		data:{community_reply_comment:community_reply_comment,community_no :community_no},
			  		datatype:"json",
			  		success:function(data){
							if(data == true){

								$("#community_reply_comment").val("");
								$(".comment-text").html("");								
								community_reply_list();		
								$("#My-Reply-List").html("");
								replyList();

							}
			  			}
			  		})
	  			 }
	 		 })
	  
	  
	  	  // 댓글 리스트 불러오기
		  function community_reply_list(){
		  	
				var community_no = 	$(".community_number").val();
				
				  $.ajax({
					  type:"post",
					  url:"/owner/community/replylist",
					  data:{community_no:community_no},
					  datatype: "json",
					  success: function(data){
						  $.each(data.communityreplylist, function(index , replelist){
							  var replyhtml = 	'<span class="username">'+ replelist.community_reply_writer +'<br/>'+replelist.community_reply_comment +
													'<span class="text-muted pull-right">'+ replelist.community_reply_date +'</span>'
												'</span>';
								$(".comment-text").append(replyhtml);		
						  })
					  }
				  })
			  }
	</script>
	<!-- Footer -->
	<jsp:include page="../layout/Footer.jsp" />
</body>
</html>