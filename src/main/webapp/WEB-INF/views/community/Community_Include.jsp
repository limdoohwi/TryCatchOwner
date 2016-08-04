
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<div class="col-md-3">
	<div class="box box-solid">
		<div class="box-header with-border">
			<h3 class="box-title">정보</h3>

			<div class="box-tools">
				<button type="button" class="btn btn-box-tool"
					data-widget="collapse">
					<i class="fa fa-minus"></i>
				</button>
			</div>
		</div>
		<div class="box-body no-padding">
			<ul class="nav nav-pills nav-stacked">
				<li id="My-Write" class="active">
					<a href="#"><i	class="fa fa-pencil"></i> 내가 쓴 글 <span class="label label-primary pull-right">${fn:length(mycommunity_list)}</span></a>
					<div id="My-Write-List" class="box-body no-padding col-sm-offset-1" style="font-size: 13pt; display: none">
						<c:set var="mycommunity_list" value="${mycommunity_list}" />
						<c:set var="mycommunity_size" value="${fn:length(mycommunity_list)}" />
						<c:choose>
							<c:when test="${mycommunity_size!=0}">
								<c:forEach var="mycommunity_list" items="${mycommunity_list}">
									<div style="display: block">
										<a href="/owner/community_read?community_no=${mycommunity_list.community_no}">내용- ${mycommunity_list.community_title}</a>
									</div>
								</c:forEach>
							</c:when>
							<c:when test="${mycommunity_size==0}">
								<div style="display: block">
									글을 쓰세요
									<button type="button" class="goinsert btn btn-default btn-sm">
										<i class="glyphicon glyphicon-pencil"></i>
									</button>
								</div>
							</c:when>
						</c:choose>
					</div>
				</li>
				<li id="My-Reply" class="active">
					<a href="#"><i class="fa fa-pencil"></i> 내가 단 댓글 <span id="My-Reply-Size" class="label label-primary pull-right"></span></a>
					<div id="My-Reply-List" class="box-body no-padding col-sm-offset-1"	style="font-size: 13pt; display: none"></div>
				</li>
				<li id="Book-Mark" class="active">
					<a href="#"><i class="fa fa-star text-yellow"></i> 즐겨찾기 <span id="communitylike_span" class="label label-primary pull-right"></span></a>
					<div id="Book-Mark-List-Div" class="box-body no-padding col-sm-offset-1" style="font-size: 13pt; display: none;"></div>
				</li>
			</ul>
		</div>
	</div>
</div>

<script>
        
        
        // 내가 단 댓글 상태업데이트
        function replyList(){
        	$.ajax({
				  type:"post",
				  url:"/owner/community/myreplylist",
				  success: function(data){
					  $("#My-Reply-Size").html(data.myreplyList.length);
					  $.each(data.myreplyList, function(index , myreplyList){
						  var myreplyhtml ='<div style="display: block">'+
							  					'<a href="/owner/community_read?community_no=' + myreplyList.community_no +'">'+
						 						 myreplyList.community_no + '번 게시물에 대한 댓글 -' + myreplyList.community_reply_comment +'</a>'+
						 				   '</div>';						  
						  $("#My-Reply-List").append(myreplyhtml);						  
					  })
				  }
			  })
        }
        
        function bookmarkList(){        	
    		//즐겨찾기 상태 업데이트
    		  $.ajax({
    			  type:"post",
    			  url:"/owner/community_like_list",
    			  success: function(data){
    				 $("#communitylike_span").html(data.mycommunity_like.length);
    				 $.each(data.mycommunity_like, function(index, like){        
    					 	 likehtml =	'<div class="like_number">';
                        	 likehtml +='<input type="hidden" value="' + like.community_no +'"/>';
                        	 likehtml +='<a href="/owner/community_read?community_no='+ like.community_no + '">title -' + like.community_title +'</a>';
                        	 likehtml +='</div>';
    					 $("#Book-Mark-List-Div").append(likehtml);
    					 
    						var like_community_no = new Array();
    						$(".like_number").each(function(){
    							like_community_no.push($(this).find("input[type=hidden]").val());
    						});
    						
  
    						for(var i=0; i<like_community_no.length; i++){
    							$(".community_list_tr").each(function(){
    								if($(this).find(".community_no").val() == like_community_no[i]){
    									$(this).find(".Book-Mark-After").show();
    									$(this).find(".Book-Mark-Before").hide();
    								}
    							})
    						}
    				 });
    			  }
    		  })
    	  }
      	//왼쪽 패널 즐겨찾기 Click List Show
		 $(function(){
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
		 });
        </script>