<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8"/>
<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<!-- <script src="//code.jquery.com/jquery-3.5.1.min.js"></script> -->
<script src="./resources/js/jquery-3.5.1.min.js"></script>
<title>ODF – 1</title>
<script type="text/javascript">

	// dateFormat func
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

$(function(){
//	$("#document_info").hide();
//	$('#document_test_result').hide();
	
	$(".clickmenu").hover(function(){
		  $(this).css('filter','brightness(70%)');
	  },
	  function(){
	    $(this).css('filter','none');
	  }
	);	
	// fileuploadbutton click
	$('#shop-24px').click(function(){
		$('#fileupload').click();
		});
	
	// file select
	$("#fileupload").change(function(){
//		var formData = new FormData($("#selectodffile")[0]);
		var formData = new FormData();
		
		var fileName;
		var fileExt;
		var fileSize_b;
		var fileSize_kb;
		var filetype;
		var fileLastModifiedDate;
		
 		$($("#fileupload")[0].files).each(function(index, file) { 		
				fileName = file.name;
 				fileExt = file.name.substring(file.name.lastIndexOf('.') + 1, file.name.length).toLowerCase();
 				fileSize_b = file.size;
 				fileSize_kb = file.size / 1024;
 				filetype = file.type;
 				fileLastModifiedDate = file.lastModified;
 				
 			// hwp 파일일 경우
/*  			if (file.name.substring(file.name.lastIndexOf('.'), file.name.length).toLowerCase() == '.hwp') {

			}; 
*/			
			// files formdata set
 			formData.append("fileupload", file);		
    		console.log(file);
    		
    	   });
 		

 		
// 		$("#document_info").show();
 		
		// fileupload
		$.ajax({ 
			type: 'POST', 
			url: 'odfFileSelect', 
			processData: false, // 필수
			contentType: false, // 필수
			data: formData, 
			success: function(data) { 				
				// after coding
		 		// fileinfo set
		 		$("#ID201201____ODF_").children("SPAN").text(fileName);
		 		$("#_hwp").children("SPAN").text( fileExt + filetype.substring(filetype.lastIndexOf('/'), filetype.length));
		 		$("#FODF__ODF__ODF_").children("SPAN").text(fileSize_kb + " KB ("+ fileSize_b + " 바이트)");
		 		var filedate = new Date(fileLastModifiedDate);
		 		$("#ID780KB_79872_").children("SPAN").text(filedate.format("yyyy년 MM월 dd일(KS) a/p hh:mm:ss"));
			}
			,beforeSend:function(){	
		     	//(이미지 보여주기 처리)	
		        $('.wrap-loading').removeClass('display-none');	
		    }
	
		    ,complete:function(){	
		    	//(이미지 감추기 처리)	
		        $('.wrap-loading').addClass('display-none');	
		    }
	
		    ,error:function(e){	
		        //조회 실패일 때 처리	
		    }
		});
	

	});
	
	//test_button_click
	$('#shop-24px_cv').click(function(){
		var cnt_zero = 'rgba(170,170,170,1)';
		var cnt_zero_over = 'rgba(111,132,160,1)';
		
		//init
		// 자간
		$("#_9").css('fill',cnt_zero);
		$("#ID10").children("SPAN").text(' ');

		// 특수문자
		$("#_10").css('fill',cnt_zero);		
		$("#ID0").children("SPAN").text(' ');
		
		// 셀 병합 준수
		$("#_11").css('fill',cnt_zero);
		$("#ID10_b").children("SPAN").text(' ');
		
		// 기본글꼴 사용준수
		$("#_12").css('fill',cnt_zero);
		$("#ID0_co").children("SPAN").text(' ');
		
		// 글자처럼 취급
		$("#_13").css('fill',cnt_zero);
		$("#ID10_ca").children("SPAN").text(' ');
		
		// 캡션 금지
		$("#_14").css('fill',cnt_zero);
		$("#ID0_cp").children("SPAN").text(' ');
		
		// 표 테두리 실선 준수
		$("#_15").css('fill',cnt_zero);
		$("#ID0_cq").children("SPAN").text(' ');
		
		// 표 배경 준수
		$("#_16").css('fill',cnt_zero);
		$("#ID10_cb").children("SPAN").text(' ');
		
		// 이미지 국제표준 포맷 활용
		$("#_17").css('fill',cnt_zero);
		$("#ID10_cc").children("SPAN").text(' ');
		
		// 특정수식 사용 지양
		$("#_18").css('fill',cnt_zero);
		$("#ID10_cd").children("SPAN").text(' ');
		
		var formData = new FormData();		
 		$($("#fileupload")[0].files).each(function(index, file) { 
 			formData.append("fileupload", file);		   		
		});
		
 		$.ajax({ 
			type: 'POST', 
			url: 'odfFileTestStart', 
			processData: false, // 필수
			contentType: false, // 필수
			data: formData, 
			success: function(data) {
				
				//init
				// 자간
				$("#ID10").children("SPAN").text('0건');

				// 특수문자
				$("#ID0").children("SPAN").text('0건');
				
				// 셀 병합 준수
				$("#ID10_b").children("SPAN").text('0건');
				
				// 기본글꼴 사용준수
				$("#ID0_co").children("SPAN").text('0건');
				
				// 글자처럼 취급
				$("#ID10_ca").children("SPAN").text('0건');
				
				// 캡션 금지
				$("#ID0_cp").children("SPAN").text('0건');
				
				// 표 테두리 실선 준수
				$("#ID0_cq").children("SPAN").text('0건');
				
				// 표 배경 준수
				$("#ID10_cb").children("SPAN").text('0건');
				
				// 이미지 국제표준 포맷 활용
				$("#ID10_cc").children("SPAN").text('0건');
				
				// 특정수식 사용 지양
				$("#ID10_cd").children("SPAN").text('0건');
				
				// 자간
				if (data.letterSpacingChkCnt > 0 ) {
					$("#_9").css('fill',cnt_zero_over);		
					$("#ID10").children("SPAN").text(data.letterSpacingChkCnt + '건');
				}
				
				// 특수문제
/* 				if (data.특수문제 > 0 ) {
					$("#_10").css('fill',cnt_zero_over);		
					$("#ID0").children("SPAN").text(data.특수문제 + '건');
				}			
*/		
				// 셀 병합 준수
 				if (data.gridChkCnt > 0 ) {
					$("#_11").css('fill',cnt_zero_over);		
					$("#ID10_b").children("SPAN").text(data.gridChkCnt + '건');
				}				
				
 				// 기본 글꼴 사용 준수
				if (data.fontChkCnt > 0 ) {
					$("#_12").css('fill',cnt_zero_over);		
					$("#ID0_co").children("SPAN").text(data.fontChkCnt + '건');
				}

				// 글자처럼 취급
/* 				if (data.글자처럼 취급 > 0 ) {
					$("#_13").css('fill',cnt_zero_over);		
					$("#ID10_ca").children("SPAN").text(data.글자처럼 취급 + '건');
				}
 */
				// 캡션 금지
				if (data.captionChkCnt > 0 ) {
					$("#_14").css('fill',cnt_zero_over);		
					$("#ID0_cp").children("SPAN").text(data.captionChkCnt + '건');
				}

				// 표 테두리 실선 준수
				if (data.tbBdrSoildChkCnt > 0 ) {
					$("#_15").css('fill',cnt_zero_over);		
					$("#ID0_cq").children("SPAN").text(data.tbBdrSoildChkCnt + '건');
				}

				// 표 배경 준수
/* 				if (data.표 배경 준수 > 0 ) {
					$("#_16").css('fill',cnt_zero_over);		
					$("#ID10_cb").children("SPAN").text(data.표 배경 준수 + '건');
				}
 */
				// 이미지 국제표준 포맷 활용
/* 				if (data.이미지 국제표준 포맷 활용 > 0 ) {
					$("#_17").css('fill',cnt_zero_over);		
					$("#ID10_cc").children("SPAN").text(data.이미지 국제표준 포맷 활용 + '건');
				}
 */
				// 특정수식 사용 지양
/* 				if (data.특정수식 사용 > 0 ) {
					$("#_18").css('fill',cnt_zero_over);		
					$("#ID10_cd").children("SPAN").text(data.특정수식 사용 + '건');
				}
 */				
				alert('진단 완료');
//				$('#document_test_result').show();
			}
		,beforeSend:function(){	
	     	//(이미지 보여주기 처리)	
	        $('.wrap-loading').removeClass('display-none');	
	    }

	    ,complete:function(){	
	    	//(이미지 감추기 처리)	
	        $('.wrap-loading').addClass('display-none');	
	    }

	    ,error:function(e){	
	        //조회 실패일 때 처리	
	    	alert('진단 실패');
	    }
		});		
	});
});
</script>
<style id="applicationStylesheet" type="text/css">
	.mediaViewInfo {
		--web-view-name: ODF – 1;
		--web-view-id: ODF__1;
		--web-scale-on-resize: true;
		--web-enable-deep-linking: true;
	}
	:root {
		--web-view-ids: ODF__1;
	}
	* {
/* 		margin: 0%;
		padding: 0%; */
		box-sizing: border-box;
		border: none;
	}
	#ODF__1 {
		position: fixed;
		width: 100%;
		height: 100%;
		background-color: rgba(255,255,255,1);
		overflow: visible;
		--web-view-name: ODF – 1;
		--web-view-id: ODF__1;
		--web-scale-on-resize: true;
		--web-enable-deep-linking: true;
	}
	#_1 {
		position: fixed;
		opacity: 0.26;
		fill: rgba(109,102,92,1);
		width: 100%;
		height: 100%;
	}
	._1 {
		position: fixed;
		overflow: visible;
		width: 100%;
		height: 10%;
		left: 0%;
		top: 0%;
	}
	#_2 {
		position: fixed;
		fill: rgba(79,99,105,1);
		width: 100%;
		height: 100%;
	}
	._2 {
		position: fixed;
		overflow: visible;
		width: 80%;
		height: 13%;
		left: 20%;
		top: 4%;
	}
	#ODF__ {
		left: 22%;
		top: 8%;
		position: fixed;
		overflow: visible;

		white-space: nowrap;
		text-align: left;
		font-family: NanumGothic;
		font-style: normal;
		font-weight: bold;
		font-size: 38px;
		color: rgba(255,255,255,1);
		text-transform: uppercase;
	}
	#_1_j {
		fill: transparent;
		stroke: rgba(112,112,112,1);
		stroke-width: 1px;
		stroke-linejoin: miter;
		stroke-linecap: butt;
		stroke-miterlimit: 4;
		shape-rendering: auto;
	}
	._1_j {
		overflow: visible;
		position: fixed;
		width: 1%;
		height: 100%;
		left: 32%;
		top: 17%;
		transform: matrix(1,0,0,1,0,0);
	}
	#_2_k {
		fill: transparent;
		stroke: rgba(112,112,112,1);
		stroke-width: 1px;
		stroke-linejoin: miter;
		stroke-linecap: butt;
		stroke-miterlimit: 4;
		shape-rendering: auto;
	}
	._2_k {
		overflow: visible;
		position: fixed;
		width: 100%;
		height: 1%;
		left: 32.5%;
		top: 42%;
		transform: matrix(1,0,0,1,0,0);
	}
	#_7 {
		fill: rgba(41,85,100,1);
		stroke: rgba(112,112,112,1);
		stroke-width: 1px;
		stroke-linejoin: miter;
		stroke-linecap: butt;
		stroke-miterlimit: 4;
		shape-rendering: auto;
	}
	._7 {
		position: fixed;
		overflow: visible;
		width: 50.104px;
		height: 49.21px;
		left: 5%;
		top: 29%;
	}
	#ID1 {
		filter: drop-shadow(0px 3px 6px rgba(0, 0, 0, 0.161));
		left: 6.3%;
		top: 30.7%;
		position: fixed;
		overflow: visible;
		width: 10px;
		white-space: nowrap;
		text-align: left;
		font-family: Expo M;
		font-style: normal;
		font-weight: normal;
		font-size: 25px;
		color: rgba(255,255,255,1);
	}
	#_ {
		left: 9%;
		top: 30%;
		position: fixed;
		overflow: visible;
		white-space: nowrap;
		text-align: left;
		font-family: NanumBarunGothic;
		font-style: normal;
		font-weight: normal;
		font-size: 31px;
		color: rgba(112,112,112,1);
	}
	#__ {
		left: 162.976px;
		top: 281.91px;
		position: absolute;
		overflow: visible;
		width: 119px;
		white-space: nowrap;
		text-align: left;
		font-family: Segoe UI;
		font-style: normal;
		font-weight: normal;
		font-size: 18px;
		color: rgba(112,112,112,1);
	}
	#ID201201____ODF_ {
		left: 122.259px;
		top: 359.372px;
		position: absolute;
		overflow: visible;
		width: 360px;
		
		text-align: left;
		font-family: NanumGothic;
		font-style: normal;
		font-weight: normal;
		font-size: 14px;
		color: rgba(112,112,112,1);
		text-decoration: underline;
	}
	#_2_q {
		position: absolute;
		width: 111.225px;
		height: 31.779px;
		left: 124.246px;
		top: 405.915px;
		overflow: visible;
	}
	#_8 {
		fill: rgba(212,212,212,1);
	}
	._8 {
		position: absolute;
		overflow: visible;
		width: 111.225px;
		height: 31.779px;
		left: 0px;
		top: 0px;
	}
	#__s {
		left: 17.875px;
		top: 6.952px;
		position: absolute;
		overflow: visible;
		width: 58px;
		white-space: nowrap;
		text-align: left;
		font-family: NanumGothic;
		font-style: normal;
		font-weight: normal;
		font-size: 14px;
		color: rgba(112,112,112,1);
	}
	#_hwp {
		left: 122.259px;
		top: 447.783px;
		position: absolute;
		overflow: visible;
		width: 360px;
		text-align: left;
		font-family: NanumGothic;
		font-style: normal;
		font-weight: normal;
		font-size: 14px;
		color: rgba(112,112,112,1);
		text-decoration: underline;
	}
	#_3 {
		position: absolute;
		width: 111.225px;
		height: 29.792px;
		left: 124.246px;
		top: 483.478px;
		overflow: visible;
	}
	#_8_v {
		fill: rgba(212,212,212,1);
	}
	._8_v {
		position: absolute;
		overflow: visible;
		width: 111.225px;
		height: 29.792px;
		left: 0px;
		top: 0px;
	}
	#________ {
		left: 17.875px;
		top: 5.958px;
		position: absolute;
		overflow: visible;
		width: 59px;
		white-space: nowrap;
		text-align: left;
		font-family: NanumGothic;
		font-style: normal;
		font-weight: normal;
		font-size: 14px;
		color: rgba(112,112,112,1);
	}
	#FODF__ODF__ODF_ {
		left: 123.252px;
		top: 518.311px;
		position: absolute;
		overflow: visible;
		width: 360px;
		text-align: left;
		font-family: NanumGothic;
		font-style: normal;
		font-weight: normal;
		font-size: 14px;
		color: rgba(112,112,112,1);
		text-decoration: underline;
	}
	#_4 {
		position: absolute;
		width: 111.225px;
		height: 30.785px;
		left: 124.246px;
		top: 567.786px;
		overflow: visible;
	}
	#_8_z {
		fill: rgba(212,212,212,1);
	}
	._8_z {
		position: absolute;
		overflow: visible;
		width: 111.225px;
		height: 30.785px;
		left: 0px;
		top: 0px;
	}
	#_______ {
		left: 17.875px;
		top: 6.952px;
		position: absolute;
		overflow: visible;
		width: 55px;
		white-space: nowrap;
		text-align: left;
		font-family: NanumGothic;
		font-style: normal;
		font-weight: normal;
		font-size: 14px;
		color: rgba(112,112,112,1);
	}
	#ID780KB_79872_ {
		left: 125px;
		top: 608px;
		position: absolute;
		overflow: visible;
		width: 360px;
		text-align: left;
		font-family: NanumGothic;
		font-style: normal;
		font-weight: normal;
		font-size: 14px;
		color: rgba(112,112,112,1);
		text-decoration: underline;
	}
	#_8_ {
		fill: rgba(212,212,212,1);
	}
	._8_ {
		position: absolute;
		overflow: visible;
		width: 111.225px;
		height: 30.785px;
		left: 124.246px;
		top: 644.355px;
	}
	#___ {
		left: 142.121px;
		top: 650.313px;
		position: absolute;
		overflow: visible;
		width: 65px;
		white-space: nowrap;
		text-align: left;
		font-family: NanumGothic;
		font-style: normal;
		font-weight: normal;
		font-size: 14px;
		color: rgba(112,112,112,1);
	}
	#ID2020_12_1___101503 {
		left: 125.239px;
		top: 685.327px;
		position: absolute;
		overflow: visible;
		width: 360px;
		text-align: left;
		font-family: NanumGothic;
		font-style: normal;
		font-weight: normal;
		font-size: 14px;
		color: rgba(112,112,112,1);
		text-decoration: underline;
	}
	#_6 {
		position: absolute;
		width: 111.225px;
		height: 29.792px;
		left: 125px;
		top: 721.682px;
		overflow: visible;
	}
	#_8_ba {
		fill: rgba(212,212,212,1);
	}
	._8_ba {
		position: absolute;
		overflow: visible;
		width: 111.225px;
		height: 29.792px;
		left: 0px;
		top: 0px;
	}
	#___ba {
		left: 18.858px;
		top: 5.095px;
		position: absolute;
		overflow: visible;
		width: 61px;
		white-space: nowrap;
		text-align: left;
		font-family: NanumGothic;
		font-style: normal;
		font-weight: normal;
		font-size: 14px;
		color: rgba(112,112,112,1);
	}
	#ID2020_12_2___113457 {
		left: 124.246px;
		top: 761.195px;
		position: absolute;
		overflow: visible;
		width: 360px;
		text-align: left;
		font-family: NanumGothic;
		font-style: normal;
		font-weight: normal;
		font-size: 14px;
		color: rgba(112,112,112,1);
		text-decoration: underline;
	}
	#_5 {
		fill: rgba(41,85,100,1);
		stroke: rgba(112,112,112,1);
		stroke-width: 1px;
		stroke-linejoin: miter;
		stroke-linecap: butt;
		stroke-miterlimit: 4;
		shape-rendering: auto;
	}
	._5 {
		position: absolute;
		overflow: visible;
		width: 50.104px;
		height: 49.21px;
		left: 572.061px;
		top: 204.941px;
	}
	#ID2 {
		filter: drop-shadow(0px 3px 6px rgba(0, 0, 0, 0.161));
		left: 587.089px;
		top: 214.021px;
		position: absolute;
		overflow: visible;
		width: 19px;
		white-space: nowrap;
		text-align: left;
		font-family: Expo M;
		font-style: normal;
		font-weight: normal;
		font-size: 29px;
		color: rgba(255,255,255,1);
	}
	#__bb {
		left: 640px;
		top: 211.073px;
		position: absolute;
		overflow: visible;
		width: 174px;
		white-space: nowrap;
		text-align: left;
		font-family: NanumBarunGothic;
		font-style: normal;
		font-weight: normal;
		font-size: 31px;
		color: rgba(112,112,112,1);
	}
	#_6_bc {
		fill: rgba(41,85,100,1);
		stroke: rgba(112,112,112,1);
		stroke-width: 1px;
		stroke-linejoin: miter;
		stroke-linecap: butt;
		stroke-miterlimit: 4;
		shape-rendering: auto;
	}
	._6_bc {
		position: absolute;
		overflow: visible;
		width: 50.104px;
		height: 49.21px;
		left: 573.061px;
		top: 351.675px;
	}
	#ID3 {
		filter: drop-shadow(0px 3px 6px rgba(0, 0, 0, 0.161));
		left: 588.225px;
		top: 363.32px;
		position: absolute;
		overflow: visible;
		width: 18px;
		white-space: nowrap;
		text-align: left;
		font-family: Expo M;
		font-style: normal;
		font-weight: normal;
		font-size: 28px;
		color: rgba(255,255,255,1);
	}
	#_bi {
		left: 640px;
		top: 358.32px;
		position: absolute;
		overflow: visible;
		width: 167px;
		white-space: nowrap;
		text-align: left;
		font-family: NanumBarunGothic;
		font-style: normal;
		font-weight: normal;
		font-size: 31px;
		color: rgba(112,112,112,1);
	}
	#_9 {
		fill: rgba(170,170,170,1);
		stroke: rgba(112,112,112,1);
		stroke-width: 1px;
		stroke-linejoin: miter;
		stroke-linecap: butt;
		stroke-miterlimit: 4;
		shape-rendering: auto;
	}
	._9 {
		filter: drop-shadow(0px 5px 8px rgba(0, 0, 0, 0.361));
		position: absolute;
		overflow: visible;
		width: 374.556px;
		height: 72.991px;
		left: 620.258px;
		top: 447.783px;
	}
	#_____ {
		left: 652.543px;
		top: 461.305px;
		position: absolute;
		overflow: visible;
		width: 169px;
		white-space: nowrap;
		text-align: left;
		font-family: NanumGothic;
		font-style: normal;
		font-weight: normal;
		font-size: 17px;
		color: rgba(255,255,255,1);
	}
	#_10 {
		fill: rgba(170,170,170,1);
		stroke: rgba(112,112,112,1);
		stroke-width: 1px;
		stroke-linejoin: miter;
		stroke-linecap: butt;
		stroke-miterlimit: 4;
		shape-rendering: auto;
	}
	._10 {
		filter: drop-shadow(0px 3px 6px rgba(0, 0, 0, 0.161));
		position: absolute;
		overflow: visible;
		width: 367.564px;
		height: 67.933px;
		left: 622.201px;
		top: 515.096px;
	}
	#___bi {
		left: 652.798px;
		top: 529.167px;
		position: absolute;
		overflow: visible;
		width: 151px;
		white-space: nowrap;
		text-align: left;
		font-family: NanumGothic;
		font-style: normal;
		font-weight: normal;
		font-size: 17px;
		color: rgba(255,255,255,1);
	}
	#_11 {
		fill: rgba(170,170,170,1);
		stroke: rgba(112,112,112,1);
		stroke-width: 1px;
		stroke-linejoin: miter;
		stroke-linecap: butt;
		stroke-miterlimit: 4;
		shape-rendering: auto;
	}
	._11 {
		filter: drop-shadow(0px 5px 8px rgba(0, 0, 0, 0.361));
		position: absolute;
		overflow: visible;
		width: 373.564px;
		height: 72.991px;
		left: 622.201px;
		top: 584.358px;
	}
	#___bk {
		left: 648.17px;
		top: 597.203px;
		position: absolute;
		overflow: visible;
		width: 90px;
		white-space: nowrap;
		text-align: left;
		font-family: NanumGothic;
		font-style: normal;
		font-weight: normal;
		font-size: 17px;
		color: rgba(255,255,255,1);
	}
	#_12 {
		fill: rgba(170,170,170,1);
		stroke: rgba(112,112,112,1);
		stroke-width: 1px;
		stroke-linejoin: miter;
		stroke-linecap: butt;
		stroke-miterlimit: 4;
		shape-rendering: auto;
	}
	._12 {
		filter: drop-shadow(0px 3px 6px rgba(0, 0, 0, 0.161));
		position: absolute;
		overflow: visible;
		width: 367.564px;
		height: 66.991px;
		left: 622.201px;
		top: 651.687px;
	}
	#___bm {
		left: 648.035px;
		top: 665.863px;
		position: absolute;
		overflow: visible;
		width: 145px;
		white-space: nowrap;
		text-align: left;
		font-family: NanumGothic;
		font-style: normal;
		font-weight: normal;
		font-size: 17px;
		color: rgba(255,255,255,1);
	}
	#_13 {
		fill: rgba(170,170,170,1);
		stroke: rgba(112,112,112,1);
		stroke-width: 1px;
		stroke-linejoin: miter;
		stroke-linecap: butt;
		stroke-miterlimit: 4;
		shape-rendering: auto;
	}
	._13 {
		filter: drop-shadow(0px 5px 8px rgba(0, 0, 0, 0.361));
		position: absolute;
		overflow: visible;
		width: 373.564px;
		height: 72.991px;
		left: 623.165px;
		top: 718.155px;
	}
	#___bo {
		left: 646.05px;
		top: 730.409px;
		position: absolute;
		overflow: visible;
		width: 149px;
		white-space: nowrap;
		text-align: left;
		font-family: NanumGothic;
		font-style: normal;
		font-weight: normal;
		font-size: 17px;
		color: rgba(255,255,255,1);
	}
	#_14 {
		fill: rgba(170,170,170,1);
		stroke: rgba(112,112,112,1);
		stroke-width: 1px;
		stroke-linejoin: miter;
		stroke-linecap: butt;
		stroke-miterlimit: 4;
		shape-rendering: auto;
	}
	._14 {
		filter: drop-shadow(0px 3px 6px rgba(0, 0, 0, 0.161));
		position: absolute;
		overflow: visible;
		width: 367.563px;
		height: 66.991px;
		left: 1055.642px;
		top: 447.783px;
	}
	#___bq {
		left: 1082.137px;
		top: 460.335px;
		position: absolute;
		overflow: visible;
		width: 117px;
		white-space: nowrap;
		text-align: left;
		font-family: NanumGothic;
		font-style: normal;
		font-weight: normal;
		font-size: 17px;
		color: rgba(255,255,255,1);
	}
	#_15 {
		fill: rgba(170,170,170,1);
		stroke: rgba(112,112,112,1);
		stroke-width: 1px;
		stroke-linejoin: miter;
		stroke-linecap: butt;
		stroke-miterlimit: 4;
		shape-rendering: auto;
	}
	._15 {
		filter: drop-shadow(0px 3px 6px rgba(0, 0, 0, 0.161));
		position: absolute;
		overflow: visible;
		width: 367.563px;
		height: 67.933px;
		left: 1055.642px;
		top: 515.096px;
	}
	#____bs {
		left: 1081.318px;
		top: 529.348px;
		position: absolute;
		overflow: visible;
		width: 153px;
		white-space: nowrap;
		text-align: left;
		font-family: NanumGothic;
		font-style: normal;
		font-weight: normal;
		font-size: 17px;
		color: rgba(255,255,255,1);
	}
	#_16 {
		fill: rgba(170,170,170,1);
		stroke: rgba(112,112,112,1);
		stroke-width: 1px;
		stroke-linejoin: miter;
		stroke-linecap: butt;
		stroke-miterlimit: 4;
		shape-rendering: auto;
	}
	._16 {
		filter: drop-shadow(0px 5px 8px rgba(0, 0, 0, 0.361));
		position: absolute;
		overflow: visible;
		width: 373.563px;
		height: 72.991px;
		left: 1055.642px;
		top: 584.358px;
	}
	#___bu {
		left: 1082.653px;
		top: 596.638px;
		position: absolute;
		overflow: visible;
		width: 90px;
		white-space: nowrap;
		text-align: left;
		font-family: NanumGothic;
		font-style: normal;
		font-weight: normal;
		font-size: 17px;
		color: rgba(255,255,255,1);
	}
	#_17 {
		fill: rgba(170,170,170,1);
		stroke: rgba(112,112,112,1);
		stroke-width: 1px;
		stroke-linejoin: miter;
		stroke-linecap: butt;
		stroke-miterlimit: 4;
		shape-rendering: auto;
	}
	._17 {
		filter: drop-shadow(0px 5px 8px rgba(0, 0, 0, 0.361));
		position: absolute;
		overflow: visible;
		width: 373.563px;
		height: 73.933px;
		left: 1055.642px;
		top: 651.587px;
	}
	#____bw {
		left: 1075.777px;
		top: 667.013px;
		position: absolute;
		overflow: visible;
		width: 191px;
		white-space: nowrap;
		text-align: left;
		font-family: NanumGothic;
		font-style: normal;
		font-weight: normal;
		font-size: 17px;
		color: rgba(255,255,255,1);
	}
	#_18 {
		fill: rgba(170,170,170,1);
		stroke: rgba(112,112,112,1);
		stroke-width: 1px;
		stroke-linejoin: miter;
		stroke-linecap: butt;
		stroke-miterlimit: 4;
		shape-rendering: auto;
	}
	._18 {
		filter: drop-shadow(0px 5px 8px rgba(0, 0, 0, 0.361));
		position: absolute;
		overflow: visible;
		width: 373.563px;
		height: 72.991px;
		left: 1055.642px;
		top: 718.155px;
	}
	#___by {
		left: 1081.633px;
		top: 730.777px;
		position: absolute;
		overflow: visible;
		width: 138px;
		white-space: nowrap;
		text-align: left;
		font-family: NanumGothic;
		font-style: normal;
		font-weight: normal;
		font-size: 17px;
		color: rgba(255,255,255,1);
	}
	#ID10 {
		left: 883.185px;
		top: 462.278px;
		position: absolute;
		overflow: visible;
		width: 38px;
		white-space: nowrap;
		text-align: left;
		font-family: NanumGothic;
		font-style: normal;
		font-weight: normal;
		font-size: 17px;
		color: rgba(255,255,255,1);
	}
	#ID10_b {
		left: 883.185px;
		top: 595.089px;
		position: absolute;
		overflow: visible;
		width: 38px;
		white-space: nowrap;
		text-align: left;
		font-family: NanumGothic;
		font-style: normal;
		font-weight: normal;
		font-size: 17px;
		color: rgba(255,255,255,1);
	}
	#ID10_ca {
		left: 883.185px;
		top: 732.409px;
		position: absolute;
		overflow: visible;
		width: 38px;
		white-space: nowrap;
		text-align: left;
		font-family: NanumGothic;
		font-style: normal;
		font-weight: normal;
		font-size: 17px;
		color: rgba(255,255,255,1);
	}
	#ID10_cb {
		left: 1315.274px;
		top: 596.225px;
		position: absolute;
		overflow: visible;
		width: 38px;
		white-space: nowrap;
		text-align: left;
		font-family: NanumGothic;
		font-style: normal;
		font-weight: normal;
		font-size: 17px;
		color: rgba(255,255,255,1);
	}
	#ID10_cc {
		left: 1315.274px;
		top: 667.013px;
		position: absolute;
		overflow: visible;
		width: 38px;
		white-space: nowrap;
		text-align: left;
		font-family: NanumGothic;
		font-style: normal;
		font-weight: normal;
		font-size: 17px;
		color: rgba(255,255,255,1);
	}
	#ID10_cd {
		left: 1315.274px;
		top: 730.376px;
		position: absolute;
		overflow: visible;
		width: 38px;
		white-space: nowrap;
		text-align: left;
		font-family: NanumGothic;
		font-style: normal;
		font-weight: normal;
		font-size: 17px;
		color: rgba(255,255,255,1);
	}
	#done_all-24px {
		position: absolute;
		width: 47.878px;
		height: 42.065px;
		left: 913.276px;
		top: 451.436px;
		overflow: visible;
	}
	#_3_b {
		fill: transparent;
	}
	._3_b {
		overflow: visible;
		position: absolute;
		width: 42.064px;
		height: 42.065px;
		left: 0px;
		top: 0px;
		transform: matrix(1,0,0,1,0,0);
	}
	#_4_b {
		fill: rgba(225,211,84,1);
	}
	._4_b {
		overflow: visible;
		position: absolute;
		width: 40.75px;
		height: 23.504px;
		left: 7.128px;
		top: 9.281px;
		transform: matrix(1,0,0,1,0,0);
	}
	#done_all-24px_b {
		position: absolute;
		width: 51.083px;
		height: 42.065px;
		left: 909.905px;
		top: 588.437px;
		overflow: visible;
	}
	#_3_ca {
		fill: transparent;
	}
	._3_ca {
		overflow: visible;
		position: absolute;
		width: 42.064px;
		height: 42.065px;
		left: 0px;
		top: 0px;
		transform: matrix(1,0,0,1,0,0);
	}
	#_4_ca {
		fill: rgba(225,211,84,1);
	}
	._4_ca {
		overflow: visible;
		position: absolute;
		width: 40.75px;
		height: 23.504px;
		left: 10.333px;
		top: 9.281px;
		transform: matrix(1,0,0,1,0,0);
	}
	#done_all-24px_cb {
		position: absolute;
		width: 51.083px;
		height: 42.065px;
		left: 910.101px;
		top: 721.963px;
		overflow: visible;
	}
	#_3_cc {
		fill: transparent;
	}
	._3_cc {
		overflow: visible;
		position: absolute;
		width: 42.064px;
		height: 42.065px;
		left: 0px;
		top: 0px;
		transform: matrix(1,0,0,1,0,0);
	}
	#_4_cd {
		fill: rgba(225,211,84,1);
	}
	._4_cd {
		overflow: visible;
		position: absolute;
		width: 40.75px;
		height: 23.504px;
		left: 10.333px;
		top: 9.281px;
		transform: matrix(1,0,0,1,0,0);
	}
	#done_all-24px_ce {
		position: absolute;
		width: 42.065px;
		height: 42.065px;
		left: 1356.137px;
		top: 588.437px;
		overflow: visible;
	}
	#_3_cf {
		fill: transparent;
	}
	._3_cf {
		overflow: visible;
		position: absolute;
		width: 42.064px;
		height: 42.065px;
		left: 0px;
		top: 0px;
		transform: matrix(1,0,0,1,0,0);
	}
	#_4_cg {
		fill: rgba(225,211,84,1);
	}
	._4_cg {
		overflow: visible;
		position: absolute;
		width: 40.75px;
		height: 23.504px;
		left: 0.719px;
		top: 9.797px;
		transform: matrix(1,0,0,1,0,0);
	}
	#done_all-24px_ch {
		position: absolute;
		width: 42.065px;
		height: 42.065px;
		left: 1356.137px;
		top: 658.012px;
		overflow: visible;
	}
	#_3_ci {
		fill: transparent;
	}
	._3_ci {
		overflow: visible;
		position: absolute;
		width: 42.064px;
		height: 42.065px;
		left: 0px;
		top: 0px;
		transform: matrix(1,0,0,1,0,0);
	}
	#_4_cj {
		fill: rgba(225,211,84,1);
	}
	._4_cj {
		overflow: visible;
		position: absolute;
		width: 40.75px;
		height: 23.504px;
		left: 0.719px;
		top: 9.798px;
		transform: matrix(1,0,0,1,0,0);
	}
	#done_all-24px_ck {
		position: absolute;
		width: 50.282px;
		height: 42.065px;
		left: 1348.124px;
		top: 721.963px;
		overflow: visible;
	}
	#_3_cl {
		fill: transparent;
	}
	._3_cl {
		overflow: visible;
		position: absolute;
		width: 42.064px;
		height: 42.065px;
		left: 0px;
		top: 0px;
		transform: matrix(1,0,0,1,0,0);
	}
	#_4_cm {
		fill: rgba(225,211,84,1);
	}
	._4_cm {
		overflow: visible;
		position: absolute;
		width: 40.75px;
		height: 23.504px;
		left: 9.532px;
		top: 9.281px;
		transform: matrix(1,0,0,1,0,0);
	}
	#ID0 {
		left: 883.185px;
		top: 530.138px;
		position: absolute;
		overflow: visible;
		width: 27px;
		white-space: nowrap;
		text-align: left;
		font-family: NanumGothic;
		font-style: normal;
		font-weight: normal;
		font-size: 17px;
		color: rgba(255,255,255,1);
	}
	#ID0_co {
		left: 883.185px;
		top: 663.918px;
		position: absolute;
		overflow: visible;
		width: 27px;
		white-space: nowrap;
		text-align: left;
		font-family: NanumGothic;
		font-style: normal;
		font-weight: normal;
		font-size: 17px;
		color: rgba(255,255,255,1);
	}
	#ID0_cp {
		left: 1315.274px;
		top: 461.099px;
		position: absolute;
		overflow: visible;
		width: 27px;
		white-space: nowrap;
		text-align: left;
		font-family: NanumGothic;
		font-style: normal;
		font-weight: normal;
		font-size: 17px;
		color: rgba(255,255,255,1);
	}
	#ID0_cq {
		left: 1315.274px;
		top: 530.319px;
		position: absolute;
		overflow: visible;
		width: 27px;
		white-space: nowrap;
		text-align: left;
		font-family: NanumGothic;
		font-style: normal;
		font-weight: normal;
		font-size: 17px;
		color: rgba(255,255,255,1);
	}
	#_19 {
		fill: rgba(162,113,165,1);
		stroke: rgba(112,112,112,1);
		stroke-width: 1px;
		stroke-linejoin: miter;
		stroke-linecap: butt;
		stroke-miterlimit: 4;
		shape-rendering: auto;
	}
	._19 {
		display: none;
		position: absolute;
		overflow: visible;
		width: 204px;
		height: 86px;
		left: 399.182px;
		top: 243.619px;
	}
	#shop-24px {
		position: fixed;
		width: 56.528px;
		height: 56.528px;
		left: 26%;
		top: 28.5%;
		overflow: visible;
	}
	#_7_ct {
		fill: transparent;
	}
	._7_ct {
		overflow: visible;
		position: absolute;
		width: 56.528px;
		height: 56.528px;
		left: 0px;
		top: 0px;
		transform: matrix(1,0,0,1,0,0);
	}
	#_8_cu {
		fill: rgba(105,138,124,1);
	}
	._8_cu {
		overflow: visible;
		position: absolute;
		width: 47.106px;
		height: 44.751px;
		left: 4.711px;
		top: 4.711px;
		transform: matrix(1,0,0,1,0,0);
	}
	#shop-24px_cv {
		position: absolute;
		width: 56.528px;
		height: 56.528px;
		left: 840.826px;
		top: 198.623px;
		overflow: visible;
	}
	#_7_cw {
		fill: transparent;
	}
	._7_cw {
		overflow: visible;
		position: absolute;
		width: 56.527px;
		height: 56.528px;
		left: 0px;
		top: 0px;
		transform: matrix(1,0,0,1,0,0);
	}
	#_8_cx {
		fill: rgba(236,212,120,1);
	}
	._8_cx {
		overflow: visible;
		position: absolute;
		width: 47.106px;
		height: 44.751px;
		left: 4.71px;
		top: 4.711px;
		transform: matrix(1,0,0,1,0,0);
	}
	#done_all-24px_cy {
		position: absolute;
		width: 19.23px;
		height: 19.23px;
		left: 451.302px;
		top: 482.635px;
		overflow: visible;
	}
	#_9_cz {
		fill: transparent;
	}
	._9_cz {
		overflow: visible;
		position: absolute;
		width: 19.229px;
		height: 19.229px;
		left: 0px;
		top: 0px;
		transform: matrix(1,0,0,1,0,0);
	}
	#menu_book-24px {
		position: absolute;
		width: 29.792px;
		height: 29.792px;
		left: 125.239px;
		top: 279.937px;
		overflow: visible;
	}
	#_7_c {
		position: absolute;
		width: 29.792px;
		height: 29.792px;
		left: 0px;
		top: 0px;
		overflow: visible;
	}
	#_20 {
		fill: transparent;
	}
	._20 {
		position: absolute;
		overflow: visible;
		width: 29.792px;
		height: 29.792px;
		left: 0px;
		top: 0px;
	}
	#_10_c {
		position: absolute;
		width: 27.175px;
		height: 20.999px;
		left: 0.882px;
		top: 5.173px;
		overflow: visible;
	}
	#_9_c {
		position: absolute;
		width: 27.175px;
		height: 20.999px;
		left: 0px;
		top: 0px;
		overflow: visible;
	}
	#_10_da {
		fill: rgba(114,111,111,1);
	}
	._10_da {
		overflow: visible;
		position: absolute;
		width: 27.175px;
		height: 20.999px;
		left: 0px;
		top: 0px;
		transform: matrix(1,0,0,1,0,0);
	}
	#_8_c {
		position: absolute;
		width: 8.647px;
		height: 9.659px;
		left: 14.823px;
		top: 5.558px;
		overflow: visible;
	}
	#_11_c {
		fill: rgba(114,111,111,1);
	}
	._11_c {
		overflow: visible;
		position: absolute;
		width: 8.646px;
		height: 3.076px;
		left: 0px;
		top: 0px;
		transform: matrix(1,0,0,1,0,0);
	}
	#_12_c {
		fill: rgba(114,111,111,1);
	}
	._12_c {
		overflow: visible;
		position: absolute;
		width: 8.646px;
		height: 3.076px;
		left: 0px;
		top: 3.286px;
		transform: matrix(1,0,0,1,0,0);
	}
	#_13_c {
		fill: rgba(114,111,111,1);
	}
	._13_c {
		overflow: visible;
		position: absolute;
		width: 8.646px;
		height: 3.076px;
		left: 0px;
		top: 6.584px;
		transform: matrix(1,0,0,1,0,0);
	}
	#_11_da {
		position: absolute;
		width: 111.225px;
		height: 30.785px;
		left: 124.246px;
		top: 323.543px;
		overflow: visible;
	}
	#_8_db {
		fill: rgba(212,212,212,1);
	}
	._8_db {
		position: absolute;
		overflow: visible;
		width: 111.225px;
		height: 30.785px;
		left: 0px;
		top: 0px;
	}
	#__dc {
		left: 17.875px;
		top: 6.951px;
		position: absolute;
		overflow: visible;
		width: 58px;
		white-space: nowrap;
		text-align: left;
		font-family: NanumGothic;
		font-style: normal;
		font-weight: normal;
		font-size: 14px;
		color: rgba(112,112,112,1);
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

