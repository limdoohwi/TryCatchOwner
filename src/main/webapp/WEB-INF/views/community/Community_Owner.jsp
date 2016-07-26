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
                  <span class="label label-primary pull-right">12</span></a>
                  <div id="My-Write-List" class="box-body no-padding col-sm-offset-1" style="font-size:13pt; display: none">
                    <div style="display: block">
                    	<a href="#">2016년 6월 17일 - 이거어떰?</a>
                    </div>
                    <div style="display: block">
                    	<a href="#">2016년 6월 7일 - 아 존나</a>
                    </div>
                   </div> 
                 </li>
                <li id="My-Reply" class="active"><a href="#"><i class="fa fa-pencil"></i> 내가 단 댓글
                  <span class="label label-primary pull-right">12</span></a>
                   <div id="My-Reply-List" class="box-body no-padding col-sm-offset-1" style="font-size:13pt; display: none">
                    <div style="display: block">
                    	<a href="#">어떤놈이 쓴글1 - 제 생각에 님은 병신</a>
                    </div>
                    <div style="display: block">
                    	<a href="#">어떤놈이 쓴글2 - 어쩔</a>
                    </div>
                   </div>   
                </li>
                <li id="Book-Mark" class="active"><a href="#"><i class="fa fa-star text-yellow"></i> 즐겨찾기
                  <span class="label label-primary pull-right">12</span></a>
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
        <!-- /.col -->
        <div class="col-md-9">
          <div class="box box-primary">
            <div class="mailbox-controls">              
                <!-- /.btn-group -->
                <button type="button" class="btn btn-default btn-sm" id="goinsert"><i class="glyphicon glyphicon-pencil"></i></button>
                <div class="pull-right">
                  <input type="text" class="form-control input-sm" placeholder="작성자 & 제목 검색">
                  <span style="margin-top:5px;" class="glyphicon glyphicon-search form-control-feedback"></span>   
                </div>
              </div>
            <div class="box-body no-padding">
              <div class="table-responsive mailbox-messages">
                <table class="table table-hover table-striped">
                  <tbody>               
<c:set var="community_list" value="${community_list}"/>
<c:set var="community_size" value="${fn:length(community_list)}"/>
					<c:choose>
						<c:when test="${community_size!=0}">
							<c:forEach var = "community_list" items="${community_list}">
								<tr>
				                    <td class="mailbox-star">
				                    	<div class="Book-Mark-Before" style="cursor:pointer;"><i class="fa fa-star-o text-yellow"></i></div>
				                    	<div class="Book-Mark-After" style="display:none; cursor:pointer"><i style="cursor:pointer;" class="fa fa-star text-yellow"></i></div>                    
				                    </td>
				                    <td class="mailbox-name">${community_list.community_writer}</td>
				                    <td class="mailbox-subject"><b>제목 - </b><a style="text-decoration: none" href="/owner/community_read?community_no=${community_list.community_no}">${community_list.community_title}</a>
				                    </td>
				                    <td class="mailbox-attachment"><i class="fa fa-paperclip"></i></td>
				                    <td class="mailbox-date">12 days ago</td>
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
                <button type="button" class="btn btn-default btn-sm"><i class="fa fa-refresh"></i></button>
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
 	
	<script>
	  $.widget.bridge('uibutton', $.ui.button);
	  
	  $(function(){
		  //작성자 옆 별표시 Click 즐겨찾기 추가
		  $(".Book-Mark-Before").click(function(){
			 var index = $(".Book-Mark-Before").index(this);
			 var divB = $(".Book-Mark-Before").eq(index);
			 var divA = $(divB).siblings(".Book-Mark-After");
			$(divB).hide();
			$(divA).show();
		  });
		  //작성자 옆 별표시 Click 즐겨찾기 삭제
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
		  $("#goinsert").click(function(){
			  location.href="/owner/community_insert";
		  })
		  
	  })
	</script>
	<!-- Footer -->
 	<jsp:include page="../layout/Footer.jsp" />
</body>
</html>