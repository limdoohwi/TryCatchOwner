<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
  <style>
  	.main-sidebar span{
  		color:white;
  	}
  	
  	.Notice-Writer-User-Name{
  		font-size: 13pt;
  		font-weight: 600;
  	}
  </style>
</head>
<body class="hold-transition skin-blue sidebar-mini">
<div class="wrapper">
<!-- Header -->
<jsp:include page="../layout/Header.jsp" />
<!-- Notice Write -->
<!-- 곧지사항 - 관리자 영역 -->
<c:if test="${member_dto.member_code == 3}">
		<div class="row">
        <div class="col-md-12">
          <div class="box box-widget">
            <div class="box-header with-border">
              <div class="user-block">
              	  <!-- User Icon -->
	              <div style="display:inline-block;">
	              	<i class="fa fa-user fa-2x"
							style="color: red; text-shadow: 1px 1px 1px #ccc;"></i>
	              </div>
	              <!-- 작성자 -->
	              <div style="display:inline-block;">
	               <a class="Notice-Writer-User-Name" href="#">${member_dto.member_name}</a>
	              </div>
	              <!-- 작성 일시 -->
	              <div style="display:inline-block; margin-left: 5%">
	             	 <span class="text-muted">2016년 7월 3일 16시 26분</span>
	              </div>
              </div>	
              <div class="box-tools">
				<!-- 최소화 버튼 -->
                <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i>
                </button>
                <!-- 닫기 버튼 -->
                <button type="button" class="btn btn-box-tool" data-widget="remove"><i class="fa fa-times"></i></button>
              </div>
            </div>
            <div class="Notice-Write-Div box-body">
              <textarea id="Notice-Write-Text-Area" rows="10" cols="334" placeholder="글쓰기" required="required" wrap="hard"></textarea>
              <button type="button" id="Notice-Write-Btn" class="btn btn-success btn-xs">글쓰기</button>
            </div>
          </div>
        </div>
 	</div>
</c:if>
 	
<!-- Notice -->
<!-- 공지사항 list 영역 -->
 <div class="row">
        <div class="col-md-12">
          <div class="box box-widget">
            <div class="box-header with-border">
              <div class="user-block">
              		<!-- User Icon -->
	              <div style="display:inline-block;">
	              	<i class="fa fa-user fa-2x"
							style="color: red; text-shadow: 1px 1px 1px #ccc;"></i>
	              </div>
	              	<!-- 작성자 -->
	              <div style="display:inline-block;">
	               <a class="Notice-Writer-User-Name" href="#">${member_dto.member_name}</a>
	              </div>
              </div>	
              <div class="box-tools">
				<!-- 최소화 버튼 -->
                <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i>
                </button>
                <!-- 닫기 버튼 -->
                <button type="button" class="btn btn-box-tool" data-widget="remove"><i class="fa fa-times"></i></button>
              </div>
            </div>
            <div class="box-body">
              <p>이제부터 여러분들의 상납금을 올리겠습니다. <br/>만일 불복종한다면 화형입니다.</p>
              <button type="button" class="btn btn-default btn-xs"><i class="fa fa-thumbs-o-up"></i> 좋아요</button>
              <c:if test="${member_dto.member_code == 3}">
              	<button type="button" class="btn btn-danger btn-xs"><i class="fa fa-trash-o"></i>삭제</button>
              </c:if>
              <!-- 좋아요 및 댓글 Count Number -->
              <span class="pull-right text-muted">127 likes - 3 comments</span>
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
                <div class="img-push">
                  <input type="text" class="Notice-Reply-Text form-control input-sm" placeholder="Press enter to post comment">
                </div>
            </div>
          </div>
        </div>
 	</div>
 </div>
 
 <!-- jQuery 2.2.0 -->
<script src="/owner/resources/plugins/jQuery/jQuery-2.2.0.min.js"></script>
<!-- jQuery UI 1.11.4 -->
<script src="https://code.jquery.com/ui/1.11.4/jquery-ui.min.js"></script>
<script>
	  $.widget.bridge('uibutton', $.ui.button);
	  
	  $(function(){
		  //관리자 - 글쓰기 버튼 클릭
		  $("#Notice-Write-Btn").click(function(){
			 var content = $("#Notice-Write-Text-Area").val();
			 if(content == ""){
				 alert("읿력된 내용이 없습니다.");
				 $("#Notice-Write-Text-Area").focus();
				 return false;
			 }
		  });
		  
		  //댓글 쓰기란 엔터키 입력시 댓글 등록
		  $(".Notice-Reply-Text").keyup(function(e){
			  if(e.keyCode == 13){
				  
			  }
		  });
	  })
</script>
 <!-- Footer -->
 <jsp:include page="../layout/Footer.jsp" />
</body>
</html>