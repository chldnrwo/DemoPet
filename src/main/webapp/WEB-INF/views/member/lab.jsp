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
	
	<c:forEach var="video" items="${videos}">
		<div>
		    <h2><c:out value="${video.snippet.title}" /></h2>
		    <iframe width="560" height="315" src="https://www.youtube.com/embed/${video.id.videoId}" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
		    <p><a href="https://www.youtube.com/watch?v=${video.id.videoId}">Watch on YouTube</a></p>
		</div>
	</c:forEach>

<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3"
	crossorigin="anonymous"></script>
<script>
		const ctx = "${pageContext.request.contextPath}";
		
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









