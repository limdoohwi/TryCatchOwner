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
	                  <!-- 내가 쓴 글 Count Number -->
	                  <span class="label label-primary pull-right">12</span></a>
	                  <!-- 내가 쓴 글 List -->
	                  <div id="My-Write-List" class="box-body no-padding col-sm-offset-1" style="font-size:13pt; display: none">
	                    <div style="display: block">
	                    	<a href="#">2016년 6월 17일 - 이거어떰?</a>
	                    </div>
	                    <div style="display: block">
	                    	<a href="#">2016년 6월 7일 - 아 존나</a>
	                    </div>
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
	              <h3 class="box-title">Read</h3>
	
	              <div class="box-tools pull-right">
	                <a href="#" class="btn btn-box-tool" data-toggle="tooltip" title="Previous"><i class="fa fa-chevron-left"></i></a>
	                <a href="#" class="btn btn-box-tool" data-toggle="tooltip" title="Next"><i class="fa fa-chevron-right"></i></a>
	              </div>
	            </div>
	            <div class="box-body no-padding">
	              <div class="mailbox-read-info">
	              <!-- Board Subject -->
	                <h3>SDK깔았당 다뒤졋어</h3>
	               	<!-- Board Writer -->
	                <h5>컨츄리꼬꼬
	                  <span class="mailbox-read-time pull-right">2016년 7월 4일 오후 13시 16분</span></h5>
	              </div>
	              <div class="mailbox-controls with-border text-center">
	                <div class="btn-group">
	                <!-- Delte -->
	                  <button type="button" class="btn btn-default btn-sm" data-toggle="tooltip" data-container="body" title="삭제">
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
	                <p>Hello John,</p>
	
	                <p>Keffiyeh blog actually fashion axe vegan, irony biodiesel. Cold-pressed hoodie chillwave put a bird
	                  on it aesthetic, bitters brunch meggings vegan iPhone. Dreamcatcher vegan scenester mlkshk. Ethical
	                  master cleanse Bushwick, occupy Thundercats banjo cliche ennui farm-to-table mlkshk fanny pack
	                  gluten-free. Marfa butcher vegan quinoa, bicycle rights disrupt tofu scenester chillwave 3 wolf moon
	                  asymmetrical taxidermy pour-over. Quinoa tote bag fashion axe, Godard disrupt migas church-key tofu
	                  blog locavore. Thundercats cronut polaroid Neutra tousled, meh food truck selfies narwhal American
	                  Apparel.</p>
	
	                <p>Raw denim McSweeney's bicycle rights, iPhone trust fund quinoa Neutra VHS kale chips vegan PBR&amp;B
	                  literally Thundercats +1. Forage tilde four dollar toast, banjo health goth paleo butcher. Four dollar
	                  toast Brooklyn pour-over American Apparel sustainable, lumbersexual listicle gluten-free health goth
	                  umami hoodie. Synth Echo Park bicycle rights DIY farm-to-table, retro kogi sriracha dreamcatcher PBR&amp;B
	                  flannel hashtag irony Wes Anderson. Lumbersexual Williamsburg Helvetica next level. Cold-pressed
	                  slow-carb pop-up normcore Thundercats Portland, cardigan literally meditation lumbersexual crucifix.
	                  Wayfarers raw denim paleo Bushwick, keytar Helvetica scenester keffiyeh 8-bit irony mumblecore
	                  whatever viral Truffaut.</p>
	
	                <p>Post-ironic shabby chic VHS, Marfa keytar flannel lomo try-hard keffiyeh cray. Actually fap fanny
	                  pack yr artisan trust fund. High Life dreamcatcher church-key gentrify. Tumblr stumptown four dollar
	                  toast vinyl, cold-pressed try-hard blog authentic keffiyeh Helvetica lo-fi tilde Intelligentsia. Lomo
	                  locavore salvia bespoke, twee fixie paleo cliche brunch Schlitz blog McSweeney's messenger bag swag
	                  slow-carb. Odd Future photo booth pork belly, you probably haven't heard of them actually tofu ennui
	                  keffiyeh lo-fi Truffaut health goth. Narwhal sustainable retro disrupt.</p>
	
	                <p>Skateboard artisan letterpress before they sold out High Life messenger bag. Bitters chambray
	                  leggings listicle, drinking vinegar chillwave synth. Fanny pack hoodie American Apparel twee. American
	                  Apparel PBR listicle, salvia aesthetic occupy sustainable Neutra kogi. Organic synth Tumblr viral
	                  plaid, shabby chic single-origin coffee Etsy 3 wolf moon slow-carb Schlitz roof party tousled squid
	                  vinyl. Readymade next level literally trust fund. Distillery master cleanse migas, Vice sriracha
	                  flannel chambray chia cronut.</p>
	
	                <p>Thanks,<br>Jane</p>
	              </div>
	            </div>
	            <!-- File Upload List -->
	            <div class="box-footer">
	              <ul class="mailbox-attachments clearfix">
	                <li>
	                  <span class="mailbox-attachment-icon"><i class="fa fa-file-pdf-o"></i></span>
	
	                  <div class="mailbox-attachment-info">
	                    <a href="#" class="mailbox-attachment-name"><i class="fa fa-paperclip"></i> Sep2014-report.pdf</a>
	                        <span class="mailbox-attachment-size">
	                          1,245 KB
	                          <a href="#" class="btn btn-default btn-xs pull-right"><i class="fa fa-cloud-download"></i></a>
	                        </span>
	                  </div>
	                </li>
	                <li>
	                  <span class="mailbox-attachment-icon"><i class="fa fa-file-word-o"></i></span>
	
	                  <div class="mailbox-attachment-info">
	                    <a href="#" class="mailbox-attachment-name"><i class="fa fa-paperclip"></i> App Description.docx</a>
	                        <span class="mailbox-attachment-size">
	                          1,245 KB
	                          <a href="#" class="btn btn-default btn-xs pull-right"><i class="fa fa-cloud-download"></i></a>
	                        </span>
	                  </div>
	                </li>
	                <li>
	                  <span class="mailbox-attachment-icon has-img"><img src="dist/img/photo1.png" alt="Attachment"></span>
	
	                  <div class="mailbox-attachment-info">
	                    <a href="#" class="mailbox-attachment-name"><i class="fa fa-camera"></i> photo1.png</a>
	                        <span class="mailbox-attachment-size">
	                          2.67 MB
	                          <a href="#" class="btn btn-default btn-xs pull-right"><i class="fa fa-cloud-download"></i></a>
	                        </span>
	                  </div>
	                </li>
	                <li>
	                  <span class="mailbox-attachment-icon has-img"><img src="dist/img/photo2.png" alt="Attachment"></span>
	
	                  <div class="mailbox-attachment-info">
	                    <a href="#" class="mailbox-attachment-name"><i class="fa fa-camera"></i> photo2.png</a>
	                        <span class="mailbox-attachment-size">
	                          1.9 MB
	                          <a href="#" class="btn btn-default btn-xs pull-right"><i class="fa fa-cloud-download"></i></a>
	                        </span>
	                  </div>
	                </li>
	              </ul>
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
	    </section>
	</div>

 	<!-- jQuery 2.2.0 -->
	<script src="/owner/resources/plugins/jQuery/jQuery-2.2.0.min.js"></script>
	<!-- jQuery UI 1.11.4 -->
	<script src="https://code.jquery.com/ui/1.11.4/jquery-ui.min.js"></script>
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
	  })
	</script>
	<!-- Footer -->
 	<jsp:include page="../layout/Footer.jsp" />
</body>
</html>