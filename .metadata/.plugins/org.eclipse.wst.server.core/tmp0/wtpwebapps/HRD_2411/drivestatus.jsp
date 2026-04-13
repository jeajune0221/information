<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@include file = "db_connect.jsp" %>
    <%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="style.css" rel = "stylesheet"/>
</head>
<body>
<jsp:include page="header.jsp"></jsp:include>
<section>
<form style =" display : flex; text-align: center; justify-content : center; align-items :center ;">
	<table border = "1">
		<tr>
			<td>부서코드</td>
			<td>부서명</td>
			<td>총운행거리</td>
			<td>총주유금액</td>
		</tr>
		<%
		request.setCharacterEncoding("UTF-8");
		try{
			String query = "select E.DEPT_CODE,E.DEPT_NAME,sum(R.DRV_END-R.DRV_START),sum(R.DRV_MONEY) from TBL_DEPT E JOIN TBL_DRIVE R on E.DEPT_CODE = R.DEPT_CODE group by E.DEPT_CODE,E.DEPT_NAME";
			PreparedStatement pstmt = con.prepareStatement(query);
			ResultSet rs = pstmt.executeQuery(query);
			
			
			while(rs.next()){
				%>
				<tr>
					<td>
					<%= rs.getString(1)%>
					</td>
					<td><%= rs.getString(2)%></td>
					<td><%= rs.getInt(3)%></td>
					<td>=<%=rs.getInt(4) %></td>
				
				</tr>
				<%
			}
			
		}catch(Exception e){
			
		}
		
		
		%>
		
	
	</table>
</form>
</section>
<jsp:include page="footer.jsp"></jsp:include>

</body>
</html>