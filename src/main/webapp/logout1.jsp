<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>logout1</title>
</head>
<body>
<%
session.removeAttribute("account");
//response.sendRedirect("AdminHome.jsp");  Hoặc 
response.sendRedirect("login.jsp");
%>

</body>
</html>
