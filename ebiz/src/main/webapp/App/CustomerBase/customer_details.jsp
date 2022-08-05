<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ page import="dbManagement.DBUtil" %>
 <%@ page import="java.sql.ResultSet" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>This APP</title>
		
		<!-- bootstrap link-->
		<link rel="stylesheet" href="../../bootstrap/css/bootstrap.css">
	</head>
	<body>
		<h1>Customer d details</h1>
		<div class="container">
			<% 
			
				DBUtil dbutil = new DBUtil();
				String sql = "select * from customer";
				ResultSet rs = dbutil.getData(sql);
				while(rs.next()){
			%>
				<h1 class="text-dark"> User name <%=rs.getString("name") %></h1>
				<h1 class="text-light"> User gender <%=rs.getString("gender") %></h1>		
			<%
				}
				dbutil.closeConnections();
			%>
		</div>
</body>
</html>