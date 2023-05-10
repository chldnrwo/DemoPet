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
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css" integrity="sha512-xh6O/CkQoPOWDdYTDqeRdPCVd1SpvCA9XXcUnZS2FmJNp1coAFzvtCN9BmamE+4aHK8yyUHUSCcJHgXloTyT2A==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
</head>
<body>

	<my:navbar></my:navbar>
	<my:navbar-mypage></my:navbar-mypage>

	<div class="container-md"
		style="border-left: solid #d2d2d2; border-right: solid #d2d2d2;max-width: 800px;">
		
		<strong
		style="padding: 80px 0 43px 0; display: block; font-size: 30px;">${member.nickname }님의
		강아지 프로필 등록</strong>
		<div class="row">
			<div class="col-md-10">
				<div class="mb-3">
				<div class="container d-flex flex-column align-items-center" style="border: 1px solid #d2d2d2; min-height: 320px; max-width: 320px;">
				    <div class="item d-flex flex-column justify-content-center" style="flex-grow: 1;">
					        <div id="defaultImg">
						        <div class="d-flex justify-content-center mb-2">
						        <img style="width: 128px; height: 128px; border-radius: 100%;" src="${imgUrl }/mypage/dog.jpg">
						        	
						        </div>
						        <div class="text-center">
						            프로필 사진을 등록해주세요
						        </div>
						    </div>
				    		
					        <div>
					        	<img id="preview" src="#" alt="preview image" 
					        	style="display:none; max-width: 100%; max-height: 100%;">
					        </div>
				    </div>
				</div>
					<br>
					<form action="" method="post" enctype="multipart/form-data">
					<input hidden name="user_id" type="text" value="${member.user_id}"/>
					<input multiple type="file" accept="image/*" class="form-control" name="file" onchange="previewImage(event)">
					
					<br>
					
					<div class="mb-3">
						<label for="" class="form-label">
							이름
						</label>
						
						<div class="input-group">
							<input id="name" class="form-control" type="text" name="name">
						</div>
					</div>
					
					<div class="mb-3">
						<label for="" class="form-label">
							생년월일
						</label>
						<div class="input-group">
							<input type="text" title="생년월일" name="birth" id="birthDay" class="datepicker form-control">
						</div>
					</div>
					
					<div class="mb-3">
						<label for="" class="form-label">
							견종
						</label>
						
						<div class="input-group">
							<input id="breed" class="form-control" type="text" name="breed">
						</div>
					</div>
					
					<div class="mb-3">
						<label for="" class="form-label">
							중성화여부
						</label>
						<div class="form-check">
						  <input class="form-check-input" type="radio" name="neutering" id="neutering" value=true checked>
						  <label class="form-check-label" for="exampleRadios3">
						    중성화 완료
						  </label>
						</div>
						<div class="form-check">
						  <input class="form-check-input" type="radio" name="neutering" id="neutering" value=false>
						  <label class="form-check-label" for="exampleRadios4">
						  	중성화 미완료
						  </label>
						</div>
					</div>
											
	                <div class="mb-3">
						<label for="" class="form-label">
							성별
						</label>
								
						<select class="form-select" aria-label="Default select example" name="pet_gender" id="gender">
						  <option selected>선택하세요</option>
						  <option value="male">수컷</option>
						  <option value="female">암컷</option>
						</select>            
	                </div>
	                
	                <div class="mb-3">
						<label for="" class="form-label">
							사이즈
						</label>
								
						<select class="form-select" aria-label="Default select example" name="size_type" id="size_type">
						  <option selected>선택하세요</option>
						  <option value="대형견">대형견</option>
						  <option value="중형견">중형견</option>
						  <option value="소형견">소형견</option>
						</select>            
	                </div>
			        
					<br>
					<br>
					<div class="d-flex justify-content-center mb-2">
					<input id="reservation" type="submit" class="btn btn-outline-dark"
						style="width: 130px;margin-right: 3rem;" value="등록 완료"
						onclick="location.href='${path}/member/mypage'"/>
				
					<button id="reservation" type="button" class="btn btn-outline-dark"
						style="width: 130px;margin-right: 3rem;"
						onclick="location.href='${path}/member/mypage'">나가기</button>
					</div>
					</form>
					
				
				</div>
			</div>
			<div class="col-md-2"></div>
		</div>
	</div>


	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>

	<script type="text/javascript">
		/*새로 쓰는 기술*/
		/*Jquery date picker*/
		    $(document).ready(function() {
		 
		        $(".datepicker").datepicker({
		  
		              //showOn: "both", // 버튼과 텍스트 필드 모두 캘린더를 보여준다.
		              //buttonImage: "/application/db/jquery/images/calendar.gif", // 버튼 이미지
		              //buttonImageOnly: true, // 버튼에 있는 이미지만 표시한다.
		              changeMonth: true, // 월을 바꿀수 있는 셀렉트 박스를 표시한다.
		              changeYear: true, // 년을 바꿀 수 있는 셀렉트 박스를 표시한다.
		              minDate: '-100y', // 현재날짜로부터 100년이전까지 년을 표시한다.
		              nextText: '다음 달', // next 아이콘의 툴팁.
		              prevText: '이전 달', // prev 아이콘의 툴팁.
		              numberOfMonths: [1,1], // 한번에 얼마나 많은 월을 표시할것인가. [2,3] 일 경우, 2(행) x 3(열) = 6개의 월을 표시한다.
		              stepMonths: 3, // next, prev 버튼을 클릭했을때 얼마나 많은 월을 이동하여 표시하는가. 
		              yearRange: 'c-100:c+10', // 년도 선택 셀렉트박스를 현재 년도에서 이전, 이후로 얼마의 범위를 표시할것인가.
		              showButtonPanel: true, // 캘린더 하단에 버튼 패널을 표시한다. ( ...으로 표시되는부분이다.) 
		              currentText: '오늘 날짜' , // 오늘 날짜로 이동하는 버튼 패널
		              closeText: '닫기',  // 닫기 버튼 패널
		              dateFormat: "yy-mm-dd", // 텍스트 필드에 입력되는 날짜 형식.
		              showAnim: "slide", //애니메이션을 적용한다.  
		              showMonthAfterYear: true , // 월, 년순의 셀렉트 박스를 년,월 순으로 바꿔준다. 
		              dayNamesMin: ['월', '화', '수', '목', '금', '토', '일'], // 요일의 한글 형식.
		              monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'] // 월의 한글 형식.
		 
		         });
		 
		    });
	</script>
	<script>
	/*---------------------------미리 보기 기능-----------------------------------*/
	  function previewImage(event) {
	    // input 태그에서 선택한 파일
	    const selectedFile = event.target.files[0];

	    // FileReader 객체 생성
	    const reader = new FileReader();

	    // 파일 로드 완료시 동작할 이벤트 등록
	    reader.onload = function(event) {
	      // 미리보기 이미지의 src 속성값 변경
	      document.getElementById('preview').src = event.target.result;
	      // 미리보기 이미지를 보여줌
	      document.getElementById('preview').style.display = "inline-block";
	      document.getElementById('defaultImg').style.display = "none";
	    };

	    // FileReader를 사용하여 파일 읽기
	    reader.readAsDataURL(selectedFile);
	  }
	/*------------------------미리 보기 기능 끝------------------------------------------------*/
	</script>
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
