<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
		<!-- Community -->
	
	  <!-- Content Wrapper. Contains page content -->
	    <!-- Content Header (Page header) -->
	    <section class="content-header">
	      <h1>
	        Read
	      </h1>
	    </section>
	
	    <!-- 왼쪽 패널  -->
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
	                <!-- 내가 쓴 글 -->
	              <li id="My-Write" class="active"><a href="#"><i class="fa fa-pencil"></i> 내가 쓴 글
                  <span class="label label-primary pull-right">${fn:length(mycommunity_list)}</span></a>
                  <div id="My-Write-List" class="box-body no-padding col-sm-offset-1" style="font-size:13pt; display: none">
<c:set var="mycommunity_list" value="${mycommunity_list}"/>
<c:set var="mycommunity_size" value="${fn:length(mycommunity_list)}"/>
					<c:choose>
						<c:when test="${mycommunity_size!=0}">
							<c:forEach var = "mycommunity_list" items="${mycommunity_list}">
			                    <div style="display: block">
			                    	<a href="/owner/community_read?community_no=${mycommunity_list.community_no}">내용 - ${mycommunity_list.community_title}</a>
			                    </div>
			                </c:forEach>
			            </c:when>
			            <c:when test="${mycommunity_size==0}">
			            	<div style="display:block">
			            		글을 쓰세요<button type="button" class="btn btn-default btn-sm" id="goinsert"><i class="glyphicon glyphicon-pencil"></i></button>
			            	</div>
			            </c:when>
			        </c:choose>            
                   </div> 
                 </li>
<c:set var="myreplycommunity_list" value="${myreplycommunity_list}"/>    
<c:set var="myreplycommunity_size" value="${fn:length(myreplycommunity_list)}"/>             
	                <li id="My-Reply" class="active"><a href="#"><i class="fa fa-pencil"></i> 내가 단 댓글
	                  <span class="label label-primary pull-right">${myreplycommunity_size}</span></a>
	                   <div id="My-Reply-List" class="box-body no-padding col-sm-offset-1" style="font-size:13pt; display: none">
	                    <c:choose>
	                    	<c:when test="${myreplycommunity_size!=0}">
	                    		<c:forEach items="${myreplycommunity_list}" var="myreplycommunity_list">
				                    <div style="display: block">
				                    	<a href="/owner/community_read?community_no=${myreplycommunity_list.community_no}">${myreplycommunity_list.community_no}번 게시물에 대한 댓글 - ${myreplycommunity_list.community_reply_comment}</a>
				                    </div>
	                    		</c:forEach>
							</c:when>
							<c:when test="${myreplycommunity_size!=0}">
								등록하신 댓글이 없습니다.
							</c:when>
	                    </c:choose>
	                   </div>   
	                </li>
	                <!-- 즐겨찾기 -->
<c:set var="mycommunity_like" value="${mycommunity_like}"/>
<c:set var="mycommunity_like_size" value="${fn:length(mycommunity_like)}"/>                
	                <li id="Book-Mark" class="active"><a href="#"><i class="fa fa-star text-yellow"></i> 즐겨찾기
	                  <span class="label label-primary pull-right">${mycommunity_like_size}</span></a>
	                    <div id="Book-Mark-List" class="box-body no-padding col-sm-offset-1" style="font-size:13pt; display: none">
							<c:choose>   
								<c:when test="${mycommunity_like_size!=0}">    
									<c:forEach items="${mycommunity_like}" var="mycommunity_like">           
				                    	<div class="like_number" style="display: block">
				                    	<input type="hidden" value="${mycommunity_like.community_no}" />
				                    		<a href="/owner/community_read?community_no=${mycommunity_like.community_no}">제목 - ${mycommunity_like.community_title}</a>				    
				                    	</div>
			                    	</c:forEach> 
	                    		</c:when>
	                    		<c:when test="${mycommunity_like_size==0}">
	                    			즐겨찾기 항목 없음
	                    		</c:when>
	                    	</c:choose>
	                    </div>
	                </li>
	              </ul>
	            </div>
	          </div>
	        </div>
	
	        <div class="col-md-9">
	          <div class="box box-primary">
	            <div class="box-header with-border">
	              <h3 class="box-title">READ</h3>
	
	              <div class="box-tools pull-right">
	                <a href="/owner/community_prev?community_no=${communityDTO.community_no}" class="btn btn-box-tool" data-toggle="tooltip" title="Previous"><i class="fa fa-chevron-left"></i></a>
	                <a href="/owner/community_next?community_no=${communityDTO.community_no}" class="btn btn-box-tool" data-toggle="tooltip" title="Next"><i class="fa fa-chevron-right"></i></a>
	              </div>
	            </div>
	            <div class="box-body no-padding">
	              <div class="mailbox-read-info">
	              <!-- Board Subject -->
	              	<input type="hidden" class="community_number" value="${communityDTO.community_no}"/>
	              	<input type="hidden" class="community_title" value="${communityDTO.community_title}"/>
	                <h3>${communityDTO.community_title}</h3>
	                <h2>${communityDTO.community_writer}</h2>
	               	<!-- Board Writer -->
	                <h5>
	                  <span class="mailbox-read-time pull-right">${communityDTO.community_regdate}</span></h5>
	              </div>
	              <div class="mailbox-controls with-border text-center">
	                <div class="btn-group">
	                <!-- Delte -->
	                  <button type="button" class="btn btn-default btn-sm" data-toggle="tooltip" id="community_del" data-container="body" title="삭제">
	                    <i class="fa fa-trash-o"></i></button>
		              	<!-- 즐겨찾기 --> 
		                <button type="button" class="btn btn-default btn-sm" data-toggle="tooltip" data-container="body" title="즐겨찾기">
		                    <div class="Book-Mark-Before"><i class="fa fa-star-o text-yellow"></i></div>
		                	<div class="Book-Mark-After" style="display:none"><i class="fa fa-star text-yellow"></i></div>
		                </button>
	                  </div>
	                </div>
	              </div>
	              <!-- Board Content -->
	              <div class="mailbox-read-message">
					${communityDTO.community_content}
	              </div>
	            </div>
	            <!-- Reply -->
	            <div class="box-footer box-comments">
	              <div class="box-comment">
	                <div class="comment-text">

