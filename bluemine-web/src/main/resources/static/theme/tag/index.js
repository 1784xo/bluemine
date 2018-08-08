
function createline(params, lineChart, url) {
	$.ajax({
		url: url,
		type: "POST",
		contentType: "application/json",
		dataType: "jsonp",
		data: JSON.stringify(params),
		success: function (data) {
			//debugger;
			if(data.status=="200") {
				var xAxisData = [];
				var seriesData = [];
				var list = data.result;
				var option = deepCopy(lineOption);
				for (var item in list) {
					xAxisData.push(list[item].callDate);
					if(params.data.subType=="F") {
						option.title.text = "次数"
						seriesData.push(list[item].frequency);
					} else {
						option.title.text = "会话数"
						seriesData.push(list[item].callNum);
					}
				}
				if(params.data.subType=="F") {
					option.series[0].name = "次数";
				} else {
					option.series[0].name = "会话数";
				}
				option.xAxis.data = xAxisData;
				option.series[0].data = seriesData;
				lineChart.setOption(option, true);
			} else {
				alert("err");
			}

		}
	});
}

function createpie(params, pieChart, url) {
	$.ajax({
		url: url,
		type: "POST",
		contentType: "application/json",
		dataType: "jsonp",
		data: JSON.stringify(params),
		success: function (data) {
			//debugger;
			if(data.status=="200") {
				var legendData = [];
				var seriesData = [];
				var list = data.result;
				var option = deepCopy(pieOption);
				for (var item in list) {
					
					legendData.push(list[item].tagText);
					if(params.data.subType=="F") {
						option.title.text = "次数";
						option.legend.right = "0";
						seriesData.push({
							value: list[item].frequency,
							name: list[item].tagText
						});
					} else {
						option.title.text = "会话数";
						option.legend.left = "0";
						seriesData.push({
							value: list[item].callNum,
							name: list[item].tagText
						});
					}
				}

				if(params.data.subType=="F") {
					option.series[0].name = "次数";
				} else {
					option.series[0].name = "会话数";
				}
				option.legend.data = legendData;
				option.series[0].data = seriesData;
				pieChart.setOption(option, true);
			} else {
				alert("err");
			}
		}
	});
}

var deepCopy = function(obj) {
  var newO = {};
  if (obj instanceof Array) {
    newO = [];
  }
  for ( var key in obj) {
    var val = obj[key];
    newO[key] = typeof val === 'object' ? arguments.callee(val) : val;
  }
  return newO;
}

function getparam(subType) {
	debugger;
	var curtag;
	
	if($('#open-tags-dialog').data().select==undefined || $('#open-tags-dialog').data().select.tagText=="全部") {
		curtag = {
			tagId: "0",
			channelId: "49252889384718336",
			subType: "F"
		}
	} else {
		curtag = $('#open-tags-dialog').data().select;
		curtag = {
			tagId: curtag.tagId,
			channelId: curtag.channelId,
			subType: subType
		}
	}
	
	var params = {
		data: {
			callDate: $(".to").val(),
			tagId: curtag.tagId,
			channelNo: curtag.channelId,
			subType: subType
		}
	}
	return params;
}
function appendZero(obj) {
	if(obj<10) return "0" +""+ obj;
	else return obj;
}

function getYesterday() {
var dd = new Date();
    dd.setDate(dd.getDate()-1);
    var y = dd.getFullYear();
    var m = appendZero(dd.getMonth()+1);
    var d = appendZero(dd.getDate());
	return y+"-"+m+"-"+d;
}


bulemine.loader(function () {

	return;
	$(".to").val(getYesterday());

	var lineChart = echarts.init(document.getElementById('charts-1'));
	var pieChart1 = echarts.init(document.getElementById('fdiv'));
	var pieChart2 = echarts.init(document.getElementById('cdiv'));

	var lineparams1 = getparam("F");
	var lineparams2 = getparam("C");
	var pieparams1 = getparam("F");
	var pieparams2 = getparam("C");

	createline(lineparams1, lineChart, "/service/tagcollect/findByTag");
	createpie(pieparams1, pieChart1, "/service/tagcollect/findBySubTag");
	createpie(pieparams2, pieChart2, "/service/tagcollect/findBySubTag");

	$('#subBtn').on('click', function () {
		var lineparams1 = getparam("F");
		var lineparams2 = getparam("C");
		var pieparams1 = getparam("F");
		var pieparams2 = getparam("C");

		$("#led2").removeClass("led-enable");
		$("#led2").addClass("led-disable");

		$("#led1").removeClass("led-disable");
		$("#led1").addClass("led-enable");

		createline(lineparams1, lineChart, "/service/tagcollect/findByTag");
		createpie(pieparams1, pieChart1, "/service/tagcollect/findBySubTag");
		createpie(pieparams2, pieChart2, "/service/tagcollect/findBySubTag");
		
	});

	$('#led1').on('click', function () {

		$("#led2").removeClass("led-enable");
		$("#led2").addClass("led-disable");

		$("#led1").removeClass("led-disable");
		$("#led1").addClass("led-enable");

		createline(getparam("F"), lineChart, "/service/tagcollect/findByTag");
	});

	$('#led2').on('click', function () {
		$("#led1").removeClass("led-enable");
		$("#led1").addClass("led-disable");

		$("#led2").removeClass("led-disable");
		$("#led2").addClass("led-enable");

		createline(getparam("C"), lineChart, "/service/tagcollect/findByTag");
	});
	
	//导出
	$("#exportbtn").click(function () {
		var mycanvas = $("#main").find("canvas")[0];
	 
		var image = mycanvas.toDataURL("image/jpeg");
	 
		var $a = document.createElement('a');
		$a.setAttribute("href", image);
		$a.setAttribute("download", "");
		$a.click();
	 
		//window.location.href=image; // it will save locally
	});
});
