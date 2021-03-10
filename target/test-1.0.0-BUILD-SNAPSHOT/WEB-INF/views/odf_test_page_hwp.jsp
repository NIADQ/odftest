<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8"/>
<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script src="./resources/js/jquery-3.5.1.min.js"></script>
<title>ODF – 1</title>
<style type="text/css">
	html, body{
		height: 100%;
		margin: 0;
	}
	.header{
		position: relative;
		width: 100%;
		height: 15%;
    	background-color: rgb(217, 215, 213);
	}
	.title{
		position: relative;
		width: 80%;
		background-color: rgba(79,99,105,1);
		white-space: nowrap;
		height: 100%;
    	text-align: left;
    	font-family: NanumGothic;
    	font-style: normal;
    	font-weight: bold;
    	font-size: 38px;
    	color: rgba(255,255,255,1);
    	text-transform: uppercase;
	    line-height: 100px;
	    padding-left: 50px;
	    left: 170px;
	    top: 50px;
	    border-radius: 40px;
	    z-index: 1;
	}
	.body{
		position: relative;
		display: flex;
		height: 85%;
	}
	#findFile{
		cursor: pointer;
	}
	#checkStart{
		cursor: pointer;
	}
	.left{
		width: 485px;
		border-right: 1px solid black;
		display: block;
	}
	.right{
		width: 67%;
		display: block;
	}
	.right-top{
		height: 24%;
		border-bottom: 1px solid black;
	}
	.right-bottom{
		height: 70%;
	}
	.left-content{
		position: relative;
		margin-top: 70px;
		display: block;
		height: 88%;
	}
	.left-content-content{
		margin-bottom: 20px;
	}
	.left-content-content > div{
		height: 20px;
		font-family: NanumGothic;
	    font-style: normal;
	    font-weight: normal;
	    font-size: 14px;
	    color: rgba(112,112,112,1);
	    margin-top: 5px;
	}
	.left-content-content > span{
		padding: 5px;
	}
	#_8_cu {
		fill: rgba(105,138,124,1);
	}
	._8_cu {
		position:relative;
		overflow: visible;
		width: 47.106px;
		height: 44.751px;
		transform: matrix(1,0,0,1,0,0);
	}
	#_8_cx {
		fill: rgba(236,212,120,1);
	}
	._8_cx {
		position: relative;
		overflow: visible;
		width: 47.106px;
		height: 44.751px;
		transform: matrix(1,0,0,1,0,0);
	}
	.left-bottom-content{
		padding: 3% 2% 0% 2%;
	}
	.row{
		display: flex;
		width: 100%;
		margin-bottom: 2%;
	}
	.col{
		background-color: rgba(170,170,170,1);
	    height: 50px;
	    width: 35%;
	    border-radius: 16px;
	    line-height: 50px;
	    color: white;
	    border: 2px solid rgba(112,112,112,1);
	    padding-left: 35px;
	}
	.col-left{
		margin-right: 10%;
	}
	.row > .col > span{
		float: right;
    	margin-right: 30px;
	}
	.wrap-loading { /*화면 전체를 어둡게 합니다.*/
	z-index:1;
    position: fixed;
    left:0;
    right:0;
    top:0;
    bottom:0;
    background: rgba(0,0,0,0.2); /*not in ie */
    filter: progid:DXImageTransform.Microsoft.Gradient(startColorstr='#20000000',endColorstr='#20000000');    /* ie */
	}
    .wrap-loading div { /*로딩 이미지*/
        position: fixed;
        top:50%;
        left:50%;
        margin-left: -21px;
        margin-top: -21px;
    }
    .display-none { /*감추기*/
        display:none;
    }
    @media screen and (max-width: 1224px) {
		.row{
			display: block;
			margin-bottom: 0;
		}
		.col{
			margin-bottom: 2%;
			width: 92%;
		}
	}
</style>
</head>
<body>
<div class="wrap-loading display-none">
<div>
<embed src="./img/loading.svg" type="image/svg+xml">
</div>
</div>
<form id="selectodffile" action="fileupload" method="post" enctype="multipart/form-data">
	<input type="file" class="custom-file-input" id="fileupload" name="fileupload" multiple="multiple" style="display:none">
