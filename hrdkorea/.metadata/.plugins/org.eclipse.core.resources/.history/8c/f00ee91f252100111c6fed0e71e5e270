<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@include file = "dbconnect.jsp" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%request.setCharacterEncoding("UTF-8");
String pid = request.getParameter("pid");
System.out.println(pid);

String query ="delete from giants_player where pid="+pid ;
PreparedStatement pstmt = con.prepareStatement(query);
pstmt.executeUpdate(query);
 %>
<jsp:forward page="list.jsp"></jsp:forward>
</body>
</html>