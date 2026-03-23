<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@include file = "dbconnect.jsp" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href ="style.css" rel ="stylesheet">
</head>
<body>
<script type = "text/javascript" src = "check.js"></script>
<jsp:include page="header.jsp"></jsp:include>
<section>
<H2>선수 정보 수정</H2>
<form method="post" action ="update_action.jsp" name = "frm" style = "display : flex; align-items : center; justify-content : center; text-align : center">
<table border = 1>
<%
request.setCharacterEncoding("UTF-8");
String pid = request.getParameter("pid");
System.out.println(pid);
String pname ="";
String pposition ="";
String pdate ="";
String pgrade ="";
try{
	String query ="select * from giants_player where pid ="+pid ;
	PreparedStatement pstmt = con.prepareStatement(query);
	ResultSet rs = pstmt.executeQuery(query);
	rs.next();
	pname = rs.getString("pname");
	pposition = rs.getString("pposition");
	pdate = rs.getString("pdate");
	pgrade = rs.getString("pgrade");
}catch (Exception e){
	
}

 %>


<tr>
<td>선수 번호</td>
<td><input type ="text" name = "pid" value ="<%=pid%>" readonly></td>
</tr>
<tr>
<td>선수이름</td>
<td><input type ="text" name ="pname" value ="<%=pname%>"></td>
</tr>
<tr>
<td>선수포지션</td>
<td>
<select name ="pposition" style ="width : 100%">
<option value ="">포지션 선택</option>
<option value ="투수"<%if(pposition.equals("투수")) out.println("selected"); %>>투수</option>
<option value ="내야수"<%if(pposition.equals("내야수")) out.println("selected"); %>>내야수</option>
<option value ="외야수"<%if(pposition.equals("외야수")) out.println("selected"); %>>외야수</option>
<option value ="포수"<%if(pposition.equals("포수")) out.println("selected"); %>>포수</option>

</select>
</td>
</tr>
<tr>
<td>선수 등록일</td>
<td><input type="text" name ="pdate" value = <%=pdate %>></td>
</tr>
<tr>
<td>선수 등급</td>
<td><input type ="radio" name = "pgrade" value ="S" <%if(pgrade.equals("S")) out.println("checked"); %>>S
<input type ="radio" name = "pgrade" value ="A" <%if(pgrade.equals("A")) out.println("checked"); %>>A
<input type ="radio" name = "pgrade" value ="B" <%if(pgrade.equals("B")) out.println("checked"); %>>B
<input type ="radio" name = "pgrade" value ="C" <%if(pgrade.equals("C")) out.println("checked"); %>>C</td>
</tr>
<tr>
<td colspan = 2>
<input type = "submit" value ="수정" onclick ="modify()">
<input type = "reset" value ="취소" onclick = "cancel()">

</td>
</tr>

</table>
</form>
</section>
<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>