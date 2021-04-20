<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="java.util.*"%>
<%@ page import="com.project.plus.domain.ClubVO"%>
<%@ page import="java.text.SimpleDateFormat"%>
 <jsp:useBean id="now" class="java.util.Date" />
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<style>
/* 진경 수정 */
.fixed-top{
 position: sticky;
}

.wrap{
	height:2000px;
}
.container {
    height: 100%;
}


#clubBar {
	display: flex;
}

#openClubPic {
	width: 30%;
	padding-left: 2%;
	margin-right: 2%;
	/* background-color: red; */
}


#openClubPic img{
	width:80%;
	height:80%;
}

#openClubProgress {
	width: 50%;
	/* background-color: blue; */
}

#openClubBtn {
	width: 15%;
	/* background-color: blueviolet; */
	margin: 3% 0% 2% 7%;
}

#clubName {
	margin: 8% 0%;
	font-weight: bold;
	font-size: 20px;
}

#inBtn {
	width: 120px;
	height: 50px;
	border-style: none;
	border-radius: 7%;
	margin-top: 52%;
	font-size: 22px;
	margin-bottom: 3%;
}

#extendBtn {
	width: 100px;
	height: 40px;
	border-style: none;
	border-radius: 7%;
	/* margin-top: 52%; */
	font-size: 19px;
	margin-bottom: 3%;
	margin-top:7%;
	background-color: #007BFF;
	color:#fff;
}

#outBtn{
	width: 100px;
	height: 40px;
	border-style: none;
	border-radius: 7%;
	margin-top: 51%; 
	font-size: 18px;
	margin-bottom: 3%;
	background-color: #007BFF;
	color:#fff;
	
}

#openClubPic img {
	margin-top: 7%;
	border-radius: 20px;
}

.open-plus .col-md-10 {
	border-style: none;
	border-radius: 10px;
	background-color: rgba(88, 86, 87, 0.041);
	margin-top: 10px;
	height: 170px;
	width: 80vw;
}

.open-plus{
	font-size :24px;
	font-weight : bold;
}

#clubBar {
	margin: 4% 0%;
}

.counter-block {
	margin-top: 10px;
	margin-bottom : 5%; /*20210416 css 수정*/
	width: 690px;
	height: 180px; /*20210416 css 수정*/
	text-align: center;
	margin-left: 6%;
	border: 3px solid #eee;
	border-radius: 5px;
	
}

.counter-block p {
	font-weight: bold;
	color: rgba(7, 7, 7, 0.877);
}

.counter-block h6 {
	font-weight: bold;
	color: rgba(7, 7, 7, 0.877);
}

/* 모달 css*/
.modal-content {
	position: relative;
	background-color: #fff;
	background-clip: padding-box;
	border: 1px solid #999;
	border: 1px solid rgba(0, 0, 0, .2);
	border-radius: 6px;
	outline: 0;
	width: 620px;
	height: 500px;
	margin-left: 5%;
	font-size: 15px;
}

.modal-header {
	font-size: 15px;
	display: -ms-flexbox;
	display: inline-table;
	-ms-flex-align: start;
	-ms-flex-pack: justify;
	padding: 1rem 1rem;
	border-bottom: 1px solid #dee2e6;
	background-color: #EBF0F7;
	border-radius: 6px 6px 0px 0px;
	border-top-right-radius: calc(.3rem - 1px);
}

.btn-default {
	color: #333;
	background-color: #fff;
	border-color: #ccc;
}
/*모달 끝*/
#infoText {
	font-size: 14px;
	left: 0px;
	bottom: 0px;
	width: 100%;
}

#infoText {
	margin-top: 30px;
}

#blank {
	margin-top: 5%;
	line-height: 6px;
}
/*모달 창 위치*/
.modal-dialog {
	margin-top: 5%;
}

#ff {
	display: inline;
	width: 100%;
}

.modal-footer {
	margin-top: 40px;
}

.textStyle {
	background: linear-gradient(to top, #FFE400 50%, transparent 50%);
}

.badge-danger {
    color: #fff;
    background-color: #dc3545fa;
}
a {
    color: #212529;
    text-decoration: none;
    background-color: transparent;
}
h6{
 font-weight: bold;
 margin-bottom:2%;
}


#myTitle{
	padding-top : 5px;
    font-size :26px;
	font-weight:bold;
}
#titleMy{
	background : linear-gradient(to top,#FFE400 50%, transparent 50%);
}
 
 /*20210416 css 추가*/
.pTags{
	font-size : 21px;
	font-weight: bold;
}


