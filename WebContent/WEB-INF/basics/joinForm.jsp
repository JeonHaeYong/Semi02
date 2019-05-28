<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<link
	href="https://fonts.googleapis.com/css?family=Do+Hyeon|Jua|Nanum+Gothic|Nanum+Gothic+Coding&display=swap"
	rel="stylesheet">
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>	
<style>
body {
	font-family: "Nanum Gothic";
	height: 100%;
}

.wrapper {
	width: 400px;
	margin: auto;
	padding: 40px;
	border: 1px solid #e4e4e4;
	border-radius: 5px;
}

.top_wrapper {
	display: flex;
	justify-content: space-between;
	height: 40px;
	align-items: center;
	position: relative;
	margin: auto;
}

a {
	font-weight: bold;
}

a:hover {
	color: #000000;
}

.title {
	margin-bottom: 40px;
}

.btn-primary {
	margin: 20px 0px 20px;
	background-color: #1ebdd8;
	border-color: #1ebdd8;
	color: #FFF;
}

.btn-primary:hover, .btn-primary:focus {
	border-color: #28a39f;
	background-color: #28a39f;
	color: #FFF;
}

.btn-primary:active, .btn-primary:visited, .btn-primary:active:focus,
	.btn-primary:active:hover {
	border-color: #639d34;
	background-color: #639d34;
	color: #FFF;
}

#zip {
	display: inline-block;
	margin-top:20px;
}

#inputZip {
	display: inline-block;
}

.helper {
	font-size: 12px;
}
#pw_form, #pw_match, #emailCheck{
	font-size:12px;
}
#divBtnJoin{
	text-align:center;
}
#checkPassword{
	margin-bottom:5px;
}
#inputEmail{
	display:inline-block;
}
ul {
	margin: auto;
}

li {
	width: 130px;
}
</style>
</head>
<body>

