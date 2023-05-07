<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="my" tagdir="/WEB-INF/tags"%>
<c:set var="path" value="${ pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>

<style>
.container-dotted {
  border: 2px dotted #74D19D;
}
.fontP{
	font-family: 'Palatino Linotype';
	font-weight: bold;
	font-size: 18px;
}
.fontA {
	display: flex;
	color: black;
	font-family: "Malgun Gothic";
	font-weight: bold;
	padding: 0 0 10px 0;
	font-size: 20px;
}

.fontB {
	color: rgba(0, 0, 0, 0.56);
	font-family: "Malgun Gothic";
	font-weight: bold;
}

.fix {
	background-color: rgb(60, 60, 60) !important;
	width: 100%;
	position: fixed !important;
	animation: down 0.5s ease !important;
}

@
keyframes down { 0%{
	transform: translateY(-50px)
}

100


%
{
transform


:


translateY
(


0px


)


}
}
@font-face {
	font-family: 'NanumSquareNeo-Variable';
	src:
		url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_11-01@1.0/NanumSquareNeo-Variable.woff2')
		format('woff2');
	font-weight: normal;
	font-style: normal;
}

body {
	font-family: 'NanumSquareNeo-Variable', 'Palatino Linotype' !important;
}

.container {
	display: flex;
}
</style>

<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css"
	integrity="sha512-xh6O/CkQoPOWDdYTDqeRdPCVd1SpvCA9XXcUnZS2FmJNp1coAFzvtCN9BmamE+4aHK8yyUHUSCcJHgXloTyT2A=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />
