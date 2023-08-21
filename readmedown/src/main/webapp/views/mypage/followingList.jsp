<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<link rel="icon" href="/images/logo-pencil.png" />
<link rel="apple-touch-icon" href="/images/logo-pencil.png" />
<link rel="stylesheet" href="/css/style.css" />
<link rel="stylesheet" href="/css/mypage/myPage.css" />
<link rel="stylesheet" href="/css/mypage/followingList.css" />
<script src="/js/jquery-3.6.4.min.js"></script>
<title>Read Me▼</title>
</head>
<body>
<jsp:include page="../header.jsp" />
	<div id="main_box">
		<div id="main_contents">
			<div class="mypage_container">
				<div class="contentWrap">
					<div class="userInfo">
						<div class="user">
							<div class="mypage-profile-image"><img src="${info.profile_image}"></div>
							<span id="name">${info.name}</span>
							<span id="git">My Github : ${info.git_id}</span>
							<button onclick="redirectToEditProfile()">Edit Profile</button>
						</div>
					</div>
				</div>
				<div class="categoryWrap">
					<div class="category">
						<a href="/mypage" class="category-link"
							id="myTemplateLink"> <img
							src="/images/mypage/my_template.svg">내 템플릿
						</a>
					</div>
					<div class="category">
						<a href="/bookmarks" class="category-link"
							id="bookmarksLink"> <img src="/images/mypage/bookmarks.svg">북마크
						</a>
					</div>
					<div class="category">
						<a href="/following" class="category-link" id="followingLink"
							style="border-bottom: 7px solid var(--neon3);"> <img
							src="/images/mypage/following.svg">팔로잉
						</a>
					</div>

				</div>
				<div class="infoWrap" id="infoWrap">
					<div class="following_list">
						<div class="following_user">
							<div class="user_image"></div>
							<div class="user_name">
								<p>@템플릿기부천사</p>
							</div>
							<div class="follow_button">
								<button onmouseover="showUnfollowText(this)"
									onclick="removeFollowingUser(this)">팔로잉</button>
							</div>
						</div>
						<div class="following_user">
							<div class="user_image"></div>
							<div class="user_name">
								<p>@리드미참쉽죠</p>
							</div>
							<div class="follow_button">
								<button onmouseover="showUnfollowText(this)"
									onclick="removeFollowingUser(this)">팔로잉</button>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>		
	</div>
<script src="/js/mypage/myPage.js"></script>
</body>
</html>