</form>
<div class="header">
	<div class="title">
		ODF 개방형문서형식 진단도구
	</div>
</div>
<div class="body">
	<div class="left">
		<div class="left-content">
			<div class="left-title" style="display: flex;font-size: 31px;margin-left: 3%;">
				<div style="background-color: rgba(79,99,105,1); width: 45px;color: white;border-radius: 20%;text-align: center;">1</div>
				<div style="margin-left: 2%;white-space: nowrap;text-align: left;font-family: NanumBarunGothic;font-style: normal;font-weight: normal;color: rgba(112,112,112,1);">진단대상파일 열기</div>
				<div id="findFile" style="font-size: 10px;position:relative;left:10px;">
					<svg class="_8_cu" viewBox="2 2 47.106 44.751">
						<path id="_8_cu" d="M 34.97439575195313 11.42126560211182 L 34.97439575195313 6.710631847381592 C 34.97439575195313 4.096230506896973 32.87816619873047 1.999999403953552 30.26376724243164 1.999999403953552 L 20.8425121307373 1.999999403953552 C 18.22811508178711 1.999999403953552 16.13188362121582 4.096230506896973 16.13188362121582 6.710631847381592 L 16.13188362121582 11.42126560211182 L 1.999999523162842 11.42126560211182 L 1.999999523162842 42.04038238525391 C 1.999999523162842 44.65478134155273 4.09622859954834 46.75100708007813 6.71062707901001 46.75100708007813 L 44.39564895629883 46.75100708007813 C 47.01004791259766 46.75100708007813 49.10626983642578 44.65478134155273 49.10626983642578 42.04038238525391 L 49.10626983642578 11.42126560211182 L 34.97439575195313 11.42126560211182 Z M 20.8425121307373 6.710631847381592 L 30.26376724243164 6.710631847381592 L 30.26376724243164 11.42126560211182 L 20.8425121307373 11.42126560211182 L 20.8425121307373 6.710631847381592 Z M 18.48719787597656 39.68506240844727 L 18.48719787597656 18.48721504211426 L 36.15204620361328 27.90848159790039 L 18.48719787597656 39.68506240844727 Z">
						</path>
					</svg>
				</div>
			</div>
			<div style="margin-left: 50px;">
				<div style="white-space: nowrap;text-align: left;font-family: Segoe UI;font-style: normal;font-weight: normal;font-size: 18px;color: rgba(112,112,112,1);margin: 5%;">
					문서 정보 요약
				</div>
				<div class="left-content-content">
					<span style="background-color: #eee;">파일 이름</span>
					<div id="fileName"></div>
				</div>
				<div class="left-content-content">
					<span style="background-color: #eee;">파일 형식</span>
					<div id="fileStat"></div>
				</div>
				<div class="left-content-content">
					<span style="background-color: #eee;">크기</span>
					<div id="fileSize"></div>
				</div>
				<div class="left-content-content">
					<span style="background-color: #eee;">수정한 날짜</span>
					<div id="fileModiDate"></div>
				</div>
				<div class="left-content-content">
					<span style="background-color: #eee;">이미지 갯 수</span>
					<div id="useImage"></div>
				</div>
				<div class="left-content-content">
					<span style="background-color: #eee;">테이블 갯 수</span>
					<div id="useTable"></div>
				</div>
			</div>
		</div>
	</div>
	<div class="right">
		<div class="right-top">
			<div style="position: relative;top: 50%;left: 2%;">
				<div class="right-title" style="display: flex;font-size: 31px;height: 45px;">
					<div style="background-color: rgba(79,99,105,1); width: 45px;color: white;border-radius: 20%;text-align: center;">2</div>
					<div style="margin-left: 2%;white-space: nowrap;text-align: left;font-family: NanumBarunGothic;font-style: normal;font-weight: normal;color: rgba(112,112,112,1);">진단실행 시작</div>
					<div style="font-size: 10px;position:relative;left:10px;" id="checkStart">
						<svg class="_8_cx" viewBox="2 2 47.106 44.751">
							<path id="_8_cx" d="M 34.97439575195313 11.42126560211182 L 34.97439575195313 6.710631847381592 C 34.97439575195313 4.096230506896973 32.87816619873047 1.999999403953552 30.26376724243164 1.999999403953552 L 20.8425121307373 1.999999403953552 C 18.22811508178711 1.999999403953552 16.13188362121582 4.096230506896973 16.13188362121582 6.710631847381592 L 16.13188362121582 11.42126560211182 L 1.999999523162842 11.42126560211182 L 1.999999523162842 42.04038238525391 C 1.999999523162842 44.65478134155273 4.09622859954834 46.75100708007813 6.71062707901001 46.75100708007813 L 44.39564895629883 46.75100708007813 C 47.01004791259766 46.75100708007813 49.10626983642578 44.65478134155273 49.10626983642578 42.04038238525391 L 49.10626983642578 11.42126560211182 L 34.97439575195313 11.42126560211182 Z M 20.8425121307373 6.710631847381592 L 30.26376724243164 6.710631847381592 L 30.26376724243164 11.42126560211182 L 20.8425121307373 11.42126560211182 L 20.8425121307373 6.710631847381592 Z M 18.48719787597656 39.68506240844727 L 18.48719787597656 18.48721504211426 L 36.15204620361328 27.90848159790039 L 18.48719787597656 39.68506240844727 Z">
							</path>
						</svg>
					</div>
				</div>
			</div>
		</div>
		<div class="right-bottom">
			<div style="padding: 2% 2% 0% 2%;">
				<div class="right-title" style="display: flex;font-size: 31px;height: 45px;">
					<div style="background-color: rgba(79,99,105,1); width: 45px;color: white;border-radius: 20%;text-align: center;">3</div>
					<div style="margin-left: 2%;white-space: nowrap;text-align: left;font-family: NanumBarunGothic;font-style: normal;font-weight: normal;color: rgba(112,112,112,1);">진단결과 요약</div>
				</div>
				<div class="left-bottom-content">
					<div class="row">
						<div class="col col-left" id="_9" title="자간 간격이 -19~19 허용">자간 및 간격 구간 준수 <span id="ID10"></span></div>
						<div class="col" id="_14" title="표 캡션 갯 수">'캡션' 사용 금지 <span id="ID0_cp"></span></div>
					</div>
					<div class="row">
						<div class="col col-left" id="_10" title="개발 예정">특수문자(기호) 준수 <span id="ID0"></span></div>
						<div class="col" id="_15" title="점선, 테두리 없음, 대각선 갯 수">표 테두리 '실선' 준수 <span id="ID0_cq"></span></div>
					</div>
					<div class="row">
						<div class="col col-left" id="_11" title="병합한 셀 총 갯 수">셀 병합 준수 <span id="ID10_b"></span></div>
						<div class="col" id="_16" title="개발 예정">표 배경 준수 <span id="ID10_cb"></span></div>
					</div>
					<div class="row">
						<div class="col col-left" id="_12" title='"함초롬바탕", "함초롬바탕 굵게", "함초롬바탕 확장", "함초롬바탕 확장B", "함초롬바탕 확장 굵게", "함초롬돋움", "함초롬돋움 굵게", "함초롬돋움 확장", "한컴산뜻돋움", "Haan Wings 2", "HancomEQN", "바탕", "바탕체", "돋움", "돋움체", "굴림", "굴림체", "궁서", "궁서체", "맑은 고딕" 제외'>기본 글꼴 사용 준수 <span id="ID0_co"></span></div>
						<div class="col" id="_17" title="개발 예정">이미지 국제표준 포맷 활용 <span id="ID10_cc"></span></div>
					</div>
					<div class="row">
						<div class="col col-left" id="_13" title="개발 예정">'글자처럼 취급' 준수 <span id="ID10_ca"></span></div>
						<div class="col" id="_18" title="개발 예정">특정수식 사용 지양 <span id="ID10_cd"></span></div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<div style="display: none;">
	<form name="HwpControl">
		<OBJECT id=HwpCtrl style="LEFT: 0px; TOP: 0px" height=600 width=700 align=center 
		classid=CLSID:BD9C32DE-3155-4691-8972-097D53B10052>
			<PARAM NAME="_Version" VALUE="65536">
			<PARAM NAME="_ExtentX" VALUE="21167">
			<PARAM NAME="_ExtentY" VALUE="15875">
			<PARAM NAME="_StockProps" VALUE="0">
			<PARAM NAME="FILENAME" VALUE="">
		</OBJECT>
	</form>