</head>
<body>

	<my:navbar></my:navbar>
	<my:navbar-mypage></my:navbar-mypage>

	<div class="container-md"
		style="border-left: solid #d2d2d2; border-right: solid #d2d2d2;max-width: 800px;">

		<strong
			style="padding: 80px 0 43px 0; display: block; font-size: 30px;">${member.nickname }님의
			마이 페이지</strong>
		<div class="row">
			
			<div class="col-md-10">
				<div class="mb-3">
					<div class="container" style="border: 1px solid #d2d2d2; min-height: 320px;">
						<div class="item">
							<div style="padding: 60px 0px 0px 0px;">
								<c:if test="${member.user_profile eq null }">
									<img style="width: 128px; height: 128px; border-radius: 100%;"
										src="${imgUrl }/mypage/ico_21.png">
								</c:if>
								<c:if test="${member.user_profile ne null }">
									<img style="width: 128px; height: 128px; border-radius: 100%;"
										src="${imgUrl }/mypage/${member.user_id}/${member.user_profile}">
								</c:if>
							</div>
						</div>
						
						<div class="item" style="margin-left: 3rem;">
							<div style="min-height: 20px"></div>
							<div class="fontP" style="margin-bottom: 1rem;">
							Email : <span style="font-size: 20px;">${member.email}</span>
							</div>
							<div class="fontP" style="margin-bottom: 1rem;">
							Nickname : <span style="font-size: 20px;">${member.nickname}</span>
							</div>
							<div class="fontP" style="margin-bottom: 1rem;">
							Address : <span style="font-size: 15px;">${member.city}</span>
							</div>
							<div class="fontP" style="min-height: 160px">
							Introduction : <br>
								<c:if test="${member.self_introduction eq null }">
									내 정보 수정을 통해 자기소개를 등록해주세요	
								</c:if>
								<c:if test="${member.self_introduction ne null }">
									<div>
									${member.self_introduction}
									</div>	
								</c:if>
							</div>
						</div>
					</div>
					<br> <br>
					
					<h3 style="font-weight: bold;">나의 반려견</h3>
					<c:if test="${empty pet}">
						<div class="container" style="border: 1px solid #d2d2d2;min-height: 320px;">
							<div class="container justify-content-center container-dotted" style="margin: 10px 0 10px 0;">
								<div class="item">
									<div style="padding: 60px 0px 0px 0px;">
										<img style="width: 128px; height: 128px; border-radius: 100%;"
										src="${imgUrl }/mypage/dog.jpg">
									</div>
									<div>
										강아지 정보를 등록해주세요
									</div>
								</div>
							</div>
						</div>
					</c:if>
					<c:forEach var="petInfo" items="${pet}">
				        <div class="container" style="border: 1px solid #d2d2d2;min-height: 320px;">
								<c:if test="${petInfo.pet_profile eq null }">
									<div class="item">
										<div style="padding: 60px 0px 0px 0px;">
											<img style="width: 128px; height: 128px; border-radius: 100%;"
											src="${imgUrl }/mypage/dog.jpg">
										</div>
									</div>
								</c:if>
								<c:if test="${petInfo.pet_profile ne null }">
									<div class="item">
										<div style="padding: 60px 0px 0px 0px;">
											<img style="width: 128px; height: 128px; border-radius: 100%;"
											src="${imgUrl }/mypage/${member.user_id}/${petInfo.pet_profile}">
										</div>
									</div>
								</c:if>
								<div class="item" style="margin-left: 3rem;">
										<div style="min-height: 20px"></div>
										<div class="fontP" style="margin-bottom: 1rem;">
										Name : <span style="font-size: 20px;">${petInfo.name}</span>
										</div>
										<div class="fontP" style="margin-bottom: 1rem;">
										Age : <span id="petAge${petInfo.pet_id}" style="font-size: 20px;"></span>
											
										
										</div>
										<div class="fontP" style="margin-bottom: 1rem;">
										Breed : 
										</div>
										<div class="fontP" style="margin-bottom: 1rem;">
										Gender : 
										</div>
										<div class="fontP" style="margin-bottom: 1rem;">
										Neutering : 
										</div>
										<div class="fontP" style="margin-bottom: 1rem;">
										Size : 
										</div>
									</div>
							
						</div>
				    </c:forEach>
					
					<br>
					<button id="reservation" type="button" class="btn btn-outline-dark"
						style="width: 130px;margin-right: 3rem;"
						onclick="location.href='${path}/member/update'">내 정보 수정</button>
					<button id="reservation" type="button" class="btn btn-outline-dark"
						style="width: 130px;">강아지 등록</button>
					
					<br><br>					
					<button id="reservation" type="button" class="btn btn-outline-dark mr-3"
						style="width: 130px;margin-right: 3rem;"
						onclick="location.href='${path}/payment/cart'">장바구니</button>

					<input class="btn btn-danger" type="submit" value="회원탈퇴"
						data-bs-toggle="modal" data-bs-target="#removeModal"
						style="width: 130px;">
				</div>
			</div>
			<div class="col-md-2"></div>
		</div>
	</div>

	<%-- 탈퇴 시 예전암호 입력 Modal --%>
	<div class="modal fade" id="removeModal" tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h1 class="modal-title fs-6" id="exampleModalLabel"
						style="color: #B9062F; font-weight: bold;">탈퇴를 원하시면 회원을탈퇴합니다
						라고 입력해주세요</h1>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<input id="deleteText" type="text" class="form-control"
						placeholder="회원을탈퇴합니다">
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-bs-dismiss="modal">닫기</button>
					<button id="modalConfirmButton2" type="button"
						class="btn btn-danger">탈퇴</button>
				</div>
			</div>
		</div>
	</div>

	<c:url value="/member/remove" var="removeUrl" />
	<form id="form2" action="${removeUrl }" method="post">
		<input type="hidden" name="id" value="${member.user_id }">
	</form>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3"
		crossorigin="anonymous"></script>
	<script>
		const ctx = "${pageContext.request.contextPath}";
		
		
		/* --------------회원 탈퇴 기능-------------------------------------------------------------------------------------------------- */
		document.querySelector("#modalConfirmButton2").addEventListener(
				"click", function() {
					const text = document.querySelector("#deleteText").value
					const form = document.forms.form2;
					if (text == '회원을탈퇴합니다') {
						console.log("OK");
						form.submit();
					}
				});
		/* --------------회원 탈퇴 기능 끝------------------------------------------------------------------------------------------------ */

		/* --------------sticky navbar scroll 기능-------------------------------------------------------------------------------------------------- */
		function navigo() {
			const header = document.querySelector('#nav2'); //헤더부분획득
			const headerheight = header.clientHeight;//헤더높이
			document.addEventListener('scroll', onScroll, {
				passive : true
			});//스크롤 이벤트
			function onScroll() {
				const scrollposition = pageYOffset;//스크롤 위치
				const nav = document.querySelector('#nav');//네비게이션
				if (headerheight <= scrollposition) {//만약 헤더높이<=스크롤위치라면
					nav.classList.add('fix')//fix클래스를 네비에 추가
				} else {//그 외의 경우
					nav.classList.remove('fix');//fix클래스를 네비에서 제거
				}
			}
		}
		navigo()
		/* --------------sticky navbar scroll 기능 끝-------------------------------------------------------------------------------------------------- */
	</script>
</body>
</html>









