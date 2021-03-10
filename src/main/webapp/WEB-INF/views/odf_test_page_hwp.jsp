<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8"/>
<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" type="text/css" href="./resources/slick/slick.css">
<link rel="stylesheet" type="text/css" href="./resources/slick/slick-theme.css">
<script src="./resources/js/jquery-3.5.1.min.js"></script>
<script src="./resources/slick/slick.js" type="text/javascript" charset="utf-8"></script>
<script src="./resources/slick/slick.min.js" type="text/javascript" charset="utf-8"></script>
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
	    width: 40%;
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
    /* slick-slider */
    .back-black{
    	background-color: black;
    	position: absolute;
    	top: 0;
    	left: 0;
    	z-index: 10;
    	opacity: 0.5;
    	width: 100%;
    	height: 100%;
    }
    .slider {
        width: 50%;
        margin: 10% auto;
        position: relative;
        opacity: 1;
        z-index: 11;
    }

    .slick-slide {
      margin: 0px 20px;
      z-index: 11;
    }

    /* .slick-slide img {
      width: 100%;
      z-index: 11;
    } */
    .slick-slide div {
      width: 100%;
      z-index: 11;
      height: 300px !important;
      overflow-wrap: anywhere;
      overflow-y: scroll;
      background-color: #eee;
      -ms-user-select: text; 
	  -moz-user-select: -moz-text;
	  -khtml-user-select: text;
	  -webkit-user-select: text;
      user-select: text;
    }

    .slick-prev:before,
    .slick-next:before {
      color: #0099ff;
      z-index: 11;
    }


    .slick-slide {
      transition: all ease-in-out .3s;
      opacity: .2;
      z-index: 11;
    }
    
    .slick-active {
      opacity: .5;
      z-index: 11;
    }

    .slick-current {
      opacity: 1;
      z-index: 11;
    }
    @media screen and (max-width: 1460px) {
		.row{
			display: block;
			margin-bottom: 0;
		}
		.col{
			margin-bottom: 2%;
			width: 92%;
		}
	}
	.modal{
		display: none;
		width: 100%;
		height:100%;/*포지션을 사용하면, 직계부모가 브라우저의 높이가 된다.*/
		background: rgba(0,0,0,0.3);
		position: fixed; /*스크롤에 영향을 받지 않는다.*/
		top: 0px ;
		right: 0px; /* 자바스크립트로 모달을 켰다 끈다. display:block; display:none;*/
		z-index: 10;
	}
</style>
</head>
<body>
<div class="modal">
	<section class="variable slider">
		
	</section>
</div>
<div class="wrap-loading display-none">
<div>
<embed src="./img/loading.svg" type="image/svg+xml">
</div>
</div>
<form id="selectodffile" action="fileupload" method="post" enctype="multipart/form-data">
	<input type="file" class="custom-file-input" id="fileupload" name="fileupload" multiple="multiple" style="display:none">
