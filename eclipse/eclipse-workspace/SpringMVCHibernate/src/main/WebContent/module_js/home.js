function getHtml(e){var l=$("#"+e).html();return l}function replaceall(e,l,t){return e.split(l).join(t)}function subPage(e){console.log(e)}var rootSlider,subSlider,rootSliderIndex=0,subSliderIndex=0,subSliderIndex_s=0,subSliderIndexJSON={},vessel_Slider_check=!1,reloadQC_Interval,subTitleList=["JAVA","JAVAScript","Oracle","Mysql"],subTitleId=["java","javascript","oracle","mysql"];$(document).ready(function(){for(var e=0;e<subTitleId.length;e++){var l=getHtml("default_layout_hidden");l=replaceall(l,"%SubID_1%",subTitleId[e]),l=replaceall(l,"%ID_1%",subTitleList[e]),l=replaceall(l,"%ID_2%",subTitleList[e]),$("#sub_layout_view").append(l)}for(var t="",e=0;e<subTitleId.length;e++)t+=getHtml("default_layout_hidden2");console.log(t),$("#section").append(t)});