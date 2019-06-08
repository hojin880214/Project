function checkImageType(fileName) {
	var pattern=/jpg|gif|png|jpeg/i;
	return fileName.match(pattern);
}

function getFileInfo(fullName) {
	var fileName,imgSrc,getLink,fileLink;
	console.log("fullName : " + fullName);
	if(checkImageType(fullName)){
		imgSrc="../displayFile?fileName="+fullName;
		
		fileLink=fullName.substr(14); // /2019/02/27/s_ ~*
		var folders=fullName.substr(0,12); // /2019/02/27/
		getLink="../displayFile?fileName="+folders+fileLink;
	}else{
		imgSrc="../resources/images/file.png";
		fileLink=fullName.substr(12);
		getLink="../displayFile?fileName="+fullName;
	}
	fileName=fileLink.substr(fileLink.indexOf("_")+1);
	return {fileName:fileName,imgSrc:imgSrc,getLink:getLink,fullName:fullName}
}