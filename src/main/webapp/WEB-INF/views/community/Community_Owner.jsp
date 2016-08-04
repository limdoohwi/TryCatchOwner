<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="limit" value="${limit}" />
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
				<jsp:include page="Community_Include.jsp" />
				<!-- /.col -->
				<div class="col-md-9">
					<div class="box box-primary">
						<div class="mailbox-controls">
							<!-- /.btn-group -->
							<button type="button" class="goinsert btn btn-default btn-sm">
								<i class="glyphicon glyphicon-pencil"></i>
							</button>
							<div class="pull-right">
								<form action="/owner/community_list" method="post">
									<input type="hidden" name="limit" value="0" /> <input
										type="text" class="form-control input-sm"
										name="community_search" id="community_search"
										placeholder="작성자 & 제목 검색"> <span
										style="margin-top: 5px;"
										class="glyphicon glyphicon-search form-control-feedback"></span>
								</form>
							</div>
						</div>
						<div class="box-body no-padding">
							<div class="table-responsive mailbox-messages">
								<table class="table table-hover table-striped">
									<tbody>
										<c:set var="community_list" value="${community_list}" />
										<c:set var="community_size"
											value="${fn:length(community_list)}" />
										<c:set var="community_all" value="${community_all}" />
										<jsp:useBean id="toDay1" class="java.util.Date" />
										<fmt:formatDate value="${toDay1}" pattern="yyyy-MM-dd"
											var="toDay" />
										<c:choose>
											<c:when test="${community_size!=0}">
												<c:forEach var="community_list" items="${community_list}">
													<tr class="community_list_tr">
														<td class="mailbox-star">
															<div class="Book-Mark-Before" style="cursor: pointer;">
																<i class="fa fa-star-o text-yellow"></i>
															</div>
															<div class="Book-Mark-After"
																style="display: none; cursor: pointer">
																<i style="cursor: pointer;"
																	class="fa fa-star text-yellow"></i>
															</div>
															<div style="display: none">
																<input type="text" class="community_no"
																	value="${community_list.community_no}" />
															</div>
														</td>
														<td class="mailbox-name">작성자 -
															${community_list.community_writer}</td>
														<td class="mailbox-subject"><b>제목 - </b><a
															style="text-decoration: none"
															href="/owner/community_read?community_no=${community_list.community_no}">${community_list.community_title}
																<fmt:formatDate
																	value="${community_list.community_regdate}"
																	pattern="yyyy-MM-dd" var="regDate" /> <c:if
																	test="${toDay == regDate}">
																	<span class="form-group has-warning">
																		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<label
																		class="control-label" for="inputWarning1">NEW</label>
																	</span>
																</c:if>
														</a>

															<div style="display: none">
																<input type="text" class="community_title"
																	value="${community_list.community_title}">
															</div></td>
														<td class="mailbox-attachment"><i
															class="fa fa-paperclip"></i></td>
														<td class="mailbox-date">${community_list.community_regdate}</td>
													</tr>
												</c:forEach>
											</c:when>
											<c:when test="${community_size==0}">
												<td style="width: 100%; text-align: center;">데이터가 없습니다.</td>
											</c:when>
										</c:choose>
									</tbody>
								</table>
							</div>
						</div>
						<div class="box-footer no-padding">
							<div class="mailbox-controls">
								<div class="btn-group"></div>
								<button type="button" class="btn btn-default btn-sm"
									id="refresh">
									<i class="fa fa-refresh"></i>
								</button>
								<div class="pull-right">
									${limit}~${limit + 5} / ${community_all}
									<div class="btn-group">
										<button type="button" style="display: none;" id="prev5"
											class="btn btn-default btn-sm">
											<i class="fa fa-chevron-left"></i>
										</button>
										<button type="button" id="next5"
											class="btn btn-default btn-sm">
											<i class="fa fa-chevron-right"></i>
										</button>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</section>
	</div>

	<script>
	  $.widget.bridge('uibutton', $.ui.button);
	  
	  $(function(){
		  bookmarkList();
		  replyList();
		  
		  // 페이징 상태
		  var limit = "${limit}";
		  var community_size = "${community_size}";
		  if(limit>0){
			  $("#prev5").show();
		  }
		  if(community_size < 10){
			  $("#next5").hide();
		  }
		  
		  //작성자 옆 별표시 Click 즐겨찾기 추가
		  $(".Book-Mark-Before").click(function(){	
			 var index = $(".Book-Mark-Before").index(this);
			 var divB = $(".Book-Mark-Before").eq(index);
			 var community_no = $(".community_no").eq(index).val();
			 var community_title = $(".community_title").eq(index).val();
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
				 var index = $(".Book-Mark-After").index(this);
				 var divA = $(".Book-Mark-After").eq(index);
				 var community_no = $(".community_no").eq(index).val();
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
						$("#Book-Mark-List-Div").html("");
						bookmarkList();
					}
				 }
			  })	  
		  })

		  	
		  
		  $(".goinsert").click(function(){
			  location.href="/owner/community_insert";
		  });	  
		  $("#refresh").click(function(){
			  location.href="/owner/community_list?limit=0";
		  });
		  
		  $("#next5").click(function(){
			  location.href="/owner/community_list?limit=${limit + 10}";
		  });
		  $("#prev5").click(function(){
			  location.href="/owner/community_list?limit=${limit - 10}";
		  });
		  
		  var search = document.getElementById("community_search"); 
		  search.onkeydown(function(){
			  this.form.submit();
		  })
	  });
</script>
	<!-- Footer -->
	<jsp:include page="../layout/Footer.jsp" />
</body>
</html>