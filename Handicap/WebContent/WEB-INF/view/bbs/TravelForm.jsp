<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" media="all"
	href="/Handicap/css/main.css">
<link rel="stylesheet" type="text/css" media="all"
	href="/Handicap/css/new.css">
<link rel="stylesheet" type="text/css" media="all"
	href="/Handicap/css/styles.css">
<title>게시판_여행</title>
</head>
<body>
	<div id="CssWrapper" align="center">
		<%@include file="../top.jsp"%>


		<div  align="center">
			<%@include file="../menu.jsp"%>
		</div>
		<!-- center 끝 -->
			<div id="CssContents">
	<table  align="left">
			<tr>
				<td width="100px" align="center">
				
						<%@include file="BbsSubMenu.jsp"%>
					
				</td>
				<td>
						<%@include file="Talbum.jsp"%>
				</td>
			</tr>
		</table>
		</div>
		<%@include file ="../Footer.jsp" %>
		
		
		<%-- <div id="sidebar" align="right">
			<%@include file="../banner.jsp"%>


		</div>
 --%>
	</div>  <!-- 전체 wapper -->
</body>
</html>