<nav class="navbar navbar-expand-md navbar-light">
		<div class="logo">
			<a class="navbar-brand" href="main.jsp"><img src="logo/bridge_logo2.png"
				width="150px"></a>
		</div>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarNav" aria-gcontrols="navbarNav"
			aria-expanded="false" aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="navbarNav">
			<ul class="navbar-nav">
				<li class="nav-item"><a class="nav-link" href="Introduce.members">소개</a></li>
				<li class="nav-item"><a class="nav-link" href="write.board">후원해
						주세요</a></li>
				<li class="nav-item"><a class="nav-link"
					href="textList.board?currentPage=1">후원 게시판</a></li>
				<c:choose>
					<c:when test="${sessionScope.loginEmail != null || navercontents.name != null}">
						<li class="nav-item"><a class="nav-link"
							href="Logout.members">로그아웃</a></li>
					</c:when>
					<c:otherwise>
						<li class="nav-item"><a class="nav-link"
							href="LoginForm.members">로그인</a></li>
						<li class="nav-item"><a class="nav-link"
							href="JoinForm.members">회원가입</a></li>
					</c:otherwise>
				</c:choose>

				<!-- <li class="nav-item"><a class="nav-link" href="#">후원하기</a></li>
				<li class="nav-item"><a class="nav-link" href="LoginForm.members">로그인</a></li>
				<li class="nav-item"><a class="nav-link" href="JoinForm.members">회원가입</a></li> -->
			</ul>
		</div>
	</nav>
	<hr>

	<form action="Join.members" id="joinForm" method="post">
		<div class="wrapper">
			<div class="title">
				<h3>회원가입</h3>
			</div>
			
			<div class="form-group">
				<input type="email" class="form-control" id="inputEmail" name="email"
					placeholder="이메일 계정" style="width:70%" required>
				<button type="button" id="btnConfirmEmail"
					class="btn btn-outline-info">인증하기</button>
				<p id="emailCheck"></p>
			</div>
			<div id="divPw" class="form-group">
				<input type="password" class="form-control" id="inputPassword" name="pw"
					placeholder="비밀번호" required><em class="helper">영문, 숫자, 특수문자
					(!@#$%^&*+=-)를 조합한 8자 이상</em><p id="pw_form"> </p>
			</div>
			<div class="form-group">
				<input type="password" class="form-control" id="checkPassword"
					placeholder="비밀번호 확인" required><p id="pw_match"></p>
			</div>
			<div class="form-group">
				<input type="text" class="form-control" id="name" name="name"
					placeholder="이름" required>
			</div>
			<div class="form-group">
				<input type="text" class="form-control" id="phone" name="phone"
					placeholder="전화번호">
			</div>
			<div id="zip" class="form-group">
				<input type="text" id="inputZip" class="form-control" name="zip"
					style="width: 50%" placeholder="우편번호" readonly>
				<button type="button" id="search"
					class="btn btn-outline-info">찾기</button>
			</div>
			<div class="form-group">
				<input type="text" class="form-control" id="inputAddress" name="address1"
					placeholder="주소" readonly>
			</div>
			<div class="form-group">
				<input type="text" class="form-control" id="inputAddress2" name="address2"
					placeholder="상세주소">
			</div>

			<div id="divBtnJoin"><input type="button" id="btnJoin" class="btn btn-primary" value="가입하기"></div>
		</div>
	</form>


	<script>
		$("#btnJoin").on("click", function(){
			if($("#inputEmail").val() == ""){
				alert("이메일을 입력해주세요.");
			}
			else if($("#pw_match").text() != ""){
				alert("비밀번호를 다시 확인해주세요.");
			}
			else if($("#name").val() == ""){
				alert("이름을 입력해주세요.");
			}
			else{
				$.ajax({
					url: "SendMail.members",
					type: "post",
					data: {
						email: $("#inputEmail").val()
					}
				}).done(function(resp){
					if(resp == 0){
						alert("이메일 주소가 잘못되었습니다. 다시 입력해주세요.");
					}
					else{	// 메일 발송을 성공했을 때
						var inputNum = prompt("입력하신 이메일로 메일이 발송되었습니다. 확인하신 후 인증번호를 입력해주세요.");
						if(inputNum == resp){
							$("#joinForm").submit();
						}
						else if(resp){
							alert("인증번호가 일치하지 않습니다.");
							location.href = "JoinForm.members";
						}
					}
				});
			}
		})
		
		$("#inputEmail").on("input", function(){
			$.ajax({
				url: "EmailDuplCheck.members",
				type: "post",
				data: {
					email: $("#inputEmail").val()
				}
			}).done(function(resp){
				console.log(resp);
				if(resp == "false"){
					$("#emailCheck").css("color", "red");
					$("#emailCheck").text("이미 가입된 이메일입니다.");
				}
				else{
					$("#emailCheck").text("");
				}
			})
		})

		document.getElementById("inputPassword").oninput = function() {
			var inputPw = document.getElementById("inputPassword").value;
			var regex = /^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{8,25}$/g; // 숫자+영문자+특수문자 조합, 8자리 이상
			var result = regex.exec(inputPw);
			if (result == null) {
				document.getElementById("pw_form").innerHTML = "8자 이상 영문,숫자,특수문자를 사용하세요.";
				document.getElementById("pw_form").style.color = "red";
			} else {
				document.getElementById("pw_form").innerHTML = "";
			}
		}

		document.getElementById("checkPassword").oninput = function() {
			var pw = document.getElementById("inputPassword").value;
			var pw_chk = document.getElementById("checkPassword").value;
			if (pw == pw_chk) {
				document.getElementById("pw_match").innerHTML = "";
		
			} else {
				document.getElementById("pw_match").innerHTML = "비밀번호가 일치하지 않습니다.";
				document.getElementById("pw_match").style.color = "red";
			}
		}

		document.getElementById("search").onclick = searchAddress;

		function searchAddress() {
			new daum.Postcode({
				oncomplete : function(data) {
					var roadAddr = data.roadAddress; // 도로명 주소 변수
					var extraRoadAddr = ''; // 참고 항목 변수

					if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
						extraRoadAddr += data.bname;
					}

					if (data.buildingName !== '' && data.apartment === 'Y') {
						extraRoadAddr += (extraRoadAddr !== '' ? ', '
								+ data.buildingName : data.buildingName);
					}

					if (extraRoadAddr !== '') {
						extraRoadAddr = ' (' + extraRoadAddr + ')';
					}

					document.getElementById('inputZip').value = data.zonecode;
					document.getElementById("inputAddress").value = roadAddr;
				}
			}).open();
		}
	</script>
</body>
</html>