</form>
<form id="odfcheck" action="filecheck" method="post" enctype="multipart/form-data">
	<input type="file" class="custom-file-input" id="filecheck" name="fileupload" multiple="multiple" accept=".hml" style="display:none">
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
					<div style="margin-right: 15px;">
						<span style="font-size: 15px;">사용된 이미지 갯수:</span>
						<span id="useImage" style="font-size: 16px;"></span>
					</div>
					<div class="">
						<span style="font-size: 15px;">사용된 표 갯수:</span>
						<span id="useTable" style="font-size: 16px;"></span>
					</div>
				</div>
				<div class="left-bottom-content">
					<div class="row">
						<div class="col col-left" id="_9" title="자간 간격이 -19~19 허용">자간 및 간격 구간 준수 <span id="ID10"></span></div>
						<div class="col" id="_11" title="병합한 셀 총 갯 수">셀 병합 준수 <span id="ID10_b"></span></div>
					</div>
					<div class="row">
						<div class="col col-left" id="_10" title="Unicode(유니코드)특수문자를 제외한 문자">특수문자(기호) 준수 <span id="ID0"></span></div>
						<div class="col" id="_15" title="점선, 테두리 없음, 대각선 갯 수">표 테두리 '실선' 준수 <span id="ID0_cq"></span></div>
					</div>
					<div class="row">
						<div class="col col-left" id="_14" title="표 캡션 갯 수">'캡션' 사용 금지 <span id="ID0_cp"></span></div>
						<div class="col" id="_16" title="그라데이션 및 배경색 위반">표 배경 준수 <span id="ID10_cb"></span></div>
					</div>
					<div class="row">
						<div class="col col-left" id="_12" title='"함초롬바탕", "함초롬바탕 굵게", "함초롬바탕 확장", "함초롬바탕 확장B", "함초롬바탕 확장 굵게", "함초롬돋움", "함초롬돋움 굵게", "함초롬돋움 확장", "한컴산뜻돋움", "Haan Wings 2", "HancomEQN", "바탕", "바탕체", "돋움", "돋움체", "굴림", "굴림체", "궁서", "궁서체", "맑은 고딕" 제외'>기본 글꼴 사용 준수 <span id="ID0_co"></span></div>
						<div class="col" id="_17" title="jpg, jpeg, bmp, gif, png를 제외한 나머지 확장명의 이미지파일">이미지 국제표준 포맷 활용 <span id="ID10_cc"></span></div>
					</div>
					<div class="row">
						<div class="col col-left" id="_13" title="글자처럼 취급한  element의 갯 수">'글자처럼 취급' 준수 <span id="ID10_ca"></span></div>
						<div class="col" id="_18" title="특정수식 사용 지양">하이퍼링크, 매크로, 수식 사용 지양 <span id="ID10_cd"></span></div>
					</div>
					<div class="row">
						<div class="col col-left" id="_19" title="아래아한글—글자모양(속성) “양각”, “음각” 기능 사용 지양">양각, 음각 지양<span id="plusMinerDeg"></span></div>
						<div class="col" id="_20" title="단독사용 외 활용을 지양하고 필요 시 이미지 혹은 표를 활용">도형<span id="figure"></span></div>
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
	    }
    };
    
    function fnEvent(){
    	$("#findFile").on("click",function(){
    		$("#fileupload").click();
    	});
    	$(".slick-arrow, .slick-dots > li, .slick-slide, .slick-list, .slider").on("click",function(e){
    		e.preventDefault();
    		e.stopPropagation();
    	});
    	$(".modal").on("click",function(e){
    		e.preventDefault();
    		e.stopPropagation();
    		$('.slider').slick("unslick");
    		$(".modal").hide();
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
    		var cnt_zero = 'rgba(170,170,170,1)';
    		
    		// 자간
    		$("#_9").css('background-color',cnt_zero);
    		$("#ID10").text(' ');

    		// 특수문자
    		$("#_10").css('background-color',cnt_zero);		
    		$("#ID0").text(' ');
    		
    		// 셀 병합 준수
    		$("#_11").css('background-color',cnt_zero);
    		$("#ID10_b").text(' ');
    		
    		// 기본글꼴 사용준수
    		$("#_12").css('background-color',cnt_zero);
    		$("#ID0_co").text(' ');
    		
    		// 글자처럼 취급
    		$("#_13").css('background-color',cnt_zero);
    		$("#ID10_ca").text(' ');
    		
    		// 캡션 금지
    		$("#_14").css('background-color',cnt_zero);
    		$("#ID0_cp").text(' ');
    		
    		// 표 테두리 실선 준수
    		$("#_15").css('background-color',cnt_zero);
    		$("#ID0_cq").text(' ');
    		
    		// 표 배경 준수
    		$("#_16").css('background-color',cnt_zero);
    		$("#ID10_cb").text(' ');
    		
    		// 이미지 국제표준 포맷 활용
    		$("#_17").css('background-color',cnt_zero);
    		$("#ID10_cc").text(' ');
    		
    		// 특정수식 사용 지양
    		$("#_18").css('background-color',cnt_zero);
    		$("#ID10_cd").text(' ');
    		
    		// 양각 음각
    		$("#_19").css('background-color',cnt_zero);
    		$("#plusMinerDeg").text(' ');
    		
    		// 도형
    		$("#_20").css('background-color',cnt_zero);
    		$("#figure").text(' ');
    		
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
    				console.log(data);
    				// after coding
    		 		// fileinfo set
    		 		$("#fileName").text(fileName);
    		 		$("#fileStat").text( fileExt + filetype.substring(filetype.lastIndexOf('/'), filetype.length));
    		 		$("#fileSize").text(fileSize_kb.toFixed(0).toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",")
    		 				+ " KB ("+ fileSize_b.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",") + " 바이트)");		 		
    		 		$("#fileModiDate").text(filedate.format("yyyy년 MM월 dd일(KS) a/p hh:mm:ss"));
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
    	$("#checkStart").on("click",function(){
       		$("#filecheck").click();
       	});
    	$('#filecheck').change(function(){
			$($("#filecheck")[0].files).each(function(index, file) { 		
				fileExt = file.name.substring(file.name.lastIndexOf('.') + 1, file.name.length).toLowerCase();
			});

	 		if(fileExt != "hml"){
				alert(".hml 파일을 첨부해주세요.");
				return false;
			}
    		var cnt_zero = 'rgba(170,170,170,1)';
    		var cnt_zero_over = 'rgba(111,132,160,1)';
    		
    		//init
    		// 자간
    		$("#_9").css('background-color',cnt_zero);
    		$("#ID10").text(' ');

    		// 특수문자
    		$("#_10").css('background-color',cnt_zero);		
    		$("#ID0").text(' ');
    		
    		// 셀 병합 준수
    		$("#_11").css('background-color',cnt_zero);
    		$("#ID10_b").text(' ');
    		
    		// 기본글꼴 사용준수
    		$("#_12").css('background-color',cnt_zero);
    		$("#ID0_co").text(' ');
    		
    		// 글자처럼 취급
    		$("#_13").css('background-color',cnt_zero);
    		$("#ID10_ca").text(' ');
    		
    		// 캡션 금지
    		$("#_14").css('background-color',cnt_zero);
    		$("#ID0_cp").text(' ');
    		
    		// 표 테두리 실선 준수
    		$("#_15").css('background-color',cnt_zero);
    		$("#ID0_cq").text(' ');
    		
    		// 표 배경 준수
    		$("#_16").css('background-color',cnt_zero);
    		$("#ID10_cb").text(' ');
    		
    		// 이미지 국제표준 포맷 활용
    		$("#_17").css('background-color',cnt_zero);
    		$("#ID10_cc").text(' ');
    		
    		// 특정수식 사용 지양
    		$("#_18").css('background-color',cnt_zero);
    		$("#ID10_cd").text(' ');
    		
    		// 양각 음각
    		$("#_19").css('background-color',cnt_zero);
    		$("#plusMinerDeg").text(' ');
    		
    		// 도형
    		$("#_20").css('background-color',cnt_zero);
    		$("#figure").text(' ');
    		
    		var formData = new FormData();		
     		$($("#filecheck")[0].files).each(function(index, file) { 
     			formData.append("fileupload", file);		   		
    		});
    		
     		$.ajax({ 
    			type: 'POST', 
    			url: 'odfFileTestStart_hwp', 
    			processData: false, // 필수
    			contentType: false, // 필수
    			data: formData, 
    			success: function(data) {
    				console.log(data);
    				$("#useImage").text(data.usedImage + " 개");
    		 		$("#useTable").text(data.usedTable + " 개");
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
    				
    				// 양각 음각
    				$("#plusMinerDeg").text('0건');
    				
    				// 도형
    				$("#figure").text('0건');
    				
    				// 자간
    				if (data.letterSpacingChkCnt > 0 ) {
    					$("#_9").css('background-color',cnt_zero_over);		
    					$("#ID10").text(data.letterSpacingChkCnt + '건');
    					$("#ID10").css("cursor","pointer");
    					$("#ID10").css('text-decoration-line','underline');
    					$("#ID10").addClass("result-picture");
    				}
    				
    				// 특수문자
    				if (data.specialCharCnt > 0 ) {
    					$("#_10").css('background-color',cnt_zero_over);		
    					$("#ID0").text(data.specialCharCnt + '건');
    					$("#ID0").css("cursor","pointer");
    					$("#ID0").css('text-decoration-line','underline');
    					$("#ID0").addClass("result-picture");
    				}
    				
    				// 셀 병합 준수
     				if (data.gridChkCnt > 0 ) {
    					$("#_11").css('background-color',cnt_zero_over);		
    					$("#ID10_b").text(data.gridChkCnt + '건');
    					$("#ID10_b").css("cursor","pointer");
    					$("#ID10_b").css('text-decoration-line','underline');
    					$("#ID10_b").addClass("result-picture");
    				}				
    				
     				// 기본 글꼴 사용 준수
    				if (data.fontChkCnt > 0 ) {
    					$("#_12").css('background-color',cnt_zero_over);		
    					$("#ID0_co").text(data.fontChkCnt + '건');
    					$("#ID0_co").css("cursor","pointer");
    					$("#ID0_co").css('text-decoration-line','underline');
    					$("#ID0_co").addClass("result-picture");
    				}

    				// 글자처럼 취급
    				if (data.treatAsCharCnt > 0 ) {
    					$("#_13").css('background-color',cnt_zero_over);		
    					$("#ID10_ca").text(data.treatAsCharCnt + '건');
    					$("#ID10_ca").css("cursor","pointer");
    					$("#ID10_ca").css('text-decoration-line','underline');
    					$("#ID10_ca").addClass("result-picture");
    				}
    				
    				// 캡션 금지
    				if (data.captionChkCnt > 0 ) {
    					$("#_14").css('background-color',cnt_zero_over);		
    					$("#ID0_cp").text(data.captionChkCnt + '건');
    					$("#ID0_cp").css("cursor","pointer");
    					$("#ID0_cp").css('text-decoration-line','underline');
    					$("#ID0_cp").addClass("result-picture");
    				}

    				// 표 테두리 실선 준수
    				if (data.tbBdrSoildChkCnt > 0 ) {
    					$("#_15").css('background-color',cnt_zero_over);		
    					$("#ID0_cq").text(data.tbBdrSoildChkCnt + '건');
    					$("#ID0_cq").css("cursor","pointer");
    					$("#ID0_cq").css('text-decoration-line','underline');
    					$("#ID0_cq").addClass("result-picture");
    				}

    				// 표 배경 준수
    				if (data.tableBackgroundCnt > 0 ) {
    					$("#_16").css('background-color',cnt_zero_over);		
    					$("#ID10_cb").text(data.tableBackgroundCnt + '건');
    					$("#ID10_cb").css("cursor","pointer");
    					$("#ID10_cb").css('text-decoration-line','underline');
    					$("#ID10_cb").addClass("result-picture");
    				}
    				
    				// 이미지 국제표준 포맷 활용
     				if (data.imageFileExtension > 0 ) {
    					$("#_17").css('background-color',cnt_zero_over);		
    					$("#ID10_cc").text(data.imageFileExtension + '건');
    					$("#ID10_cc").css("cursor","pointer");
    					$("#ID10_cc").css('text-decoration-line','underline');
    					$("#ID10_cc").addClass("result-picture");
    				}
    				
    				// 특정수식 사용 지양
    				if (data.equationCnt > 0 ) {
    					$("#_18").css('background-color',cnt_zero_over);		
    					$("#ID10_cd").text(data.equationCnt + '건');
    					$("#ID10_cd").css("cursor","pointer");
    					$("#ID10_cd").css('text-decoration-line','underline');
    					$("#ID10_cd").addClass("result-picture");
    				}
    				
    				// 양각, 음각
    				if (data.plusMinerDegCnt > 0 ) {
    					$("#_19").css('background-color',cnt_zero_over);		
    					$("#plusMinerDeg").text(data.plusMinerDegCnt + '건');
    					$("#plusMinerDeg").css("cursor","pointer");
    					$("#plusMinerDeg").css('text-decoration-line','underline');
    					$("#plusMinerDeg").addClass("result-picture");
    				}
    				
    				// 도형
    				if (data.figureCnt > 0 ) {
    					$("#_20").css('background-color',cnt_zero_over);		
    					$("#figure").text(data.figureCnt + '건');
    					$("#figure").css("cursor","pointer");
    					$("#figure").css('text-decoration-line','underline');
    					$("#figure").addClass("result-picture");
    				}
    				
     				
    				alert('진단 완료');
//    				$('#document_test_result').show();

     				$(".result-picture").on("click",function(){
     					if($(this).attr("id")=="ID10"){//자간
     						var html="";
     						for(var i=0;i<data.checkReason.letterSpacingChk.length;i++){
     							html += "<div><div>"+data.checkReason.letterSpacingChk[i]+"</div></div>";
     						}
     						$(".modal > .slider").html(html);
							$('.slider').slick({
										dots: true,
									infinite: true,
								  draggable : false,
								  touchMove : false,
							});
     						$(".modal").show();
     					}
     					if($(this).attr("id")=="ID10_b"){//셀병합
     						var html="";
     						for(var i=0;i<data.checkReason.gridChk.length;i++){
     							html += "<div><div>"+data.checkReason.gridChk[i]+"</div></div>";
     						}
     						$(".modal > .slider").html(html);
     						$('.slider').slick({
									dots: true,
								infinite: true,
							  draggable : false,
							  touchMove : false,
							});
     						$(".modal").show();
     					}
     					if($(this).attr("id")=="ID0"){//특수문자
     						var html="";
     						for(var i=0;i<data.checkReason.specialChar.length;i++){
     							html += "<div><div>"+data.checkReason.specialChar[i]+"</div></div>";
     						}
     						$(".modal > .slider").html(html);
     						$('.slider').slick({
										dots: true,
									infinite: true,
								  draggable : false,
								  touchMove : false,
							});
     						$(".modal").show();
     					}
     					if($(this).attr("id")=="ID0_cq"){//표 테두리
     						var html="";
     						for(var i=0;i<data.checkReason.tbBdrSoildChk.length;i++){
     							html += "<div><div>"+data.checkReason.tbBdrSoildChk[i]+"</div></div>";
     						}
     						$(".modal > .slider").html(html);
     						$('.slider').slick({
										dots: true,
									infinite: true,
									draggable : false,
									  touchMove : false,
							});
     						$(".modal").show();
     					}
     					if($(this).attr("id")=="ID0_cp"){//캡션
     						var html="";
     						for(var i=0;i<data.checkReason.captionChk.length;i++){
     							html += "<div><div>"+data.checkReason.captionChk[i]+"</div></div>";
     						}
     						$(".modal > .slider").html(html);
     						$('.slider').slick({
										dots: true,
									infinite: true,
									draggable : false,
									  touchMove : false,
							});
     						$(".modal").show();
     					}                       
     					if($(this).attr("id")=="ID10_cb"){//표 배경
     						var html="";
     						for(var i=0;i<data.checkReason.tableBackground.length;i++){
     							html += "<div><div>"+data.checkReason.tableBackground[i]+"</div></div>";
     						}
     						$(".modal > .slider").html(html);
     						$('.slider').slick({
										dots: true,
									infinite: true,
									draggable : false,
									  touchMove : false,
							});
     						$(".modal").show();           
     					}                       
     					if($(this).attr("id")=="ID0_co"){//기본 글꼴
     						var html="";
     						for(var i=0;i<data.checkReason.fontChk.length;i++){
     							html += "<div><div>"+data.checkReason.fontChk[i]+"</div></div>";
     						}
     						$(".modal > .slider").html(html);
     						$('.slider').slick({
										dots: true,
									infinite: true,
									draggable : false,
									  touchMove : false,
							});
     						$(".modal").show();     
     					}                       
     					if($(this).attr("id")=="ID10_cc"){//이미지 국제표준
     						var html="";
     						for(var i=0;i<data.checkReason.imageFile.length;i++){
     							var text = data.checkReason.imageFile[i].replace(/\n/gi, '<br>');
     							html += "<div><div>"+text+"</div></div>";
     						}
     						$(".modal > .slider").html(html);
     						$('.slider').slick({
										dots: true,
									infinite: true,
									draggable : false,
									  touchMove : false,
							});
     						$(".modal").show();      
     					}                       
     					if($(this).attr("id")=="ID10_ca"){//글자처럼 취급
     						var html="";
     						for(var i=0;i<data.checkReason.treatAsChar.length;i++){
     							var text = data.checkReason.treatAsChar[i].replace(/\n/gi, '<br>');
     							html += "<div><div>"+text+"</div></div>";
     						}
     						$(".modal > .slider").html(html);
     						$('.slider').slick({
										dots: true,
									infinite: true,
									draggable : false,
									  touchMove : false,
							});
     						$(".modal").show();    
     					}                       
     					if($(this).attr("id")=="ID10_cd"){//수식 사용지양
     						var html="";
     						for(var i=0;i<data.checkReason.equation.length;i++){
     							html += "<div><div>"+data.checkReason.equation[i]+"</div></div>";
     						}
     						$(".modal > .slider").html(html);
     						$('.slider').slick({
										dots: true,
									infinite: true,
									draggable : false,
									  touchMove : false,
							});
     						$(".modal").show();      
     					}                       
     					if($(this).attr("id")=="plusMinerDeg"){//양각 음각
     						var html="";
     						for(var i=0;i<data.checkReason.plusMinerDeg.length;i++){
     							html += "<div><div>"+data.checkReason.plusMinerDeg[i]+"</div></div>";
     						}
     						$(".modal > .slider").html(html);
     						$('.slider').slick({
										dots: true,
									infinite: true,
									draggable : false,
									  touchMove : false,
							});
     						$(".modal").show();      
     					}                       
     					if($(this).attr("id")=="figure"){//도형
     						var html="";
     						for(var i=0;i<data.checkReason.figure.length;i++){
     							html += "<div><div>"+data.checkReason.figure[i]+"</div></div>";
     						}
     						$(".modal > .slider").html(html);
     						$('.slider').slick({
										dots: true,
									infinite: true,
									draggable : false,
									  touchMove : false,
							});
     						$(".modal").show();
     					}
     					
     					//$(".modal").show();
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
    
    function slider(){
    	$(".variable").slick({
			dots: true,
			infinite: true,
			variableWidth: true
		});
    }
    
}();

$(document).ready(function(){
	// 크롬 체크
	var agent = navigator.userAgent.toLowerCase();
	OdfApp.init();
});
</script>
</html>