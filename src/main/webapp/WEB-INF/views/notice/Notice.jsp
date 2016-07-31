<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
<!-- 페이지 넘버 -->
<c:set var="totalRecord_Board" value="${fn:length(notice_list)}"/>

<c:set var="numPerPage_Board" value="5"/>
<c:set var="pagePerBlock_Board" value="5"/>
<fmt:formatNumber var="fmt_totalPage_Board" value="${totalRecord_Board / numPerPage_Board}" pattern="#.#" />
<c:if test="${fmt_totalPage_Board%1 > 0}">
	<fmt:parseNumber var="totalPage_Board" integerOnly="true" value="${(totalRecord_Board / numPerPage_Board)+1}" scope="session"/>
</c:if>
<c:if test="${fmt_totalPage_Board%1 == 0}">
	<fmt:parseNumber var="totalPage_Board" integerOnly="true" value="${totalRecord_Board / numPerPage_Board}" scope="session"/>
</c:if>
<fmt:formatNumber var="fmt_totalBlock_Board" value="${totalPage_Board/ pagePerBlock_Board}" pattern="#.#" />
<c:if test="${fmt_totalBlock_Board%1 > 0}">
	<fmt:parseNumber var="totalBlock_Board" integerOnly="true" value="${(totalPage_Board / pagePerBlock_Board)+1}" scope="session"/>
</c:if>
<c:if test="${fmt_totalBlock_Board%1 == 0}">
	<fmt:parseNumber var="totalBlock_Board" integerOnly="true" value="${totalPage_Board / pagePerBlock_Board}" scope="session"/>
</c:if>
<c:if test="${param.nowPage_Board == null }">
	<c:set var="nowPage_Board" value="0"/>
</c:if>
<c:if test="${param.nowPage_Board != null }">
	<c:set var="nowPage_Board" value="${param.nowPage_Board}"/>
</c:if>
<c:if test="${param.nowBlock_Board == null }">
	<c:set var="nowBlock_Board" value="0"/>
</c:if>
<c:if test="${param.nowBlock_Board != null }">
	<c:set var="nowBlock_Board" value="${param.nowBlock_Board}"/>
</c:if>
<c:set var="beginPerPage_Board" value="${nowPage_Board * numPerPage_Board}"/>

<!-- Header -->
<jsp:include page="../layout/Header.jsp" />

<!-- Notice Write -->
<!-- 공지사항 - 관리자 영역 -->
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
	               <a class="Notice-Writer-User-Name" href="#">${notice.member_name}</a>
	              </div>
	              <!-- 작성 일시 -->
	              <div style="display:inline-block; margin-left: 5%">
	             	 <span class="text-muted">${notice.notice_date}</span>
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
              <form id="notice_insert_form" method="post" action="/owner/notice.insert">
              <textarea name="notice_content" id="Notice-Write-Text-Area" rows="10" cols="334" placeholder="글쓰기" required="required" wrap="hard"></textarea>
               <input type="hidden" value="${member_dto.member_name}" name="member_name">
              <button type="button" id="Notice-Write-Btn" class="btn btn-success btn-xs">글쓰기</button>              
              </form>  
           	</div>
          </div>
        </div>
 	</div>
</c:if>
 	
<!-- Notice -->
<!-- 공지사항 list 영역 -->
<c:if test="${totalRecord_Board == 0 }" >
					<td>데이터가 없습니다.</td>