</style>
</head>
<title>내 모임 관리</title>
<body>
	<div class="container" class="clearfix">
		<div class="row">
			<!-- 상단의 my progress -->
			<div class="col-md-2" id="myTitle"><span id="titleMy">my progress</span></div>
			<div class="col-md-8">
				<div class="counter-block">
					<div class="row">
						<div class="col-12 progress-icon">
							<p style="font-size:26px; margin-top:20px;">🏳🏳‍🌈내모임현황‍🏳‍🌈🏳‍</p>
						</div>
						<div class="col-4 progress-icon" >
							<p class="pTags">참가중</p>
							<h6>${fn:length(selectAttendClubList)}</h6>
						</div>
						<div class="col-4 progress-icon" class="pTags">
							<p class="pTags">완료</p>
							<h6>${clubCnt}</h6>
						</div>
						<div class="col-4 progress-icon" class="pTags">
							<p class="pTags">개설</p>
							<h6>${fn:length(selectCurClubList)}</h6> 
						</div>
					</div>
				</div>
			</div>
		</div>
		
		<!-- 개설한 모임 -->
		<div class="row-middle" >
			<div class="open-plus">
				개설한 모임
				<c:if test="${empty selectCurClubList }">
					<div class="col-md-10" id="clubBar">
						<div id="ff">
							<p style="font-size: 15px; text-align: center; margin-top: 50px;"> 아직 개설한 모임이 없습니다.</p>
							<p style="font-size: 15px; text-align: center;">
								이루고자하는 목표를 더하기 멤버들과 함께 이뤄보세요.🦝🐷🐔🐸🐾
							</p>
						</div>
					</div>
				</c:if>
				<c:if test="${selectCurClubList !=null || selectCurClubList != '' }">
					<c:forEach var="clubList" items="${selectCurClubList }">
						<div class="col-md-10" id="clubBar">
							<input type="hidden" id="clubNum" value="${clubList.clubNum}" />
							<input type="hidden" id="memberNum" value="${user.memberNum}" />
							<div id="openClubPic">
								<!--  <a href="getCommunity?clubNum=${clubList.clubNum}"> <img src="${path}/resources/img/tmpImg/${clubList.clubMain_pic}"
									width="80%" height="80%" title="커뮤니티입장 GOGO~!" /></a>-->
							<a href="getCommunity?clubNum=${clubList.clubNum}">
								<img  src="${path}/resources${clubList.clubMain_pic}" title="커뮤니티입장 GOGO~!" 
	     								  onerror="this.onerror=null; this.src='${path}/resources/img/goal.PNG'" style="width: 80%"/>
		                    </a>
							</div>
							<div id="openClubProgress">
								<h3 id="clubName">
									<a href="getClub?clubNum=${clubList.clubNum}" title="모임상세페이지 GOGO~!">${clubList.clubName}</a>
								</h3>
								<div class="w3-light-grey w3-round-large">
									<div class="w3-container w3-blue w3-round-large" 
										style="width: ${clubList.progressBar}%" id="progressBar">${clubList.progressBar}%</div>
								</div>
							</div>
							<div id="openClubBtn">
								<input type="button"onClick="location.href='getMyClubInfo?clubNum=${clubList.clubNum}'" id="extendBtn" value="수정하기"/>
								<c:if test="${clubList.progressBar >= 70}">
									<c:if test="${clubList.clubFee == 0}">
										<input type="button" id="extendBtn" data-toggle="modal" data-target="#myModal${clubList.clubNum}" value="연장하기"
											title="모임 연장은 모임의 70% 진행 후 가능합니다." />
									</c:if>
									<c:if test="${clubList.clubFee > 0}">
										<input type="button" id="extendBtn" value="연장하기"
										title="모임 연장은 모임의 70% 진행 후 가능합니다." 
										onclick="alert('모임 연장은 무료 모임에서만 가능합니다. \n유료모임의 경우 다시 모임을 개설해주세요!')" />
									</c:if>
								</c:if>
								<c:if test="${clubList.progressBar < 70}">
									<input type="button" id="extendBtn" value="연장하기"
										title="모임 연장은 모임의 70% 진행 후 가능합니다."
										onclick="alert('모임 연장은 모임의 70% 진행 후 가능합니다.')" />
								</c:if>
							</div>
						</div>
						<!-- 모달 시작 -->
						<div class="modal fade" id="myModal${clubList.clubNum}"
							role="dialog">
							<!-- 사용자 지정 부분① : id명 -->
							<div class="modal-dialog">
								<!-- Modal content-->
								<div class="modal-content">
									<div class="modal-header">
										<button type="button" class="close" data-dismiss="modal">×</button>
										<h2 style="margin-top: 3%;">모임이 즐거우셨군요!</h2>
										<!-- 사용자 지정 부분② : 타이틀 -->
										<p id="blank">좋은 멤버들과 함께 하는 모임 이대로 끝내긴 아쉽죠..!</p>
										<p>기간 연장으로 모임을 지속해보세요💖</p>
									</div>
									<form action="extendDate" method="post">
										<div class="modal-body">
											<div style="padding-bottom: 3%;">
												<p>
													<span class="textStyle">모임기간</span>
												</p>
												<!-- 사용자 지정 부분③ : 텍스트 메시지 -->
												<p>${clubList.clubStartDate}~ ${clubList.clubEndDate}</p>
											</div>
											<div>
												<input type="hidden" name="clubNum"value="${clubList.clubNum}"></input> 
												<input type="hidden" name="clubEndDate" value="${clubList.clubEndDate}"></input>
												<p>
													<span class="textStyle"> 원하시는 기간을 선택해주신 후 연장하기 버튼을
														클릭해주세요! <br>클릭 시 바로 모임 연장이 됩니다!
													</span>
												</p>
												<input type="radio" name="weeks" checked="checked" value="7" />1
												week <input type="radio" name="weeks" value="14" /> 2 week
												<input type="radio" name="weeks" value="21" /> 3 week <input
													type="radio" name="weeks" value="28" /> 4 week
											</div>
											<div id="infoText" style="margin-bottom: -50px;">
												<p>모임연장은 모임이 70% 진행된 이후에 가능하며, 연장 후에는 날짜를 다시 되돌릴 수 없습니다.</p>
											</div>
										</div>
										<div class="modal-footer">
										
											<button type="submit" class="btn btn-default">연장하기</button>
											<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
										</div>
									</form>
								</div>
							</div>
						</div>
						<!-- 모달 끝 -->
					</c:forEach>
				</c:if>
			</div>
		</div>
		<br> <br>

		<!-- 참여중인 모임 -->
		<div class="row-middle">
			<div class="open-plus">
				참여중인 모임
				<c:if test="${empty selectAttendClubList }">
					<div class="col-md-10" id="clubBar">
						<div id="ff">
							<p style="font-size: 15px; text-align: center; margin-top: 50px;">현재
								참여중인 모임이 없습니다.</p>
							<p style="font-size: 15px; text-align: center;">이루고자하는 목표를
								더하기 멤버들과 함께 이뤄보세요.🦝🐷🐔🐸🐾</p>
						</div>
					</div>
				</c:if>
				<c:if test="${selectAttendClubList !=null || selectAttendClubList != '' }">
					<c:forEach var="attendList" items="${selectAttendClubList }">
						<fmt:formatDate value="${now}" pattern="yyyy-MM-dd HH:mm:ss" var="today" />
						<div class="col-md-10" id="clubBar">
							<div id="openClubPic">
								<a href="getCommunity?clubNum=${attendList.clubNum}">
								<img  src="${path}/resources${attendList.clubMain_pic}" title="커뮤니티입장 GOGO~!"
     								  onerror="this.onerror=null; this.src='${path}/resources/img/goal.PNG'" style="width: 80%"/>
								</a>
							</div>
							<div id="openClubProgress">
								<h3 id="clubName" ><a href="getClub?clubNum=${attendList.clubNum}" title="모임상세페이지 GOGO~!">${attendList.clubName}   </a>
									<c:if test="${attendList.clubFee > 0}"><span class="badge badge-danger">유료</span></c:if>
									<c:if test="${attendList.clubFee == 0}"><span class="badge badge-secondary">무료</span></c:if>
								

									<c:if test="${attendList.clubStartDate > today}"><span class="badge badge-warning">모임시작 전</span></c:if>
								</h3>
								<div class="w3-light-grey w3-round-large">
									<div class="w3-container w3-blue w3-round-large"
										style="width: ${attendList.progressBar}%" id="progressBar">${attendList.progressBar}%</div>
								</div>
							</div>
							<div id="openClubBtn">
									<input type="button" id="outBtn" data-toggle="modal" data-target="#refundOptionTwo${attendList.clubNum}" value="모임나가기" />
							</div>
						</div>
						
						
					
						<!-- 모달 시작 -->
						<div class="modal fade" id="refundOptionTwo${attendList.clubNum}" role="dialog">
							<!-- 사용자 지정 부분① : id명 -->
							<div class="modal-dialog">
								<!-- Modal content-->
								<div class="modal-content">
									<div class="modal-header">
										<button type="button" class="close" data-dismiss="modal">×</button>
										<h2 style="margin-top: 3%;">모임에서 나가고 싶으시군요!</h2>
										<h6 style="margin-top: 3%; font-weight:bold"">아래 주의사항을 자세히 읽어주세요💌</h6>
										<!-- 사용자 지정 부분② : 타이틀 -->
									</div>
										<div class="modal-body">
											<div style="padding-bottom: 3%;">
												<br>
												<p style="margin-bottom:4%;"><span class="textStyle">모임 취소 시 주의사항</span></p>
												<br>
												<h6 >🔹  모임등록 시 포인트 결제가 이루어졌다면 꼭 충분히 숙지해주세요!</h6>
												<h6 >🔹  이미 시작된 모임은 모임 등록 시 결제한 포인트가 환불되지 않습니다ㅜㅅㅜ</h6>
												<h6 >🔹  본인 부주의로 인한 모임취소의 책임은 본인에게 있습니다.</h6>
											</div>
											<div id="infoText" style="margin-bottom: -50px;">
												<p>아직 모임이 시작하지 않은 모임이라면 포인트 환불이 가능합니다! </p>
											</div>
										</div>
										<div class="modal-footer">
											<button type="button" class="btn btn-default" onclick="clubOut('${attendList.clubNum}', '${attendList.clubLeader}')">모임나가기</button>
											<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
										</div>
								</div>
							</div>
						</div>
						<!-- 모달 끝 -->
					</c:forEach>
				</c:if>
			</div>
		</div><br> <br>
		
		<!-- 종료된 모임 -->
		<div class="row-middle">
			<div class="open-plus">
				종료된 모임
				<c:if test="${empty finishList }">
					<div class="col-md-10" id="clubBar">
						<div id="ff">
							<p style="font-size: 15px; text-align: center; margin-top: 50px;">
							현재 종료된 모임이 없습니다.</p>
							<p style="font-size: 15px; text-align: center;">이루고자하는 목표를
								더하기 멤버들과 함께 이뤄보세요.🦝🐷🐔🐸🐾</p>
						</div>
					</div>
				</c:if>
				<c:if test="${finishList !=null || finishList != '' }">
					<c:forEach var="finishClub" items="${finishList}">
						<fmt:formatDate value="${now}" pattern="yyyy-MM-dd HH:mm:ss" var="today" />
						<div class="col-md-10" id="clubBar">
							<div id="openClubPic">
								<!-- <img src="${path}/resources/img/다이어트.PNG" width="80%" height="80%" title="커뮤니티입장 GOGO~!" />-->
								<img  src="${path}/resources${finishClub.clubMain_pic}" title="커뮤니티입장 GOGO~!" 
     								  onerror="this.onerror=null; this.src='${path}/resources/img/goal.PNG'" style="width: 80%"/>
							</div>
							<div id="openClubProgress">
								<h3 id="clubName" ><a href="getClub?clubNum=${finishClub.clubNum}" title="모임상세페이지 GOGO~!">${finishClub.clubName}   </a>
									<c:if test="${finishClub.clubFee > 0}"><span class="badge badge-danger">유료</span></c:if>
									<c:if test="${finishClub.clubFee == 0}"><span class="badge badge-secondary">무료</span></c:if>
									<span class="badge badge-warning">종료된 모임</span>
								</h3>
								<div class="w3-light-grey w3-round-large">
									<div class="w3-container w3-blue w3-round-large" 
										style="width: 100%; background-color: #eee !important;" id="progressBar" >종료된 모임</div>
								</div>
							</div>
							<div id="openClubBtn">
									<input type="button" id="outBtn" onclick="location.href='getClub?clubNum=${finishClub.clubNum}'" value="상세페이지" />
							</div>
						</div>
					</c:forEach>
				</c:if>
			</div>
		</div>		
		<br><br>
	</div>

<!-- <script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script> -->
<script>
function clubOut(clubNum, clubLeader) {
	$.ajax({
		url : 'outClub',
		type : 'post',
		data : {'clubNum' : clubNum, 
				'clubLeader' : clubLeader	
		},
		success : function(result) {
			console.log(result);
			alert(result);
			location.reload();
		},
		error : function() {
			alert("error");
		}
	});
	
};
/*20210416 주석처리 , 안하면 나가기 안됨*/
/* if(${msgs} != null){
	alert('${msg}'');
} */
</script>
</body>
</html>