<!-- 
 *
 * 	JSP: Community_Insert
 *  Description: 커뮤니티 업로드 하는 JSP
 *  Created: 2016­07­31
 *	Author: 박완석
 *  Mail: kknd9009@naver.com
 * 	Copyrights 2016-07-31 by Try{}CatchOwner
 *
 * 	Revisions:
 * 		1. When & Who : 2016-07-31 by 박완석
 * 		2. What		  : Naver스마트에디터를 사용하여 사진 업로드 기능 구현
 *
 -->
<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
  <style>
  	.main-sidebar span{
  		color:white;
  	}
  </style>
<body class="hold-transition skin-blue sidebar-mini">
	<div class="wrapper">
	<jsp:include page="../layout/Header.jsp" />
		<form method="post" action="/owner/community_insert" id="frm">
			<div class="row col-md-offset-2" style="margin-right:100px; width:1000px">
				<div class="panel panel-info">
					<div class="panel-heading">	</div>
					<div class="panel-body">TITLE : &nbsp;&nbsp;&nbsp;<input style="width:900px" type="text" class="form-control" name="community_title"/></div>				
					<div class="panel-body"><textarea name="community_content" id="smarteditor" rows="10" cols="100" style="width:900px; height:500px;"></textarea></div>
					<button type="button" id="community_submit" class="btn btn-default" style="background-color:#18bc9c">write</button> &nbsp;<button type="button" id="recipe_goback" class="btn btn-default" style="background-color:#18bc9c">목록으로</button>
				</div>
			</div>
		</form>
	</div>
	
	<!-- Naver SmartEditor -->
<script src="/owner/resources/smarteditor/js/HuskyEZCreator.js"></script>
</head> 
<script>
$(function(){
    var editor_object = [];
    nhn.husky.EZCreator.createInIFrame({
        oAppRef: editor_object,
        elPlaceHolder: "smarteditor",
        sSkinURI: "/owner/resources/smarteditor/SmartEditor2Skin.html", 
        htParams : {
            bUseToolbar : true,             
            bUseVerticalResizer : false,     
            bUseModeChanger : false, 
        }
    });
    $("#community_submit").click(function(){
        editor_object.getById["smarteditor"].exec("UPDATE_CONTENTS_FIELD", []);
        msgsendcommunity();
        $("#frm").submit();
    });
    $("#recipe_goback").click(function(){
    	location.href="/owner/community_list?limit=0";
    })
});
function msgsendcommunity() {
	socket.send(JSON.stringify({'type':'NewContent'}));
}


</script>
	<jsp:include page="../layout/Footer.jsp" />	
</body>	
<script type="text/javascript" src="/owner/resources/smarteditor/photo_uploader/plugin/hp_SE2M_AttachQuickPhoto.js" charset="utf-8"> </script>
</html>