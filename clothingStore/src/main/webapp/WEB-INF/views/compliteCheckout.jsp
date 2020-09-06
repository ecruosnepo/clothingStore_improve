<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	.complite-container{
		text-align:center;		
		height:43.5vh;
	}
	.complite-inner{
		position:relative;
		top:90px;
		margin:auto 0;
	}
	.main-btn{
		background-color:#222 !important;
		color:white !important;
		font-weight:600 !important;
		padding:10px 20px !important;
	}
	.main-btn:hover{
		text-decoration:none !important;
		color:white !important;
	}
</style>
</head>
<body>
	<jsp:include page="header.jsp" flush="false" />
	<div class="container complite-container mh-100">
		<div class="complite-inner">
			<h1>결제가 완료되었습니다.</h1>
			<h4>구매해주셔서 감사합니다</h4>
			<button class="btn main-btn rounded-0" onclick="location.href='/';">메인으로 돌아가기</button>
		</div>
	</div>
</body>
</html>
<jsp:include page="footer.jsp" flush="false" />