/**
 * 
 */
		
var subTitleList = ['JAVA', 'JAVAScript', 'Oracle', 'Mysql'];
var subTitleId = ['java', 'javascript', 'oracle', 'mysql'];
var windowResizeH;
var windowResizeH2;

function hiddenLoading(){
	document.getElementById("loading").style.display = "none";
	//document.getElementById("overflow").style.overflow = "scroll";
}

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
	
	// slick 사용하고 싶으면 html 이나 jsp 단에 최하단에 js 설정할 것
    $(".center").slick({
        dots: true,
        infinite: true,
        centerMode: true,
        slidesToShow: 3,
        slidesToScroll: 3
      });
    /*
    windowResizeH = $(window).height()*0.9;
    windowResizeH2 = $(window).height()*0.7;
	$('#mainContainer').height(windowResizeH);
	$('#secondContainer').height(windowResizeH2);
    console.log(windowResizeH);
    
    $(window).resize(function (){
    	windowResizeH = $(window).height()*0.9;
    	windowResizeH2 = $(window).height()*0.7;
    	$('#mainContainer').height(windowResizeH);
    	$('#secondContainer').height(windowResizeH2);
    });*/
    
    hiddenLoading();
    
    
    $(".scrollMenu li").click(function(a) {
    	// a tag 를 href 로 진입시 깜빡임 현상때문에 href를 title 로 교체
    	var scrollPosition = $(a.target.title).offset().top;
    	//console.log(a);
	
    	$("html, body").stop().animate({
    		scrollTop: scrollPosition
    	}, 1000);
    });
    
});


function subPage(sub_title){
	console.log(sub_title);
	
}

function imgClick(id){
	console.log(id);
};