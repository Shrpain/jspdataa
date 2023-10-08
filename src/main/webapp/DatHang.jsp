<%@page import="bean.giohangbean"%>
<%@page import="bo.giohangbo"%>
<%@page import="modal.Admin"%>
<%@page import="java.util.ArrayList"%>
<%@page import="bean.sachbean"%>
<%@page import="bean.loaibean"%>
<%@page import="bo.sachbo"%>
<%@page import="bo.loaibo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Trang Đặt Hàng</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"></script>
<link rel="stylesheet" href="css/AdminHome.css">
<%
loaibo lbo = new loaibo();
sachbo sbo = new sachbo();
%>
</head>
<body>

	<nav class="navbar navbar-expand-lg bg-body-tertiary">
		<div class="container-fluid">
			<a class="navbar-brand" href="#"> <img src="/test1/img/logo.jpg"
				class="rounded-circle" alt="Logo" width="40" height="35"
				class="d-inline-block align-text-top">

			</a>
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
				aria-controls="navbarSupportedContent" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarSupportedContent">
				<ul class="navbar-nav me-auto mb-2 mb-lg-0">
					<li class="nav-item"><a class="nav-link active"
						aria-current="page" href="#">Trang Chủ</a></li>
					<li class="nav-item"><a class="nav-link" href="#">Giỏ Hàng
					</a></li>
					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" href="#" role="button"
						data-bs-toggle="dropdown" aria-expanded="false"> Thư Viện </a>
						<ul class="dropdown-menu">
							<!--  <li><a class="dropdown-item" href="#">Công Nghệ Thông tin</a></li>
                  <li><a class="dropdown-item" href="#">Toán Ứng Dụng</a></li>
                  <li><a class="dropdown-item" href="#">Vậy Lý Hữu Cơ</a></li>
                  <li><a class="dropdown-item" href="#">Hóa Hữu Cơ</a></li>
                  <li><hr class="dropdown-divider"></li>
                  <li><a class="dropdown-item" href="#">Quản Lý Đơn Hàng</a></li>-->
							<li>
								<%
                for (loaibean l : lbo.getloai()) {
                %>
								<tr>
									<td><a class="dropdown-item"
										href="AdminHome.jsp?ml=<%=l.getMaloai()%>"> <%=l.getMaloai()%></a></td>
								</tr> <%
                }
                %>
							</li>
							<li><a class="dropdown-item" href="#">Quản Lý Đơn Hàng</a></li>
						</ul>
					<li class="nav-item"><a class="nav-link" href="#"> Thanh
							Toán </a></li>
					<li class="nav-item"><a class="nav-link" href="#"> Lịch Sử
							Mua Hàng</a></li>
				</ul>
				<form action="AdminHome.jsp" method="post" class="d-flex"
					role="search">
					<input class="form-control me-2" type="text" name="txttk"
						placeholder="Search" aria-label="Search">
					<button class="btn btn-outline-success" type="submit" name="th">Search</button>

					<!--  <form action="Menu.jsp" method="post">
                <input type="text" name="txttk"><br>
                <input type="submit" name="th" value="search">-->
				</form>
				</td>
				</form>
				<ul class="nav navbar-nav navbar-right">
					<%
					if (session.getAttribute("account") != null) {
    				Admin account = (Admin) session.getAttribute("account");
    				giohangbo gbo = (giohangbo) session.getAttribute("gioHang"); // Lấy giỏ hàng từ tài khoản
    				// Lấy thông tin tài khoản từ session
    				String username = account.getUsername();
    				int role = account.getRole();
    				// Sử dụng thông tin tài khoản theo cách bạn cần ở đây
					%>
					<li><a class="nav-link" href="#"><span
        			class="glyphicon glyphicon-user"></span><%= username %></a></li>
					<%
    				if (role == 1) {
					%>
					<li><a class="nav-link" href="logout.jsp"><span
        			class="glyphicon glyphicon-log-out"></span> Đăng xuất</a></li>
					<%
    				} else if (role == 2) {
					%>
					<li><a class="nav-link" href="logout1.jsp"><span
        			class="glyphicon glyphicon-log-out"></span> Đăng xuất</a></li>
					<%
   					 }
					} else {
					%>
					<li><a class="nav-link" href="login.jsp"><span
        			class="glyphicon glyphicon-log-in"></span> Đăng nhập</a></li>
					<li><a class="nav-link" href="logout.jsp"><span
        			class="glyphicon glyphicon-user"></span> Đăng ký</a></li>
					<%}%>
				</ul>
			</div>
		</div>
	</nav>
	<table class="table">
		<tr>
			<td width="200" valign="top">
				<table class="table table-hover">
					<%
                for (loaibean l : lbo.getloai()) {
                %>
					<tr>
						<td><a href="AdminHome.jsp?ml=<%=l.getMaloai()%>"> <%=l.getMaloai()%></a></td>
					</tr>
					<%
                }
                %>
				</table>
			</td>
			<td width="600" valign="top">
				<form method="post" action="xoa.jsp">
					<table class="table">
						<table class="table table-bordered">
							<thead>
								<tr>
									<th></th>
									<th>Mã Sách</th>
									<th>Hình Ảnh</th>
									<th>Tên Sách</th>
									<th>Tác Giả</th>
									<th>Giá</th>
									<th>Số Lượng</th>
									<th>Thành Tiền</th>
									<th></th>

								</tr>
							</thead>
							<tbody>
								<%
				if (session.getAttribute("gh") != null) {
					giohangbo gbo = (giohangbo) session.getAttribute("gh");
					int n = gbo.ds.size();
				for (int i = 0; i < n; i++) {
					giohangbean g = gbo.ds.get(i);
				%>
								<tr>

									<td><input type="checkbox" name="itemToDelete"
										value="<%= i %>"></td>
									<td><%= g.getMasach() %></td>
									<td><img src="<%=g.getAnh() %>" alt="Sap"
										style="width: 150px; height: 150px;"></td>
									<td><%= g.getTensach() %></td>
									<td><%= g.getTacgia() %></td>
									<td><%= g.getGia() %> VNĐ</td>
									<td><a href="xoa.jsp?tru=t&ms1=<%=g.getMasach()%>"><button
												type="button" class="btn warning" name="tru">-</button></a> <input
										type="text" name="txtsl" style="width: 40px;" id=""
										value="<%=g.getSoluong() %>"> <a
										href="xoa.jsp?cong=c&ms1=<%=g.getMasach()%>"><button
												type="button" class="btn warning" name="cong">+</button></a></td>


									<td><%= g.getThanhtien() %> VNĐ</td>
									<!--   <td><a href="XoaSach.jsp?msach=<%= g.getMasach() %>">Xóa</a></td>-->
								</tr>
								<%
								}
								%>

							</tbody>
						</table>
						<input type="submit" name="deleteSelected"
							value="Xóa Mặt Hàng Đã Chọn">
						<input type="submit" name="deleteAll" value="Xóa Tất Cả">

						<!-- Thêm nút để thanh toán hoặc tiếp tục mua sắm -->
						<div class="text-right">
							<h4>
								Tổng Tiền: =<%=gbo.Tongtien()%>
							</h4>
							<a href="ThanhToan.jsp" class="btn btn-success">Thanh Toán</a> <a
								href="Menu.jsp" class="btn btn-primary">Tiếp Tục Mua Sắm</a>
						</div>
						<%
						}
						%>
					</table>
				</form>
			</td>
			
		</tr>
	</table>
</body>
</html>