<c:set var="community_reply_size" value="${fn:length(community_reply_list)}"/>
${community_reply_size}
						<c:choose>
							<c:when test="${community_reply_size!=0}">
								<c:forEach end="${community_reply_size}" items="${community_reply_list}" var="community_reply">
			                      <span class="username">
			                        ${community_reply.community_reply_writer}
			                        <span class="text-muted pull-right">${community_reply.community_reply_date}</span>
			                      </span>
		                  <!-- Reply Content -->
	                      			${community_reply.community_reply_comment}
	                      		</c:forEach>
	                   	 	</c:when>  	
	                 	<c:when test="${community_reply_size==0}">
	                 		댓글이 없습니다.
	                 	</c:when>
	                  </c:choose>    	
	               </div>
	              </div>
	            </div>
	            <!-- Reply 작성하는 곳 -->
	            <div class="box-footer">
	              <form action="/owner/community_reply" method="post">
	              	<input type="hidden" name ="community_no" value="${communityDTO.community_no}"/>
	                <div class="img-push">
	                  <input type="text" name="community_reply_comment"class="form-control input-sm" placeholder="Press enter to post comment">
	                </div>
	              </form>
	            </div>
	          </div>
	        </div>
	    </section>
	</div>

	<script>
	  $.widget.bridge('uibutton', $.ui.button);
	  
	  $(function(){
		  
		 	var like_no = "${communityDTO.community_no}";
			var like_community_no = new Array();
			$(".like_number").each(function(){
				like_community_no.push($(this).find("input[type=hidden]").val());
			});
			for(var i=0; i<like_community_no.length; i++){
				if(like_no == like_community_no[i]){
					$(".Book-Mark-After").show();
					$(".Book-Mark-Before").hide();
				}
			}
			
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
					 var member_no = "${member_dto.member_no}";
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
						}
					 }
				  })	  
			  })

			  	
		 
		  
			
		  /*
		  //게시판 상단 즐겨찾기 Click 즐겨찾기 추가
		  $(".Book-Mark-Before").click(function(){
			 var index = $(".Book-Mark-Before").index(this);
			 var divB = $(".Book-Mark-Before").eq(index);
			 var divA = $(divB).siblings(".Book-Mark-After");
			$(divB).hide();
			$(divA).show();
		  });
		  
		  
		  
		  //게시판 상단 즐겨찾기 취소 Click 즐겨찾기 삭제
		  $(".Book-Mark-After").click(function(){
			 var index = $(".Book-Mark-After").index(this);
			 var divA = $(".Book-Mark-After").eq(index);
			 var divB = $(divA).siblings(".Book-Mark-Before");
			$(divB).show();
			$(divA).hide();
		  });	
		  
		  */
		  //왼쪽 패널 즐겨찾기 Click List Show
		  $("#Book-Mark").click(function(){
			  $("#Book-Mark-List").slideToggle(400);
		  });
		  //왼쪽 패널 내가 쓴 글 Click List Show
		  $("#My-Write").click(function(){
			  $("#My-Write-List").slideToggle(400);
		  });
		  //왼쪽 패널 내가 단 댓글 Click List Show
		  $("#My-Reply").click(function(){
			  $("#My-Reply-List").slideToggle(400);
		  });
		  
		  $("#community_del").click(function(){
			  var conf = confirm("본인만 삭제가능합니다 삭제하시겠습니까?");
			  if(conf){
				 location.href="/owner/community_del?community_no=${communityDTO.community_no}";
			  }
			  else{
				 
			  }
		  })
	  })
	</script>
	<!-- Footer -->
 	<jsp:include page="../layout/Footer.jsp" />
</body>
</html>