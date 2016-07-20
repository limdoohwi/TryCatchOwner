<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
<!-- Notice Write -->
<div class="row">
        <div class="col-md-12">
          <div class="box box-widget">
            <div class="box-header with-border">
              <div class="user-block">
              	<!-- 작성자 -->
                <span class="username"><a href="#">TryCoffee Community</a></span>
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
              <textarea class="Notice-Write-Text-Area" rows="10" cols="263" placeholder="글쓰기" required="required" wrap="hard"></textarea>
              <button type="button" class="Notice-Write-Btn btn btn-success btn-xs">글쓰기</button>
            </div>
          </div>
        </div>
 	</div>
 	
<!-- Notice -->
 <div class="row">
        <div class="col-md-12">
          <div class="box box-widget">
            <div class="box-header with-border">
              <div class="user-block">
              	<!-- 작성자 -->
                <span class="username"><a href="#">TryCoffee Community</a></span>
                <!-- 게시판 정보 -->
                <span class="description">2016년 7월 3일 16시 23분</span>
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
              <form action="#" method="post">
                <div class="img-push">
                  <input type="text" class="form-control input-sm" placeholder="Press enter to post comment">
                </div>
              </form>
            </div>
          </div>
        </div>
 	</div>
 
 	<div class="row">
        <div class="col-md-12">
          <div class="box box-widget">
            <div class="box-header with-border">
              <div class="user-block">
              	<!-- 작성자 -->
                <span class="username"><a href="#">TryCoffee Community</a></span>
                <!-- 게시판 정보 -->
                <span class="description">2016년 7월 1일 15시 23분</span>
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
              <p>아 심심행</p>
              <button type="button" class="btn btn-default btn-xs"><i class="fa fa-thumbs-o-up"></i> 좋아요</button>
              <!-- 좋아요 및 댓글 Count Number -->
              <span class="pull-right text-muted">127 likes - 3 comments</span>
            </div>
            <!-- Reply -->
            <div class="box-footer box-comments">
              <div class="box-comment">
                <div class="comment-text">
                      <span class="username">
                        Maria Gonzales
                        <span class="text-muted pull-right">2016년 7월 1일 16시 26분</span>
                      </span>
                  <!-- Reply Content -->
                      	나둥
               </div>
              </div>
            </div>
    		<!-- Reply 작성하는 곳 -->
            <div class="box-footer">
              <form action="#" method="post">
                <div class="img-push">
                  <input type="text" class="form-control input-sm" placeholder="Press enter to post comment">
                </div>
              </form>
            </div>
          </div>
        </div>
 	</div>
 	
 	<div class="row">
        <div class="col-md-12">
          <div class="box box-widget">
            <div class="box-header with-border">
              <div class="user-block">
              	<!-- 작성자 -->
                <span class="username"><a href="#">TryCoffee Community</a></span>
                <!-- 게시판 정보 -->
                <span class="description">2016년 7월 1일 13시 23분</span>
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
              <p>매출액좀 올려라 새끼들아</p>
              <button type="button" class="btn btn-default btn-xs"><i class="fa fa-thumbs-o-up"></i> 좋아요</button>
              <!-- 좋아요 및 댓글 Count Number -->
              <span class="pull-right text-muted">127 likes - 3 comments</span>
            </div>
            <!-- Reply -->
            <div class="box-footer box-comments">
              <div class="box-comment">
                <div class="comment-text">
                      <span class="username">
                        Maria Gonzales
                        <span class="text-muted pull-right">2016년 7월 1일 16시 26분</span>
                      </span>
                  <!-- Reply Content -->
                      	GG
               </div>
              </div>
            </div>
    		<!-- Reply 작성하는 곳 -->
            <div class="box-footer">
              <form action="#" method="post">
                <div class="img-push">
                  <input type="text" class="form-control input-sm" placeholder="Press enter to post comment">
                </div>
              </form>
            </div>
          </div>
        </div>
 	</div>
 </div>
 <!-- Footer -->
 <jsp:include page="../layout/Footer.jsp" />
</body>
</html>