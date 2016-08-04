<!-- 
/*
 * 	JSP: DetailProfit_Wait_Modal
 *  Description: 매출액 페이지에서 입력된 연도의 매출액 상세 정보 클릭시 loading Icon을 보여주는 제이쿼리 레이어팝업
 *  Created: 2016­07­27
 *	Author: 김준혁
 *  Mail: iamheykj@gmail.com
 * 	Copyrights 2016-07-27 by Try{}Catch
 *
 *	Revisions:
 */
 -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<style>
#Wait-Modal{
	padding: 20px;
	border: none;
	position: absolute;
    left: 900px;
    top: 1400px;
	background-color: #ffffff;
	opacity: 0.5;
}
</style>

<div id="Wait-Modal">
	<i class="fa fa-spinner fa-pulse fa-3x fa-fw" style="color:red"></i>
<span class="sr-only">Loading...</span>
</div>

