<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<div>
		<form method="POST" action="<%=request.getContextPath()%>/boardMatching/inputData" class="" name="imgFile" enctype="multipart/form-data">
			<input type="text" name="id" class="form-control" id="id" placeholder="예시) 침대 이사, 소파 배송" value="" required>
			<input type="file" name="pw" class="" id="pw">
			<button class="btn" type="submit" onclick="">사진 올리기</button>
		</form>
	</div>

</body>
</html>