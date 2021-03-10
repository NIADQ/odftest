<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
	<title>Home</title>
	<!-- 합쳐지고 최소화된 최신 CSS -->
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
		<!-- 부가적인 테마 -->
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
	 	
	 	<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<!-- <script src="./resources/js/jquery-3.5.1.min.js"></script> -->
<script src="./resources/js/hmlizer.core.js"></script>
<script src="./resources/js/document.js"></script>
</head>
					<script type="text/javascript">
						$(document).ready(function(){
							var formObj = $("form[name='writeForm']");
							var odf_file = $("#odf_fileupload");
							
							$("#openidbbutton").on("click", function(){
								odf_fileupload.click();
							});
							
							$("#odf_fileupload").change(function(){
								$("#filename").text("");
								$("#filetype").text("");
								$("#filesize").text("");
								$("#filevalue").text("");			
								
								$("#filename").text("파일이름:"+$('#odf_fileupload')[0].files[0].name);
								$("#filetype").text("파일타입:"+$('#odf_fileupload')[0].files[0].type);
								$("#filesize").text("파일크기:"+$('#odf_fileupload')[0].files[0].size + "byte");
								$("#filevalue").text("파일패스:"+$('#odf_fileupload')[0].files[0].value);
								/*  alert($('#odf_fileupload')[0].files[0].name); //파일이름
							       alert($("#odf_fileupload")[0].files[0].type); // 파일 타임
							       alert($("#odf_fileupload")[0].files[0].size); // 파일 크기
							       alert($("#odf_fileupload")[0].files[0].value); // 파일 패스 */
							 //  $('input[type=file]')[0].files[0].name;
							 //  $("#imgUpload")[0].files[0].type;
							 //  $("#imgUpload")[0].files[0].size;
							});
							
/* 							$(".write_btn").on("click", function(){
								if(fn_valiChk()){
									return false;
								}
								formObj.attr("action", "/board/write");
								formObj.attr("method", "post");
								formObj.submit();
							}); */
						})
/* 						function fn_valiChk(){
							var regForm = $("form[name='writeForm'] .chk").length;
							for(var i = 0; i<regForm; i++){
								if($(".chk").eq(i).val() == "" || $(".chk").eq(i).val() == null){
									alert($(".chk").eq(i).attr("title"));
									return true;
								}
							}
						} */
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

/* function FileOpen(){
	$('#odf_fileupload').click();
	
 	HwpControl.HwpCtrl.Open(document.getElementById('odf_fileupload').value, "HWP");	
	var convertFileName = $("#odf_fileupload").val().substring(0 ,$("#odf_fileupload").val().lastIndexOf(".") + 1) + 'hml';
} */
 


$(function(){	
	//변환버튼 클릭
	$("#convertButton").click(function(){
		$('#odf_fileupload').click();
	  });
		
	//변환 파일 선택시 변환 시작
	$("#odf_fileupload").change(function(e){ 
	 	HwpControl.HwpCtrl.Open(document.getElementById('odf_fileupload').value, "HWP");	
			convertFileName = $("#odf_fileupload").val().substring(0 ,$("#odf_fileupload").val().lastIndexOf(".") + 1) + 'hml';

			if (HwpControl.HwpCtrl.SaveAs(convertFileName, "HWPML2X")) {
				alert("변환성공");
			}else{
				alert("변환실패");
			} 
	 });
});
</script>






<body>
<h1>
	ODF진단 툴 메인 페이지
</h1>
	</br>	
	<form method="post" action="odftest_hwp2">
	<input type="submit" value="odf진단 시작하기_hwp"> &gt; IE이용(파일 2번 선택)
	</form>
	<br/>
	<form method="post" action="odftest_hwp">
	<input type="submit" value="odf진단 시작하기_hwp(대안3)"> &gt; IE이용(대안3)
	</form>
	<br/>
	<form method="post" action="odftest_hml">
	<input type="submit" value="odf진단 시작하기_hml"> &gt; Chrome이용(유저 수동 변환 후 hml선택)
	</form>
	</br>

<!-- 	
	<form name="writeForm" method="post" action="/board/write" enctype="multipart/form-data">
		<input type="file" name="file" id="odf_fileupload" style="visibilit:hidden;">								
	</form>
	
	<label id="filename"></label></br>
	<label id="filetype"></label></br>
	<label id="filesize"></label></br>
	<label id="filevalue"></label></br> 
-->

<!-- 
<input type="file" name="file1" id="odf_fileupload">

<input type="button" id="convertButton" value="파일변환"/>

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
 -->
<script language="javascript">

  OnStart();

</script>

</body>
</html>
