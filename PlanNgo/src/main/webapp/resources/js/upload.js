/**
 Register.jsp 에서 file ajax 처리할떄 사용 .
 LastUpdate : 2021/01/06
 */

function checkImageType(fileName) {

	var pattern = /jpg|gif|png|jpeg/i;

	return fileName.match(pattern);
}

function getFileInfo(fullName) {

	var fileName, imgsrc;

	var fileLink;

	if (checkImageType(fullName)) {
		//console.log(fullName); // /s_ 가 붙어 있는 파일임 
		
		//imgsrc = http://localhost:8080/displayFile?fileName=/s_3584fd35-463e-4c19-812c-3eb2b3c803f7_%EC%9D%B4%EC%A0%A0%EC%BB%B4%ED%93%A8%ED%84%B0%ED%95%99%EC%9B%90%20%EB%B0%94%ED%83%95%ED%99%94%EB%A9%B4%20(%EA%B3%B5%EC%A7%80%EC%82%AC%ED%95%AD%20%EC%95%88%EB%82%B4).jpg 
		imgsrc = "/displayFile?fileName=" + fullName;
		fileLink = fullName.substr(14); //15번쨰 뒤로 프린트됨
		delLink = "/deleteFile?fileName="+fullName
		console.log("fullName = "+ fullName);
		
	} else {
		alert ("JPG, PNG, GIF 파일 형식만 업로드 가능합니다.");
	}

	fileName = fileLink.substr(fileLink.indexOf("_")+1);

	return {fileName:fileName, imgsrc:imgsrc, delLink:delLink, fullName:fullName};	
}