<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<div class="row">
	<div class="col-lg-12">
		<h2 class="page-header">게시판 관리 > 게시판 수정</h2>
	</div>
	<!-- /.col-lg-12 -->
</div>
<!-- /.row -->
<div class="row">
	<div class="col-lg-12">
		<div class="panel panel-default">
			<div class="panel-heading">사용중인 게시판</div>
			<!-- /.panel-heading -->
			<div class="panel-body">
				<table width="100%" class="table table-bordered table-hover"
					id="dataTables-example">
					<thead>
						<tr>
							<th><input type="checkbox"></th>
							<th>게시판ID</th>
							<th>게시판 타이틀</th>
							<th>분류</th>
							<th>총 게시물</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td class="center"><input type="checkbox"></td>
							<td class="center"><input type="number" name="BRD_ID" value="3"></td>
							<td class="center"><input type="text" name="BRD_NAME" value="커뮤니티"></td>
							<td class="center">
							<select name="job">
									<option value="운영">운영</option>
									<option value="학생">미운영</option>
									<option value="회사원">삭제</option>
							</select>
							</td>
							<td class="center"><input type="number"value="3"></td>
						</tr>
						<tr>
							<td class="center"><input type="checkbox"></td>
							<td class="center"><input type="number" name="BRD_ID" value="2"></td>
							<td class="center"><input type="text" name="BRD_NAME" value="FAQ"></td>
							<td class="center">
														<select name="job">
									<option value="운영">운영</option>
									<option value="학생">미운영</option>
									<option value="회사원">삭제</option>
							</select></td>
							<td class="center"><input type="number" value="30"></td>
						</tr>
						<tr>
							<td class="center"><input type="checkbox"></td>
							<td class="center"><input type="number" name="BRD_ID" value="1"></td>
							<td class="center"><input type="text" name="BRD_NAME" value="공지사항"></td>
							<td class="center">
							<select name="job">
									<option value="운영">운영</option>
									<option value="학생">미운영</option>
									<option value="회사원">삭제</option>
							</select></td>
							<td class="center"><input type="number" value="90"></td>
						</tr>
					</tbody>
				</table>
				<hr>
				<div class="btn-center" style="text-align: center">
					<button id="save" class="btn btn-default btn-outline btn-primary">저장</button>
					<button id="cancel" class="btn btn-default btn-outline btn-primary">취소</button>
				</div>
			</div>
			<!-- /.panel-body -->
		</div>
		<!-- /.panel -->
	</div>
	<!-- /.col-lg-12 -->
</div>
<!-- /.row -->