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
		if(${result == "true"}){
			alert("�α��ο� �����߽��ϴ�.");
			location.href = "main.jsp";
		}else{
			alert("�̸��� �Ǵ� ��й�ȣ�� �ٽ� Ȯ�����ּ���.");
			location.href = "loginForm.jsp";
		}
	</script>
</body>
</html>