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
String pname = request.getParameter("pname");
String pposition = request.getParameter("pposition");
String pdate = request.getParameter("pdate");
String pgrade = request.getParameter("pgrade");

//String query ="delete from giants_player where pid="+pid ;
//String query = "update giants_player set pname ="+pname +" where pid =" + pid;
//String query = String.format("update giants_player set pname = '%s',pposition = '%s',pdate = '%s',pgrade = '%s' where pid = %d",pname,pposition,pdate,pgrade, Integer.parseInt(pid));
String query = String.format("insert into giants_player values(%d,'%s','%s','%s','%s')",Integer.parseInt(pid),pname,pposition,pdate,pgrade);

PreparedStatement pstmt = con.prepareStatement(query);
pstmt.executeUpdate(query);
//insert into giants_player values(1006,'유강남', '포수', '20230228', 'A');
 %>
<jsp:forward page="list.jsp"></jsp:forward>
</body>
</html>