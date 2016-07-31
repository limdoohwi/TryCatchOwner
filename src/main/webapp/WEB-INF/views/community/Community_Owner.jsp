<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="limit" value="${limit}"/>
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
			            		글을 쓰세요<button type="button" class="goinsert btn btn-default btn-sm"><i class="glyphicon glyphicon-pencil"></i></button>
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
						<c:when test="${myreplycommunity_size==0}">
							등록하신 댓글이 없습니다.
						</c:when>
                    </c:choose>
                   </div>   
                </li>            
<c:set var="mycommunity_like_size" value="${fn:length(mycommunity_like)}"/>
                <li id="Book-Mark" class="active"><a href="#"><i class="fa fa-star text-yellow"></i> 즐겨찾기
                  <span class="label label-primary pull-right">${mycommunity_like_size}</span></a>
                    <div id="Book-Mark-List-Div" class="box-body no-padding col-sm-offset-1" style="font-size:13pt; display: none;">
                    </div>
                </li>
              </ul>
            </div>
          </div>
        </div>
        <!-- /.col -->
        <div class="col-md-9">
          <div class="box box-primary">
            <div class="mailbox-controls">              
                <!-- /.btn-group -->
                <button type="button" class="goinsert btn btn-default btn-sm"><i class="glyphicon glyphicon-pencil"></i></button>
                <div class="pull-right">
                	<form action="/owner/community_list" method="post">
                		<input type="hidden" name="limit" value="0"/>
	                  <input type="text" class="form-control input-sm" name="community_search" id="community_search" placeholder="작성자 & 제목 검색">
	                  <span style="margin-top:5px;" class="glyphicon glyphicon-search form-control-feedback" ></span>   
                  	</form>
                </div>
              </div>
            <div class="box-body no-padding">
              <div class="table-responsive mailbox-messages">
                <table class="table table-hover table-striped">
                  <tbody>               
<c:set var="community_list" value="${community_list}"/>
<c:set var="community_size" value="${fn:length(community_list)}"/>
<c:set var="community_all" value="${community_all}"/>
					<c:choose>
						<c:when test="${community_size!=0}">
							<c:forEach var = "community_list" items="${community_list}"> 
								<tr class="community_list_tr">
				                    <td class="mailbox-star">
					                    <div class="Book-Mark-Before" style="cursor:pointer;"><i class="fa fa-star-o text-yellow"></i></div>
					                    <div class="Book-Mark-After"  style="display:none; cursor:pointer"><i style="cursor:pointer;" class="fa fa-star text-yellow"></i></div>                 
				                    	<div style="display: none"><input type="text" class="community_no" value="${community_list.community_no}" /></div>
				                    </td>
										<td class="mailbox-name">작성자 - ${community_list.community_writer}</td>
					                    <td class="mailbox-subject"><b>제목 - </b><a style="text-decoration: none" href="/owner/community_read?community_no=${community_list.community_no}">${community_list.community_title}</a>
					                    <div style="display: none"><input type="text" class="community_title" value="${community_list.community_title}"/></div>
				                    </td>
				                    <td class="mailbox-attachment"><i class="fa fa-paperclip"></i></td>
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
                <button type="button" class="btn btn-default btn-sm" id="refresh"><i class="fa fa-refresh"></i></button>
                <div class="pull-right">
                  ${limit}~${limit + 5} / ${community_all}
                  <div class="btn-group">
                    <button type="button" style="display:none;" id="prev5" class="btn btn-default btn-sm"><i class="fa fa-chevron-left"></i></button>
                    <button type="button" id="next5" class="btn btn-default btn-sm"><i class="fa fa-chevron-right"></i></button>
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
		  
		  $.ajax({
			  type:"post",
			  url:"/owner/community_like_list",
			  success: function(data){
				 $.each(data.mycommunity_like, function(index, like){        
					 var likehtml =	'<div class="like_number">';
                    	 likehtml +='<input type="hidden" value=' + like.community_no +'/>';
                    	 likehtml +='<a href="/owner/community_read?community_no='+ like.community_no + '">title -' + like.community_title +'</a>';
                    	 likehtml +='</div>';			
					 $("#Book-Mark-List-Div").append(likehtml);
				 });
					//즐겨찾기 상태
					alert("Ddd");
					var like_community_no = new Array();
					$(".like_number").each(function(){
						like_community_no.push($(this).find("input[type=hidden]").val());
						alert(like_community_no.push($(this).find("input[type=hidden]").val()));
					});
					for(var i=0; i<like_community_no.length; i++){
						$(".community_list_tr").each(function(){
							if($(this).find(".community_no").val() == like_community_no[i]){
								$(this).find(".Book-Mark-After").show();
								$(this).find(".Book-Mark-Before").hide();
							}
						})
					}
			  }
		  })
		  
		  
		  
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
					}
				 }
			  })	  
		  })

		  	
		  //왼쪽 패널 즐겨찾기 Click List Show
		  $("#Book-Mark").click(function(){
			  $("#Book-Mark-List-Div").slideToggle(400);
		  });
		  //왼쪽 패널 내가 쓴 글 Click List Show
		  $("#My-Write").click(function(){
			  $("#My-Write-List").slideToggle(400);
		  });
		  //왼쪽 패널 내가 단 댓글 Click List Show
		  $("#My-Reply").click(function(){
			  $("#My-Reply-List").slideToggle(400);
		  });
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