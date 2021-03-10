<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ODF 메뉴얼</title>
<style type="text/css">
	.command-name{
		float: left;
		margin-right: 5px;
	}
	.command > fieldset > div{
		width: 100%;
	}
	.command > fieldset > div > div{
		width: 80%;
		overflow: auto;
	}
</style>
</head>
<body>
<h1>사용법  및 진단기준 상세</h1>
<section style="text-align: center;">
	<fieldset style="margin: 0 14%;">
		<legend>
			<h1>사용법</h1>
		</legend>
		<div>1. '진단대상파일 열기' 우측 <b>초록색 아이콘</b>을 눌러줍니다.</div>
		<img src="./img/manual/manual0.png" width="860"><br>
		<div>2. 다음과 같이 확장자가 <b>hwp</b>인 파일을 선택합니다.</div>
		<img src="./img/manual/manual1.png" width="860"><br>
		<div style="margin-top: 20px;">3. 다음과 같은 알림창에서 <b>'접근 허용'</b> 두 번 또는<b>'모두 허용'</b> 한 번 클릭합니다.</div>
		<img src="./img/manual/manual2.png" ><br>
		<div style="margin-top: 20px;">4. 다음 알림창에서 <b>'확인'</b>을 누르면 파일에 대한 정보가 나옵니다.</div>
		<img src="./img/manual/manual3.png"><br>
		<div style="margin-top: 20px;">5. '진단실행 시작' 우측 <b>노란색 아이콘</b>을 눌러줍니다.</div>
		<img src="./img/manual/manual4.png" width="860"><br>
		<div style="margin-top: 20px;">6. 다음과 같이 확장자가 <b>hml</b>인 파일을 선택합니다.</div>
		<img src="./img/manual/manual5.png" width="860">
		<div style="margin-top: 20px;">7. 다음 알림창에서 <b>'확인'</b>을 누르면 진단실행의 결과가 나옵니다.</div>
		<img src="./img/manual/manual6.png"><br>
		<img src="./img/manual/manual7.png" width="860">
	</fieldset>
</section>
<section class="command">
	<fieldset style="margin: 0 14%;">
		<legend>
			<h2>진단 기준</h2>
		</legend>
		<img src="./img/command.png" width="100%">
		<div>
			<span class="command-name">1. 자간 및 간격 구간 준수 :</span>
			<div>자간 간격이 -19~19 허용</div>
		</div>
		<div>
			<span class="command-name">2. 특수문자(기호)준수 :</span>
			<div>Unicode(유니코드)특수문자를 제외한 문자</div>
		</div>
		<div>
			<span class="command-name">3. '캡션' 사용 금지 :</span>
			<div>표 캡션 갯 수</div>
		</div>
		<div>
			<span class="command-name">4. 기본 글꼴 사용 준수 :</span>
			<div>"함초롬바탕", "함초롬바탕 굵게", "함초롬바탕 확장", "함초롬바탕 확장B", "함초롬바탕 확장 굵게", "함초롬돋움", "함초롬돋움 굵게", "함초롬돋움 확장", "한컴산뜻돋움", "Haan Wings 2", "HancomEQN", "바탕", "바탕체", "돋움", "돋움체", "굴림", "굴림체", "궁서", "궁서체", "맑은 고딕" 제외</div>
		</div>
		<div>
			<span class="command-name">5. '글자처럼 취급' 준수 :</span>
			<div>글자처럼 취급한  element의 갯 수</div>
		</div>
		<div>
			<span class="command-name">6. 양각, 음각 지양 :</span>
			<div>아래아한글—글자모양(속성) “양각”, “음각” 기능 사용 지양</div>
		</div>
		<div>
			<span class="command-name">7. 셀 병합 준수 :</span>
			<div>병합한 셀 총 갯 수</div>
		</div>
		<div>
			<span class="command-name">8. 표 테두리'실선'준수 :</span>
			<div>점선, 테두리 없음, 대각선 갯 수</div>
		</div>
		<div>
			<span class="command-name">9. 표 배경 준수 :</span>
			<div>그라데이션 및 배경색 위반</div>
		</div>
		<div>
			<span class="command-name">10. 이미지 국제표준 포멧 활용 :</span>
			<div>jpg, jpeg, bmp, gif, png를 제외한 나머지 확장명의 이미지파일</div>
		</div>
		<div>
			<span class="command-name">11. 하이퍼링크, 매크로, 수식 사용지양 :</span>
			<div>특정수식 사용 지양</div>
		</div>
		<div>
			<span class="command-name">12. 도형 :</span>
			<div>단독사용 외 활용을 지양하고 필요 시 이미지 혹은 표를 활용</div>
		</div>
	</fieldset>
</section>
<br>
<section>
	<fieldset style="margin: 0 14%;">
		<legend><b>기준 미준수 대상 표기 패턴별 분류</b></legend>
		<div>&lt;기준미준수 텍스트 표기&gt;</div>
		<div>자간 및 간격 구간 준수</div>
		<div><b>특수문자(기호) 준수   &lt;-  특수문자는 비어있는 부분 카피해서 아래아한글 내에서 붙여넣기하면 보입니다.</b></div>
		<div>'캡션' 사용 금지 </div>
		<div>기본 글꼴 사용 준수</div>
		<div>'글자처럼 취급' 준수 </div>
		<div>하이퍼링크, 매크로, 수식 사용 지양</div> 
		<div>양각, 음각 지양</div>
		
		<div>&lt;기준 미준수 표-행-열 표기&gt;</div>
		<div>셀 병합 준수 </div>
		<div>표 테두리 '실선' 준수 </div>
		<div>표 배경 준수 </div>
		
		<div>&lt;기준 미준수 개체설명문 표기&gt;</div>
		<div>이미지 국제표준 포맷 활용 </div>
		<div>도형</div>
	</fieldset>
</section>
<br>
<section>
	<fieldset style="margin: 0 14%;">
		<legend><b>정부기관 보도자료 ODF</b></legend>
		<a href="./resources/200802_정부기관 보도자료 ODF 변환 교육_v2.pdf" download>200802_정부기관 보도자료 ODF 변환 교육_v2.pdf</a>
	</fieldset>
</section>
</body>
</html>