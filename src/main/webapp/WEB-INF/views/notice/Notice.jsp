<!-- 
/*
 * 	JSP: TryCoffee_Owner.jsp
 *  Description: Notice에 모든 것을 출력 및 저장하는 JSP 페이지 
 *  Created: 2016­07­20
 *	Author: 이준영
 *  Mail: 13nfri@naver.com
 * 	Copyrights 2016-07-18 by Try{}Catch
 *
 *	Revisions:
 * 	1. When & Who : 2016-07-20 by 이준영
 * 	2. What		  : 전반적인  UI구현
 *  
 * 	1. When & Who : 2016-07-25 by 이준영
 * 	2. What		  : 공지사항글 저장 및 삭제 구현, 댓글 저장 및 삭제 구현
 *  
 * 	1. When & Who : 2016-07-27 by 이준영
 * 	2. What		  : 공지사항글 삭제 시 해당하는 댓글 삭제 구현, 해당하는 글에 달린 댓글 출력 구현
 *
 * 	1. When & Who : 2016-07-30 by 이준영
 * 	2. What		  : 페이징 구현
 *
 * 	1. When & Who : 2016-08-02 by 임두휘
 * 	2. What		  : 모든 기능 Ajax화 
 *
 * 	1. When & Who : 2016-08-04 by 김준혁
 * 	2. What		  : Ajax 페이징 구현
 */
 -->
<%@ page contentType="text/html; charset=UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<style>
.main-sidebar span {
	color: white;
}

