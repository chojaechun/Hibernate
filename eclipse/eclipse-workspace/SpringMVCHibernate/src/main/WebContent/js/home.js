/**
 * 
 */
		var rootSlider;						// parents Slider event
		var subSlider;						// child Slider event
		var rootSliderIndex=0;				// parents Slider index(page)
		var subSliderIndex=0;				// child Slider index(page
		var subSliderIndex_s=0;				//child Slider var(use for detail index value)
		var subSliderIndexJSON={};			// child Slider index(page) detail
		var vessel_Slider_check = false; 	// Slider size configuration check
		var reloadQC_Interval;				// QC information calling Interval event
		
var subTitleList = ['JAVA', 'JAVAScript', 'Oracle', 'Mysql'];
var subTitleId = ['java', 'javascript', 'oracle', 'mysql'];

//Get HTML Source
function getHtml(id){
	var result = $("#"+id).html();
	return result;
}

// Replace String
function replaceall(fullStr,originalStr,changeStr){
   return  fullStr.split(originalStr).join(changeStr);
}

$(document).ready(function(){
	
	for(var i=0; i<subTitleId.length; i++){
		var layerHTML1 = getHtml("default_layout_hidden");
		layerHTML1 = replaceall(layerHTML1, "%SubID_1%", subTitleId[i]);
		layerHTML1 = replaceall(layerHTML1, "%ID_1%", subTitleList[i]);
		layerHTML1 = replaceall(layerHTML1, "%ID_2%", subTitleList[i]);
		$("#sub_layout_view").append(layerHTML1);
	}
	
	var qcAddLi="";
	for(var i=0; i<subTitleId.length; i++){
		qcAddLi += getHtml("default_layout_hidden2");
	}
	console.log(qcAddLi);
	$("#section").append(qcAddLi);
	
});


function subPage(sub_title){
	console.log(sub_title);
	
}