</c:if>
<c:if test="${totalRecord_Board != 0 }" >
<c:forEach begin="${beginPerPage_Board}" end="${(beginPerPage_Board + numPerPage_Board)-1}" items="${notice_list}" var="notice" >
	 <div class="row">
	        <div class="col-md-12">
	          <div class="box box-widget">
	            <c:if test="${notice.notice_depth==0 }"> 
	            <div class="box-header with-border">
	              <div class="user-block">
	              		<!-- User Icon -->
		              <div style="display:inline-block;">
		              	<i class="fa fa-user fa-2x"
								style="color: red; text-shadow: 1px 1px 1px #ccc;"></i>
		              </div>
		              	<!-- 작성자 -->     		
		           	  <div style="display:inline-block;">
		               <a class="Notice-Writer-User-Name" href="#">${notice.member_name}</a>
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
	            <form method="post" action="/owner/notice.delete">
		            <div class="box-body">
		             ${notice.notice_content}
		              <c:if test="${member_dto.member_code == 3}">
		              	<button type="submit" class="delete_button btn btn-danger btn-xs" id="delete_button"><i class="fa fa-trash-o"></i>삭제</button>
		              </c:if>
		              <!-- 좋아요 및 댓글 Count Number -->
		              <span class="pull-right text-muted"></span>
		            </div>
	            <input type="hidden" value="${notice.notice_num}" name="notice_num">
	            </form>
	            <!-- Reply -->
	            <div class="box-footer box-comments">
	              <div class="box-comment">
	                <div class="comment-text">
	                <c:forEach items="${notice_reply_list}" var="reply" >
		              	<c:if test="${notice.notice_num == reply.notice_group }">
		        		<form method="post" action="/owner/notice.reply.delete" id="reply_delete_form">  
		                      <span class="Notice-Writer-User-Name">
		                       ${reply.member_name } 
		                      <c:if test="${member_dto.member_code == 3 || member_dto.member_name == reply.member_name}">
		                      	<button type="submit" class="delete_reply_button btn btn-danger btn-xs"><i class="fa fa-trash-o"></i>삭제</button>
		                      </c:if>
		                        <span class="text-muted pull-right">${reply.notice_date}</span>
		                      </span><br/>
		                  <!-- Reply Content -->
		                      ${reply.notice_content }
		        		 	<hr/>
		                 	<input type="hidden" name="reply_delete_num" value="${reply.notice_num}"/>      
		        		 </form>
		                 </c:if>     
	               </c:forEach> 
	               </div>
	              </div>
	            </div>
	    		<!-- Reply 작성하는 곳 -->
	    		<form action="/owner/notice.reply.insert" method="post" id="notice_insert_reply_form">
	            <div class="box-footer">
	                <div class="img-push">
	                  <input type="text" name="reply_content" class="Notice-Reply-Text form-control input-sm" placeholder="Press enter to post comment">
	                  <input type="hidden" name="notice_pos" value="${notice.notice_pos }">
	                  <input type="hidden" value="${notice.notice_num}" name="notice_num">
	                  <input type="hidden" value="${member_dto.member_name}" name="reply_member_name">
	                </div>
	            </div>
	            </form>
	            </c:if>
	          </div>
	        </div>
	 	</div>
	 	
</c:forEach>
	 	<!-- 페이지 번호 -->
	<div class="span6 offset3">
		<div class="pagination">
	  			<ul>
	  				<c:if test="${nowBlock_Board > 0}">
			    				<td><a href="/owner/notice/Notice?beginPerPage_Board">Prev</a></td>
			    	</c:if>	
			    	<c:set var="BlockisCreate_Board" value="true"/>
			    	<c:forEach var="index_Board" begin="0" end="${pagePerBlock_Board-1}" varStatus="BlockNum_Board">
			   			<c:if test="${BlockisCreate_Board}">
			   				<c:if test="${(nowBlock_Board * pagePerBlock_Board) + index_Board == totalPage_Board-1}">
			   					<c:set var="BlockisCreate_Board" value="false"/>
			   				</c:if>
			   					<td width="30px">
			   					<a href="/owner/notice/Notice?nowPage_Board=${(nowBlock_Board* pagePerBlock_Board) + index_Board}&nowBlock_Board=${nowBlock_Board}"><button class="btn btn-primary">${(nowBlock_Board * pagePerBlock_Board) + index_Board + 1}</button></a></td>
			   				</c:if>
			   			</c:forEach>
			   			<c:if test="${totalBlock_Board > nowBlock_Board + 1}">
			    			<td><a href="/owner/notice/Notice?nowPage_Board=${(nowBlock_Board + 1) * pagePerBlock_Board}&nowBlock_Board=${nowBlock_Board + 1}">Next</a></td>
			    		</c:if>
	  		  	</ul>
		</div>
	</div>
</c:if>
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
			 var notice_content = $("#Notice-Write-Text-Area").val();
			 if(notice_content == ""){
				 alert("입력된 내용이 없습니다.");
				 $("#Notice-Write-Text-Area").focus();
				 return false;
			 }
			 else{
				 $("#notice_insert_form").submit();
			 }
		  });
		  
		  //댓글 쓰기란 엔터키 입력시 댓글 등록
		  $(".Notice-Reply-Text").keyup(function(e){
			  if(e.keyCode == 13){
				  var reply_content = $(".Notice-Reply-Text").val();
					 if(reply_content == ""){
						 alert("입력된 내용이 없습니다.");
						 $(".Notice-Reply-Text").focus();
						 return false;
					 }
					 else{
						 $("#notice_insert_reply_form").submit();
					 }
			  }
		  });
		  
		  $(".delete_button").click(function(){
				  if(confirm("삭제 하시겠습니까?") == true){
					  document.form.submit();
				  }
				  else{
					  return false;
				  }
		  });
		  
		  $(".delete_reply_button").click(function(){
			  if(confirm("삭제 하시겠습니까?") == true){
				 $("#reply_delete_form").submit();
			  }
			  else{
				  return false;
			  }
	  	  });
	  });
</script>
 <!-- Footer -->
 <jsp:include page="../layout/Footer.jsp" />
</body>
</html>