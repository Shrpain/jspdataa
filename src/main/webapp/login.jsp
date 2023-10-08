<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
    <h1>login form</h1>
    
    <form action="loginSV" method="post">
        <h2 style="color: <%= (request.getAttribute("error") == null) ? "transparent" : "red" %>"><%= request.getAttribute("error") %></h2>
        username : <input type="text" name="username"><br>
        password : <input type="text" name="password"><br>
        <input type="submit" value="Đăng nhập">
    </form>
</body>
</html>