.Notice-Writer-User-Name {
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
		<!-- 공지사항 - 관리자 영역 -->
		<c:if test="${member_dto.member_code == 3}">
			<div class="row">
				<div class="col-md-12">
					<div class="box box-widget">
						<div class="box-header with-border">
							<div class="user-block">
								<!-- User Icon -->
								<div style="display: inline-block;">
									<i class="fa fa-user fa-2x"
										style="color: red; text-shadow: 1px 1px 1px #ccc;"></i>
								</div>
								<!-- 작성자 -->
								<div style="display: inline-block;">
									<a class="Notice-Writer-User-Name" href="#">${member_dto.member_name}</a>
								</div>
							</div>
							<div class="box-tools">
								<!-- 최소화 버튼 -->
								<button type="button" class="btn btn-box-tool"
									data-widget="collapse">
									<i class="fa fa-minus"></i>
								</button>
								<!-- 닫기 버튼 -->
								<button type="button" class="btn btn-box-tool"
									data-widget="remove">
									<i class="fa fa-times"></i>
								</button>
							</div>
						</div>
						<div class="Notice-Write-Div box-body">
							<textarea id="Notice-Content-Text-Area" rows="10" cols="150"
								placeholder="글쓰기" required="required" wrap="hard"></textarea>
							<button type="button" id="Notice-Write-Btn"
								class="btn btn-success btn-xs">글쓰기</button>
						</div>
					</div>
				</div>
			</div>
		</c:if>
		<!-- Notice -->
		<!-- 공지사항 list 영역 -->
		<div class="Notice_List_Div"></div>
	</div>
	<!-- jQuery 2.2.0 -->
	<script src="/owner/resources/plugins/jQuery/jQuery-2.2.0.min.js"></script>
	<!-- jQuery UI 1.11.4 -->
	<script src="https://code.jquery.com/ui/1.11.4/jquery-ui.min.js"></script>
	<script src="/owner/resources/Owner_js/ListAjax.js"></script>
	<script>
		$.widget.bridge('uibutton', $.ui.button);

		$(function() {
			callList_Ajax("/owner/notice/list", showNoticeList, null, null);

			//관리자 - 글쓰기 버튼 클릭
			$("#Notice-Write-Btn").click(
					function() {
						var notice_content = $("#Notice-Content-Text-Area")
								.val();
						if (notice_content == "") {
							alert("입력된 내용이 없습니다.");
							$("#Notice-Content-Text-Area").focus();
							return false;
						} else {
							callList_Ajax("/owner/notice/insert",
									showNoticeList, null, {
										member_no : '${member_dto.member_no}',
										notice_content : $(
												"#Notice-Content-Text-Area")
												.val()
									});
						}
					});

			//댓글 쓰기란 엔터키 입력시 댓글 등록
			$(".Notice-Reply-Text").keyup(function(e) {
				if (e.keyCode == 13) {
					var reply_content = $(".Notice-Reply-Text").val();
					if (reply_content == "") {
						alert("입력된 내용이 없습니다.");
						$(".Notice-Reply-Text").focus();
						return false;
					} else {
						alert("여기도 두번이나 들어오나?");
						// $("#notice_insert_reply_form").submit();
					}
				}
			});
		});

		function showNoticeList(data) {
			var html = "";

			$
					.each(
							data.noticeList,
							function(index, jsonData) {
								html += '<div class="row"><div class="col-md-12"><div class="box box-widget collapsed-box"><div class="box-header with-border"><div class="user-block">';
								html += '<div style="display: inline-block;"><i class="fa fa-user fa-2x" style="color: red; text-shadow: 1px 1px 1px #ccc;"></i></div>';
								html += '<div style="display: inline-block;"><a class="Notice-Writer-User-Name" href="#">';
								html += jsonData.member_name + '</a>';
								html += '&nbsp&nbsp<button class="delete_button btn btn-danger btn-xs" id="delete_button"';
								if ('${member_dto.member_code}' != '3') {
									html += 'style="display:none"'
								}
								html += '><i class="fa fa-trash-o"></i></button>';
								html += '</div></div>';
								html += '<div class="box-tools"><button type="button" class="btn btn-box-tool" data-widget="collapse">댓글보기&nbsp;'
										+ jsonData.reply_count
										+ '&nbsp;<i class="fa fa-plus"></i></button>';
								html += '<button type="button" class="btn btn-box-tool" data-widget="remove"><i class="fa fa-times"></i></button></div>'
										+ jsonData.notice_content;
								html += '<span class="pull-right text-muted">'
										+ jsonData.notice_regdate + '</span>';
								html += '</div>';
								html += '<input type="hidden" value="'+jsonData.notice_no+'" class="Notice_No">';
								html += '<div class="box-body box-comments" ><div class="box-comment">';
								$
										.each(
												data.noticereplyList,
												function(index, jsonReplyData) {
													if (jsonData.notice_no == jsonReplyData.notice_parent_no) {
														html += '<span class="Notice-Writer-User-Name" style="font-size:10pt">'
																+ jsonReplyData.member_name;
														html += '&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;'
																+ jsonReplyData.notice_content;
														html += '<span class="text-muted pull-right">'
																+ jsonReplyData.notice_regdate;
														html += '<button class="delete_reply_button btn btn-link btn-xs"';
														if ('${member_dto.member_code}' != '3'
																&& '${member_dto.member_no}' != jsonReplyData.member_no) {
															html += 'style="display:none"';
														}
														html += '><i class="fa fa-times"></i></button>';
														html += '</span></span><hr/>';
														html += '<input type="hidden" class="Reply_Notice_No" value="'+jsonReplyData.notice_no +'"/>';
													}
												});
								html += '<div class="comment-text"></div></div></div>';
								html += '<div class="box-footer"><div class="img-push"><input type="text" name="reply_content" class="Notice-Reply-Text form-control input-sm" placeholder="Press enter to post comment">';
								html += '<input type="hidden" value="${member_dto.member_name}" name="reply_member_name"></div></div></div></div></div>';
							});
			$(".Notice_List_Div").html(html);

		}

		$(document).on('click', ".delete_button", function() {
			if (confirm("삭제 하시겠습니까?") == true) {
				var eq = $(".delete_button").index(this);
				callList_Ajax("/owner/notice/delete", showNoticeList, null, {
					notice_no : $(".Notice_No").eq(eq).val()
				});

			} else {
				return false;
			}
		});
		$(document).on('click', ".delete_reply_button", function() {
			if (confirm("삭제 하시겠습니까?") == true) {
				var eq = $(".delete_reply_button").index(this);
				callList_Ajax("/owner/notice/delete", showNoticeList, null, {
					notice_no : $(".Reply_Notice_No").eq(eq).val()
				});

			} else {
				return false;
			}
		});

		$(document).on(
				'keyup',
				".Notice-Reply-Text",
				function(e) {
					var eq = $(".Notice-Reply-Text").index(this);
					if (e.keyCode == 13) {
						var reply_content = $(this).val();
						if (reply_content == "") {
							alert("입력된 내용이 없습니다.");
							$(".Notice-Reply-Text").focus();
							return false;
						} else {
							callList_Ajax("/owner/notice/reply/insert",
									showNoticeList, null, {
										notice_no : $(".Notice_No").eq(eq)
												.val(),
										notice_content : reply_content,
										member_no : '${member_dto.member_no}'
									});
						}
					}
				});
	</script>
	<!-- Footer -->
	<jsp:include page="../layout/Footer.jsp" />
</body>
</html>