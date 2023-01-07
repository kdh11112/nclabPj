<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>인사관리</title>
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>

<script type="text/javascript" >
	// jQuery 시작점 - main
	// html 문서를 메모리 전부 로딩(DOM 생성)하면 시작
	$(document).ready(function() {
// 		alert("asd");
	});
	
	$(function(){
		$('#datepicker2').click( function() {
		$("#datepicker2").datepicker({
		  changeYear: true,
		  changeMonth: true,
		  prevText: '이전 달',
		  nextText: '다음 달',
		  monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
		  monthNamesShort: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
		  dayNames: ['일', '월', '화', '수', '목', '금', '토'],
		  dayNamesShort: ['일', '월', '화', '수', '목', '금', '토'],
		  dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
		  showMonthAfterYear: true,
		  yearSuffix: '년',
    	  language: 'ko',
    	  dateFormat: 'yy-mm-dd',
	    }).datepicker('show'); 
	    }); 
	});
	
	$(function(){
		$('#datepicker').click( function() {
		$("#datepicker").datepicker({
		  changeYear: true,
		  changeMonth: true,
		  prevText: '이전 달',
		  nextText: '다음 달',
		  monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
		  monthNamesShort: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
		  dayNames: ['일', '월', '화', '수', '목', '금', '토'],
		  dayNamesShort: ['일', '월', '화', '수', '목', '금', '토'],
		  dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
		  showMonthAfterYear: true,
		  yearSuffix: '년',
    	  language: 'ko',
    	  dateFormat: 'yy-mm-dd',
	    }).datepicker('show'); 
	    }); 
	});
	
	
// 	$(function(){
//     	$("#datepicke").datepicker({
//     	language: 'ko'
//     }); 
// 	});
	
//주소
$(function() {
  $('#btn1').click( function() {
	    new daum.Postcode({
	        oncomplete: function(data) {
	        	// 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                
                } 

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('emppostcode').value = data.zonecode;
                document.getElementById("empadress").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("empdetailadress").focus();
	        }
	    }).open();
  });
});
	
</script>




</head>
<body>
<h1>인사관리</h1>
<table border="1px">
<tr>
<td>사번</td>
<td >@사번사번@</td>
<td><input type="button" value="사원 찾기" onclick="" name="" id=""/></td>
<td>이름</td>
<td><input type="text"  ></td>
</tr>
<tr>
<td>생년월일</td>
<td colspan="2"><input type="text" class="datepicker2" id="datepicker2"  value="" /></td>
<td>연락처</td>
<td><input type="text"  ></td>
</tr>
<tr>
<td>이메일</td>
<td colspan="2"><input type="text"  ></td>
<td>비상연락처</td>
<td><input type="text"  ></td>
</tr>
<tr>
<td>우편번호</td>
<td><input type="text" id="emppostcode"/ readonly="readonly"></td>
<td><input type="button" value="우편번호 찾기" onclick="" name="btn1" id="btn1"/></td>
<td>주소</td>
<td><input type="text" id="empadress" readonly="readonly"/></td>
</tr>
<tr>
<td>상세주소</td>
<td colspan="1"><input type="text" id="empdetailadress" /></td>
</tr>
<tr>
<td>입사년월</td>
<td colspan="1"><input type="text" class="datepicker" id="datepicker"  value="" /> </td>
<!-- <td colspan="3"><input type="text" class="datepicker" id="datepicker"  value="@입사년월입사년월@" style="width: 70%"/> <button style="width: 20%" id="abc" >달력</button></td> -->
</tr>
</table>
<div>
<button>신규</button>
<button>수정</button>
<button>삭제</button>
<button>입력</button>
</div>
<!-- <div><input type="text" id="datepicke"></div> -->

<script type="text/javascript" src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js" integrity="sha512-894YE6QWD5I59HgZOGReFYm4dnWc1Qt5NtvYSaNcOP+u1T9qYdvdihz0PPSiiqn/+/3e7Jo4EaG7TubfWGUrMQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js" integrity="sha512-uto9mlQzrs59VwILcLiRYeLKPPbS/bT71da/OEBYEwcdNUk8jYIy+D176RYoop1Da+f9mvkYrmj5MCLZWEtQuA==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.css" integrity="sha512-aOG0c6nPNzGk+5zjwyJaoRUgCdOrfSDhmMID2u4+OIslr0GjpLKo7Xm0Ao3xmpM4T8AmIouRkqwj1nrdVsLKEQ==" crossorigin="anonymous" referrerpolicy="no-referrer" />
</body>
</html>