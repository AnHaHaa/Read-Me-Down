//모달 취소버튼(공통)
$("body").on('click','.modal_cancelbtn',function(){
	$(this).parents(".modal").css("display","none");
});

//모달 내 테이블 tr누를시 선택(공통)
$(".modal table tbody").on("click",'tr',function(){
	$(this).find("input[type='radio']").prop("checked",true);
});

//모달함수선언
function openAlertModal(modal_msg){
	$("#alert_modal").css("display","flex");
	$("#alert_modal #modal_alert_text").html(modal_msg);
}

function openBadges(){
	$.ajax({
		type: 'post',
		url: '/getbadges',
		dataType: 'json',
		data: {
			keyword: $("#badge_keyword").val()
		},
		success: function(data) { // 결과 성공 콜백함수
			let badgelist = data;
			for(let i=0; i<badgelist.length; i++){
				$("#modal_result").append("<button id='"+badgelist[i].badge_link+"'>" + badgelist[i].badge_name + '</button>');
			}
			$("#choosed_badges").html('');
			$("#badge_keyword").val('');
		},
		error: function(request, status, error) { // 결과 에러 콜백함수
			console.log(error)
		}
	});//ajax end
	$("#badge_modal").css("display","flex");
}

function openActivityGraph(){
	$("#activity_graph_modal").css("display","flex");
	//모달초기화
	$("#activity_graph_modal #github_ID").val('');
	$($("#activity_graph_modal input[type='radio']")[0]).prop("checked",true);
	$('#activity_graph_modal #themetable').scrollTop(0);
	$("#activity_graph_modal #github_ID_guide").text("조회할 github ID를 입력하세요.");
	$("#activity_graph_modal #github_ID_guide").css("color","var(--text)");
}

function openReadmeStats() {
	$("#readme_stats_modal").css("display", "flex");
	//모달초기화
	$('#readme_stats_modal .modal_box').scrollTop(0);
	$('#readme_stats_modal #themetable').scrollTop(0);
	$("#readme_stats_modal #github_ID").val('');
	$("#readme_stats_modal #github_ID_guide").text("조회할 github ID를 입력하세요.");
	$("#readme_stats_modal #github_ID_guide").css("color","var(--text)");
	$("#readme_stats_modal input[name='hidden_option']").prop("checked",true);
	$("#readme_stats_modal input[name='add_option']").prop("checked",false);
	$($("#readme_stats_modal input[name='icon_option']")[0]).prop("checked",true);
	
	$.ajax({
		type: 'post',
		url: '/getstatstheme',
		dataType: 'json',
		data: {
			keyword: $("#stats_theme_keyword").val()
		},
		success: function(data) { // 결과 성공 콜백함수
			let list = data;
			for (let i = 0; i < list.length; i++) {
				let themename = list[i].stats_theme_name;
				themename = themename.replace("-", "<br>");
				themename = themename.replace("_", "<br>");
				$("#readme_stats_modal #themetable tbody").append(
					`<tr>
					<td><label><input type="radio" name="theme" value="${list[i].stats_theme_name}" checked><span>${themename}</span></label></td>
					<td><img src="${list[i].stats_theme_img}"></td>
				</tr>`
				);
				$($("#readme_stats_modal input[name='theme']")[0]).prop("checked", true);
			}
		},
		error: function(request, status, error) { // 결과 에러 콜백함수
			console.log(error)
		}
	});//ajax end
}

function openTopLangs() {
	$("#top_langs_modal").css("display", "flex");
	//모달초기화
	$('#top_langs_modal .modal_box').scrollTop(0);
	$('#top_langs_modal #themetable').scrollTop(0);
	$('#top_langs_modal #layouttable').scrollTop(0);
	$("#top_langs_modal #github_ID_guide").text("조회할 github ID를 입력하세요.");
	$("#top_langs_modal #github_ID_guide").css("color","var(--text)");
	$("#top_langs_modal input[type='text']").val('');
	$($("#top_langs_modal input[name='layout']")[0]).prop("checked", true);
	$.ajax({
		type: 'post',
		url: '/getstatstheme',
		dataType: 'json',
		data: {
			keyword: $("#top_langs_modal #stats_theme_keyword").val()
		},
		success: function(data) { // 결과 성공 콜백함수
			let list = data;
			for (let i = 0; i < list.length; i++) {
				let themename = list[i].stats_theme_name;
				themename = themename.replace("-", "<br>");
				themename = themename.replace("_", "<br>");
				$("#top_langs_modal #themetable tbody").append(
					`<tr>
					<td><label><input type="radio" name="theme" value="${list[i].stats_theme_name}" checked><span>${themename}</span></label></td>
					<td><img src="${list[i].stats_theme_img}"></td>
				</tr>`
				);
				$($("#top_langs_modal input[name='theme']")[0]).prop("checked", true);
			}
		},
		error: function(request, status, error) { // 결과 에러 콜백함수
			console.log(error)
		}
	});//ajax end
}
function openBoj_h() {
	$("#boj_h_modal").css("display", "flex");
	//모달초기화
	$("#boj_h_modal input[type='text']").val('');
}
function openBoj_m() {
	$("#boj_m_modal").css("display", "flex");
	//모달초기화
	$("#boj_m_modal input[type='text']").val('');
	$("#boj_m_modal input[type='radio']").prop("checked", false);
}
function openCodeForce() {
	$("#codeforces_modal").css("display", "flex");
	//모달초기화
	$("#codeforces_modal input[type='text']").val('');
}
function openGrass() {
	$("#solved_grass_modal").css("display", "flex");
	//모달초기화
	$("#solved_grass_modal input[type='text']").val('');
	$($("#solved_grass_modal input[type='radio']")[0]).prop("checked", true);
}