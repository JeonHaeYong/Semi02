<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<script>
		if(${result} > 0){
			alert("ȸ���� �ǽŰ� ȯ���մϴ�!!");
			location.href = "login.jsp";
		}else{
			alert("ȸ�����Կ� �����߽��ϴ�. �˼��մϴ�");
			location.href = "main.jsp";
		}
	</script>
</body>
</html>