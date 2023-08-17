<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<script src="https://unpkg.com/masonry-layout@4/dist/masonry.pkgd.min.js"></script>
<script src="https://unpkg.com/imagesloaded@4/imagesloaded.pkgd.min.js"></script>
<link rel="icon" href="/images/logo-pencil.png" />
<link rel="apple-touch-icon" href="/images/logo-pencil.png" />
<link rel="stylesheet" href="/css/style.css" />
<link rel="stylesheet" href="/css/main.css" />
<script src="/js/jquery-3.6.4.min.js"></script>
<title>Read Me▼</title>
<script>
$(document).ready(function() {
	//이미지 masonry로 배열
	var msnry = new Masonry( '.grid', {
		  itemSelector: '.grid-item',
		  // columnWidth: 200
		  columnWidth: '.grid-sizer',
		  percentPosition: true,
		  gutter : 20,
		});
	imagesLoaded( '.grid' ).on( 'progress', function() {
	  msnry.layout();
	});
	
	//북마크 추가(프론트)
	$(".main_bookmark_btn").on('click', function(){
		$(this).parents().siblings(".bookmarked-plus").show();//북마크추가 css효과
	});
	//북마크 해제(프론트)
	$(".main_bookmarked_btn").on('click', function(){
		$(this).parents(".bookmarked-plus").hide();//북마크제거 css효과
	});
	
	//검색 누르면 박스 오픈
	$("#search_word_input").on('click', function(){
		$("#search_below_box").slideToggle(300);
	});
	
	//검색어 x누르면 삭제(아직기능구현X) -> 근데 추천검색어만 둔다면 필요없음.. 일단 냅두기
	$(".remove_keyword").on('click', function(){
		$(this).parents(".one_searchword").css("display", "none");
	});
	
	
}); //ready
</script>
</head>
<body>
<jsp:include page="header.jsp"/>
	
<div id="main_box">
<div id="main_contents">
	<div id="search_top_box">
		<div id="search_box">
			<div id="search_icon_box"><img id="search_icon_img" src="/images/main/search_icon.svg"></div>
			<div id="search_word_box"><input type="text" id="search_word_input"></div>
		</div>
	</div>
	<div id="search_below_box">
		<div id="search_btns_box">
			<!-- <div id="latest_searchword" style="font-size : 20px">최근 검색 기록<br>
				<div class="search_words_box">
					<div class="one_searchword" id="">
						<div class="search_keyword">심플</div>
						<div class="remove_keyword">X</div>
					</div>
					<div class="one_searchword">
						<div class="search_keyword">화려</div>
						<div class="remove_keyword">X</div>
					</div>
				</div>				
			</div> -->
			<div id="recommend_searchword" style="font-size : 20px">추천 키워드<br>
				<div class="search_words_box">
					<div class="one_searchword">
						<div class="search_keyword">심플</div>
						<!-- <div class="remove_keyword">X</div> -->
					</div>
					<div class="one_searchword">
						<div class="search_keyword">화려</div>
						<!-- <div class="remove_keyword">X</div> -->
					</div>
				</div>				
			</div>
			<!-- <div id="popular_searchword" style="font-size : 20px">인기 검색어<br>
				<div class="search_words_box">
					<div class="one_searchword">
						<div class="search_keyword">심플</div>
						<div class="remove_keyword">X</div>
					</div>
					<div class="one_searchword">
						<div class="search_keyword">화려</div>
						<div class="remove_keyword">X</div>
					</div>
				</div>				
			</div> -->
		</div>
	</div>
	<div id="main_gallery">
		<div class="grid">
		  <div class="grid-sizer"></div>
			<c:forEach begin="1" end="19" varStatus="vs">
		           <div class="grid-item"> 
		               <img src='/images/main/readme_ex${vs.count}.png' alt="template">
		               <div class="darkness"></div>
		               <div class="btn-plus">
			               <div class="main_bookmark_box"><img class="main_bookmark_btn" src='/images/main/bookmark_before.svg'></div>
		               </div>
		               <div class="bookmarked-plus">
			               <div class="main_bookmarked_box"><img class="main_bookmarked_btn" src='/images/main/bookmark_after.svg'></div>
		               </div>
		           </div>	
		       </c:forEach>
			<c:forEach begin="1" end="19" varStatus="vs">
		           <div class="grid-item"> 
		               <img src='/images/main/readme_ex${vs.count}.png' alt="template" onerror="this.src='/images/main/no_img.svg'">
		               <div class="darkness"></div>
		               <div class="btn-plus">
			               <div class="main_bookmark_box"><img class="main_bookmark_btn" src='/images/main/bookmark_before.svg'></div>
		               </div>
		               <div class="bookmarked-plus">
			               <div class="main_bookmarked_box"><img class="main_bookmarked_btn" src='/images/main/bookmark_after.svg'></div>
		               </div>
		           </div>	
		       </c:forEach>
		</div>
	</div>
</div>
</div>

</body>
</html>
