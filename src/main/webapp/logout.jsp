<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>logout</title>
</head>
<body>
<%
session.removeAttribute("account");
response.sendRedirect("login.jsp"); // Hoặc response.sendRedirect("UserHome.jsp");
%>

</body>
</html>
