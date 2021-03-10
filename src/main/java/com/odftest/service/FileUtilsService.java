package com.odftest.service;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.attribute.BasicFileAttributes;
import java.nio.file.attribute.FileTime;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.regex.Pattern;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.xpath.XPath;
import javax.xml.xpath.XPathConstants;
import javax.xml.xpath.XPathExpression;
import javax.xml.xpath.XPathFactory;

import org.apache.commons.io.FilenameUtils;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.w3c.dom.Document;
import org.w3c.dom.NodeList;

@Service
public class FileUtilsService implements IFileUtilsService {

	// 업로드파일 정보 추출
	@Override
	public HashMap<String, Object> odfFileInfo(MultipartFile[] files) throws IllegalStateException, IOException {
		HashMap<String, Object> result = new HashMap<String, Object>();
		File file = new File("abc");
		String modifiedFormatted = "";
		String createFormatted = "";
		BasicFileAttributes attrs = null;

		for (MultipartFile originFile : files) {
			if (!originFile.getOriginalFilename().isEmpty()) {
				// System.out.println(file.getName());//추가본
				System.out.println(originFile.getOriginalFilename());
				System.out.println(FilenameUtils.getExtension(originFile.getOriginalFilename()));
				// FilenameUtils는 주로 파일 확장자 검사할때 사용이 된다.
				if (FilenameUtils.getExtension(originFile.getOriginalFilename()).toLowerCase().equals("hwp")) {// 59~60까지
																												// 진단에
																												// 이용가능?

					result.put("filExtension", FilenameUtils.getExtension(originFile.getOriginalFilename()));
					result.put("fileName", originFile.getOriginalFilename());

					try {
						attrs = Files.readAttributes(file.toPath(), BasicFileAttributes.class);// BasicFileAttributes 생성
																								// 날짜와 시간에 엑세스에 사용된다.
						FileTime modifiedTime = attrs.lastModifiedTime();
						FileTime createTime = attrs.creationTime();
						String pattern = "yyyy년 MM월 dd일 E요일 a H:mm:ss";
						SimpleDateFormat simpleDateFormat = new SimpleDateFormat(pattern, Locale.KOREAN);

						modifiedFormatted = simpleDateFormat.format(new Date(modifiedTime.toMillis()));
						createFormatted = simpleDateFormat.format(new Date(createTime.toMillis()));

						result.put("fileName", file.getName());
						result.put("createTime", createFormatted);
						result.put("lastModifiedTime", modifiedFormatted);
						result.put("fileSize_b", file.length());
						result.put("fileSize_kb", (file.length() / 1024));

						System.out.println("수정된날짜 : " + new Date(modifiedTime.toMillis()));
						System.out.println("형식지정표현 수정된날짜 : " + modifiedFormatted);

					} catch (IOException e) {
						e.printStackTrace();
					}
				}

			}
		}

		return result;
	}
	
