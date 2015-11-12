<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.handicap.model.beans.BbsVO"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:useBean id="MessageVO" class="com.handicap.model.beans.BbsVO"></jsp:useBean>
<link rel="stylesheet" type="text/css" media="all"
	href="/Handicap/css/main.css">
<link rel="stylesheet" type="text/css" media="all"
	href="/Handicap/css/new.css">
<link rel="stylesheet" type="text/css" media="all"
	href="/Handicap/css/styles.css">

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="/Handicap/js/jquery-1.10.2.min.js"></script>

<title>Insert title here</title>
<script type="text/javascript">
	$(document).ready(function() {
		$("#delete").click(function() { //삭제버튼
			if (confirm("정말로 삭제하시겠습니까?") == true) { // 확인
				$("#bbsContent").attr({
					action : 'bbsDelete',
					method : 'post'
				});
				$("#bbsContent").submit();
			} else {
				return; // 취소
			}
		});
		/* $("#goodupdate").click(function(){
		   if(confirm("추천하였습니다!!")==true){
		      $("#bbsNoticeContent").attr({action:'goodupdate', method:'post'});
		      $("#bbsNoticeContent").submit();
		   }
		}) */
		$("#goodupdate").click(function() {
			/*  if ($("#goodupdate")) {
			   alert("추천할꺼야?");
			} else {  */
			$.ajax({
				type : "GET",
				url : "goodupdate",
				data : goodupdate,
				success : function(data) {
					goodCk = true;
					alert("추천하였습니다!!");
				}
			});
			//}
		});
	});
