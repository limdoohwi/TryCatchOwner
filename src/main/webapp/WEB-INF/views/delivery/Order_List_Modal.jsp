
<%@ page contentType="text/html; charset=UTF-8"%>
<script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
<script>
	$(function(){
		$("#Show-Order-List").draggable();
	})
</script>
<style>
#Show-Order-List {
	padding: 20px;
	border: 4px solid #ddd;
	position: absolute;
	left: 1100px;
	top: 400px;
	background: #fff;
}

#Show-Order-List button {
	cursor: pointer;
}
</style>

<div id="Show-Order-List">
	<div>
		<table id="material_detail_table"
			class="table table-striped table-bordered table-list">
			<!-- Member-Purchase-Table-Header -->
			<thead>
				<tr>
					<th>구매 상품</th>
					<th>단가</th>
					<th>수량</th>
					<th>금액</th>
				</tr>
			</thead>
			<!-- Member-Purchase-Table-Body -->
			<tbody>

			</tbody>
		</table>
	</div>
	<div class="col-sm-offset-5">
		<button id="Show-Order-List-Modal-Hide-Btn" type="button"
			class="btn btn-default">닫기</button>
	</div>
</div>