	@Override
	public HashMap<String, Object> odfFileTest2(MultipartFile[] files) throws IllegalStateException, IOException {
		HashMap<String, Object> result = new HashMap<String, Object>();
		HashMap<String, Object> checkReason = new HashMap<String, Object>();
		int captionChkCnt = 0; // 캡션존재건수체크
		int gridChkCnt = 0; // 셀병합건수체크
		int letterSpacingChkCnt = 0; // 자간간격 위배 건수체크
		int tbBdrSoildChkCnt = 0; // 표 테두리 실선 여부 건수체크
		int fontChkCnt = 0; // 기본폰트 미사용 건수체크
		int specialCharCnt = 0; //  특수문자unicode아닌거 
		int tableBackgroundCnt = 0; // 셀 배경 위배 건수체크
		int imageFileExtension = 0;
		int treatAsCharCnt = 0;
		int equationCnt = 0;
		int plusMinerDegCnt = 0;
		int figureCnt = 0;
		ArrayList<String> captionChk = new ArrayList<String>();
		ArrayList<String> gridChk = new ArrayList<String>();
		ArrayList<String> letterSpacingChk = new ArrayList<String>();
		ArrayList<String> tbBdrSoildChk = new ArrayList<String>();
		ArrayList<String> fontChk = new ArrayList<String>();
		ArrayList<String> specialChar = new ArrayList<String>();
		ArrayList<String> tableBackground = new ArrayList<String>();
		ArrayList<String> imageFile = new ArrayList<String>();
		ArrayList<String> treatAsChar = new ArrayList<String>();
		ArrayList<String> equation = new ArrayList<String>();
		ArrayList<String> plusMinerDeg = new ArrayList<String>();
		ArrayList<String> figure = new ArrayList<String>();
		// odf파일 체크(기본 hwp, xml, xsl 업로드하는 것으로 가정)

		// 각 기준별 진단 로직 작성
		// 진단 후 해당 건수 해당 변수에 담기

		// xpath 활용해서 parsing 준비//caption node 확인
		XPathFactory xPathFactory = XPathFactory.newInstance();
		XPath xpath = xPathFactory.newXPath();
		//

//					File file = new File("abc");

		// hwp 진단로직
		for (MultipartFile originFile : files) {
			if (!originFile.getOriginalFilename().isEmpty()) {
				if (FilenameUtils.getExtension(originFile.getOriginalFilename()).toLowerCase().equals("hml")) {
					try {

						// 파일 생성
						File file0 = new File(files[0].getOriginalFilename());
						file0.createNewFile();

						FileOutputStream fos = new FileOutputStream(file0);
						fos.write(files[0].getBytes());
						fos.close();

						DocumentBuilderFactory dbFactory = DocumentBuilderFactory.newInstance();
						DocumentBuilder dBuilder = dbFactory.newDocumentBuilder();
						Document doc = dBuilder.parse(file0);
						doc.getDocumentElement().normalize();
						
						//사용된 이미지, 표 갯수
						NodeList imageList = doc.getElementsByTagName("PICTURE");
						NodeList tableUsedList = doc.getElementsByTagName("TABLE");
						
						result.put("usedImage",imageList.getLength());
						result.put("usedTable",tableUsedList.getLength());

						// 캡션찾기
						NodeList capList = doc.getElementsByTagName("CAPTION");
						for(int i=0;i<capList.getLength();i++) {
							captionChk.add(capList.item(i).getTextContent());
						}
						captionChkCnt += capList.getLength();

//									   XPathExpression expression = xpath.compile("//SHAPEOBJECT/CAPTION");
//									   NodeList nodelist = (NodeList) expression.evaluate(doc, XPathConstants.NODESET);
//									   for(int i=0;i<nodelist.getLength();i++){
//										   Node node = (Node) expression.evaluate(nodelist.item(i),XPathConstants.NODE);
//										   System.out.println(node.getTextContent());
//										   captionChkCnt += 1;
//									   }//	캡션찾기 end

						// 셀 병합 그리드
						
						XPathExpression tableExp = xpath.compile("//TABLE");
						NodeList tableList1 = (NodeList) tableExp.evaluate(doc, XPathConstants.NODESET);
						for (int i = 0; i < tableList1.getLength(); i++) {
							for(int k=2;k<tableList1.item(i).getChildNodes().getLength();k++) {
								for(int l=0; l<tableList1.item(i).getChildNodes().item(k).getChildNodes().getLength();l++){
									String colSpan = tableList1.item(i).getChildNodes().item(k).getChildNodes().item(l).getAttributes().getNamedItem("ColSpan").toString();
									String rowSpan = tableList1.item(i).getChildNodes().item(k).getChildNodes().item(l).getAttributes().getNamedItem("RowSpan").toString();
									String colSpanVal = colSpan.substring(colSpan.indexOf("\"")+1, colSpan.length()-1);
									String rowSpanVal = rowSpan.substring(rowSpan.indexOf("\"")+1, rowSpan.length()-1);
									if(!colSpanVal.equals("1")||!rowSpanVal.equals("1")){
										gridChkCnt++;
										gridChk.add((i+1)+"표 - "+(k-1)+"행 - "+(l+1)+"열");
									}
								}
							}
						}
						
						
						
						
						
						

						// 자간/간격 특정 구간 준수
						NodeList textList = doc.getElementsByTagName("TEXT");
						// TEXT[TextShape.val()]
						String[] textShapeArr = new String[textList.getLength()];

						for (int i = 0; i < textList.getLength(); i++) {
							String shapetextval = textList.item(i).getAttributes().item(0).toString();
							int target = shapetextval.indexOf("\"") + 1;
							shapetextval = shapetextval.substring(target, shapetextval.length() - 1);
							textShapeArr[i] = shapetextval;
						}

						XPathExpression spacingZero = xpath.compile("//CHARSHAPE/CHARSPACING");
						NodeList spacingZeroList = (NodeList) spacingZero.evaluate(doc, XPathConstants.NODESET);

						// TEXT[TextShape.val()]
						String[] shapeIdValArr = new String[spacingZeroList.getLength()];
						int j = 0;
						for (int i = 0; i < spacingZeroList.getLength(); i++) {
							String charspacingattr = spacingZeroList.item(i).getAttributes().getNamedItem("Hangul").toString();
							String charspacingval = charspacingattr.substring(charspacingattr.indexOf("\"")+1, charspacingattr.length()-1);
							if (!charspacingval.equals("-19")&&!charspacingval.equals("-18")&&!charspacingval.equals("-17")&&!charspacingval.equals("-16")&&!charspacingval.equals("-15")&&!charspacingval.equals("-14")&&!charspacingval.equals("-13")&&!charspacingval.equals("-12")&&!charspacingval.equals("-11")&&!charspacingval.equals("-10")&&!charspacingval.equals("-9")&&!charspacingval.equals("-8")&&!charspacingval.equals("-7")&&!charspacingval.equals("-6")&&!charspacingval.equals("-5")&&!charspacingval.equals("-4")&&!charspacingval.equals("-3")&&!charspacingval.equals("-2")&&!charspacingval.equals("-1")&&!charspacingval.equals("0")&&!charspacingval.equals("1")&&!charspacingval.equals("2")&&!charspacingval.equals("3")&&!charspacingval.equals("4")&&!charspacingval.equals("5")&&!charspacingval.equals("6")&&!charspacingval.equals("7")&&!charspacingval.equals("8")&&!charspacingval.equals("9")&&!charspacingval.equals("10")&&!charspacingval.equals("11")&&!charspacingval.equals("12")&&!charspacingval.equals("13")&&!charspacingval.equals("14")&&!charspacingval.equals("15")&&!charspacingval.equals("16")&&!charspacingval.equals("17")&&!charspacingval.equals("18")&&!charspacingval.equals("19")) {
								String shapeIdVal = spacingZeroList.item(i).getParentNode().getAttributes().getNamedItem("Id").toString();
								int target = shapeIdVal.indexOf("\"") + 1;
								shapeIdValArr[j] = shapeIdVal.substring(target, shapeIdVal.length() - 1);
								j++;
							}
						}
						
						ArrayList<String> shapeArrList = new ArrayList<String>();

						for (String item : shapeIdValArr) {
							if (!shapeArrList.contains(item)&&item != null)
								shapeArrList.add(item);
						}
						
						for (int i = 0; i < shapeArrList.size(); i++) {
							XPathExpression spacingZeroText = xpath.compile("//TEXT[@CharShape='"+shapeArrList.get(i)+"']");
							NodeList spacingZeroTextList = (NodeList) spacingZeroText.evaluate(doc, XPathConstants.NODESET);
							for(int k=0;k<spacingZeroTextList.getLength();k++){
								letterSpacingChk.add(spacingZeroTextList.item(k).getTextContent());
							}
						}

						for (int i = 0; i < textShapeArr.length; i++) {
							for (int k = 0; k < shapeArrList.size(); k++) {
								if (textShapeArr[i].toString().equals(shapeArrList.get(k).toString())) {
									letterSpacingChkCnt++;
								}
							}
						} // 자간/간격 특정 구간 준수 end

						// 표 테두리 '실선' 준수

						// 대각선 아닌거 갯수
						XPathExpression diagonal = xpath.compile("//BORDERFILL[@BackSlash = '0'][@Slash = '0']");
						NodeList diagonalList = (NodeList) diagonal.evaluate(doc, XPathConstants.NODESET);
						for(int i=0;i<diagonalList.getLength();i++){
							diagonalList.item(i).getAttributes().getNamedItem("BackSlash");
						}
						NodeList allBorderfillList = doc.getElementsByTagName("BORDERFILL");

						// 전체<BORDERFILL>에서 <BORDERFILL>의 attr의 BS와 S가 0인거를 뺀거
						String[] diagonalArr = new String[allBorderfillList.getLength() - diagonalList.getLength()];

						int d = 0;
						for (int i = 0; i < allBorderfillList.getLength(); i++) {
							String slash = allBorderfillList.item(i).getAttributes().item(8).toString();
							String bSlash = allBorderfillList.item(i).getAttributes().item(0).toString();
							int targetS = slash.indexOf("\"") + 1;
							int targetBS = bSlash.indexOf("\"") + 1;
							String slashVal = slash.substring(targetS, slash.length() - 1).toString();
							String bSlashVal = bSlash.substring(targetBS, bSlash.length() - 1).toString();
							if (!slashVal.equals("0") || !bSlashVal.equals("0")) {
								String diagonalId = allBorderfillList.item(i).getAttributes().getNamedItem("Id").toString();
								int target = diagonalId.indexOf("\"") + 1;
								String diagonalIdVal = diagonalId.substring(target, diagonalId.length() - 1);
								diagonalArr[d] = diagonalIdVal;
								d++;
							}
						}

						// 실선 아닌거 갯수
						XPathExpression leftborder = xpath.compile("//LEFTBORDER[@Type = 'Solid']");
						NodeList leftborderList = (NodeList) leftborder.evaluate(doc, XPathConstants.NODESET);
						NodeList allleftborderList = doc.getElementsByTagName("LEFTBORDER");
						String[] leftborderArr = getBorderIdArr(allleftborderList, leftborderList);

						XPathExpression rightborder = xpath.compile("//RIGHTBORDER[@Type = 'Solid']");
						NodeList rightborderList = (NodeList) rightborder.evaluate(doc, XPathConstants.NODESET);
						NodeList allrightborderrList = doc.getElementsByTagName("RIGHTBORDER");
						String[] rightborderArr = getBorderIdArr(allrightborderrList, rightborderList);

						XPathExpression topborder = xpath.compile("//TOPBORDER[@Type = 'Solid']");
						NodeList topborderList = (NodeList) topborder.evaluate(doc, XPathConstants.NODESET);
						NodeList alltopborderList = doc.getElementsByTagName("TOPBORDER");
						String[] topborderArr = getBorderIdArr(alltopborderList, topborderList);

						XPathExpression bottomborder = xpath.compile("//BOTTOMBORDER[@Type = 'Solid']");
						NodeList bottomborderList = (NodeList) bottomborder.evaluate(doc, XPathConstants.NODESET);
						NodeList allbottomborderList = doc.getElementsByTagName("BOTTOMBORDER");
						String[] bottomborderArr = getBorderIdArr(allbottomborderList, bottomborderList);

						String[] borderArr = new String[diagonalArr.length + leftborderArr.length
								+ rightborderArr.length + topborderArr.length + bottomborderArr.length];
						System.arraycopy(diagonalArr, 0, borderArr, 0, diagonalArr.length);
						System.arraycopy(leftborderArr, 0, borderArr, diagonalArr.length, leftborderArr.length);
						System.arraycopy(rightborderArr, 0, borderArr, diagonalArr.length + leftborderArr.length,
								rightborderArr.length);
						System.arraycopy(topborderArr, 0, borderArr,
								diagonalArr.length + leftborderArr.length + rightborderArr.length, topborderArr.length);
						System.arraycopy(bottomborderArr, 0, borderArr,
								diagonalArr.length + leftborderArr.length + rightborderArr.length + topborderArr.length,
								bottomborderArr.length);
						

						ArrayList<String> borderArrList = new ArrayList<String>();

						for (String item : borderArr) {
							if (!borderArrList.contains(item))
								borderArrList.add(item);
						}
						
						
						for (int i = 0; i < tableList1.getLength(); i++) {
							String tableBorder = tableList1.item(i).getAttributes().getNamedItem("BorderFill").toString();
							int target = tableBorder.indexOf("\"")+1;
							String tableBorderFillVal = tableBorder.substring(target,tableBorder.length()-1);
							for(int k=0;k<borderArrList.size();k++){
								if(tableBorderFillVal.equals(borderArrList.get(k))){
									tbBdrSoildChk.add((i+1)+" 표");
									tbBdrSoildChkCnt++;
								}
							}
							for(int k=2;k<tableList1.item(i).getChildNodes().getLength();k++) {
								for(int l=0; l<tableList1.item(i).getChildNodes().item(k).getChildNodes().getLength();l++){
									String borderFill = tableList1.item(i).getChildNodes().item(k).getChildNodes().item(l).getAttributes().getNamedItem("BorderFill").toString();
									int target1 = borderFill.indexOf("\"")+1;
									String borderFillVal = borderFill.substring(target1,borderFill.length()-1);
									for(int m=0;m<borderArrList.size();m++){
										if(borderFillVal.equals(borderArrList.get(m))){
											tbBdrSoildChk.add((i+1)+"표 - "+(k-1)+"행 - "+(l+1)+"열");
											tbBdrSoildChkCnt++;
										}
									}
								}
							}
						}//	표 테두리 '실선' 준수 end
						
						//	기본글꼴 사용
						XPathExpression textstyle = xpath.compile("//FONTFACE[@Lang = 'Hangul']/FONT");
						NodeList textstyleList = (NodeList) textstyle.evaluate(doc, XPathConstants.NODESET);
						
						String[] basefont = {"함초롬바탕", "함초롬바탕 굵게", "함초롬바탕 확장", "함초롬바탕 확장B", "함초롬바탕 확장 굵게", "함초롬돋움", "함초롬돋움 굵게", "함초롬돋움 확장", "한컴산뜻돋움", "Haan Wings 2", "HancomEQN", "바탕", "바탕체", "돋움", "돋움체", "굴림", "굴림체", "궁서", "궁서체", "맑은 고딕"};
						ArrayList<String> basefontList = new ArrayList<String>();
						for(int i=0;i<basefont.length;i++){
							basefontList.add(basefont[i]);
						}
						
						for(int i=0;i<textstyleList.getLength();i++){
							String fontName = textstyleList.item(i).getAttributes().getNamedItem("Name").toString();
							int target = fontName.indexOf("\"")+1;
							String font = fontName.substring(target,fontName.length()-1);
							if(!basefontList.contains(font)) {
								String fontIdAttr = textstyleList.item(i).getAttributes().getNamedItem("Id").toString();
								int target1 = fontIdAttr.indexOf("\"")+1;
								String fontId = fontIdAttr.substring(target1,fontIdAttr.length()-1);
								XPathExpression fontIdNodes = xpath.compile("//FONTID[@Hangul='"+fontId+"']");
								NodeList fontIdList = (NodeList) fontIdNodes.evaluate(doc, XPathConstants.NODESET);
								for(int k=0;k<fontIdList.getLength();k++){
									String charshapList = fontIdList.item(k).getParentNode().getAttributes().getNamedItem("Id").toString();
									int target2 = charshapList.indexOf("\"")+1;
									String charShapId = charshapList.substring(target2,charshapList.length()-1);
									XPathExpression charNodes = xpath.compile("//TEXT[@CharShape='"+charShapId+"']");
									NodeList charNodesList = (NodeList) charNodes.evaluate(doc, XPathConstants.NODESET);
									for(int l=0;l<charNodesList.getLength();l++){
										fontChk.add(charNodesList.item(l).getTextContent().toString());
										fontChkCnt++;
									}
								}
							}
						}
						
						
						//특수문자
						XPathExpression charNode = xpath.compile("//CHAR");
						NodeList charNodeList = (NodeList) charNode.evaluate(doc, XPathConstants.NODESET);
						ArrayList<String> charArrList = new ArrayList<String>();
						ArrayList<String> specialCharArr = new ArrayList<String>();
						
						for(int i=0;i<charNodeList.getLength();i++) {
							String charVal = charNodeList.item(i).getTextContent().replaceAll(" ", "");
							String[] charValArray = new String[charVal.length()];
							for(int k=0;k<charVal.length();k++){
								charValArray[k] = charVal.substring(k, k+1);
								if (!charArrList.contains(charValArray[k])) {
									charArrList.add(charValArray[k]);
								}
							}
						}
						
						for(int i=0;i<charArrList.size();i++) {
							if(!Pattern.matches("^[ㄱ-ㅎ가-힣a-zA-Z0-9]*$", charArrList.get(i))){
								specialCharArr.add(charArrList.get(i).toString());
							}
						}
						
						
						Pattern pattern = Pattern.compile("^([E-F]{1})([0-8]{1})([0-9A-F]{1})([0-9A-F]{1})*$");
						
						for(int i=0;i<specialCharArr.size();i++){
							String hex = String.format("0x%02X%n", (int)specialCharArr.get(i).charAt(0)).substring(2);
							if (pattern.matcher(hex).find()) {
								specialChar.add("\""+specialCharArr.get(i)+"\"  <- 따옴표 안쪽을 드래그하여 찾아주세요.");
								specialCharCnt++;
							}
							
						}
						
						//셀 배경
						XPathExpression tableNode = xpath.compile("//TABLE");
						NodeList tableList = (NodeList) tableNode.evaluate(doc, XPathConstants.NODESET);
						XPathExpression cellNode = xpath.compile("//CELL");
						NodeList cellList0 = (NodeList) cellNode.evaluate(doc, XPathConstants.NODESET);
						XPathExpression WINDOWBRUSH = xpath.compile("//WINDOWBRUSH");
						NodeList WINDOWBRUSHList = (NodeList) WINDOWBRUSH.evaluate(doc, XPathConstants.NODESET);
						XPathExpression GRADATION = xpath.compile("//GRADATION");
						NodeList GRADATIONList = (NodeList) GRADATION.evaluate(doc, XPathConstants.NODESET);
						ArrayList<String> WINDOWBRUSHIdList = new ArrayList<String>();
						ArrayList<String> GRADATIONIdList = new ArrayList<String>();
						ArrayList<String> tableBorderList = new ArrayList<String>();
						ArrayList<String> cellBorderList = new ArrayList<String>();
						ArrayList<String> windowTableList = new ArrayList<String>();
						ArrayList<String> gradTableList = new ArrayList<String>();
						ArrayList<String> windowCellList = new ArrayList<String>();
						ArrayList<String> gradCellList = new ArrayList<String>();
						ArrayList<String> totalCellBGList = new ArrayList<String>();
						ArrayList<String> totalCellBGListDupl = new ArrayList<String>();
						
						// WINDOWBRUSH태그를 가진 borderfill태그의 아이디를 WINDOWBRUSHIdList에 넣었음
						WINDOWBRUSHIdList = borderFillIdList(WINDOWBRUSHList);
						// GRADATION태그를 가진 borderfill태그의 아이디를 GRADATIONIdList에 넣었음
						GRADATIONIdList = borderFillIdList(GRADATIONList);
						// table태그의 BorderFIll 어트리뷰트를 tableBorderList에 넣음
						tableBorderList = nodeBorderFillList(tableList);
						// cell태그의 BorderFIll 어트리뷰트를 cellBorderList에 넣음
						cellBorderList = nodeBorderFillList(cellList0);
						
						windowTableList = getTableCellAttr(WINDOWBRUSHIdList, tableBorderList);
						gradTableList = getTableCellAttr(GRADATIONIdList, tableBorderList);
						windowCellList = getTableCellAttr(WINDOWBRUSHIdList, cellBorderList);
						gradCellList = getTableCellAttr(GRADATIONIdList, cellBorderList);
						
						tableBackgroundCnt = windowTableList.size()+gradTableList.size()+windowCellList.size()+gradCellList.size();
						
						for (String item : windowTableList){totalCellBGList.add(item);}
						for (String item : gradTableList){totalCellBGList.add(item);}
						for (String item : windowCellList){totalCellBGList.add(item);}
						for (String item : gradCellList){totalCellBGList.add(item);}
						
						for (String item : totalCellBGList) {
							if (!totalCellBGListDupl.contains(item))
								totalCellBGListDupl.add(item);
						}
						
						for(int i=0;i<totalCellBGListDupl.size();i++){
							for (int k = 0; k < tableList1.getLength(); k++) {
								String tableBorder = tableList1.item(k).getAttributes().getNamedItem("BorderFill").toString();
								int target = tableBorder.indexOf("\"")+1;
								String tableBorderFillVal = tableBorder.substring(target,tableBorder.length()-1);
								if(tableBorderFillVal.equals(totalCellBGListDupl.get(i))){
									tableBackground.add((k+1)+" 표");
								}
								for(int l=2;l<tableList1.item(k).getChildNodes().getLength();l++) {
									for(int m=0; m<tableList1.item(k).getChildNodes().item(l).getChildNodes().getLength();m++){
										String borderFill = tableList1.item(k).getChildNodes().item(l).getChildNodes().item(m).getAttributes().getNamedItem("BorderFill").toString();
										int target1 = borderFill.indexOf("\"")+1;
										String borderFillVal = borderFill.substring(target1,borderFill.length()-1);
										if(borderFillVal.equals(totalCellBGListDupl.get(i))){
											tableBackground.add((k+1)+"표 - "+(l-1)+"행 - "+(m+1)+"열");
										}
									}
								}
							}
						}
						//셀 배경 end
						
						//국제 표준 이미지
						XPathExpression IMAGE = xpath.compile("//IMAGE");
						NodeList IMAGEList = (NodeList) IMAGE.evaluate(doc, XPathConstants.NODESET);
						XPathExpression BINITEM = xpath.compile("//BINITEM");
						NodeList BINITEMList = (NodeList) BINITEM.evaluate(doc, XPathConstants.NODESET);
						ArrayList<String> IMAGEBinItemList = new ArrayList<String>();
						ArrayList<String> BINITEMDataList = new ArrayList<String>();
						for(int i=0;i<IMAGEList.getLength();i++){
							String IMAGEAttr = IMAGEList.item(i).getAttributes().getNamedItem("BinItem").toString();
							int target = IMAGEAttr.indexOf("\"")+1;
							String IMAGEVal = IMAGEAttr.substring(target,IMAGEAttr.length()-1);
							IMAGEBinItemList.add(IMAGEVal);
						}
						
						for(int i=0;i<BINITEMList.getLength();i++){
							String BINITEMAttr = BINITEMList.item(i).getAttributes().getNamedItem("Format").toString();
							int target = BINITEMAttr.indexOf("\"")+1;
							String BINITEMVal = BINITEMAttr.substring(target,BINITEMAttr.length()-1).toString();
							if(!BINITEMVal.equals("jpeg")&&!BINITEMVal.equals("jpg")&&!BINITEMVal.equals("bmp")&&!BINITEMVal.equals("png")&&!BINITEMVal.equals("gif")){
								String BinDataAttr = BINITEMList.item(i).getAttributes().getNamedItem("BinData").toString();
								target = BinDataAttr.indexOf("\"")+1;
								String BinDataVal = BinDataAttr.substring(target,BinDataAttr.length()-1).toString();
								BINITEMDataList.add(BinDataVal);
							}
						}
						
						for(int i=0;i<IMAGEBinItemList.size();i++){
							for(int k=0;k<BINITEMDataList.size();k++){
								if(IMAGEBinItemList.get(i).equals(BINITEMDataList.get(k))){
									imageFileExtension++;
								}
							}
						}
						
						for(int i=0;i<BINITEMDataList.size();i++){
							XPathExpression imageNode = xpath.compile("//IMAGE[@BinItem='"+BINITEMDataList.get(i)+"']");
							NodeList imageNodeList = (NodeList) imageNode.evaluate(doc, XPathConstants.NODESET);
							for(int k=0;k<imageNodeList.getLength();k++){
								imageFile.add(imageNodeList.item(k).getParentNode().getParentNode().getTextContent().toString());
							}
						}
						// 이미지 국제표준 end
						
						// 글자처럼 취급
						XPathExpression tablePositionNode = xpath.compile("//POSITION");
						NodeList tablePositionList = (NodeList) tablePositionNode.evaluate(doc, XPathConstants.NODESET);
						
						for(int i=0;i<tablePositionList.getLength();i++){
							String positionAttr = tablePositionList.item(i).getAttributes().getNamedItem("TreatAsChar").toString();
							int target = positionAttr.indexOf("\"")+1;
							String positionTreat = positionAttr.substring(target,positionAttr.length()-1).toString();
							if(positionTreat.equals("true")){// true=글자처럼 취급, false=글자처럼 취급 안함
//								System.out.println("tablePositionList : "+tablePositionList.item(i).getParentNode().getParentNode().getTextContent());
								treatAsChar.add(tablePositionList.item(i).getParentNode().getParentNode().getTextContent());
								treatAsCharCnt++;
							}
						}
						// 글자처럼 취급 end
						
						// 특정수식 사용 지양
						XPathExpression equationNode = xpath.compile("//EQUATION");
						NodeList equationList = (NodeList) equationNode.evaluate(doc, XPathConstants.NODESET);
						for(int i=0;i<equationList.getLength();i++){
							equation.add(equationList.item(i).getTextContent().toString());
							equationCnt++;
						}
						
						// 글자 양각, 음각
						XPathExpression embossNode = xpath.compile("//EMBOSS");//양각
						NodeList embossList = (NodeList) embossNode.evaluate(doc, XPathConstants.NODESET);
						XPathExpression engraveNode = xpath.compile("//ENGRAVE");//음각
						NodeList engraveList = (NodeList) engraveNode.evaluate(doc, XPathConstants.NODESET);
						XPathExpression textNode = xpath.compile("//TEXT[@CharShape]");//음각
						NodeList textNodeList = (NodeList) textNode.evaluate(doc, XPathConstants.NODESET);
						ArrayList<String> embossParentId = new ArrayList<String>();//양각 리스트
						ArrayList<String> engraveParentId = new ArrayList<String>();//음각 리스트
						for(int i=0;i<embossList.getLength();i++){//양각
							String embossParentIdAttr = embossList.item(i).getParentNode().getAttributes().getNamedItem("Id").toString();
							int target = embossParentIdAttr.indexOf("\"")+1;
							String embossParentIdVal = embossParentIdAttr.substring(target,embossParentIdAttr.length()-1).toString();
							embossParentId.add(embossParentIdVal);
						}
						for(int i=0;i<engraveList.getLength();i++){//음각
							String engraveParentIdAttr = engraveList.item(i).getParentNode().getAttributes().getNamedItem("Id").toString();
							int target = engraveParentIdAttr.indexOf("\"")+1;
							String engraveParentIdVal = engraveParentIdAttr.substring(target,engraveParentIdAttr.length()-1).toString();
							engraveParentId.add(engraveParentIdVal);
						}
						for(int i=0;i<textNodeList.getLength();i++){
							String textAttr = textNodeList.item(i).getAttributes().getNamedItem("CharShape").toString();
							int target = textAttr.indexOf("\"")+1;
							String charShapeVal = textAttr.substring(target,textAttr.length()-1).toString();
							for(int k=0;k<embossParentId.size();k++){
								if(embossParentId.get(k).toString().equals(charShapeVal)){
									plusMinerDeg.add(textNodeList.item(i).getTextContent().toString());
									plusMinerDegCnt++;
								}
							}
							for(int k=0;k<engraveParentId.size();k++){
								if(engraveParentId.get(k).toString().equals(charShapeVal)){
									plusMinerDeg.add(textNodeList.item(i).getTextContent().toString());
									plusMinerDegCnt++;
								}
							}
						}
						//글자 양각, 음각 end
						
						
						// 도형
						XPathExpression drawingObjNode = xpath.compile("//DRAWINGOBJECT");//양각
						NodeList drawingObjList = (NodeList) drawingObjNode.evaluate(doc, XPathConstants.NODESET);
						for(int i=0;i<drawingObjList.getLength();i++){
							figure.add(drawingObjList.item(i).getParentNode().getTextContent().toString());
							figureCnt++;
						}
						// 도형 end
						

						// 임시 파일 삭제
//									fXmlFile.delete();
					} catch (Exception e) {
						e.printStackTrace();
					}
				}
			}

		}
		;
		
		checkReason.put("captionChk", captionChk);
		checkReason.put("gridChk", gridChk);
		checkReason.put("letterSpacingChk", letterSpacingChk);
		checkReason.put("tbBdrSoildChk", tbBdrSoildChk);
		checkReason.put("fontChk", fontChk);
		checkReason.put("specialChar", specialChar);
		checkReason.put("tableBackground", tableBackground);
		checkReason.put("imageFile", imageFile);
		checkReason.put("treatAsChar", treatAsChar);
		checkReason.put("equation", equation);
		checkReason.put("plusMinerDeg", plusMinerDeg);
		checkReason.put("figure", figure);

		result.put("captionChkCnt", captionChkCnt);
		result.put("gridChkCnt", gridChkCnt);
		result.put("letterSpacingChkCnt", letterSpacingChkCnt);
		result.put("tbBdrSoildChkCnt", tbBdrSoildChkCnt);
		result.put("fontChkCnt", fontChkCnt);
		result.put("specialCharCnt", specialCharCnt);
		result.put("tableBackgroundCnt", tableBackgroundCnt);
		result.put("imageFileExtension", imageFileExtension);
		result.put("treatAsCharCnt", treatAsCharCnt);
		result.put("equationCnt", equationCnt);
		result.put("plusMinerDegCnt", plusMinerDegCnt);
		result.put("figureCnt", figureCnt);
		result.put("checkReason", checkReason);

		return result;
	}