</div>
</body>
<script type="text/javascript" language="javascript">
var OdfApp = function () {
	Date.prototype.format = function (f) {
	    if (!this.valueOf()) return " ";
	    var weekKorName = ["일요일", "월요일", "화요일", "수요일", "목요일", "금요일", "토요일"];
	    var weekKorShortName = ["일", "월", "화", "수", "목", "금", "토"];
	    var weekEngName = ["Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"];
	    var weekEngShortName = ["Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat"];
	    var d = this;
	
	    return f.replace(/(yyyy|yy|MM|dd|KS|KL|ES|EL|HH|hh|mm|ss|a\/p)/gi, function ($1) {
	        switch ($1) {
	            case "yyyy": return d.getFullYear(); // 년 (4자리)
	            case "yy": return (d.getFullYear() % 1000).zf(2); // 년 (2자리)
	            case "MM": return (d.getMonth() + 1).zf(2); // 월 (2자리)
	            case "dd": return d.getDate().zf(2); // 일 (2자리)
	            case "KS": return weekKorShortName[d.getDay()]; // 요일 (짧은 한글)
	            case "KL": return weekKorName[d.getDay()]; // 요일 (긴 한글)
	            case "ES": return weekEngShortName[d.getDay()]; // 요일 (짧은 영어)
	            case "EL": return weekEngName[d.getDay()]; // 요일 (긴 영어)
	            case "HH": return d.getHours().zf(2); // 시간 (24시간 기준, 2자리)
	            case "hh": return ((h = d.getHours() % 12) ? h : 12).zf(2); // 시간 (12시간 기준, 2자리)
	            case "mm": return d.getMinutes().zf(2); // 분 (2자리)
	            case "ss": return d.getSeconds().zf(2); // 초 (2자리)
	            case "a/p": return d.getHours() < 12 ? "오전" : "오후"; // 오전/오후 구분
	            default: return $1;
	        }
	    });
	};
	
	String.prototype.string = function (len) { var s = '', i = 0; while (i++ < len) { s += this; } return s; };
	String.prototype.zf = function (len) { return "0".string(len - this.length) + this; };
	Number.prototype.zf = function (len) { return this.toString().zf(len); };
	
    return{
        init: function (){
        	fnEvent();
        	OnStart();
	    }
    };
    
    function fnEvent(){
    	$("#findFile").on("click",function(){
    		$("#fileupload").click();
    	});
    	
    	// file select
    	$("#fileupload").change(function(e){
//    		var formData = new FormData($("#selectodffile")[0]);
    		var formData = new FormData();		
    		var fileName;
    		var fileExt;
    		var fileSize_b;
    		var fileSize_kb;
    		var filetype;
    		var fileLastModifiedDate;
    		var filedat;
    		
     		$($("#fileupload")[0].files).each(function(index, file) { 		
    				fileName = file.name;
     				fileExt = file.name.substring(file.name.lastIndexOf('.') + 1, file.name.length).toLowerCase();
     				fileSize_b = file.size;
     				fileSize_kb = file.size / 1024;
     				filetype = file.type;
     				
     				if (file.lastModified) {
     				fileLastModifiedDate = file.lastModified;												
					}else {
     				fileLastModifiedDate = file.lastModifiedDate;												
					}
     				filedate = new Date(fileLastModifiedDate);
     				
     			// hwp 파일일 경우
    /*  			if (file.name.substring(file.name.lastIndexOf('.'), file.name.length).toLowerCase() == '.hwp') {

    			}; 
    */			
    			// files formdata set
     			formData.append("fileupload", file);		
    			formData.append("path", $("#fileupload").val());
        	   });

     		if(fileExt != "hwp"){
				alert(".hwp 파일을 첨부해주세요.");
				return false;
			}
     		
     		HwpControl.HwpCtrl.Open(document.getElementById('fileupload').value, "HWP");	
			convertFileName = $("#fileupload").val().substring(0 ,$("#fileupload").val().lastIndexOf(".") + 1) + 'hml';

			if (HwpControl.HwpCtrl.SaveAs(convertFileName, "HWPML2X")) {
				alert("변환성공");
				var filePath = convertFileName;
			}else{
				alert("변환실패");
			}
			
//     		$("#document_info").show();
     		
    		// fileupload
    		$.ajax({ 
    			type: 'POST', 
    			url: 'odfFileSelect_hwp', 
    			processData: false, // 필수
    			contentType: false, // 필수
    			data: formData, 
    			success: function(data) { 				
    				// after coding
    		 		// fileinfo set
    		 		$("#fileName").text(fileName);
    		 		$("#fileStat").text( fileExt + filetype.substring(filetype.lastIndexOf('/'), filetype.length));
    		 		$("#fileSize").text(fileSize_kb.toFixed(0).toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",")
    		 				+ " KB ("+ fileSize_b.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",") + " 바이트)");		 		
    		 		$("#fileModiDate").text(filedate.format("yyyy년 MM월 dd일(KS) a/p hh:mm:ss"));
    		 		$("#useImage").text(data.useImage + " 개");
    		 		$("#useTable").text(data.useTable + " 개");
    		 		$(".left-content-content").children("div").css("text-decoration-line","underline");
    		 		
    			}
    			,beforeSend:function(){	
    		     	//(로딩 이미지 보여주기 처리)	
    		        $('.wrap-loading').removeClass('display-none');	
    		    }
    	
    		    ,complete:function(){	
    		    	//(로딩 이미지 감추기 처리)	
    		        $('.wrap-loading').addClass('display-none');	
    		    }
    	
    		    ,error:function(e){	
    		        //조회 실패일 때 처리	
    		    }
    		});
    	

    	});
    	
    	//월요일 해야될거
    	
    	
    	//test_button_click
    	$('#checkStart').click(function(){
    		var cnt_zero = 'rgba(170,170,170,1)';
    		var cnt_zero_over = 'rgba(111,132,160,1)';
    		
    		//init
    		// 자간
    		$("#_9").css('fill',cnt_zero);
    		$("#ID10").text(' ');

    		// 특수문자
    		$("#_10").css('fill',cnt_zero);		
    		$("#ID0").text(' ');
    		
    		// 셀 병합 준수
    		$("#_11").css('fill',cnt_zero);
    		$("#ID10_b").text(' ');
    		
    		// 기본글꼴 사용준수
    		$("#_12").css('fill',cnt_zero);
    		$("#ID0_co").text(' ');
    		
    		// 글자처럼 취급
    		$("#_13").css('fill',cnt_zero);
    		$("#ID10_ca").text(' ');
    		
    		// 캡션 금지
    		$("#_14").css('fill',cnt_zero);
    		$("#ID0_cp").text(' ');
    		
    		// 표 테두리 실선 준수
    		$("#_15").css('fill',cnt_zero);
    		$("#ID0_cq").text(' ');
    		
    		// 표 배경 준수
    		$("#_16").css('fill',cnt_zero);
    		$("#ID10_cb").text(' ');
    		
    		// 이미지 국제표준 포맷 활용
    		$("#_17").css('fill',cnt_zero);
    		$("#ID10_cc").text(' ');
    		
    		// 특정수식 사용 지양
    		$("#_18").css('fill',cnt_zero);
    		$("#ID10_cd").text(' ');
    		
    		var formData = new FormData();		
     		$($("#fileupload")[0].files).each(function(index, file) { 
     			formData.append("fileupload", file);		   		
     			formData.append("path", $("#fileupload").val());
    		});
    		
     		$.ajax({ 
    			type: 'POST', 
    			url: 'odfFileTestStart_hwp', 
    			processData: false, // 필수
    			contentType: false, // 필수
    			data: formData, 
    			success: function(data) {
    				
    				//init
    				// 자간
    				$("#ID10").text('0건');

    				// 특수문자
    				$("#ID0").text('0건');
    				
    				// 셀 병합 준수
    				$("#ID10_b").text('0건');
    				
    				// 기본글꼴 사용준수
    				$("#ID0_co").text('0건');
    				
    				// 글자처럼 취급
    				$("#ID10_ca").text('0건');
    				
    				// 캡션 금지
    				$("#ID0_cp").text('0건');
    				
    				// 표 테두리 실선 준수
    				$("#ID0_cq").text('0건');
    				
    				// 표 배경 준수
    				$("#ID10_cb").text('0건');
    				
    				// 이미지 국제표준 포맷 활용
    				$("#ID10_cc").text('0건');
    				
    				// 특정수식 사용 지양
    				$("#ID10_cd").text('0건');
    				
    				// 자간
    				if (data.letterSpacingChkCnt > 0 ) {
    					$("#_9").css('background-color',cnt_zero_over);		
    					$("#ID10").text(data.letterSpacingChkCnt + '건');
    					$("#ID10").css("cursor","pointer");
    					$("#ID10").css('text-decoration-line','underline');
    				}
    				
    				// 특수문제
    /* 				if (data.특수문제 > 0 ) {
    					$("#_10").css('background-color',cnt_zero_over);		
    					$("#ID0").text(data.특수문제 + '건');
    					$("#ID0").css('text-decoration-line','underline');
    				}			
    */		
    				// 셀 병합 준수
     				if (data.gridChkCnt > 0 ) {
    					$("#_11").css('background-color',cnt_zero_over);		
    					$("#ID10_b").text(data.gridChkCnt + '건');
    					$("#ID10_b").css("cursor","pointer");
    					$("#ID10_b").css('text-decoration-line','underline');		
    				}				
    				
     				// 기본 글꼴 사용 준수
    				if (data.fontChkCnt > 0 ) {
    					$("#_12").css('background-color',cnt_zero_over);		
    					$("#ID0_co").text(data.fontChkCnt + '건');
    					$("#ID0_co").css("cursor","pointer");
    					$("#ID0_co").css('text-decoration-line','underline');		
    				}

    				// 글자처럼 취급
    /* 				if (data.글자처럼 취급 > 0 ) {
    					$("#_13").css('fill',cnt_zero_over);		
    					$("#ID10_ca").text(data.글자처럼 취급 + '건');
    					$("#ID10_ca").css('text-decoration-line','underline');		
    				}
     */
    				// 캡션 금지
    				if (data.captionChkCnt > 0 ) {
    					$("#_14").css('background-color',cnt_zero_over);		
    					$("#ID0_cp").text(data.captionChkCnt + '건');
    					$("#ID0_cp").css("cursor","pointer");
    					$("#ID0_cp").css('text-decoration-line','underline');		
    				}

    				// 표 테두리 실선 준수
    				if (data.tbBdrSoildChkCnt > 0 ) {
    					$("#_15").css('background-color',cnt_zero_over);		
    					$("#ID0_cq").text(data.tbBdrSoildChkCnt + '건');
    					$("#ID0_cq").css("cursor","pointer");
    					$("#ID0_cq").css('text-decoration-line','underline');		
    				}

    				// 표 배경 준수
    /* 				if (data.표 배경 준수 > 0 ) {
    					$("#_16").css('background-color',cnt_zero_over);		
    					$("#ID10_cb").text(data.표 배경 준수 + '건');
    					$("#ID10_cb").css('text-decoration-line','underline');		
    				}
     */
    				// 이미지 국제표준 포맷 활용
    /* 				if (data.이미지 국제표준 포맷 활용 > 0 ) {
    					$("#_17").css('background-color',cnt_zero_over);		
    					$("#ID10_cc").text(data.이미지 국제표준 포맷 활용 + '건');
    					$("#ID10_cc").css('text-decoration-line','underline');		
    				}
     */
    				// 특정수식 사용 지양
    /* 				if (data.특정수식 사용 > 0 ) {
    					$("#_18").css('background-color',cnt_zero_over);		
    					$("#ID10_cd").text(data.특정수식 사용 + '건');
    					$("#ID10_cd").css('text-decoration-line','underline');
    				}
     */				
     				
     				
    				//alert('진단 완료');
//    				$('#document_test_result').show();

    				// 나중에 지우고 Line:557 주석해제 바람
     				alert('진단 완료 \n 특수문자, 표 배경 준수, 이미지 국제표준, 글자처럼 취급, 특정수식은 개발 예정입니다.');
     				$("#ID10").on("click",function(){
     					alert("미리보기 미구현");
     				});
     				$("#ID10_b").on("click",function(){
     					alert("미리보기 미구현");
     				});
     				$("#ID0_co").on("click",function(){
     					alert("미리보기 미구현");
     				});
     				$("#ID0_cp").on("click",function(){
     					alert("미리보기 미구현");
     				});
     				$("#ID0_cq").on("click",function(){
     					alert("미리보기 미구현");
     				});
    			}
    		,beforeSend:function(){	
    	     	//(로딩 이미지 보여주기 처리)	
    	        $('.wrap-loading').removeClass('display-none');	
    	    }

    	    ,complete:function(){	
    	    	//(로딩 이미지 감추기 처리)	
    	        $('.wrap-loading').addClass('display-none');	
    	    }

    	    ,error:function(e){	
    	        //조회 실패일 때 처리	
    	    	alert('진단 실패');
    	    }
    		});		
    	});
    }
    
    
}();

