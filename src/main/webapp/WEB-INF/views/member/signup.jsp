<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="my" tagdir="/WEB-INF/tags" %>
<!DOCTYPE html>
<html>
<head>
<style>
@font-face {
    font-family: 'NanumSquareNeo-Variable';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_11-01@1.0/NanumSquareNeo-Variable.woff2') format('woff2');
    font-weight: normal;
    font-style: normal;
} 
body {
 font-family: 'NanumSquareNeo-Variable','Palatino Linotype' !important; 
} 
</style>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css" integrity="sha512-xh6O/CkQoPOWDdYTDqeRdPCVd1SpvCA9XXcUnZS2FmJNp1coAFzvtCN9BmamE+4aHK8yyUHUSCcJHgXloTyT2A==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet" href="/resources/demos/style.css">
</head>
<body>
	<my:navbar></my:navbar>
	
	<div class="container-md">
		<div class="row">
			<div class="col">
				<h1 style="margin-top: 20px">회원가입</h1>
				
				<form action="" method="post">
					
					<div class="mb-3">
						<label for="" class="form-label">
							이메일
						</label>
						
						<div class="input-group">
							<input id="emailInput1" class="form-control" type="email" name="M_EMAIL">
							<button id="emailExistButton1" type="button" class="btn btn-outline-secondary">중복확인</button>
						</div>
						
						<div id="emailText1" class="form-text">이메일 중복확인을 해주세요.</div>
					</div>
					
					<div class="mb-3">
						<label for="" class="form-label">
							닉네임
						</label>
						
						<div class="input-group">
							<input id="nickNameInput1" class="form-control" type="test" name="M_NICKNAME">
							<button id="nickNameExistButton1" type="button" class="btn btn-outline-secondary">중복확인</button>
						</div>
						
						<div id="nickNameText1" class="form-text">닉네임 중복확인을 해주세요.</div>
					</div>
					
					<div class="mb-3">
						<label for="" class="form-label">
							암호
						</label>
						<input id="passwordInput1" class="form-control" type="password" name="M_PASSWORD">
						<div id="passwordText1" class="form-text"></div>
					</div>
					
					<div class="mb-3">
						<label for="" class="form-label">
							암호 확인
						</label>
						<input id="passwordInput2" class="form-control" type="password">
					</div>
					
					<div class="mb-3">
						<label for="" class="form-label">
							이름
						</label>
						
						<div class="input-group">
							<input id="nameInput1" class="form-control" type="text" name="M_NAME">
						</div>
					</div>
										
	                <div class="mb-3">
    					<label for="" class="form-label">
							성별
						</label>
								
						<select class="form-select" aria-label="Default select example" name="M_GENDER">
						  <option selected>선택하세요</option>
						  <option value="male">남자</option>
						  <option value="female">여자</option>
						</select>            
	                </div>
					
					<div class="mb-3">
						<label for="" class="form-label">
							전화번호
						</label>
						<div class="input-group">
							<input id="nameInput1" class="form-control" type="text" name="M_PHONE">
						</div>
					</div>
					
					<div class="mb-3">
						<label for="" class="form-label">
							생년월일
						</label>
						<div class="input-group">
							<input type="text" title="생년월일" name="birthDay" id="birthDay" class="datepicker form-control">
						</div>
					</div>
					
					<div class="mb-3">
						<label for="" class="form-label">
							주소
						</label>
						<input hidden required="required" type="text" class="form-control" name="address2" id="address2" placeholder="주소찾기 버튼을 통해 입력해주세요">
						<input hidden required="required" type="text" class="form-control" name="addressLL" id="addressLL" placeholder="주소찾기 버튼을 통해 입력해주세요">
						<div class="input-group">
							<input readonly="readonly" required="required" type="text" class="form-control" 
							name="address" id="address" placeholder="주소찾기 버튼을 통해 입력해주세요">
							<button id="addressSubmitButton" type="button" class="btn btn-outline-secondary">주소찾기</button>
						</div>
					</div>
			
					
					<input disabled id="submitButton1" class="btn btn-primary" type="submit" value="가입">
				
				</form>
			</div>
		</div>
	</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
 
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
    /*--------------------도로명 주소 입력 기능-------------------------------------------------------------------------------*/
    const ctx = "${pageContext.request.contextPath}";

    document.querySelector("#addressSubmitButton").addEventListener("click", function() {
    	
    	window.open("${path}/member/jusoPopup","pop","width=570,height=420, scrollbars=yes, resizable=yes"); 
    });


    function jusoCallBack(roadFullAddr,roadAddrPart1){
    		// 팝업페이지에서 주소입력한 정보를 받아서, 현 페이지에 정보를 등록합니다.
    		document.querySelector("#address").value = roadFullAddr;
    		document.querySelector("#address2").value = roadAddrPart1;
    		
    		//codeAddress();
    }
    /*--------------------도로명 주소 입력 기능 끝-------------------------------------------------------------------------------*/