	public String[] getBorderIdArr(NodeList allNodeList, NodeList minerNodeList) {
		int l = 0;
		String[] returnArr = new String[allNodeList.getLength() - minerNodeList.getLength()];
		for (int i = 0; i < allNodeList.getLength(); i++) {
			String type = allNodeList.item(i).getAttributes().getNamedItem("Type").toString();
			int target = type.indexOf("\"") + 1;
			String typeVal = type.substring(target, type.length() - 1).toString();
			if (!typeVal.equals("Solid")) {
				String parentId = allNodeList.item(i).getParentNode().getAttributes().getNamedItem("Id").toString();
				int pTarget = parentId.indexOf("\"") + 1;
				String parentIdVal = parentId.substring(pTarget, parentId.length() - 1);
				returnArr[l] = parentIdVal;
				l++;
			}
		}

		return returnArr;
	}
	
	public ArrayList<String> borderFillIdList(NodeList list) {
		ArrayList<String> idList = new ArrayList<String>();
		for(int i=0;i<list.getLength();i++){
			if(list.item(i).getParentNode().getParentNode().hasAttributes()){
				String borderFillAttr = list.item(i).getParentNode().getParentNode().getAttributes().getNamedItem("Id").toString();
				int target = borderFillAttr.indexOf("\"")+1;
				String borderFillId = borderFillAttr.substring(target,borderFillAttr.length()-1);
				idList.add(borderFillId);
			}
		}
		return idList;
	}
	
	public ArrayList<String> nodeBorderFillList(NodeList list){
		ArrayList<String> idList = new ArrayList<String>();
		for(int i=0; i<list.getLength();i++){
			String thisAttr = list.item(i).getAttributes().getNamedItem("BorderFill").toString();
			int target = thisAttr.indexOf("\"")+1;
			String thisBorderFill = thisAttr.substring(target,thisAttr.length()-1);
			idList.add(thisBorderFill);
		}
		return idList;
	}
	
	public ArrayList<String> getTableCellAttr(ArrayList<String> attrList, ArrayList<String> tagList){
		ArrayList<String> result = new ArrayList<String>();
		for(int i=0;i<attrList.size();i++){
			for(int k=0;k<tagList.size();k++){
				if(tagList.get(k).equals(attrList.get(i))){
					result.add(tagList.get(k));
				}
			}
		}
		return result;
	}

}