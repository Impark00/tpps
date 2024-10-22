<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>댓글 수정</title>
</head>
<body>
<form method="post" action="/acom/modify">
	<div class="input-group">
		<label class="form-label">
		댓글 작성자
		</label>
		<input type="text" name="arwriter" class="form-control" readonly="readonly" value="${comment.arwriter}"/>
		</div>
		<div class="input-group">
			<textarea class="form-control" name="arcontent"> ${comment.arcontent}</textarea>
		</div>
		<input type="hidden" name="ano" value="${comment.ano}"/>
		<input type="hidden" name="arno" value="${comment.arno}"/>
		<div class="d-flex justify-content-end">
		<input type="submit" class="btn btn-success" value="댓글수정"/>
		</div>
</form>
</body>
</html>