</script>
</head>
<body>

	<div id="CssWrapper" align="center">
		<%@include file="../top.jsp"%>


		<div align="center">
			<%@include file="../menu.jsp"%>
		</div>
		<!-- center 끝 -->
		<div id="CssContents">
			<table align="left">
				<tr>
					<td width="100px" align="center"><%@include
							file="../new/NewSubMenu.jsp"%></td>
					<td>
						<!-- 위에 폼 인쿨루드 -->

						<form id="bbsContent" name="bbsContent">
							<table class="bbsTitle">
								<tr>
									<td align="center"><font size="15"></font></td>
								</tr>
							</table>
							<c:choose>
								<c:when test="${boardno == '32' }">
									<table class="bbsList">
										<tr>
											<td width="50px"><font size="3px"
												style="font-weight: bold;">제목 :</td>
											<td width="350px" align="left"><font size="3px"
												style="font-weight: bold;">${bbsContent.category}${bbsContent.title}</font></td>
											<td colspan="2" width="300px" align="right"><font
												size="2px">작성일 : ${bbsContent.writedate}</font></td>
										</tr>
										<tr>
											<td colspan="4" align="left"><font size="3px">작성자
													: ${bbsContent.nickname}
													&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 조회수 :
													${bbsContent.hits}
													&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 추천수 :
													${bbsContent.good}
													&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 평점 <c:choose>
														<c:when test="${bbsContent.star == '1'}">
															<img width="100" height="25"
																src="/Handicap/img/star1.png">
														</c:when>
														<c:when test="${bbsContent.star =='2'}">
															<img width="100" height="25"
																src="/Handicap/img/stat2.png">
														</c:when>
														<c:when test="${bbsContent.star == '3'}">
															<img width="100" height="25"
																src="/Handicap/img/stat3.png">
														</c:when>
														<c:when test="${bbsContent.star =='4'}">
															<img width="100" height="25"
																src="/Handicap/img/stat4.png">
														</c:when>
														<c:when test="${bbsContent.star == '5'}">
															<img width="100" height="25"
																src="/Handicap/img/stat5.png">
														</c:when>
													</c:choose>
											</font></td>
										</tr>
										<tr style="height: 300px; vertical-align: text-top;">

											<td colspan="4"><c:if test="${bbsFileName !=null }">
													<c:forEach var="bbsfile" items="${bbsFileName}">
														<img height="150px" style="width: 150px;"
															src="/Handicap/img/${bbsfile.fileoriginal}">
													</c:forEach>
												</c:if> <br>${bbsContent.contents}</td>
										</tr>
										<tr>
											<td align="left"><font size="1px">첨부파일 : </font></td>
											<td colspan="4"><c:forEach var="bbsFileName"
													items="${bbsFileName}">
													<tr>

														<td>${bbsFileName.filename}</td>

													</tr>
												</c:forEach></td>

										</tr>
									</table>
									</c:when>
			
									
		
		<c:otherwise>
			<table class="bbsList">
				<tr>
					<td width="50px"><font size="3px" style="font-weight: bold;">제목
							:</td>
					<td width="350px" align="left"><font size="3px"
						style="font-weight: bold;">${bbsContent.category}${bbsContent.region}${bbsContent.title}</font></td>
					<td colspan="2" width="300px" align="right"><font size="2px">작성일
							: ${bbsContent.writedate}</font></td>
				</tr>
				<tr>
					<td colspan="4" align="left"><font size="3px">작성자 :
							${bbsContent.nickname} &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							조회수 : ${bbsContent.hits}</font></td>
				</tr>
				<tr style="height: 300px; vertical-align: text-top;">

					<td colspan="4"><c:if test="${bbsFileName !=null }">
							<c:forEach var="bbsfile" items="${bbsFileName}">
								<img height="150px" style="width: 150px;"
									src="/Handicap/img/${bbsfile.fileoriginal}">

							</c:forEach>
						</c:if> <br>${bbsContent.contents}</td>
				</tr>
				<tr>
					<td align="left"><font size="1px">첨부파일 : </font></td>
					<td colspan="4"><c:forEach var="bbsFileName"
							items="${bbsFileName}">
							<tr>

								<td>${bbsFileName.filename}</td>

							</tr>
						</c:forEach></td>

				</tr>
			</table>
			</c:otherwise>
			</c:choose>
			<hr width="600px;">
			
			<center>
			<table width="600px;" style="border-top: 3px; border-left: 3px; border-right: 3px; border-bottom: 3px; ">
				<c:forEach var="commentList" items="${list}">
               <tr>
                  <td align="center">${commentList.nickname}</td>
                  <td align="center">${commentList.contents}</td>
               </tr>
            </c:forEach>
            <tr>
               <input type="hidden" name="pageNumber" value="${pageNumber }">
            </tr>
				<tr>
						<td colspan="2">
								댓글 이용 제한은 100자입니다.
						</td>
				</tr>
				<tr>
					<td width="700px" colspan="2">
					<input type="text" style="width: 500px; height: 50"><input type="button" value ="등록" style="width:70px; height:30px; vertical-align: bottom;"></td>
					
				</tr>
				<tr>
						<td height="20px;">
						</td>
				</tr>
				<tr>
			
					
					<td width="100px;" align="left">
						<button type="button" id="list" class ="ml-button"
							onclick="location.href='/Handicap/bbsList?boardno=${boardno}'" style="margin-bottom: 50px;">목록</button>
					</td>
					<td width="600px;" align="right">
							<c:if
							test="${boardno!=10 }">
							<button type="button" id="goodupdate" class ="ml-button">추천</button>
						</c:if>
						<c:if test="${bbsContent.nickname == membernick }">
							<button type="button" id="update" class ="ml-button"
								onclick="location.href='/Handicap/bbsUpdateForm?boardno=${bbsContent.boardno}&no=${bbsContent.no}'">수정</button>
							<button type="button" id="delete" class ="ml-button">삭제</button>
						</c:if>
					</td>
				</tr>
			</table>
			</center>
			<input type="hidden" name="no" value="${bbsContent.no }">
			<input type="hidden" name="boardno" value="${bbsContent.boardno }">
			</form>
			<!-- 아래 폼 인쿨루드 -->
			</td>

			</tr>
			</table>
	</div>
	
	
	<!-- contents 끝 -->
	<center>
	<%@include file="../Footer.jsp"%>
	</center>
	<%-- <div id="sidebar" align="right">
         <%@include file="../banner.jsp"%>
      </div>
 --%>
	</div>

	<br>


</body>
</html>