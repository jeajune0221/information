<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@include file = "dbconnect.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="style.css" rel ="stylesheet">
</head>

<jsp:include page ="header.jsp"></jsp:include>
<section>
<h2>롯데 자이언츠 선수 목록</h2>
<form style = "display : flex; align-items : center; justify-content : center; text-align : center">
<table border = "1">
<tr>
<td>선수번호</td>
<td>선수이름</td>
<td>선수포지션</td>
<td>선수등록일</td>
<td>선수등급</td>
<td>삭제</td>
</tr>

<%
request.setCharacterEncoding("UTF-8");
try{
	String query = "select * from giants_player";
	PreparedStatement pstmt = con.prepareStatement(query);
	ResultSet rs = pstmt.executeQuery(query);
%>
<% 
	while(rs.next()) 
	{
	String day = rs.getString(4);
	day = day.substring(0, 4) + "년" + day.substring(4,6) + "월" + day.substring(6,8) + "일";
	%>
	<tr>
	<td><a href = "update.jsp?pid=<%=rs.getInt(1) %>"><%=rs.getInt(1) %></a></td>
	<td> <%=rs.getString(2) %></td>
	<td> <%=rs.getString(3) %></td>
	<td> <%=day%></td>
	<td> <%=rs.getString(5)%></td>
	<td><a href ="action.jsp?pid=<%=rs.getInt(1) %>">삭제</a></td>
	</tr>
	<%
	}
	%>
	<%
}catch (Exception e){
	
}
%>

</table>
</form>
</section>
<jsp:include page ="footer.jsp"></jsp:include>
</body>
</html>