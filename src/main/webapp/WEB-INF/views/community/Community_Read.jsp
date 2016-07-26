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
			                    	<a href="/owner/community_read?community_no=${mycommunity_list.community_no}">${mycommunity_list.community_title}</a>
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
	                <!-- 내가 단 댓글 -->
	                <li id="My-Reply" class="active"><a href="#"><i class="fa fa-pencil"></i> 내가 단 댓글
	                  <!-- 내가 단 댓글 Count Number -->
	                  <span class="label label-primary pull-right">12</span></a>
	                   <!-- 내가 단 댓글 List -->
	                   <div id="My-Reply-List" class="box-body no-padding col-sm-offset-1" style="font-size:13pt; display: none">
	                    <div style="display: block">
	                    	<a href="#">어떤놈이 쓴글1 - 제 생각에 님은 병신</a>
	                    </div>
	                    <div style="display: block">
	                    	<a href="#">어떤놈이 쓴글2 - 어쩔</a>
	                    </div>
	                   </div>   
	                </li>
	                <!-- 즐겨찾기 -->
	                <li id="Book-Mark" class="active"><a href="#"><i class="fa fa-star text-yellow"></i> 즐겨찾기
	                  <!-- 즐겨찾기 Count Number -->
	                  <span class="label label-primary pull-right">12</span></a>
	                    <!-- 즐겨찾기 List -->
	                    <div id="Book-Mark-List" class="box-body no-padding col-sm-offset-1" style="font-size:13pt; display: none">
	                    	<div style="display: block">
	                    		<a href="#">작성자1 - 헉 수지 개쩜</a>
	                    	</div>
	                    	<div style="display: block">
	                    		<a href="#">작성자2 - 아이돌 유출</a>
	                    	</div>
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
	                <a href="#" class="btn btn-box-tool" data-toggle="tooltip" title="Previous"><i class="fa fa-chevron-left"></i></a>
	                <a href="#" class="btn btn-box-tool" data-toggle="tooltip" title="Next"><i class="fa fa-chevron-right"></i></a>
	              </div>
	            </div>
	            <div class="box-body no-padding">
	              <div class="mailbox-read-info">
	              <!-- Board Subject -->
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
	                      <span class="username">
	                        Maria Gonzales
	                        <span class="text-muted pull-right">2016년 7월 3일 16시 26분</span>
	                      </span>
	                  <!-- Reply Content -->
	                      	ㅇㅅㅇ
	               </div>
	              </div>
	            </div>
	            <!-- Reply 작성하는 곳 -->
	            <div class="box-footer">
	              <form action="/owner/community_reply" method="post">
	                <div class="img-push">
	                  <input type="text" class="form-control input-sm" placeholder="Press enter to post comment">
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
			  location.href="/owner/community_del?community_no=${communityDTO.community_no}";
		  })
	  })
	</script>
	<!-- Footer -->
 	<jsp:include page="../layout/Footer.jsp" />
</body>
</html>