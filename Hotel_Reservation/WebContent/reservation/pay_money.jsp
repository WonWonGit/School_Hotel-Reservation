<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.reservationNumber{
		position:relative;
		width:40%;
		border:1px solid #ccc;
		border-radius:10px;
		padding:100px;
		margin:0 auto;
		text-align:center;
		margin-top:100px;
	}
</style>
</head>
<body>
<div><jsp:include page="../main/header3.jsp"/></div>
<div class="left">
</div>
	<%
		String rsno = request.getParameter("rsno");
	%>
	<div class="reservationNumber">
		24시간 이내로 입금 부탁드립니다!<br>
		미 입금시 자동 취소됩니다.<br>
		예약 조회는 입금 후 확인 가능힙니다.<br>
		<a class="btn btn-dark" href="../main/index.jsp" role="button">HOME</a>
	</div>
<div class="left">
	<jsp:include page="../main/footer.jsp"/>
</div>	
</body>