</script> 

<script>
const ctx = "${pageContext.request.contextPath}";
// 아이디 사용 가능
let availableId = false;
// 이메일 사용 가능
let availableEmail = false;
// 패스워드 사용 가능
let availablePassword = false;

function enableSubmitButton() {
	const button = document.querySelector("#submitButton1");
	if (availableId && availableEmail && availablePassword) {
		button.removeAttribute("disabled")
	} else {
		button.setAttribute("disabled", "");
	}
}

//id input 변경시 submit 버튼 비활성화
document.querySelector("#userIdInput1").addEventListener("keyup", function() {
	availableId = false;
	enableSubmitButton();
});

// 이메일 input 변경시 submit 버튼 비활성화
document.querySelector("#emailInput1").addEventListener("keyup", function() {
	availableEmail = false;
	enableSubmitButton();
});

// 아이디 중복확인
document.querySelector("#userIdExistButton1").addEventListener("click", function() {
	availableId = false;
	// 입력된 userId를
	const userId = document.querySelector("#userIdInput1").value;
	
	// fetch 요청 보내고
	fetch(ctx + "/jjhLogin/existId/" + userId)
		.then(res => res.json())
		.then(data => {
			// 응답 받아서 메세지 출력
			document.querySelector("#userIdText1").innerText = data.message;
			
			if (data.status == "not exist") {
				availableId = true;
				enableSubmitButton();
			}
		}); 
	
});

// 이메일 중복확인
document.querySelector("#emailExistButton1").addEventListener("click", function() {
	availableEmail = false;
	const email = document.querySelector("#emailInput1").value;
	
	fetch(`\${ctx}/jjhLogin/existEmail`, {
		method : "post",
		headers : {
			"Content-Type" : "application/json"
		},
		body : JSON.stringify({email})
	})
		.then(res => res.json())
		.then(data => {
			document.querySelector("#emailText1").innerText = data.message;
			
			if (data.status == "not exist") {
				availableEmail = true;
				enableSubmitButton();
			}
		});
});




/* 패스워드 일치하는 지 확인 시작 */
const passwordInput1 = document.querySelector("#passwordInput1");
const passwordInput2 = document.querySelector("#passwordInput2");
const passwordText1 = document.querySelector("#passwordText1");
 
function matchPassword() {
	availablePassword = false;
	
	const value1 = passwordInput1.value;
	const value2 = passwordInput2.value;
	
	if (value1 == value2) {
		passwordText1.innerText = "패스워드가 일치합니다.";
		availablePassword = true;
	} else {
		passwordText1.innerText = "패스워드가 일치하지 않습니다.";
	}
	
	enableSubmitButton();

}

passwordInput1.addEventListener("keyup", matchPassword);
passwordInput2.addEventListener("keyup", matchPassword);
/* 패스워드 일치하는 지 확인 끝 */
</script>
</body>
</html>