</style>
<script id="applicationScript">
///////////////////////////////////////
// INITIALIZATION
///////////////////////////////////////

/**
 * Functionality for scaling, showing by media query, and navigation between multiple pages on a single page. 
 * Code subject to change.
 **/
/* 
if (window.console==null) { window["console"] = { log : function() {} } }; // some browsers do not set console

var Application = function() {
	// event constants
	this.prefix = "--web-";
	this.NAVIGATION_CHANGE = "viewChange";
	this.VIEW_NOT_FOUND = "viewNotFound";
	this.VIEW_CHANGE = "viewChange";
	this.VIEW_CHANGING = "viewChanging";
	this.STATE_NOT_FOUND = "stateNotFound";
	this.APPLICATION_COMPLETE = "applicationComplete";
	this.APPLICATION_RESIZE = "applicationResize";
	this.SIZE_STATE_NAME = "data-is-view-scaled";
	this.STATE_NAME = this.prefix + "state";

	this.lastTrigger = null;
	this.lastView = null;
	this.lastState = null;
	this.lastOverlay = null;
	this.currentView = null;
	this.currentState = null;
	this.currentOverlay = null;
	this.currentQuery = {index: 0, rule: null, mediaText: null, id: null};
	this.inclusionQuery = "(min-width: 0px)";
	this.exclusionQuery = "none and (min-width: 99999px)";
	this.LastModifiedDateLabelName = "LastModifiedDateLabel";
	this.viewScaleSliderId = "ViewScaleSliderInput";
	this.pageRefreshedName = "showPageRefreshedNotification";
	this.applicationStylesheet = null;
	this.mediaQueryDictionary = {};
	this.viewsDictionary = {};
	this.addedViews = [];
	this.views = {};
	this.viewIds = [];
	this.viewQueries = {};
	this.overlays = {};
	this.overlayIds = [];
	this.numberOfViews = 0;
	this.verticalPadding = 0;
	this.horizontalPadding = 0;
	this.stateName = null;
	this.viewScale = 1;
	this.viewLeft = 0;
	this.viewTop = 0;
	this.horizontalScrollbarsNeeded = false;
	this.verticalScrollbarsNeeded = false;

	// view settings
	this.showUpdateNotification = false;
	this.showNavigationControls = false;
	this.scaleViewsToFit = false;
	this.scaleToFitOnDoubleClick = false;
	this.actualSizeOnDoubleClick = false;
	this.scaleViewsOnResize = false;
	this.navigationOnKeypress = false;
	this.showViewName = false;
	this.enableDeepLinking = true;
	this.refreshPageForChanges = false;
	this.showRefreshNotifications = true;

	// view controls
	this.scaleViewSlider = null;
	this.lastModifiedLabel = null;
	this.supportsPopState = false; // window.history.pushState!=null;
	this.initialized = false;

	// refresh properties
	this.refreshDuration = 250;
	this.lastModifiedDate = null;
	this.refreshRequest = null;
	this.refreshInterval = null;
	this.refreshContent = null;
	this.refreshContentSize = null;
	this.refreshCheckContent = false;
	this.refreshCheckContentSize = false;

	var self = this;

	self.initialize = function(event) {
		var view = self.getVisibleView();
		var views = self.getVisibleViews();
		if (view==null) view = self.getInitialView();
		self.collectViews();
		self.collectOverlays();
		self.collectMediaQueries();

		for (let index = 0; index < views.length; index++) {
			var view = views[index];
			self.setViewOptions(view);
			self.setViewVariables(view);
			self.centerView(view);
		}

		// sometimes the body size is 0 so we call this now and again later
		if (self.initialized) {
			window.addEventListener(self.NAVIGATION_CHANGE, self.viewChangeHandler);
			window.addEventListener("keyup", self.keypressHandler);
			window.addEventListener("keypress", self.keypressHandler);
			window.addEventListener("resize", self.resizeHandler);
			window.document.addEventListener("dblclick", self.doubleClickHandler);

			if (self.supportsPopState) {
				window.addEventListener('popstate', self.popStateHandler);
			}
			else {
				window.addEventListener('hashchange', self.hashChangeHandler);
			}

			// we are ready to go
			window.dispatchEvent(new Event(self.APPLICATION_COMPLETE));
		}

		if (self.initialized==false) {
			if (self.enableDeepLinking) {
				self.syncronizeViewToURL();
			} 
	
			if (self.refreshPageForChanges) {
				self.setupRefreshForChanges();
			}
	
			self.initialized = true;
		}
		
		if (self.scaleViewsToFit) {
			self.viewScale = self.scaleViewToFit(view);
			
			if (self.viewScale<0) {
				setTimeout(self.scaleViewToFit, 500, view);
			}
		}
		else if (view) {
			self.viewScale = self.getViewScaleValue(view);
			self.centerView(view);
			self.updateSliderValue(self.viewScale);
		}
		else {
			// no view found
		}
	
		if (self.showUpdateNotification) {
			self.showNotification();
		}

		//"addEventListener" in window ? null : window.addEventListener = window.attachEvent;
		//"addEventListener" in document ? null : document.addEventListener = document.attachEvent;
	}


	///////////////////////////////////////
	// AUTO REFRESH 
	///////////////////////////////////////

	self.setupRefreshForChanges = function() {
		self.refreshRequest = new XMLHttpRequest();

		if (!self.refreshRequest) {
			return false;
		}

		// get document start values immediately
		self.requestRefreshUpdate();
	}

	/**
	 * Attempt to check the last modified date by the headers 
	 * or the last modified property from the byte array (experimental)
	 **/
	self.requestRefreshUpdate = function() {
		var url = document.location.href;
		var protocol = window.location.protocol;
		var method;
		
		try {

			if (self.refreshCheckContentSize) {
				self.refreshRequest.open('HEAD', url, true);
			}
			else if (self.refreshCheckContent) {
				self.refreshContent = document.documentElement.outerHTML;
				self.refreshRequest.open('GET', url, true);
				self.refreshRequest.responseType = "text";
			}
			else {

				// get page last modified date for the first call to compare to later
				if (self.lastModifiedDate==null) {

					// File system does not send headers in FF so get blob if possible
					if (protocol=="file:") {
						self.refreshRequest.open("GET", url, true);
						self.refreshRequest.responseType = "blob";
					}
					else {
						self.refreshRequest.open("HEAD", url, true);
						self.refreshRequest.responseType = "blob";
					}

					self.refreshRequest.onload = self.refreshOnLoadOnceHandler;

					// In some browsers (Chrome & Safari) this error occurs at send: 
					// 
					// Chrome - Access to XMLHttpRequest at 'file:///index.html' from origin 'null' 
					// has been blocked by CORS policy: 
					// Cross origin requests are only supported for protocol schemes: 
					// http, data, chrome, chrome-extension, https.
					// 
					// Safari - XMLHttpRequest cannot load file:///Users/user/Public/index.html. Cross origin requests are only supported for HTTP.
					// 
					// Solution is to run a local server, set local permissions or test in another browser
					self.refreshRequest.send(null);

					// In MS browsers the following behavior occurs possibly due to an AJAX call to check last modified date: 
					// 
					// DOM7011: The code on this page disabled back and forward caching.

					// In Brave (Chrome) error when on the server
					// index.js:221 HEAD https://www.example.com/ net::ERR_INSUFFICIENT_RESOURCES
					// self.refreshRequest.send(null);

				}
				else {
					self.refreshRequest = new XMLHttpRequest();
					self.refreshRequest.onreadystatechange = self.refreshHandler;
					self.refreshRequest.ontimeout = function() {
						self.log("Couldn't find page to check for updates");
					}
					
					var method;
					if (protocol=="file:") {
						method = "GET";
					}
					else {
						method = "HEAD";
					}

					//refreshRequest.open('HEAD', url, true);
					self.refreshRequest.open(method, url, true);
					self.refreshRequest.responseType = "blob";
					self.refreshRequest.send(null);
				}
			}
		}
		catch (error) {
			self.log("Refresh failed for the following reason:")
			self.log(error);
		}
	}

	self.refreshHandler = function() {
		var contentSize;

		try {

			if (self.refreshRequest.readyState === XMLHttpRequest.DONE) {
				
				if (self.refreshRequest.status === 2 || 
					self.refreshRequest.status === 200) {
					var pageChanged = false;

					self.updateLastModifiedLabel();

					if (self.refreshCheckContentSize) {
						var lastModifiedHeader = self.refreshRequest.getResponseHeader("Last-Modified");
						contentSize = self.refreshRequest.getResponseHeader("Content-Length");
						//lastModifiedDate = refreshRequest.getResponseHeader("Last-Modified");
						var headers = self.refreshRequest.getAllResponseHeaders();
						var hasContentHeader = headers.indexOf("Content-Length")!=-1;
						
						if (hasContentHeader) {
							contentSize = self.refreshRequest.getResponseHeader("Content-Length");

							// size has not been set yet
							if (self.refreshContentSize==null) {
								self.refreshContentSize = contentSize;
								// exit and let interval call this method again
								return;
							}

							if (contentSize!=self.refreshContentSize) {
								pageChanged = true;
							}
						}
					}
					else if (self.refreshCheckContent) {

						if (self.refreshRequest.responseText!=self.refreshContent) {
							pageChanged = true;
						}
					}
					else {
						lastModifiedHeader = self.getLastModified(self.refreshRequest);

						if (self.lastModifiedDate!=lastModifiedHeader) {
							self.log("lastModifiedDate:" + self.lastModifiedDate + ",lastModifiedHeader:" +lastModifiedHeader);
							pageChanged = true;
						}

					}

					
					if (pageChanged) {
						clearInterval(self.refreshInterval);
						self.refreshUpdatedPage();
						return;
					}

				}
				else {
					self.log('There was a problem with the request.');
				}

			}
		}
		catch( error ) {
			//console.log('Caught Exception: ' + error);
		}
	}

	self.refreshOnLoadOnceHandler = function(event) {

		// get the last modified date
		if (self.refreshRequest.response) {
			self.lastModifiedDate = self.getLastModified(self.refreshRequest);

			if (self.lastModifiedDate!=null) {

				if (self.refreshInterval==null) {
					self.refreshInterval = setInterval(self.requestRefreshUpdate, self.refreshDuration);
				}
			}
			else {
				self.log("Could not get last modified date from the server");
			}
		}
	}

	self.refreshUpdatedPage = function() {
		if (self.showRefreshNotifications) {
			var date = new Date().setTime((new Date().getTime()+10000));
			document.cookie = encodeURIComponent(self.pageRefreshedName) + "=true" + "; max-age=6000;" + " path=/";
		}

		document.location.reload(true);
	}

	self.showNotification = function(duration) {
		var notificationID = self.pageRefreshedName+"ID";
		var notification = document.getElementById(notificationID);
		if (duration==null) duration = 4000;

		if (notification!=null) {return;}

		notification = document.createElement("div");
		notification.id = notificationID;
		notification.textContent = "PAGE UPDATED";
		var styleRule = ""
		styleRule = "position: fixed; padding: 7px 16px 6px 16px; font-family: Arial, sans-serif; font-size: 10px; font-weight: bold; left: 50%;";
		styleRule += "top: 20px; background-color: rgba(0,0,0,.5); border-radius: 12px; color:rgb(235, 235, 235); transition: all 2s linear;";
		styleRule += "transform: translateX(-50%); letter-spacing: .5px; filter: drop-shadow(2px 2px 6px rgba(0, 0, 0, .1))";
		notification.setAttribute("style", styleRule);

		notification.className= "PageRefreshedClass";
		
		document.body.appendChild(notification);

		setTimeout(function() {
			notification.style.opacity = "0";
			notification.style.filter = "drop-shadow( 0px 0px 0px rgba(0,0,0, .5))";
			setTimeout(function() {
				notification.parentNode.removeChild(notification);
			}, duration)
		}, duration);

		document.cookie = encodeURIComponent(self.pageRefreshedName) + "=; max-age=1; path=/";
	}

	/**
	 * Get the last modified date from the header 
	 * or file object after request has been received
	 **/
	self.getLastModified = function(request) {
		var date;

		// file protocol - FILE object with last modified property
		if (request.response && request.response.lastModified) {
			date = request.response.lastModified;
		}
		
		// http protocol - check headers
		if (date==null) {
			date = request.getResponseHeader("Last-Modified");
		}

		return date;
	}

	self.updateLastModifiedLabel = function() {
		var labelValue = "";
		
		if (self.lastModifiedLabel==null) {
			self.lastModifiedLabel = document.getElementById("LastModifiedLabel");
		}

		if (self.lastModifiedLabel) {
			var seconds = parseInt(((new Date().getTime() - Date.parse(document.lastModified)) / 1000 / 60) * 100 + "");
			var minutes = 0;
			var hours = 0;

			if (seconds < 60) {
				seconds = Math.floor(seconds/10)*10;
				labelValue = seconds + " seconds";
			}
			else {
				minutes = parseInt((seconds/60) + "");

				if (minutes>60) {
					hours = parseInt((seconds/60/60) +"");
					labelValue += hours==1 ? " hour" : " hours";
				}
				else {
					labelValue = minutes+"";
					labelValue += minutes==1 ? " minute" : " minutes";
				}
			}
			
			if (seconds<10) {
				labelValue = "Updated now";
			}
			else {
				labelValue = "Updated " + labelValue + " ago";
			}

			if (self.lastModifiedLabel.firstElementChild) {
				self.lastModifiedLabel.firstElementChild.textContent = labelValue;

			}
			else if ("textContent" in self.lastModifiedLabel) {
				self.lastModifiedLabel.textContent = labelValue;
			}
		}
	}

	self.getShortString = function(string, length) {
		if (length==null) length = 30;
		string = string!=null ? string.substr(0, length).replace(/\n/g, "") : "[String is null]";
		return string;
	}

	self.getShortNumber = function(value, places) {
		if (places==null || places<1) places = 4;
		value = Math.round(value * Math.pow(10,places)) / Math.pow(10, places);
		return value;
	}

	///////////////////////////////////////
	// NAVIGATION CONTROLS
	///////////////////////////////////////

	self.updateViewLabel = function() {
		var viewNavigationLabel = document.getElementById("ViewNavigationLabel");
		var view = self.getVisibleView();
		var viewIndex = view ? self.getViewIndex(view) : -1;
		var viewName = view ? self.getViewPreferenceValue(view, self.prefix + "view-name") : null;
		var viewId = view ? view.id : null;

		if (viewNavigationLabel && view) {
			if (viewName && viewName.indexOf('"')!=-1) {
				viewName = viewName.replace(/"/g, "");
			}

			if (self.showViewName) {
				viewNavigationLabel.textContent = viewName;
				self.setTooltip(viewNavigationLabel, viewIndex + 1 + " of " + self.numberOfViews);
			}
			else {
				viewNavigationLabel.textContent = viewIndex + 1 + " of " + self.numberOfViews;
				self.setTooltip(viewNavigationLabel, viewName);
			}

		}
	}

	self.updateURL = function(view) {
		view = view == null ? self.getVisibleView() : view;
		var viewId = view ? view.id : null
		var viewFragment = view ? "#"+ viewId : null;

		if (viewId && self.viewIds.length>1 && self.enableDeepLinking) {

			if (self.supportsPopState==false) {
				self.setFragment(viewId);
			}
			else {
				if (viewFragment!=window.location.hash) {

					if (window.location.hash==null) {
						window.history.replaceState({name:viewId}, null, viewFragment);
					}
					else {
						window.history.pushState({name:viewId}, null, viewFragment);
					}
				}
			}
		}
	}

	self.updateURLState = function(view, stateName) {
		stateName = view && (stateName=="" || stateName==null) ? self.getStateNameByViewId(view.id) : stateName;

		if (self.supportsPopState==false) {
			self.setFragment(stateName);
		}
		else {
			if (stateName!=window.location.hash) {

				if (window.location.hash==null) {
					window.history.replaceState({name:view.viewId}, null, stateName);
				}
				else {
					window.history.pushState({name:view.viewId}, null, stateName);
				}
			}
		}
	}

	self.setFragment = function(value) {
		window.location.hash = "#" + value;
	}

	self.setTooltip = function(element, value) {
		// setting the tooltip in edge causes a page crash on hover
		if (/Edge/.test(navigator.userAgent)) { return; }

		if ("title" in element) {
			element.title = value;
		}
	}

	self.getStylesheetRules = function(styleSheet) {
		try {
			if (styleSheet) return styleSheet.cssRules || styleSheet.rules;
	
			return document.styleSheets[0]["cssRules"] || document.styleSheets[0]["rules"];
		}
		catch (error) {
			// ERRORS:
			// SecurityError: The operation is insecure.
			// Errors happen when script loads before stylesheet or loading an external css locally

			// InvalidAccessError: A parameter or an operation is not supported by the underlying object
			// Place script after stylesheet

			console.log(error);
			if (error.toString().indexOf("The operation is insecure")!=-1) {
				console.log("Load the stylesheet before the script or load the stylesheet inline until it can be loaded on a server")
			}
			return [];
		}
	}

	/**
	 * If single page application hide all of the views. 
	 * @param {Number} selectedIndex if provided shows the view at index provided
	 **/
	self.hideViews = function(selectedIndex, animation) {
		var rules = self.getStylesheetRules();
		var queryIndex = 0;
		var numberOfRules = rules!=null ? rules.length : 0;

		// loop through rules and hide media queries except selected
		for (var i=0;i<numberOfRules;i++) {
			var rule = rules[i];

			if (rule.media!=null) {

				if (queryIndex==selectedIndex) {
					self.currentQuery.mediaText = rule.conditionText;
					self.currentQuery.index = selectedIndex;
					self.currentQuery.rule = rule;
					self.enableMediaQuery(rule);
				}
				else {
					if (animation) {
						self.fadeOut(rule)
					}
					else {
						self.disableMediaQuery(rule);
					}
				}
				
				queryIndex++;
			}
		}

		self.numberOfViews = queryIndex;
		self.updateViewLabel();
		self.updateURL();

		self.dispatchViewChange();

		var view = self.getVisibleView();
		var viewIndex = view ? self.getViewIndex(view) : -1;

		return viewIndex==selectedIndex ? view : null;
	}

	/**
	 * Hide view
	 * @param {Object} view element to hide
	 **/
	self.hideView = function(view) {
		var rule = view ? self.mediaQueryDictionary[view.id] : null;

		if (rule) {
			self.disableMediaQuery(rule);
		}
	}

	/**
	 * Hide overlay
	 * @param {Object} overlay element to hide
	 **/
	self.hideOverlay = function(overlay) {
		var rule = overlay ? self.mediaQueryDictionary[overlay.id] : null;

		if (rule) {
			self.disableMediaQuery(rule);

			//if (self.showByMediaQuery) {
				overlay.style.display = "none";
			//}
		}
	}

	/**
	 * Show the view by media query. Does not hide current views
	 * Sets view options by default
	 * @param {Object} view element to show
	 * @param {Boolean} setViewOptions sets view options if null or true
	 */
	self.showViewByMediaQuery = function(view, setViewOptions) {
		var id = view ? view.id : null;
		var query = id ? self.mediaQueryDictionary[id] : null;
		var isOverlay = view ? self.isOverlay(view) : false;
		setViewOptions = setViewOptions==null ? true : setViewOptions;

		if (query) {
			self.enableMediaQuery(query);

			if (isOverlay && view && setViewOptions) {
				self.setViewVariables(null, view);
			}
			else {
				if (view && setViewOptions) self.setViewOptions(view);
				if (view && setViewOptions) self.setViewVariables(view);
			}
		}
	}

	/**
	 * Show the view. Does not hide current views
	 */
	self.showView = function(view, setViewOptions) {
		var id = view ? view.id : null;
		var query = id ? self.mediaQueryDictionary[id] : null;
		var display = null;
		setViewOptions = setViewOptions==null ? true : setViewOptions;

		if (query) {
			self.enableMediaQuery(query);
			if (view==null) view =self.getVisibleView();
			if (view && setViewOptions) self.setViewOptions(view);
		}
		else if (id) {
			display = window.getComputedStyle(view).getPropertyValue("display");
			if (display=="" || display=="none") {
				view.style.display = "block";
			}
		}

		if (view) {
			if (self.currentView!=null) {
				self.lastView = self.currentView;
			}

			self.currentView = view;
		}
	}

	self.showViewById = function(id, setViewOptions) {
		var view = id ? self.getViewById(id) : null;

		if (view) {
			self.showView(view);
			return;
		}

		self.log("View not found '" + id + "'");
	}

	self.getElementView = function(element) {
		var view = element;
		var viewFound = false;

		while (viewFound==false || view==null) {
			if (view && self.viewsDictionary[view.id]) {
				return view;
			}
			view = view.parentNode;
		}
	}

	/**
	 * Show overlay over view
	 * @param {Event | HTMLElement} event event or html element with styles applied
	 * @param {String} id id of view or view reference
	 * @param {Number} x x location
	 * @param {Number} y y location
	 */
	self.showOverlay = function(event, id, x, y) {
		var overlay = id && typeof id === 'string' ? self.getViewById(id) : id ? id : null;
		var query = overlay ? self.mediaQueryDictionary[overlay.id] : null;
		var centerHorizontally = false;
		var centerVertically = false;
		var anchorLeft = false;
		var anchorTop = false;
		var anchorRight = false;
		var anchorBottom = false;
		var display = null;
		var reparent = true;
		var view = null;
		
		if (overlay==null || overlay==false) {
			self.log("Overlay not found, '"+ id + "'");
			return;
		}

		// get enter animation - event target must have css variables declared
		if (event) {
			var button = event.currentTarget || event; // can be event or htmlelement
			var buttonComputedStyles = getComputedStyle(button);
			var actionTargetValue = buttonComputedStyles.getPropertyValue(self.prefix+"action-target").trim();
			var animation = buttonComputedStyles.getPropertyValue(self.prefix+"animation").trim();
			var isAnimated = animation!="";
			var targetType = buttonComputedStyles.getPropertyValue(self.prefix+"action-type").trim();
			var actionTarget = self.application ? null : self.getElement(actionTargetValue);
			var actionTargetStyles = actionTarget ? actionTarget.style : null;

			if (actionTargetStyles) {
				actionTargetStyles.setProperty("animation", animation);
			}

			if ("stopImmediatePropagation" in event) {
				event.stopImmediatePropagation();
			}
		}
		
		if (self.application==false || targetType=="page") {
			document.location.href = "./" + actionTargetValue;
			return;
		}

		// remove any current overlays
		if (self.currentOverlay) {

			// act as switch if same button
			if (self.currentOverlay==actionTarget || self.currentOverlay==null) {
				if (self.lastTrigger==button) {
					self.removeOverlay(isAnimated);
					return;
				}
			}
			else {
				self.removeOverlay(isAnimated);
			}
		}

		if (reparent) {
			view = self.getElementView(button);
			if (view) {
				view.appendChild(overlay);
			}
		}

		if (query) {
			//self.setElementAnimation(overlay, null);
			//overlay.style.animation = animation;
			self.enableMediaQuery(query);
			
			var display = overlay && overlay.style.display;
			
			if (overlay && display=="" || display=="none") {
				overlay.style.display = "block";
				//self.setViewOptions(overlay);
			}

			// add animation defined in event target style declaration
			if (animation && self.supportAnimations) {
				self.fadeIn(overlay, false, animation);
			}
		}
		else if (id) {

			display = window.getComputedStyle(overlay).getPropertyValue("display");

			if (display=="" || display=="none") {
				overlay.style.display = "block";
			}

			// add animation defined in event target style declaration
			if (animation && self.supportAnimations) {
				self.fadeIn(overlay, false, animation);
			}
		}

		// do not set x or y position if centering
		var horizontal = self.prefix + "center-horizontally";
		var vertical = self.prefix + "center-vertically";
		var style = overlay.style;
		var transform = [];

		centerHorizontally = self.getIsStyleDefined(id, horizontal) ? self.getViewPreferenceBoolean(overlay, horizontal) : false;
		centerVertically = self.getIsStyleDefined(id, vertical) ? self.getViewPreferenceBoolean(overlay, vertical) : false;
		anchorLeft = self.getIsStyleDefined(id, "left");
		anchorRight = self.getIsStyleDefined(id, "right");
		anchorTop = self.getIsStyleDefined(id, "top");
		anchorBottom = self.getIsStyleDefined(id, "bottom");

		
		if (self.viewsDictionary[overlay.id] && self.viewsDictionary[overlay.id].styleDeclaration) {
			style = self.viewsDictionary[overlay.id].styleDeclaration.style;
		}
		
		if (centerHorizontally) {
			style.left = "50%";
			style.transformOrigin = "0 0";
			transform.push("translateX(-50%)");
		}
		else if (anchorRight && anchorLeft) {
			style.left = x + "px";
		}
		else if (anchorRight) {
			//style.right = x + "px";
		}
		else {
			style.left = x + "px";
		}
		
		if (centerVertically) {
			style.top = "50%";
			transform.push("translateY(-50%)");
			style.transformOrigin = "0 0";
		}
		else if (anchorTop && anchorBottom) {
			style.top = y + "px";
		}
		else if (anchorBottom) {
			//style.bottom = y + "px";
		}
		else {
			style.top = y + "px";
		}

		if (transform.length) {
			style.transform = transform.join(" ");
		}

		self.currentOverlay = overlay;
		self.lastTrigger = button;
	}

	self.goBack = function() {
		if (self.currentOverlay) {
			self.removeOverlay();
		}
		else if (self.lastView) {
			self.goToView(self.lastView.id);
		}
	}

	self.removeOverlay = function(animate) {
		var overlay = self.currentOverlay;
		animate = animate===false ? false : true;

		if (overlay) {
			var style = overlay.style;
			
			if (style.animation && self.supportAnimations && animate) {
				self.reverseAnimation(overlay, true);

				var duration = self.getAnimationDuration(style.animation, true);
		
				setTimeout(function() {
					self.setElementAnimation(overlay, null);
					self.hideOverlay(overlay);
					self.currentOverlay = null;
				}, duration);
			}
			else {
				self.setElementAnimation(overlay, null);
				self.hideOverlay(overlay);
				self.currentOverlay = null;
			}
		}
	}

	/**
	 * Reverse the animation and hide after
	 * @param {Object} target element with animation
	 * @param {Boolean} hide hide after animation ends
	 */
	self.reverseAnimation = function(target, hide) {
		var lastAnimation = null;
		var style = target.style;

		style.animationPlayState = "paused";
		lastAnimation = style.animation;
		style.animation = null;
		style.animationPlayState = "paused";

		if (hide) {
			//target.addEventListener("animationend", self.animationEndHideHandler);
	
			var duration = self.getAnimationDuration(lastAnimation, true);
			var isOverlay = self.isOverlay(target);
	
			setTimeout(function() {
				self.setElementAnimation(target, null);

				if (isOverlay) {
					self.hideOverlay(target);
				}
				else {
					self.hideView(target);
				}
			}, duration);
		}

		setTimeout(function() {
			style.animation = lastAnimation;
			style.animationPlayState = "paused";
			style.animationDirection = "reverse";
			style.animationPlayState = "running";
		}, 30);
	}

	self.animationEndHandler = function(event) {
		var target = event.currentTarget;
		self.dispatchEvent(new Event(event.type));
	}

	self.isOverlay = function(view) {
		var result = view ? self.getViewPreferenceBoolean(view, self.prefix + "is-overlay") : false;

		return result;
	}

	self.animationEndHideHandler = function(event) {
		var target = event.currentTarget;
		self.setViewVariables(null, target);
		self.hideView(target);
		target.removeEventListener("animationend", self.animationEndHideHandler);
	}

	self.animationEndShowHandler = function(event) {
		var target = event.currentTarget;
		target.removeEventListener("animationend", self.animationEndShowHandler);
	}

	self.setViewOptions = function(view) {

		if (view) {
			self.minimumScale = self.getViewPreferenceValue(view, self.prefix + "minimum-scale");
			self.maximumScale = self.getViewPreferenceValue(view, self.prefix + "maximum-scale");
			self.scaleViewsToFit = self.getViewPreferenceBoolean(view, self.prefix + "scale-to-fit");
			self.scaleToFitType = self.getViewPreferenceValue(view, self.prefix + "scale-to-fit-type");
			self.scaleToFitOnDoubleClick = self.getViewPreferenceBoolean(view, self.prefix + "scale-on-double-click");
			self.actualSizeOnDoubleClick = self.getViewPreferenceBoolean(view, self.prefix + "actual-size-on-double-click");
			self.scaleViewsOnResize = self.getViewPreferenceBoolean(view, self.prefix + "scale-on-resize");
			self.enableScaleUp = self.getViewPreferenceBoolean(view, self.prefix + "enable-scale-up");
			self.centerHorizontally = self.getViewPreferenceBoolean(view, self.prefix + "center-horizontally");
			self.centerVertically = self.getViewPreferenceBoolean(view, self.prefix + "center-vertically");
			self.navigationOnKeypress = self.getViewPreferenceBoolean(view, self.prefix + "navigate-on-keypress");
			self.showViewName = self.getViewPreferenceBoolean(view, self.prefix + "show-view-name");
			self.refreshPageForChanges = self.getViewPreferenceBoolean(view, self.prefix + "refresh-for-changes");
			self.refreshPageForChangesInterval = self.getViewPreferenceValue(view, self.prefix + "refresh-interval");
			self.showNavigationControls = self.getViewPreferenceBoolean(view, self.prefix + "show-navigation-controls");
			self.scaleViewSlider = self.getViewPreferenceBoolean(view, self.prefix + "show-scale-controls");
			self.enableDeepLinking = self.getViewPreferenceBoolean(view, self.prefix + "enable-deep-linking");
			self.singlePageApplication = self.getViewPreferenceBoolean(view, self.prefix + "application");
			self.showByMediaQuery = self.getViewPreferenceBoolean(view, self.prefix + "show-by-media-query");
			self.showUpdateNotification = document.cookie!="" ? document.cookie.indexOf(self.pageRefreshedName)!=-1 : false;
			self.imageComparisonDuration = self.getViewPreferenceValue(view, self.prefix + "image-comparison-duration");
			self.supportAnimations = self.getViewPreferenceBoolean(view, self.prefix + "enable-animations", true);

			if (self.scaleViewsToFit) {
				var newScaleValue = self.scaleViewToFit(view);
				
				if (newScaleValue<0) {
					setTimeout(self.scaleViewToFit, 500, view);
				}
			}
			else {
				self.viewScale = self.getViewScaleValue(view);
				self.viewToFitWidthScale = self.getViewFitToViewportWidthScale(view, self.enableScaleUp)
				self.viewToFitHeightScale = self.getViewFitToViewportScale(view, self.enableScaleUp);
				self.updateSliderValue(self.viewScale);
			}

			if (self.imageComparisonDuration!=null) {
				// todo
			}

			if (self.refreshPageForChangesInterval!=null) {
				self.refreshDuration = Number(self.refreshPageForChangesInterval);
			}
		}
	}

	self.previousView = function(event) {
		var rules = self.getStylesheetRules();
		var view = self.getVisibleView()
		var index = view ? self.getViewIndex(view) : -1;
		var prevQueryIndex = index!=-1 ? index-1 : self.currentQuery.index-1;
		var queryIndex = 0;
		var numberOfRules = rules!=null ? rules.length : 0;

		if (event) {
			event.stopImmediatePropagation();
		}

		if (prevQueryIndex<0) {
			return;
		}

		// loop through rules and hide media queries except selected
		for (var i=0;i<numberOfRules;i++) {
			var rule = rules[i];
			
			if (rule.media!=null) {

				if (queryIndex==prevQueryIndex) {
					self.currentQuery.mediaText = rule.conditionText;
					self.currentQuery.index = prevQueryIndex;
					self.currentQuery.rule = rule;
					self.enableMediaQuery(rule);
					self.updateViewLabel();
					self.updateURL();
					self.dispatchViewChange();
				}
				else {
					self.disableMediaQuery(rule);
				}

				queryIndex++;
			}
		}
	}

	self.nextView = function(event) {
		var rules = self.getStylesheetRules();
		var view = self.getVisibleView();
		var index = view ? self.getViewIndex(view) : -1;
		var nextQueryIndex = index!=-1 ? index+1 : self.currentQuery.index+1;
		var queryIndex = 0;
		var numberOfRules = rules!=null ? rules.length : 0;
		var numberOfMediaQueries = self.getNumberOfMediaRules();

		if (event) {
			event.stopImmediatePropagation();
		}

		if (nextQueryIndex>=numberOfMediaQueries) {
			return;
		}

		// loop through rules and hide media queries except selected
		for (var i=0;i<numberOfRules;i++) {
			var rule = rules[i];
			
			if (rule.media!=null) {

				if (queryIndex==nextQueryIndex) {
					self.currentQuery.mediaText = rule.conditionText;
					self.currentQuery.index = nextQueryIndex;
					self.currentQuery.rule = rule;
					self.enableMediaQuery(rule);
					self.updateViewLabel();
					self.updateURL();
					self.dispatchViewChange();
				}
				else {
					self.disableMediaQuery(rule);
				}

				queryIndex++;
			}
		}
	}

	/**
	 * Enables a view via media query
	 */
	self.enableMediaQuery = function(rule) {

		try {
			rule.media.mediaText = self.inclusionQuery;
		}
		catch(error) {
			//self.log(error);
			rule.conditionText = self.inclusionQuery;
		}
	}

	self.disableMediaQuery = function(rule) {

		try {
			rule.media.mediaText = self.exclusionQuery;
		}
		catch(error) {
			rule.conditionText = self.exclusionQuery;
		}
	}

	self.dispatchViewChange = function() {
		try {
			var event = new Event(self.NAVIGATION_CHANGE);
			window.dispatchEvent(event);
		}
		catch (error) {
			// In IE 11: Object doesn't support this action
		}
	}

	self.getNumberOfMediaRules = function() {
		var rules = self.getStylesheetRules();
		var numberOfRules = rules ? rules.length : 0;
		var numberOfQueries = 0;

		for (var i=0;i<numberOfRules;i++) {
			if (rules[i].media!=null) { numberOfQueries++; }
		}
		
		return numberOfQueries;
	}

	/////////////////////////////////////////
	// VIEW SCALE 
	/////////////////////////////////////////

	self.sliderChangeHandler = function(event) {
		var value = self.getShortNumber(event.currentTarget.value/100);
		var view = self.getVisibleView();
		self.setViewScaleValue(view, false, value, true);
	}

	self.updateSliderValue = function(scale) {
		var slider = document.getElementById(self.viewScaleSliderId);
		var tooltip = parseInt(scale * 100 + "") + "%";
		var inputType;
		var inputValue;
		
		if (slider) {
			inputValue = self.getShortNumber(scale * 100);
			if (inputValue!=slider["value"]) {
				slider["value"] = inputValue;
			}
			inputType = slider.getAttributeNS(null, "type");

			if (inputType!="range") {
				// input range is not supported
				slider.style.display = "none";
			}

			self.setTooltip(slider, tooltip);
		}
	}

	self.viewChangeHandler = function(event) {
		var view = self.getVisibleView();
		var matrix = view ? getComputedStyle(view).transform : null;
		
		if (matrix) {
			self.viewScale = self.getViewScaleValue(view);
			
			var scaleNeededToFit = self.getViewFitToViewportScale(view);
			var isViewLargerThanViewport = scaleNeededToFit<1;
			
			// scale large view to fit if scale to fit is enabled
			if (self.scaleViewsToFit) {
				self.scaleViewToFit(view);
			}
			else {
				self.updateSliderValue(self.viewScale);
			}
		}
	}

	self.getViewScaleValue = function(view) {
		var matrix = getComputedStyle(view).transform;

		if (matrix) {
			var matrixArray = matrix.replace("matrix(", "").split(",");
			var scaleX = parseFloat(matrixArray[0]);
			var scaleY = parseFloat(matrixArray[3]);
			var scale = Math.min(scaleX, scaleY);
		}

		return scale;
	}

	/**
	 * Scales view to scale. 
	 * @param {Object} view view to scale. views are in views array
	 * @param {Boolean} scaleToFit set to true to scale to fit. set false to use desired scale value
	 * @param {Number} desiredScale scale to define. not used if scale to fit is false
	 * @param {Boolean} isSliderChange indicates if slider is callee
	 */
	self.setViewScaleValue = function(view, scaleToFit, desiredScale, isSliderChange) {
		var enableScaleUp = self.enableScaleUp;
		var scaleToFitType = self.scaleToFitType;
		var minimumScale = self.minimumScale;
		var maximumScale = self.maximumScale;
		var hasMinimumScale = !isNaN(minimumScale) && minimumScale!="";
		var hasMaximumScale = !isNaN(maximumScale) && maximumScale!="";
		var scaleNeededToFit = self.getViewFitToViewportScale(view, enableScaleUp);
		var scaleNeededToFitWidth = self.getViewFitToViewportWidthScale(view, enableScaleUp);
		var scaleNeededToFitHeight = self.getViewFitToViewportHeightScale(view, enableScaleUp);
		var scaleToFitFull = self.getViewFitToViewportScale(view, true);
		var scaleToFitFullWidth = self.getViewFitToViewportWidthScale(view, true);
		var scaleToFitFullHeight = self.getViewFitToViewportHeightScale(view, true);
		var scaleToWidth = scaleToFitType=="width";
		var scaleToHeight = scaleToFitType=="height";
		var shrunkToFit = false;
		var topPosition = null;
		var leftPosition = null;
		var translateY = null;
		var translateX = null;
		var transformValue = "";
		var canCenterVertically = true;
		var canCenterHorizontally = true;
		var style = view.style;

		if (view && self.viewsDictionary[view.id] && self.viewsDictionary[view.id].styleDeclaration) {
			style = self.viewsDictionary[view.id].styleDeclaration.style;
		}

		if (scaleToFit && isSliderChange!=true) {
			if (scaleToFitType=="fit" || scaleToFitType=="") {
				desiredScale = scaleNeededToFit;
			}
			else if (scaleToFitType=="width") {
				desiredScale = scaleNeededToFitWidth;
			}
			else if (scaleToFitType=="height") {
				desiredScale = scaleNeededToFitHeight;
			}
		}
		else {
			if (isNaN(desiredScale)) {
				desiredScale = 1;
			}
		}

		self.updateSliderValue(desiredScale);
		
		// scale to fit width
		if (scaleToWidth && scaleToHeight==false) {
			canCenterVertically = scaleNeededToFitHeight>=scaleNeededToFitWidth;
			canCenterHorizontally = scaleNeededToFitWidth>=1 && enableScaleUp==false;

			if (isSliderChange) {
				canCenterHorizontally = desiredScale<scaleToFitFullWidth;
			}
			else if (scaleToFit) {
				desiredScale = scaleNeededToFitWidth;
			}

			if (hasMinimumScale) {
				desiredScale = Math.max(desiredScale, Number(minimumScale));
			}

			if (hasMaximumScale) {
				desiredScale = Math.min(desiredScale, Number(maximumScale));
			}

			desiredScale = self.getShortNumber(desiredScale);

			canCenterHorizontally = self.canCenterHorizontally(view, "width", enableScaleUp, desiredScale, minimumScale, maximumScale);
			canCenterVertically = self.canCenterVertically(view, "width", enableScaleUp, desiredScale, minimumScale, maximumScale);

			if (desiredScale>1 && (enableScaleUp || isSliderChange)) {
				transformValue = "scale(" + desiredScale + ")";
			}
			else if (desiredScale>=1 && enableScaleUp==false) {
				transformValue = "scale(" + 1 + ")";
			}
			else {
				transformValue = "scale(" + desiredScale + ")";
			}

			if (self.centerVertically) {
				if (canCenterVertically) {
					translateY = "-50%";
					topPosition = "50%";
				}
				else {
					translateY = "0";
					topPosition = "0";
				}
				
				if (style.top != topPosition) {
					style.top = topPosition + "";
				}

				if (canCenterVertically) {
					transformValue += " translateY(" + translateY+ ")";
				}
			}

			if (self.centerHorizontally) {
				if (canCenterHorizontally) {
					translateX = "-50%";
					leftPosition = "50%";
				}
				else {
					translateX = "0";
					leftPosition = "0";
				}

				if (style.left != leftPosition) {
					style.left = leftPosition + "";
				}

				if (canCenterHorizontally) {
					transformValue += " translateX(" + translateX+ ")";
				}
			}

			style.transformOrigin = "0 0";
			style.transform = transformValue;

			self.viewScale = desiredScale;
			self.viewToFitWidthScale = scaleNeededToFitWidth;
			self.viewToFitHeightScale = scaleNeededToFitHeight;
			self.viewLeft = leftPosition;
			self.viewTop = topPosition;

			return desiredScale;
		}

		// scale to fit height
		if (scaleToHeight && scaleToWidth==false) {
			//canCenterVertically = scaleNeededToFitHeight>=scaleNeededToFitWidth;
			//canCenterHorizontally = scaleNeededToFitHeight<=scaleNeededToFitWidth && enableScaleUp==false;
			canCenterVertically = scaleNeededToFitHeight>=scaleNeededToFitWidth;
			canCenterHorizontally = scaleNeededToFitWidth>=1 && enableScaleUp==false;
			
			if (isSliderChange) {
				canCenterHorizontally = desiredScale<scaleToFitFullHeight;
			}
			else if (scaleToFit) {
				desiredScale = scaleNeededToFitHeight;
			}

			if (hasMinimumScale) {
				desiredScale = Math.max(desiredScale, Number(minimumScale));
			}

			if (hasMaximumScale) {
				desiredScale = Math.min(desiredScale, Number(maximumScale));
				//canCenterVertically = desiredScale>=scaleNeededToFitHeight && enableScaleUp==false;
			}

			desiredScale = self.getShortNumber(desiredScale);

			canCenterHorizontally = self.canCenterHorizontally(view, "height", enableScaleUp, desiredScale, minimumScale, maximumScale);
			canCenterVertically = self.canCenterVertically(view, "height", enableScaleUp, desiredScale, minimumScale, maximumScale);

			if (desiredScale>1 && (enableScaleUp || isSliderChange)) {
				transformValue = "scale(" + desiredScale + ")";
			}
			else if (desiredScale>=1 && enableScaleUp==false) {
				transformValue = "scale(" + 1 + ")";
			}
			else {
				transformValue = "scale(" + desiredScale + ")";
			}

			if (self.centerHorizontally) {
				if (canCenterHorizontally) {
					translateX = "-50%";
					leftPosition = "50%";
				}
				else {
					translateX = "0";
					leftPosition = "0";
				}

				if (style.left != leftPosition) {
					style.left = leftPosition + "";
				}

				if (canCenterHorizontally) {
					transformValue += " translateX(" + translateX+ ")";
				}
			}

			if (self.centerVertically) {
				if (canCenterVertically) {
					translateY = "-50%";
					topPosition = "50%";
				}
				else {
					translateY = "0";
					topPosition = "0";
				}
				
				if (style.top != topPosition) {
					style.top = topPosition + "";
				}

				if (canCenterVertically) {
					transformValue += " translateY(" + translateY+ ")";
				}
			}

			style.transformOrigin = "0 0";
			style.transform = transformValue;

			self.viewScale = desiredScale;
			self.viewToFitWidthScale = scaleNeededToFitWidth;
			self.viewToFitHeightScale = scaleNeededToFitHeight;
			self.viewLeft = leftPosition;
			self.viewTop = topPosition;

			return scaleNeededToFitHeight;
		}

		if (scaleToFitType=="fit") {
			//canCenterVertically = scaleNeededToFitHeight>=scaleNeededToFitWidth;
			//canCenterHorizontally = scaleNeededToFitWidth>=scaleNeededToFitHeight;
			canCenterVertically = scaleNeededToFitHeight>=scaleNeededToFit;
			canCenterHorizontally = scaleNeededToFitWidth>=scaleNeededToFit;

			if (hasMinimumScale) {
				desiredScale = Math.max(desiredScale, Number(minimumScale));
			}

			desiredScale = self.getShortNumber(desiredScale);

			if (isSliderChange || scaleToFit==false) {
				canCenterVertically = scaleToFitFullHeight>=desiredScale;
				canCenterHorizontally = desiredScale<scaleToFitFullWidth;
			}
			else if (scaleToFit) {
				desiredScale = scaleNeededToFit;
			}

			transformValue = "scale(" + desiredScale + ")";

			//canCenterHorizontally = self.canCenterHorizontally(view, "fit", false, desiredScale);
			//canCenterVertically = self.canCenterVertically(view, "fit", false, desiredScale);
			
			if (self.centerVertically) {
				if (canCenterVertically) {
					translateY = "-50%";
					topPosition = "50%";
				}
				else {
					translateY = "0";
					topPosition = "0";
				}
				
				if (style.top != topPosition) {
					style.top = topPosition + "";
				}

				if (canCenterVertically) {
					transformValue += " translateY(" + translateY+ ")";
				}
			}

			if (self.centerHorizontally) {
				if (canCenterHorizontally) {
					translateX = "-50%";
					leftPosition = "50%";
				}
				else {
					translateX = "0";
					leftPosition = "0";
				}

				if (style.left != leftPosition) {
					style.left = leftPosition + "";
				}

				if (canCenterHorizontally) {
					transformValue += " translateX(" + translateX+ ")";
				}
			}

			style.transformOrigin = "0 0";
			style.transform = transformValue;

			self.viewScale = desiredScale;
			self.viewToFitWidthScale = scaleNeededToFitWidth;
			self.viewToFitHeightScale = scaleNeededToFitHeight;
			self.viewLeft = leftPosition;
			self.viewTop = topPosition;

			self.updateSliderValue(desiredScale);
			
			return desiredScale;
		}

		if (scaleToFitType=="default" || scaleToFitType=="") {
			desiredScale = 1;

			if (hasMinimumScale) {
				desiredScale = Math.max(desiredScale, Number(minimumScale));
			}
			if (hasMaximumScale) {
				desiredScale = Math.min(desiredScale, Number(maximumScale));
			}

			canCenterHorizontally = self.canCenterHorizontally(view, "none", false, desiredScale, minimumScale, maximumScale);
			canCenterVertically = self.canCenterVertically(view, "none", false, desiredScale, minimumScale, maximumScale);

			if (self.centerVertically) {
				if (canCenterVertically) {
					translateY = "-50%";
					topPosition = "50%";
				}
				else {
					translateY = "0";
					topPosition = "0";
				}
				
				if (style.top != topPosition) {
					style.top = topPosition + "";
				}

				if (canCenterVertically) {
					transformValue += " translateY(" + translateY+ ")";
				}
			}

			if (self.centerHorizontally) {
				if (canCenterHorizontally) {
					translateX = "-50%";
					leftPosition = "50%";
				}
				else {
					translateX = "0";
					leftPosition = "0";
				}

				if (style.left != leftPosition) {
					style.left = leftPosition + "";
				}

				if (canCenterHorizontally) {
					transformValue += " translateX(" + translateX+ ")";
				}
				else {
					transformValue += " translateX(" + 0 + ")";
				}
			}

			style.transformOrigin = "0 0";
			style.transform = transformValue;


			self.viewScale = desiredScale;
			self.viewToFitWidthScale = scaleNeededToFitWidth;
			self.viewToFitHeightScale = scaleNeededToFitHeight;
			self.viewLeft = leftPosition;
			self.viewTop = topPosition;

			self.updateSliderValue(desiredScale);
			
			return desiredScale;
		}
	}

	/**
	 * Returns true if view can be centered horizontally
	 * @param {HTMLElement} view view
	 * @param {String} type type of scaling - width, height, all, none
	 * @param {Boolean} scaleUp if scale up enabled 
	 * @param {Number} scale target scale value 
	 */
	self.canCenterHorizontally = function(view, type, scaleUp, scale, minimumScale, maximumScale) {
		var scaleNeededToFit = self.getViewFitToViewportScale(view, scaleUp);
		var scaleNeededToFitHeight = self.getViewFitToViewportHeightScale(view, scaleUp);
		var scaleNeededToFitWidth = self.getViewFitToViewportWidthScale(view, scaleUp);
		var canCenter = false;
		var minScale;

		type = type==null ? "none" : type;
		scale = scale==null ? scale : scaleNeededToFitWidth;
		scaleUp = scaleUp == null ? false : scaleUp;

		if (type=="width") {
	
			if (scaleUp && maximumScale==null) {
				canCenter = false;
			}
			else if (scaleNeededToFitWidth>=1) {
				canCenter = true;
			}
		}
		else if (type=="height") {
			minScale = Math.min(1, scaleNeededToFitHeight);
			if (minimumScale!="" && maximumScale!="") {
				minScale = Math.max(minimumScale, Math.min(maximumScale, scaleNeededToFitHeight));
			}
			else {
				if (minimumScale!="") {
					minScale = Math.max(minimumScale, scaleNeededToFitHeight);
				}
				if (maximumScale!="") {
					minScale = Math.max(minimumScale, Math.min(maximumScale, scaleNeededToFitHeight));
				}
			}
	
			if (scaleUp && maximumScale=="") {
				canCenter = false;
			}
			else if (scaleNeededToFitWidth>=minScale) {
				canCenter = true;
			}
		}
		else if (type=="fit") {
			canCenter = scaleNeededToFitWidth>=scaleNeededToFit;
		}
		else {
			if (scaleUp) {
				canCenter = false;
			}
			else if (scaleNeededToFitWidth>=1) {
				canCenter = true;
			}
		}

		self.horizontalScrollbarsNeeded = canCenter;
		
		return canCenter;
	}

	/**
	 * Returns true if view can be centered horizontally
	 * @param {HTMLElement} view view to scale
	 * @param {String} type type of scaling
	 * @param {Boolean} scaleUp if scale up enabled 
	 * @param {Number} scale target scale value 
	 */
	self.canCenterVertically = function(view, type, scaleUp, scale, minimumScale, maximumScale) {
		var scaleNeededToFit = self.getViewFitToViewportScale(view, scaleUp);
		var scaleNeededToFitWidth = self.getViewFitToViewportWidthScale(view, scaleUp);
		var scaleNeededToFitHeight = self.getViewFitToViewportHeightScale(view, scaleUp);
		var canCenter = false;
		var minScale;

		type = type==null ? "none" : type;
		scale = scale==null ? 1 : scale;
		scaleUp = scaleUp == null ? false : scaleUp;
	
		if (type=="width") {
			canCenter = scaleNeededToFitHeight>=scaleNeededToFitWidth;
		}
		else if (type=="height") {
			minScale = Math.max(minimumScale, Math.min(maximumScale, scaleNeededToFit));
			canCenter = scaleNeededToFitHeight>=minScale;
		}
		else if (type=="fit") {
			canCenter = scaleNeededToFitHeight>=scaleNeededToFit;
		}
		else {
			if (scaleUp) {
				canCenter = false;
			}
			else if (scaleNeededToFitHeight>=1) {
				canCenter = true;
			}
		}

		self.verticalScrollbarsNeeded = canCenter;
		
		return canCenter;
	}

	self.getViewFitToViewportScale = function(view, scaleUp) {
		var enableScaleUp = scaleUp;
		var availableWidth = window.innerWidth || document.documentElement.clientWidth || document.body.clientWidth;
		var availableHeight = window.innerHeight || document.documentElement.clientHeight || document.body.clientHeight;
		var elementWidth = parseFloat(getComputedStyle(view, "style").width);
		var elementHeight = parseFloat(getComputedStyle(view, "style").height);
		var newScale = 1;

		// if element is not added to the document computed values are NaN
		if (isNaN(elementWidth) || isNaN(elementHeight)) {
			return newScale;
		}

		availableWidth -= self.horizontalPadding;
		availableHeight -= self.verticalPadding;

		if (enableScaleUp) {
			newScale = Math.min(availableHeight/elementHeight, availableWidth/elementWidth);
		}
		else if (elementWidth > availableWidth || elementHeight > availableHeight) {
			newScale = Math.min(availableHeight/elementHeight, availableWidth/elementWidth);
		}
		
		return newScale;
	}

	self.getViewFitToViewportWidthScale = function(view, scaleUp) {
		// need to get browser viewport width when element
		var isParentWindow = view && view.parentNode && view.parentNode===document.body;
		var enableScaleUp = scaleUp;
		var availableWidth = window.innerWidth || document.documentElement.clientWidth || document.body.clientWidth;
		var elementWidth = parseFloat(getComputedStyle(view, "style").width);
		var newScale = 1;

		// if element is not added to the document computed values are NaN
		if (isNaN(elementWidth)) {
			return newScale;
		}

		availableWidth -= self.horizontalPadding;

		if (enableScaleUp) {
			newScale = availableWidth/elementWidth;
		}
		else if (elementWidth > availableWidth) {
			newScale = availableWidth/elementWidth;
		}
		
		return newScale;
	}

	self.getViewFitToViewportHeightScale = function(view, scaleUp) {
		var enableScaleUp = scaleUp;
		var availableHeight = window.innerHeight || document.documentElement.clientHeight || document.body.clientHeight;
		var elementHeight = parseFloat(getComputedStyle(view, "style").height);
		var newScale = 1;

		// if element is not added to the document computed values are NaN
		if (isNaN(elementHeight)) {
			return newScale;
		}

		availableHeight -= self.verticalPadding;

		if (enableScaleUp) {
			newScale = availableHeight/elementHeight;
		}
		else if (elementHeight > availableHeight) {
			newScale = availableHeight/elementHeight;
		}
		
		return newScale;
	}

	self.keypressHandler = function(event) {
		var rightKey = 39;
		var leftKey = 37;
		
		// listen for both events 
		if (event.type=="keypress") {
			window.removeEventListener("keyup", self.keypressHandler);
		}
		else {
			window.removeEventListener("keypress", self.keypressHandler);
		}
		
		if (self.showNavigationControls) {
			if (self.navigationOnKeypress) {
				if (event.keyCode==rightKey) {
					self.nextView();
				}
				if (event.keyCode==leftKey) {
					self.previousView();
				}
			}
		}
		else if (self.navigationOnKeypress) {
			if (event.keyCode==rightKey) {
				self.nextView();
			}
			if (event.keyCode==leftKey) {
				self.previousView();
			}
		}
	}

	///////////////////////////////////
	// GENERAL FUNCTIONS
	///////////////////////////////////

	self.getViewById = function(id) {
		id = id ? id.replace("#", "") : "";
		var view = self.viewIds.indexOf(id)!=-1 && self.getElement(id);
		return view;
	}

	self.getViewIds = function() {
		var viewIds = self.getViewPreferenceValue(document.body, self.prefix + "view-ids");
		var viewId = null;

		viewIds = viewIds!=null && viewIds!="" ? viewIds.split(",") : [];

		if (viewIds.length==0) {
			viewId = self.getViewPreferenceValue(document.body, self.prefix + "view-id");
			viewIds = viewId ? [viewId] : [];
		}

		return viewIds;
	}

	self.getInitialViewId = function() {
		var viewId = self.getViewPreferenceValue(document.body, self.prefix + "view-id");
		return viewId;
	}

	self.getApplicationStylesheet = function() {
		var stylesheetId = self.getViewPreferenceValue(document.body, self.prefix + "stylesheet-id");
		self.applicationStylesheet = document.getElementById("applicationStylesheet");
		return self.applicationStylesheet.sheet;
	}

	self.getVisibleView = function() {
		var viewIds = self.getViewIds();
		
		for (var i=0;i<viewIds.length;i++) {
			var viewId = viewIds[i].replace(/[\#?\.?](.*)/, "$" + "1");
			var view = self.getElement(viewId);
			var postName = "_Class";

			if (view==null && viewId && viewId.lastIndexOf(postName)!=-1) {
				view = self.getElement(viewId.replace(postName, ""));
			}
			
			if (view) {
				var display = getComputedStyle(view).display;
		
				if (display=="block" || display=="flex") {
					return view;
				}
			}
		}

		return null;
	}

	self.getVisibleViews = function() {
		var viewIds = self.getViewIds();
		var views = [];
		
		for (var i=0;i<viewIds.length;i++) {
			var viewId = viewIds[i].replace(/[\#?\.?](.*)/, "$" + "1");
			var view = self.getElement(viewId);
			var postName = "_Class";

			if (view==null && viewId && viewId.lastIndexOf(postName)!=-1) {
				view = self.getElement(viewId.replace(postName, ""));
			}
			
			if (view) {
				var display = getComputedStyle(view).display;
				
				if (display=="none") {
					continue;
				}

				if (display=="block" || display=="flex") {
					views.push(view);
				}
			}
		}

		return views;
	}

	self.getStateNameByViewId = function(id) {
		var state = self.viewsDictionary[id];
		return state && state.stateName;
	}

	self.getMatchingViews = function(ids) {
		var views = self.addedViews.slice(0);
		var matchingViews = [];

		if (self.showByMediaQuery) {
			for (let index = 0; index < views.length; index++) {
				var viewId = views[index];
				var state = self.viewsDictionary[viewId];
				var rule = state && state.rule; 
				var matchResults = window.matchMedia(rule.conditionText);
				var view = self.views[viewId];
				
				if (matchResults.matches) {
					if (ids==true) {
						matchingViews.push(viewId);
					}
					else {
						matchingViews.push(view);
					}
				}
			}
		}

		return matchingViews;
	}

	self.ruleMatchesQuery = function(rule) {
		var result = window.matchMedia(rule.conditionText);
		return result.matches;
	}

	self.getViewsByStateName = function(stateName, matchQuery) {
		var views = self.addedViews.slice(0);
		var matchingViews = [];

		if (self.showByMediaQuery) {

			// find state name
			for (let index = 0; index < views.length; index++) {
				var viewId = views[index];
				var state = self.viewsDictionary[viewId];
				var rule = state.rule;
				var mediaRule = state.mediaRule;
				var view = self.views[viewId];
				var viewStateName = self.getStyleRuleValue(mediaRule, self.STATE_NAME, state);
				var stateFoundAtt = view.getAttribute(self.STATE_NAME)==state;
				var matchesResults = false;
				
				if (viewStateName==stateName) {
					if (matchQuery) {
						matchesResults = self.ruleMatchesQuery(rule);

						if (matchesResults) {
							matchingViews.push(view);
						}
					}
					else {
						matchingViews.push(view);
					}
				}
			}
		}

		return matchingViews;
	}

	self.getInitialView = function() {
		var viewId = self.getInitialViewId();
		viewId = viewId.replace(/[\#?\.?](.*)/, "$" + "1");
		var view = self.getElement(viewId);
		var postName = "_Class";

		if (view==null && viewId && viewId.lastIndexOf(postName)!=-1) {
			view = self.getElement(viewId.replace(postName, ""));
		}

		return view;
	}

	self.getViewIndex = function(view) {
		var viewIds = self.getViewIds();
		var id = view ? view.id : null;
		var index = id && viewIds ? viewIds.indexOf(id) : -1;

		return index;
	}

	self.syncronizeViewToURL = function() {
		var fragment = self.getHashFragment();

		if (self.showByMediaQuery) {
			var stateName = fragment;
			
			if (stateName==null || stateName=="") {
				var initialView = self.getInitialView();
				stateName = initialView ? self.getStateNameByViewId(initialView.id) : null;
			}
			
			self.showMediaQueryViewsByState(stateName);
			return;
		}

		var view = self.getViewById(fragment);
		var index = view ? self.getViewIndex(view) : 0;
		if (index==-1) index = 0;
		var currentView = self.hideViews(index);

		if (self.supportsPopState && currentView) {

			if (fragment==null) {
				window.history.replaceState({name:currentView.id}, null, "#"+ currentView.id);
			}
			else {
				window.history.pushState({name:currentView.id}, null, "#"+ currentView.id);
			}
		}
		
		self.setViewVariables(view);
		return view;
	}

	/**
	 * Set the currentView or currentOverlay properties and set the lastView or lastOverlay properties
	 */
	self.setViewVariables = function(view, overlay, parentView) {
		if (view) {
			if (self.currentView) {
				self.lastView = self.currentView;
			}
			self.currentView = view;
		}

		if (overlay) {
			if (self.currentOverlay) {
				self.lastOverlay = self.currentOverlay;
			}
			self.currentOverlay = overlay;
		}
	}

	self.getViewPreferenceBoolean = function(view, property, altValue) {
		var computedStyle = window.getComputedStyle(view);
		var value = computedStyle.getPropertyValue(property);
		var type = typeof value;
		
		if (value=="true" || (type=="string" && value.indexOf("true")!=-1)) {
			return true;
		}
		else if (value=="" && arguments.length==3) {
			return altValue;
		}

		return false;
	}

	self.getViewPreferenceValue = function(view, property, defaultValue) {
		var value = window.getComputedStyle(view).getPropertyValue(property);

		if (value===undefined) {
			return defaultValue;
		}
		
		value = value.replace(/^[\s\"]*/, "");
		value = value.replace(/[\s\"]*$/, "");
		value = value.replace(/^[\s"]*(.*?)[\s"]*$/, function (match, capture) { 
			return capture;
		});

		return value;
	}

	self.getStyleRuleValue = function(cssRule, property) {
		var value = cssRule ? cssRule.style.getPropertyValue(property) : null;

		if (value===undefined) {
			return null;
		}
		
		value = value.replace(/^[\s\"]*/, "");
		value = value.replace(/[\s\"]*$/, "");
		value = value.replace(/^[\s"]*(.*?)[\s"]*$/, function (match, capture) { 
			return capture;
		});

		return value;
	}

	/**
	 * Get the first defined value of property. Returns empty string if not defined
	 * @param {String} id id of element
	 * @param {String} property 
	 */
	self.getCSSPropertyValueForElement = function(id, property) {
		var styleSheets = document.styleSheets;
		var numOfStylesheets = styleSheets.length;
		var values = [];
		var selectorIDText = "#" + id;
		var selectorClassText = "." + id + "_Class";
		var value;

		for(var i=0;i<numOfStylesheets;i++) {
			var styleSheet = styleSheets[i];
			var cssRules = self.getStylesheetRules(styleSheet);
			var numOfCSSRules = cssRules.length;
			var cssRule;
			
			for (var j=0;j<numOfCSSRules;j++) {
				cssRule = cssRules[j];
				
				if (cssRule.media) {
					var mediaRules = cssRule.cssRules;
					var numOfMediaRules = mediaRules ? mediaRules.length : 0;
					
					for(var k=0;k<numOfMediaRules;k++) {
						var mediaRule = mediaRules[k];
						
						if (mediaRule.selectorText==selectorIDText || mediaRule.selectorText==selectorClassText) {
							
							if (mediaRule.style && mediaRule.style.getPropertyValue(property)!="") {
								value = mediaRule.style.getPropertyValue(property);
								values.push(value);
							}
						}
					}
				}
				else {

					if (cssRule.selectorText==selectorIDText || cssRule.selectorText==selectorClassText) {
						if (cssRule.style && cssRule.style.getPropertyValue(property)!="") {
							value = cssRule.style.getPropertyValue(property);
							values.push(value);
						}
					}
				}
			}
		}

		return values.pop();
	}

	self.getIsStyleDefined = function(id, property) {
		var value = self.getCSSPropertyValueForElement(id, property);
		return value!==undefined && value!="";
	}

	self.collectViews = function() {
		var viewIds = self.getViewIds();

		for (let index = 0; index < viewIds.length; index++) {
			const id = viewIds[index];
			const view = self.getElement(id);
			self.views[id] = view;
		}
		
		self.viewIds = viewIds;
	}

	self.collectOverlays = function() {
		var viewIds = self.getViewIds();
		var ids = [];

		for (let index = 0; index < viewIds.length; index++) {
			const id = viewIds[index];
			const view = self.getViewById(id);
			const isOverlay = view && self.isOverlay(view);
			
			if (isOverlay) {
				ids.push(id);
				self.overlays[id] = view;
			}
		}
		
		self.overlayIds = ids;
	}

	self.collectMediaQueries = function() {
		var viewIds = self.getViewIds();
		var styleSheet = self.getApplicationStylesheet();
		var cssRules = self.getStylesheetRules(styleSheet);
		var numOfCSSRules = cssRules ? cssRules.length : 0;
		var cssRule;
		var id = viewIds.length ? viewIds[0]: ""; // single view
		var selectorIDText = "#" + id;
		var selectorClassText = "." + id + "_Class";
		var viewsNotFound = viewIds.slice();
		var viewsFound = [];
		var selectorText = null;
		var property = self.prefix + "view-id";
		var stateName = self.prefix + "state";
		var stateValue;
		
		for (var j=0;j<numOfCSSRules;j++) {
			cssRule = cssRules[j];
			
			if (cssRule.media) {
				var mediaRules = cssRule.cssRules;
				var numOfMediaRules = mediaRules ? mediaRules.length : 0;
				var mediaViewInfoFound = false;
				var mediaId = null;
				
				for(var k=0;k<numOfMediaRules;k++) {
					var mediaRule = mediaRules[k];

					selectorText = mediaRule.selectorText;
					
					if (selectorText==".mediaViewInfo" && mediaViewInfoFound==false) {

						mediaId = self.getStyleRuleValue(mediaRule, property);
						stateValue = self.getStyleRuleValue(mediaRule, stateName);

						selectorIDText = "#" + mediaId;
						selectorClassText = "." + mediaId + "_Class";
						
						// prevent duplicates from load and domcontentloaded events
						if (self.addedViews.indexOf(mediaId)==-1) {
							self.addView(mediaId, cssRule, mediaRule, stateValue);
						}

						viewsFound.push(mediaId);

						if (viewsNotFound.indexOf(mediaId)!=-1) {
							viewsNotFound.splice(viewsNotFound.indexOf(mediaId));
						}

						mediaViewInfoFound = true;
					}

					if (selectorIDText==selectorText || selectorClassText==selectorText) {
						var styleObject = self.viewsDictionary[mediaId];
						if (styleObject) {
							styleObject.styleDeclaration = mediaRule;
						}
						break;
					}
				}
			}
			else {
				selectorText = cssRule.selectorText;
				
				if (selectorText==null) continue;

				selectorText = selectorText.replace(/[#|\s|*]?/g, "");

				if (viewIds.indexOf(selectorText)!=-1) {
					self.addView(selectorText, cssRule, null, stateValue);

					if (viewsNotFound.indexOf(selectorText)!=-1) {
						viewsNotFound.splice(viewsNotFound.indexOf(selectorText));
					}

					break;
				}
			}
		}

		if (viewsNotFound.length) {
			console.log("Could not find the following views:" + viewsNotFound.join(",") + "");
			console.log("Views found:" + viewsFound.join(",") + "");
		}
	}

	/**
	 * Adds a view. A view object contains the id of the view and the style rule
	 * Use enableMediaQuery(rule) to enable
	 * An array of view names are in self.addedViews array
	 */
	self.addView = function(viewId, cssRule, mediaRule, stateName) {
		var state = {name:viewId, rule:cssRule, id:viewId, mediaRule:mediaRule, stateName:stateName};
		self.addedViews.push(viewId);
		self.viewsDictionary[viewId] = state;
		self.mediaQueryDictionary[viewId] = cssRule;
	}

	self.hasView = function(name) {

		if (self.addedViews.indexOf(name)!=-1) {
			return true;
		}
		return false;
	}

	/**
	 * Go to view by id. Views are added in addView()
	 * @param {String} id id of view in current
	 * @param {Boolean} maintainPreviousState if true then do not hide other views
	 * @param {String} parent id of parent view
	 */
	self.goToView = function(id, maintainPreviousState, parent) {
		var state = self.viewsDictionary[id];

		if (state) {
			if (maintainPreviousState==false || maintainPreviousState==null) {
				self.hideViews();
			}
			self.enableMediaQuery(state.rule);
			self.updateViewLabel();
			self.updateURL();
		}
		else {
			var event = new Event(self.STATE_NOT_FOUND);
			self.stateName = id;
			window.dispatchEvent(event);
		}
	}

	/**
	 * Go to the view in the event targets CSS variable
	 */
	self.goToTargetView = function(event) {
		var button = event.currentTarget;
		var buttonComputedStyles = getComputedStyle(button);
		var actionTargetValue = buttonComputedStyles.getPropertyValue(self.prefix+"action-target").trim();
		var animation = buttonComputedStyles.getPropertyValue(self.prefix+"animation").trim();
		var targetType = buttonComputedStyles.getPropertyValue(self.prefix+"action-type").trim();
		var targetView = self.application ? null : self.getElement(actionTargetValue);
		var targetState = targetView ? self.getStateNameByViewId(targetView.id) : null;
		var actionTargetStyles = targetView ? targetView.style : null;
		var state = self.viewsDictionary[actionTargetValue];
		
		// navigate to page
		if (self.application==false || targetType=="page") {
			document.location.href = "./" + actionTargetValue;
			return;
		}

		// if view is found
		if (targetView) {

			if (self.currentOverlay) {
				self.removeOverlay(false);
			}

			if (self.showByMediaQuery) {
				var stateName = targetState;
				
				if (stateName==null || stateName=="") {
					var initialView = self.getInitialView();
					stateName = initialView ? self.getStateNameByViewId(initialView.id) : null;
				}
				self.showMediaQueryViewsByState(stateName, event);
				return;
			}

			// add animation set in event target style declaration
			if (animation && self.supportAnimations) {
				self.crossFade(self.currentView, targetView, false, animation);
			}
			else {
				self.setViewVariables(self.currentView);
				self.hideViews();
				self.enableMediaQuery(state.rule);
				self.scaleViewIfNeeded(targetView);
				self.centerView(targetView);
				self.updateViewLabel();
				self.updateURL();
			}
		}
		else {
			var stateEvent = new Event(self.STATE_NOT_FOUND);
			self.stateName = name;
			window.dispatchEvent(stateEvent);
		}

		event.stopImmediatePropagation();
	}

	/**
	 * Cross fade between views
	 **/
	self.crossFade = function(from, to, update, animation) {
		var targetIndex = to.parentNode
		var fromIndex = Array.prototype.slice.call(from.parentElement.children).indexOf(from);
		var toIndex = Array.prototype.slice.call(to.parentElement.children).indexOf(to);

		if (from.parentNode==to.parentNode) {
			var reverse = self.getReverseAnimation(animation);
			var duration = self.getAnimationDuration(animation, true);

			// if target view is above (higher index)
			// then fade in target view 
			// and after fade in then hide previous view instantly
			if (fromIndex<toIndex) {
				self.setElementAnimation(from, null);
				self.setElementAnimation(to, null);
				self.showViewByMediaQuery(to);
				self.fadeIn(to, update, animation);

				setTimeout(function() {
					self.setElementAnimation(to, null);
					self.setElementAnimation(from, null);
					self.hideView(from);
					self.updateURL();
					self.setViewVariables(to);
					self.updateViewLabel();
				}, duration)
			}
			// if target view is on bottom
			// then show target view instantly 
			// and fade out current view
			else if (fromIndex>toIndex) {
				self.setElementAnimation(to, null);
				self.setElementAnimation(from, null);
				self.showViewByMediaQuery(to);
				self.fadeOut(from, update, reverse);

				setTimeout(function() {
					self.setElementAnimation(to, null);
					self.setElementAnimation(from, null);
					self.hideView(from);
					self.updateURL();
					self.setViewVariables(to);
				}, duration)
			}
		}
	}

	self.fadeIn = function(element, update, animation) {
		self.showViewByMediaQuery(element);

		if (update) {
			self.updateURL(element);

			element.addEventListener("animationend", function(event) {
				element.style.animation = null;
				self.setViewVariables(element);
				self.updateViewLabel();
				element.removeEventListener("animationend", arguments.callee);
			});
		}

		self.setElementAnimation(element, null);
		
		element.style.animation = animation;
	}

	self.fadeOutCurrentView = function(animation, update) {
		if (self.currentView) {
			self.fadeOut(self.currentView, update, animation);
		}
		if (self.currentOverlay) {
			self.fadeOut(self.currentOverlay, update, animation);
		}
	}

	self.fadeOut = function(element, update, animation) {
		if (update) {
			element.addEventListener("animationend", function(event) {
				element.style.animation = null;
				self.hideView(element);
				element.removeEventListener("animationend", arguments.callee);
			});
		}

		element.style.animationPlayState = "paused";
		element.style.animation = animation;
		element.style.animationPlayState = "running";
	}

	self.getReverseAnimation = function(animation) {
		if (animation && animation.indexOf("reverse")==-1) {
			animation += " reverse";
		}

		return animation;
	}

	/**
	 * Get duration in animation string
	 * @param {String} animation animation value
	 * @param {Boolean} inMilliseconds length in milliseconds if true
	 */
	self.getAnimationDuration = function(animation, inMilliseconds) {
		var duration = 0;
		var expression = /.+(\d\.\d)s.+/;

		if (animation && animation.match(expression)) {
			duration = parseFloat(animation.replace(expression, "$" + "1"));
			if (duration && inMilliseconds) duration = duration * 1000;
		}

		return duration;
	}

	self.setElementAnimation = function(element, animation, priority) {
		element.style.setProperty("animation", animation, "important");
	}

	self.getElement = function(id) {
		var elementId = id ? id.trim() : id;
		var element = elementId ? document.getElementById(elementId) : null;

		return element;
	}

	self.getElementByClass = function(className) {
		className = className ? className.trim() : className;
		var elements = document.getElementsByClassName(className);

		return elements.length ? elements[0] : null;
	}

	self.resizeHandler = function(event) {
		
		if (self.showByMediaQuery) {
			if (self.enableDeepLinking) {
				var stateName = self.getHashFragment();

				if (stateName==null || stateName=="") {
					var initialView = self.getInitialView();
					stateName = initialView ? self.getStateNameByViewId(initialView.id) : null;
				}
				self.showMediaQueryViewsByState(stateName, event);
			}
		}
		else {
			var visibleViews = self.getVisibleViews();

			for (let index = 0; index < visibleViews.length; index++) {	
				var view = visibleViews[index];
				self.scaleViewIfNeeded(view);
			}
		}

		window.dispatchEvent(new Event(self.APPLICATION_RESIZE));
	}

	self.scaleViewIfNeeded = function(view) {

		if (self.scaleViewsOnResize) {
			if (view==null) {
				view = self.getVisibleView();
			}

			var isViewScaled = view.getAttributeNS(null, self.SIZE_STATE_NAME)=="false" ? false : true;

			if (isViewScaled) {
				self.scaleViewToFit(view, true);
			}
			else {
				self.scaleViewToActualSize(view);
			}
		}
		else if (view) {
			self.centerView(view);
		}
	}

	self.centerView = function(view) {

		if (self.scaleViewsToFit) {
			self.scaleViewToFit(view, true);
		}
		else {
			self.scaleViewToActualSize(view);  // for centering support for now
		}
	}

	self.preventDoubleClick = function(event) {
		event.stopImmediatePropagation();
	}

	self.getHashFragment = function() {
		var value = window.location.hash ? window.location.hash.replace("#", "") : "";
		return value;
	}

	self.showBlockElement = function(view) {
		view.style.display = "block";
	}

	self.hideElement = function(view) {
		view.style.display = "none";
	}

	self.showStateFunction = null;

	self.showMediaQueryViewsByState = function(state, event) {
		// browser will hide and show by media query (small, medium, large)
		// but if multiple views exists at same size user may want specific view
		// if showStateFunction is defined that is called with state fragment and user can show or hide each media matching view by returning true or false
		// if showStateFunction is not defined and state is defined and view has a defined state that matches then show that and hide other matching views
		// if no state is defined show view 
		// an viewChanging event is dispatched before views are shown or hidden that can be prevented 

		// get all matched queries
		// if state name is specified then show that view and hide other views
		// if no state name is defined then show
		var matchedViews = self.getMatchingViews();
		var matchMediaQuery = true;
		var foundViews = self.getViewsByStateName(state, matchMediaQuery);
		var showViews = [];
		var hideViews = [];

		// loop views that match media query 
		for (let index = 0; index < matchedViews.length; index++) {
			var view = matchedViews[index];
			
			// let user determine visible view
			if (self.showStateFunction!=null) {
				if (self.showStateFunction(view, state)) {
					showViews.push(view);
				}
				else {
					hideViews.push(view);
				}
			}
			// state was defined so check if view matches state
			else if (foundViews.length) {

				if (foundViews.indexOf(view)!=-1) {
					showViews.push(view);
				}
				else {
					hideViews.push(view);
				}
			}
			// if no state names are defined show view (define unused state name to exclude)
			else if (state==null || state=="") {
				showViews.push(view);
			}
		}

		if (showViews.length) {
			var viewChangingEvent = new Event(self.VIEW_CHANGING);
			viewChangingEvent.showViews = showViews;
			viewChangingEvent.hideViews = hideViews;
			window.dispatchEvent(viewChangingEvent);

			if (viewChangingEvent.defaultPrevented==false) {
				for (var index = 0; index < hideViews.length; index++) {
					var view = hideViews[index];

					if (self.isOverlay(view)) {
						self.removeOverlay(view);
					}
					else {
						self.hideElement(view);
					}
				}

				for (var index = 0; index < showViews.length; index++) {
					var view = showViews[index];

					if (index==showViews.length-1) {
						self.clearDisplay(view);
						self.setViewOptions(view);
						self.setViewVariables(view);
						self.centerView(view);
						self.updateURLState(view, state);
					}
				}
			}

			var viewChangeEvent = new Event(self.VIEW_CHANGE);
			viewChangeEvent.showViews = showViews;
			viewChangeEvent.hideViews = hideViews;
			window.dispatchEvent(viewChangeEvent);
		}
		
	}

	self.clearDisplay = function(view) {
		view.style.setProperty("display", null);
	}

	self.hashChangeHandler = function(event) {
		var fragment = self.getHashFragment();
		var view = self.getViewById(fragment);

		if (self.showByMediaQuery) {
			var stateName = fragment;

			if (stateName==null || stateName=="") {
				var initialView = self.getInitialView();
				stateName = initialView ? self.getStateNameByViewId(initialView.id) : null;
			}
			self.showMediaQueryViewsByState(stateName);
		}
		else {
			if (view) {
				self.hideViews();
				self.showView(view);
				self.setViewVariables(view);
				self.updateViewLabel();
				
				window.dispatchEvent(new Event(self.VIEW_CHANGE));
			}
			else {
				window.dispatchEvent(new Event(self.VIEW_NOT_FOUND));
			}
		}
	}

	self.popStateHandler = function(event) {
		var state = event.state;
		var fragment = state ? state.name : window.location.hash;
		var view = self.getViewById(fragment);

		if (view) {
			self.hideViews();
			self.showView(view);
			self.updateViewLabel();
		}
		else {
			window.dispatchEvent(new Event(self.VIEW_NOT_FOUND));
		}
	}

	self.doubleClickHandler = function(event) {
		var view = self.getVisibleView();
		var scaleValue = view ? self.getViewScaleValue(view) : 1;
		var scaleNeededToFit = view ? self.getViewFitToViewportScale(view) : 1;
		var scaleNeededToFitWidth = view ? self.getViewFitToViewportWidthScale(view) : 1;
		var scaleNeededToFitHeight = view ? self.getViewFitToViewportHeightScale(view) : 1;
		var scaleToFitType = self.scaleToFitType;

		// Three scenarios
		// - scale to fit on double click
		// - set scale to actual size on double click
		// - switch between scale to fit and actual page size

		if (scaleToFitType=="width") {
			scaleNeededToFit = scaleNeededToFitWidth;
		}
		else if (scaleToFitType=="height") {
			scaleNeededToFit = scaleNeededToFitHeight;
		}

		// if scale and actual size enabled then switch between
		if (self.scaleToFitOnDoubleClick && self.actualSizeOnDoubleClick) {
			var isViewScaled = view.getAttributeNS(null, self.SIZE_STATE_NAME);
			var isScaled = false;
			
			// if scale is not 1 then view needs scaling
			if (scaleNeededToFit!=1) {

				// if current scale is at 1 it is at actual size
				// scale it to fit
				if (scaleValue==1) {
					self.scaleViewToFit(view);
					isScaled = true;
				}
				else {
					// scale is not at 1 so switch to actual size
					self.scaleViewToActualSize(view);
					isScaled = false;
				}
			}
			else {
				// view is smaller than viewport 
				// so scale to fit() is scale actual size
				// actual size and scaled size are the same
				// but call scale to fit to retain centering
				self.scaleViewToFit(view);
				isScaled = false;
			}
			
			view.setAttributeNS(null, self.SIZE_STATE_NAME, isScaled+"");
			isViewScaled = view.getAttributeNS(null, self.SIZE_STATE_NAME);
		}
		else if (self.scaleToFitOnDoubleClick) {
			self.scaleViewToFit(view);
		}
		else if (self.actualSizeOnDoubleClick) {
			self.scaleViewToActualSize(view);
		}

	}

	self.scaleViewToFit = function(view) {
		return self.setViewScaleValue(view, true);
	}

	self.scaleViewToActualSize = function(view) {
		self.setViewScaleValue(view, false, 1);
	}

	self.onloadHandler = function(event) {
		self.initialize();
	}

	self.setElementHTML = function(id, value) {
		var element = self.getElement(id);
		element.innerHTML = value;
	}

	self.getStackArray = function(error) {
		var value = "";
		
		if (error==null) {
		  try {
			 error = new Error("Stack");
		  }
		  catch (e) {
			 
		  }
		}
		
		if ("stack" in error) {
		  value = error.stack;
		  var methods = value.split(/\n/g);
	 
		  var newArray = methods ? methods.map(function (value, index, array) {
			 value = value.replace(/\@.*/,"");
			 return value;
		  }) : null;
	 
		  if (newArray && newArray[0].includes("getStackTrace")) {
			 newArray.shift();
		  }
		  if (newArray && newArray[0].includes("getStackArray")) {
			 newArray.shift();
		  }
		  if (newArray && newArray[0]=="") {
			 newArray.shift();
		  }
	 
			return newArray;
		}
		
		return null;
	}

	self.log = function(value) {
		console.log.apply(this, [value]);
	}
	
	// initialize on load
	// sometimes the body size is 0 so we call this now and again later
	window.addEventListener("load", self.onloadHandler);
	window.document.addEventListener("DOMContentLoaded", self.onloadHandler);
}

window.application = new Application(); */
</script>
</head>
<body>
<div class="wrap-loading display-none">
<div>
<embed src="./img/loading.svg" type="image/svg+xml">
</div>
</div>
<div id="ODF__1">
	<form id="selectodffile" action="fileupload" method="post" enctype="multipart/form-data">
		<input type="file" class="custom-file-input" id="fileupload" name="fileupload" multiple="multiple" style="display:none">
	</form>
	<svg class="_1">
		<rect id="_1" rx="0" ry="0" x="0" y="0">
		</rect>
	</svg>
	<svg class="_2">
		<rect id="_2" rx="40" ry="40" x="0" y="0" width="1340" height="97">
		</rect>
	</svg>
	<div id="ODF__">
		<span>ODF 개방형문서형식 진단도구</span>
	</div>
	<svg class="_1_j" viewBox="0 0 0.713 714.153">
		<path id="_1_j" d="M 0 0 L 0.7128052115440369 714.1532592773438">
		</path>
	</svg>
	<svg class="_2_k" viewBox="0 0 994.326 1">
		<path id="_2_k" d="M 0 0 L 994.3257446289063 0">
		</path>
	</svg>
	<div id="fileOpenTitle">
		<svg class="_7">
			<rect id="_7" rx="10" ry="10" x="0" y="0" width="50.104" height="49.21">
			</rect>
		</svg>
		<div id="ID1">
			<span>1</span>
		</div>
		<div id="_">
			<span>진단대상파일 열기</span>
		</div>
		<div id="shop-24px">
			<svg class="_7_ct" viewBox="0 0 56.528 56.528">
				<path id="_7_ct" d="M 0 0 L 56.52753448486328 0 L 56.52753448486328 56.527587890625 L 0 56.527587890625 L 0 0 Z">
				</path>
			</svg>
			<svg class="_8_cu" viewBox="2 2 47.106 44.751">
				<path id="_8_cu" d="M 34.97439575195313 11.42126560211182 L 34.97439575195313 6.710631847381592 C 34.97439575195313 4.096230506896973 32.87816619873047 1.999999403953552 30.26376724243164 1.999999403953552 L 20.8425121307373 1.999999403953552 C 18.22811508178711 1.999999403953552 16.13188362121582 4.096230506896973 16.13188362121582 6.710631847381592 L 16.13188362121582 11.42126560211182 L 1.999999523162842 11.42126560211182 L 1.999999523162842 42.04038238525391 C 1.999999523162842 44.65478134155273 4.09622859954834 46.75100708007813 6.71062707901001 46.75100708007813 L 44.39564895629883 46.75100708007813 C 47.01004791259766 46.75100708007813 49.10626983642578 44.65478134155273 49.10626983642578 42.04038238525391 L 49.10626983642578 11.42126560211182 L 34.97439575195313 11.42126560211182 Z M 20.8425121307373 6.710631847381592 L 30.26376724243164 6.710631847381592 L 30.26376724243164 11.42126560211182 L 20.8425121307373 11.42126560211182 L 20.8425121307373 6.710631847381592 Z M 18.48719787597656 39.68506240844727 L 18.48719787597656 18.48721504211426 L 36.15204620361328 27.90848159790039 L 18.48719787597656 39.68506240844727 Z">
				</path>
			</svg>
		</div>
	</div>
	<div id="document_info">
	
		<div id="menu_book-24px">
			<div id="_7_c">
				<svg class="_20">
					<rect id="_20" rx="0" ry="0" x="0" y="0" width="29.792" height="29.792">
					</rect>
				</svg>
			</div>
			<div id="_10_c">
				<div id="_9_c">
					<svg class="_10_da" viewBox="1 4.5 27.175 20.999">
						<path id="_10_da" d="M 25.7045726776123 5.117613792419434 C 24.33346557617188 4.68528413772583 22.82648849487305 4.499999523162842 21.38127326965332 4.499999523162842 C 18.97257804870605 4.499999523162842 16.37859725952148 4.994091510772705 14.58751487731934 6.352842807769775 C 12.7964334487915 4.994091510772705 10.20245265960693 4.499999523162842 7.79375696182251 4.499999523162842 C 5.385062217712402 4.499999523162842 2.791081428527832 4.994091510772705 0.9999999403953552 6.352842807769775 L 0.9999999403953552 24.44894409179688 C 0.9999999403953552 24.75775146484375 1.308806777000427 25.06655693054199 1.617614150047302 25.06655693054199 C 1.741137027740479 25.06655693054199 1.802898168563843 25.00480079650879 1.926421165466309 25.00480079650879 C 3.593980073928833 24.2018985748291 6.002676010131836 23.64604568481445 7.79375696182251 23.64604568481445 C 10.20245265960693 23.64604568481445 12.7964334487915 24.14013671875 14.58751487731934 25.49888801574707 C 16.25507354736328 24.44894409179688 19.28138542175293 23.64604568481445 21.38127326965332 23.64604568481445 C 23.41939926147461 23.64604568481445 25.51928901672363 24.0166130065918 27.24860763549805 24.94303321838379 C 27.37212944030762 25.00479698181152 27.43389320373535 25.00479698181152 27.55741500854492 25.00479698181152 C 27.86622047424316 25.00479698181152 28.17502784729004 24.69598579406738 28.17502784729004 24.38717842102051 L 28.17502784729004 6.352842807769775 C 27.43389320373535 5.796989440917969 26.6309928894043 5.426421165466309 25.7045726776123 5.117613792419434 Z M 25.7045726776123 21.7932014465332 C 24.34582138061523 21.36087036132813 22.86354827880859 21.17558860778809 21.38127326965332 21.17558860778809 C 19.28138542175293 21.17558860778809 16.25507354736328 21.97848701477051 14.58751487731934 23.02843284606934 L 14.58751487731934 8.823300361633301 C 16.25507354736328 7.773355960845947 19.28138542175293 6.970457077026367 21.38127326965332 6.970457077026367 C 22.86354827880859 6.970457077026367 24.34582138061523 7.155740737915039 25.7045726776123 7.588070869445801 L 25.7045726776123 21.7932014465332 Z">
						</path>
					</svg>
					<div id="_8_c">
						<svg class="_11_c" viewBox="13 9 8.647 3.076">
							<path id="_11_c" d="M 18.55852890014648 10.85284233093262 C 19.64552879333496 10.85284233093262 20.69547462463379 10.96401214599609 21.64659881591797 11.17400169372559 L 21.64659881591797 9.296453475952148 C 20.67076683044434 9.111170768737793 19.62082672119141 8.999999046325684 18.55852890014648 8.999999046325684 C 16.45864295959473 8.999999046325684 14.55638885498047 9.35821533203125 13 10.02523803710938 L 13 12.07571792602539 C 14.3958101272583 11.28517150878906 16.33511734008789 10.85284233093262 18.55852890014648 10.85284233093262 Z">
							</path>
						</svg>
						<svg class="_12_c" viewBox="13 11.66 8.647 3.076">
							<path id="_12_c" d="M 13 12.6852388381958 L 13 14.73571872711182 C 14.3958101272583 13.94517230987549 16.33511734008789 13.51284313201904 18.55852890014648 13.51284313201904 C 19.64552879333496 13.51284313201904 20.69547462463379 13.62401294708252 21.64659881591797 13.83400344848633 L 21.64659881591797 11.95645523071289 C 20.67076683044434 11.77116966247559 19.62082672119141 11.65999889373779 18.55852890014648 11.65999889373779 C 16.45864295959473 11.65999889373779 14.55638885498047 12.03056907653809 13 12.6852388381958 Z">
							</path>
						</svg>
						<svg class="_13_c" viewBox="13 14.33 8.647 3.076">
							<path id="_13_c" d="M 18.55852890014648 14.33000087738037 C 16.45864295959473 14.33000087738037 14.55638885498047 14.68821716308594 13 15.35524082183838 L 13 17.40571975708008 C 14.3958101272583 16.61517524719238 16.33511734008789 16.18284225463867 18.55852890014648 16.18284225463867 C 19.64552879333496 16.18284225463867 20.69547462463379 16.29401397705078 21.64659881591797 16.50400352478027 L 21.64659881591797 14.62645435333252 C 20.67076683044434 14.42881870269775 19.62082672119141 14.33000087738037 18.55852890014648 14.33000087738037 Z">
							</path>
						</svg>
					</div>
				</div>
			</div>
		</div>
		<div id="__">
			<span>문서 정보 요약</span>
		</div>
	<div id="_11_da">
			<svg class="_8_db">
				<rect id="_8_db" rx="0" ry="0" x="0" y="0" width="111.225" height="30.785">
				</rect>
			</svg>
			<div id="__dc">
				<span>파일 형식</span>
			</div>
		</div>
		<div id="ID201201____ODF_" class="document_info_div">
			<span></span>
		</div>
		<div id="_2_q">
			<svg class="_8">
				<rect id="_8" rx="0" ry="0" x="0" y="0" width="111.225" height="31.779">
				</rect>
			</svg>
			<div id="__s">
				<span>파일 형식</span>
			</div>
		</div>
		<div id="_hwp" class="document_info_div">
			<span></span>
		</div>
		<div id="_3">
			<svg class="_8_v">
				<rect id="_8_v" rx="0" ry="0" x="0" y="0" width="111.225" height="29.792">
				</rect>
			</svg>
			<div id="________">
				<span>크       기</span>
			</div>
		</div>
		<div id="FODF__ODF__ODF_" class="document_info_div">
			<span></span>
		</div>
		<div id="_4">
			<svg class="_8_z">
				<rect id="_8_z" rx="0" ry="0" x="0" y="0" width="111.225" height="30.785">
				</rect>
			</svg>
			<div id="_______">
				<span>수정한날짜</span>
			</div>
		</div>
	
		<div id="ID780KB_79872_" class="document_info_div">
			<span></span>
		</div>
<!-- 
		<svg class="_8_">
			<rect id="_8_" rx="0" ry="0" x="0" y="0" width="111.225" height="30.785">
			</rect>
		</svg>
		<div id="___">
			<span>만 든 날 짜</span>
		</div>
		<div id="ID2020_12_1___101503" class="document_info_div">
			<span>2020년 12월 1일 화요일, 오전 10:15:03</span>
		</div>
		<div id="_6">
			<svg class="_8_ba">
				<rect id="_8_ba" rx="0" ry="0" x="0" y="0" width="111.225" height="29.792">
				</rect>
			</svg>
			<div id="___ba">
				<span>수정 날 짜</span>
			</div>
		</div>
		<div id="ID2020_12_2___113457" class="document_info_div">
			<span>2020년 12월 2일 수요일, 오후 11:34:57</span>
		</div>
-->

</div>
	<svg class="_5">
		<rect id="_5" rx="10" ry="10" x="0" y="0" width="50.104" height="49.21">
		</rect>
	</svg>
	<div id="ID2">
		<span>2</span>
	</div>
	<div id="__bb">
		<span>진단실행 시작</span>
	</div>
	<div id="document_test_result">
		<svg class="_6_bc">
			<rect id="_6_bc" rx="10" ry="10" x="0" y="0" width="50.104" height="49.21">
			</rect>
		</svg>
		<div id="ID3">
			<span>3</span>
		</div>
		<div id="_bi">
			<span>진단결과요약</span>
		</div>
		<svg class="_9">
			<rect id="_9" rx="15" ry="15" x="0" y="0" width="350.557" height="48.991">
			</rect>
		</svg>
		<div id="_____">
			<span>자간 및 간격 구간 준수 </span>
		</div>		
		<div id="ID10">
			<span> </span>
		</div>
		<svg class="_10">
			<rect id="_10" rx="15" ry="15" x="0" y="0" width="349.564" height="49.933">
			</rect>
		</svg>
		<div id="___bi">
			<span>특수문자(기호) 준수 </span>
		</div>
		<div id="ID0">
			<span> </span>
		</div>
		<svg class="_11">
			<rect id="_11" rx="15" ry="15" x="0" y="0" width="349.564" height="48.991">
			</rect>
		</svg>
		<div id="___bk">
			<span>셀 병합 준수</span>
		</div>
		<div id="ID10_b">
			<span> </span>
		</div>
		<svg class="_12">
			<rect id="_12" rx="15" ry="15" x="0" y="0" width="349.564" height="48.991">
			</rect>
		</svg>
		<div id="___bm">
			<span>기본 글꼴  사용 준수</span>
		</div>
		<div id="ID0_co">
			<span> </span>
		</div>
		<svg class="_13">
			<rect id="_13" rx="15" ry="15" x="0" y="0" width="349.564" height="48.991">
			</rect>
		</svg>
		<div id="___bo">
			<span>'글자처럼 취급' 준수</span>
		</div>
		<div id="ID10_ca">
			<span> </span>
		</div>
		<svg class="_14">
			<rect id="_14" rx="15" ry="15" x="0" y="0" width="349.564" height="48.991">
			</rect>
		</svg>
		<div id="___bq">
			<span>'캡션' 사용 금지</span>
		</div>
		<div id="ID0_cp">
			<span> </span>
		</div>
		<svg class="_15">
			<rect id="_15" rx="15" ry="15" x="0" y="0" width="349.564" height="49.933">
			</rect>
		</svg>
		<div id="____bs">
			<span>표 테두리 '실선' 준수</span>
		</div>
		<div id="ID0_cq">
			<span> </span>
		</div>
		<svg class="_16">
			<rect id="_16" rx="15" ry="15" x="0" y="0" width="349.564" height="48.991">
			</rect>
		</svg>
		<div id="___bu">
			<span>표 배경 준수</span>
		</div>
		<div id="ID10_cb">
			<span> </span>
		</div>
		<svg class="_17">
			<rect id="_17" rx="15" ry="15" x="0" y="0" width="349.564" height="49.933">
			</rect>
		</svg>
		<div id="____bw">
			<span>이미지 국제표준 포맷 활용</span>
		</div>
		<div id="ID10_cc">
			<span> </span>
		</div>
		<svg class="_18">
			<rect id="_18" rx="15" ry="15" x="0" y="0" width="349.564" height="48.991">
			</rect>
		</svg>
		<div id="___by">
			<span>특정수식 사용 지양</span>
		</div>
		<div id="ID10_cd">
			<span> </span>
		</div>
		<div id="done_all-24px">
			<svg class="_3_b" viewBox="0 0 42.065 42.065">
				<path id="_3_b" d="M 0 0 L 42.06454467773438 0 L 42.06454467773438 42.06454467773438 L 0 42.06454467773438 L 0 0 Z">
				</path>
			</svg>
	<!-- 이미지 숨김
			<svg class="_4_b" viewBox="0.41 5.59 40.75 23.504">
				<path id="_4_b" d="M 31.23980140686035 8.06129264831543 L 28.76851081848145 5.590000152587891 L 17.65646553039551 16.70205116271973 L 20.12775421142578 19.17334365844727 L 31.23980140686035 8.06129264831543 Z M 38.67120361328125 5.590000152587891 L 20.12775421142578 24.13345336914063 L 12.80151462554932 16.82473754882813 L 10.33022308349609 19.29603004455566 L 20.12775421142578 29.09356689453125 L 41.16001892089844 8.06129264831543 L 38.67120361328125 5.590000152587891 Z M 0.4099999368190765 19.29603004455566 L 10.20753383636475 29.09356689453125 L 12.67882537841797 26.62227249145508 L 2.898819208145142 16.82473754882813 L 0.4099999368190765 19.29603004455566 Z">
				</path>
			</svg>
	-->
		</div>
		<div id="done_all-24px_b">
			<svg class="_3_ca" viewBox="0 0 42.065 42.065">
				<path id="_3_ca" d="M 0 0 L 42.06454467773438 0 L 42.06454467773438 42.06454467773438 L 0 42.06454467773438 L 0 0 Z">
				</path>
			</svg>
	<!-- 이미지 숨김
			<svg class="_4_ca" viewBox="0.41 5.59 40.75 23.504">
				<path id="_4_ca" d="M 31.23980140686035 8.06129264831543 L 28.76851081848145 5.590000152587891 L 17.65646553039551 16.70205116271973 L 20.12775421142578 19.17334365844727 L 31.23980140686035 8.06129264831543 Z M 38.67120361328125 5.590000152587891 L 20.12775421142578 24.13345336914063 L 12.80151462554932 16.82473754882813 L 10.33022308349609 19.29603004455566 L 20.12775421142578 29.09356689453125 L 41.16001892089844 8.06129264831543 L 38.67120361328125 5.590000152587891 Z M 0.4099999368190765 19.29603004455566 L 10.20753383636475 29.09356689453125 L 12.67882537841797 26.62227249145508 L 2.898819208145142 16.82473754882813 L 0.4099999368190765 19.29603004455566 Z">
				</path>
			</svg>
	-->
		</div>
		<div id="done_all-24px_cb">
			<svg class="_3_cc" viewBox="0 0 42.065 42.065">
				<path id="_3_cc" d="M 0 0 L 42.06454467773438 0 L 42.06454467773438 42.06454467773438 L 0 42.06454467773438 L 0 0 Z">
				</path>
			</svg>
	<!-- 이미지 숨김
			<svg class="_4_cd" viewBox="0.41 5.59 40.75 23.504">
				<path id="_4_cd" d="M 31.23980140686035 8.06129264831543 L 28.76851081848145 5.590000152587891 L 17.65646553039551 16.70205116271973 L 20.12775421142578 19.17334365844727 L 31.23980140686035 8.06129264831543 Z M 38.67120361328125 5.590000152587891 L 20.12775421142578 24.13345336914063 L 12.80151462554932 16.82473754882813 L 10.33022308349609 19.29603004455566 L 20.12775421142578 29.09356689453125 L 41.16001892089844 8.06129264831543 L 38.67120361328125 5.590000152587891 Z M 0.4099999368190765 19.29603004455566 L 10.20753383636475 29.09356689453125 L 12.67882537841797 26.62227249145508 L 2.898819208145142 16.82473754882813 L 0.4099999368190765 19.29603004455566 Z">
				</path>
			</svg>
	-->
		</div>
		<div id="done_all-24px_ce">
			<svg class="_3_cf" viewBox="0 0 42.065 42.065">
				<path id="_3_cf" d="M 0 0 L 42.06454467773438 0 L 42.06454467773438 42.06454467773438 L 0 42.06454467773438 L 0 0 Z">
				</path>
			</svg>
	<!-- 이미지 숨김
			<svg class="_4_cg" viewBox="0.41 5.59 40.75 23.504">
				<path id="_4_cg" d="M 31.23980140686035 8.06129264831543 L 28.76851081848145 5.590000152587891 L 17.65646553039551 16.70205116271973 L 20.12775421142578 19.17334365844727 L 31.23980140686035 8.06129264831543 Z M 38.67120361328125 5.590000152587891 L 20.12775421142578 24.13345336914063 L 12.80151462554932 16.82473754882813 L 10.33022308349609 19.29603004455566 L 20.12775421142578 29.09356689453125 L 41.16001892089844 8.06129264831543 L 38.67120361328125 5.590000152587891 Z M 0.4099999368190765 19.29603004455566 L 10.20753383636475 29.09356689453125 L 12.67882537841797 26.62227249145508 L 2.898819208145142 16.82473754882813 L 0.4099999368190765 19.29603004455566 Z">
				</path>
			</svg>
	-->
		</div>
		<div id="done_all-24px_ch">
			<svg class="_3_ci" viewBox="0 0 42.065 42.065">
				<path id="_3_ci" d="M 0 0 L 42.06454467773438 0 L 42.06454467773438 42.06454467773438 L 0 42.06454467773438 L 0 0 Z">
				</path>
			</svg>
	<!-- 이미지 숨김
			<svg class="_4_cj" viewBox="0.41 5.59 40.75 23.504">
				<path id="_4_cj" d="M 31.23980140686035 8.06129264831543 L 28.76851081848145 5.590000152587891 L 17.65646553039551 16.70205116271973 L 20.12775421142578 19.17334365844727 L 31.23980140686035 8.06129264831543 Z M 38.67120361328125 5.590000152587891 L 20.12775421142578 24.13345336914063 L 12.80151462554932 16.82473754882813 L 10.33022308349609 19.29603004455566 L 20.12775421142578 29.09356689453125 L 41.16001892089844 8.06129264831543 L 38.67120361328125 5.590000152587891 Z M 0.4099999368190765 19.29603004455566 L 10.20753383636475 29.09356689453125 L 12.67882537841797 26.62227249145508 L 2.898819208145142 16.82473754882813 L 0.4099999368190765 19.29603004455566 Z">
				</path>
			</svg>
	-->
		</div>
		<div id="done_all-24px_ck">
			<svg class="_3_cl" viewBox="0 0 42.065 42.065">
				<path id="_3_cl" d="M 0 0 L 42.06454467773438 0 L 42.06454467773438 42.06454467773438 L 0 42.06454467773438 L 0 0 Z">
				</path>
			</svg>
	<!-- 이미지 숨김
			<svg class="_4_cm" viewBox="0.41 5.59 40.75 23.504">
				<path id="_4_cm" d="M 31.23980140686035 8.06129264831543 L 28.76851081848145 5.590000152587891 L 17.65646553039551 16.70205116271973 L 20.12775421142578 19.17334365844727 L 31.23980140686035 8.06129264831543 Z M 38.67120361328125 5.590000152587891 L 20.12775421142578 24.13345336914063 L 12.80151462554932 16.82473754882813 L 10.33022308349609 19.29603004455566 L 20.12775421142578 29.09356689453125 L 41.16001892089844 8.06129264831543 L 38.67120361328125 5.590000152587891 Z M 0.4099999368190765 19.29603004455566 L 10.20753383636475 29.09356689453125 L 12.67882537841797 26.62227249145508 L 2.898819208145142 16.82473754882813 L 0.4099999368190765 19.29603004455566 Z">
				</path>
			</svg>
	-->
		</div>
	</div>
	<svg class="_19">
		<rect id="_19" rx="10" ry="10" x="0" y="0" width="204" height="86">
		</rect>
	</svg>

	<div id="shop-24px_cv">
		<svg class="_7_cw" viewBox="0 0 56.528 56.528">
			<path id="_7_cw" d="M 0 0 L 56.52753448486328 0 L 56.52753448486328 56.527587890625 L 0 56.527587890625 L 0 0 Z">
			</path>
		</svg>
		<svg class="_8_cx" viewBox="2 2 47.106 44.751">
			<path id="_8_cx" d="M 34.97439575195313 11.42126560211182 L 34.97439575195313 6.710631847381592 C 34.97439575195313 4.096230506896973 32.87816619873047 1.999999403953552 30.26376724243164 1.999999403953552 L 20.8425121307373 1.999999403953552 C 18.22811508178711 1.999999403953552 16.13188362121582 4.096230506896973 16.13188362121582 6.710631847381592 L 16.13188362121582 11.42126560211182 L 1.999999523162842 11.42126560211182 L 1.999999523162842 42.04038238525391 C 1.999999523162842 44.65478134155273 4.09622859954834 46.75100708007813 6.71062707901001 46.75100708007813 L 44.39564895629883 46.75100708007813 C 47.01004791259766 46.75100708007813 49.10626983642578 44.65478134155273 49.10626983642578 42.04038238525391 L 49.10626983642578 11.42126560211182 L 34.97439575195313 11.42126560211182 Z M 20.8425121307373 6.710631847381592 L 30.26376724243164 6.710631847381592 L 30.26376724243164 11.42126560211182 L 20.8425121307373 11.42126560211182 L 20.8425121307373 6.710631847381592 Z M 18.48719787597656 39.68506240844727 L 18.48719787597656 18.48721504211426 L 36.15204620361328 27.90848159790039 L 18.48719787597656 39.68506240844727 Z">
			</path>
		</svg>
	</div>
	<div id="done_all-24px_cy">
		<svg class="_9_cz" viewBox="0 0 19.23 19.23">
			<path id="_9_cz" d="M 0 0 L 19.2295036315918 0 L 19.2295036315918 19.22950553894043 L 0 19.22950553894043 L 0 0 Z">
			</path>
		</svg>
	</div>
	
</div>
</body>
</html>