$(document).ready(function(){
	// 크롬 체크
	var agent = navigator.userAgent.toLowerCase();
	if (agent.indexOf("chrome") != -1) {
	  alert("IE에서 실행시켜주세요");
	}
	OdfApp.init();
});
</script>
<script type="text/javascript" language="javascript">
var MinVersion =  0x0505010B; // SetGetTextFile 최소 버젼.
var pHwpCtrl;

function OnStart()
{
 pHwpCtrl = HwpControl.HwpCtrl;
 if (!_VerifyVersion())
 {
  pHwpCtrl = null;
  return;
 }
 
/*  HwpControl.HwpCtrl.SetClientName("DEBUG"); //For debug message */
 InitToolBarJS();
 
}
function _VerifyVersion()
{
 // 설치확인
 if(pHwpCtrl.getAttribute("Version") == null)
 {
  //alert("한글 2002 컨트롤이 설치되지 않았습니다.");
  //return false;
 }
 //버젼 확인
 CurVersion = pHwpCtrl.Version;
 if(CurVersion < MinVersion)
 {
  alert("HwpCtrl의 버젼이 낮아서 정상적으로 동작하지 않을 수 있습니다.\n"+
   "최신 버젼으로 업데이트하기를 권장합니다.\n\n"+
   "현재 버젼: 0x" + CurVersion.toString(16) + "\n"+
   "권장 버젼: 0x" + MinVersion.toString(16) + " 이상"   
   );
  return false;
 }
 if(CurVersion >= 0x0505118 && CurVersion <= 0x050511C ) // GetTextFile 동작시 오류 발생
 {
  alert("HwpCtrl.GetTextFile이 정상적으로 동작하지 않는 버젼입니다.\n"+
   "최신 버젼으로 업데이트하기를 권장합니다.\n\n"+
   "현재 버젼: 0x" + CurVersion.toString(16) + "\n"+
   "권장 버젼: " + 0x050511D + " 이상"   
   );
  return false;
 }
 return true;
}

function InitToolBarJS()
{
 HwpControl.HwpCtrl.SetToolBar(-1, "TOOLBAR_MENU");
 HwpControl.HwpCtrl.SetToolBar(-1, "TOOLBAR_STANDARD");
 HwpControl.HwpCtrl.SetToolBar(-1, "TOOLBAR_FORMAT");
 HwpControl.HwpCtrl.SetToolBar(-1, "TOOLBAR_DRAW");
 HwpControl.HwpCtrl.ShowToolBar(true);
 HwpControl.HwpCtrl.ShowStatusBar(1);
}
 


/* $(function(){
	//변환 파일 선택시 변환 시작
	$("#fileupload").change(function(e){ 
	 	HwpControl.HwpCtrl.Open(document.getElementById('fileupload').value, "HWP");	
			convertFileName = $("#fileupload").val().substring(0 ,$("#fileupload").val().lastIndexOf(".") + 1) + 'hml';

			if (HwpControl.HwpCtrl.SaveAs(convertFileName, "HWPML2X")) {
				alert("변환성공");
			}else{
				alert("변환실패");
			}
	 });
}); */
</script>
</html>