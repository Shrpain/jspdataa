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
<title>Trang UserHome</title>
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
                            <%
                            for (loaibean l : lbo.getloai()) {
                            %>
                            <li>
                                <a class="dropdown-item"
                                    href="AdminHome.jsp?ml=<%=l.getMaloai()%>"> <%=l.getMaloai()%></a>
                            </li>
                            <%
                            }
                            %>
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
                    </form>
                    <ul class="nav navbar-nav navbar-right">
                        <%
                        if (session.getAttribute("account") != null) {
                            Admin account = (Admin) session.getAttribute("account");
                            // Lấy thông tin tài khoản từ session
                            String username = account.getUsername();
                            int role = account.getRole();
                            // Sử dụng thông tin tài khoản theo cách bạn cần ở đây
                            %>
                            <li><a class="nav-link" href="#"><span
                                class="glyphicon glyphicon-user"></span><%= username %></a></li>
                            <li><a class="nav-link" href="logout.jsp"><span
                                class="glyphicon glyphicon-log-out"></span> Đăng xuất</a></li>
                            <%
                        } else {
                            %>
                            <li><a class="nav-link" href="login.jsp"><span
                                class="glyphicon glyphicon-log-in"></span> Đăng nhập</a></li>
                            <li><a class="nav-link" href="logout1.jsp"><span
                                class="glyphicon glyphicon-user"></span> Đăng ký</a></li>
                            <%
                        }
                        %>
                        </ul>
                        </div>
                    </div>
                </nav>

                <table class="table">
                    <tr>
                        <td width="200" valign="top">
                            <!-- <table class="table table-hover">
                            <%
                            for (loaibean l : lbo.getloai()) {
                            %>
                            <tr>
                                <td><a href="AdminHome.jsp?ml=<%=l.getMaloai()%>"> <%=l.getMaloai()%></a></td>
                            </tr>
                            <%
                            }
                            %>
                            </table> -->
                        </td>
                        <td width="600" valign="top">
                            <table class="table">
                                <%
                                ArrayList<sachbean> ds = sbo.getsach();
                                request.setCharacterEncoding("utf-8");
                                response.setCharacterEncoding("utf-8");
                                String ml = request.getParameter("ml");
                                String key = request.getParameter("txttk");
                                if (ml != null)
                                    ds = sbo.TimMa(ml);
                                else if (key != null)
                                    ds = sbo.Tim(key);
                                int n = ds.size();
                                for (int i = 0; i < n; i++) {
                                    sachbean s = ds.get(i);
                                %>
                                <tr>
                                    <td><a
                                        href="#?ms=<%=s.getMasach()%>&ts=<%=s.getTensach()%>&gia=<%=s.getGia()%>&tg=<%=s.getTacgia()%>&anh=<%=s.getAnh()%>&sl=<%=s.getSoluong()%>"
                                        class="text-decoration-none"> <img alt="sach"
                                            src="<%=s.getAnh()%>" width="200px" height="250px"> <br>
                                            <strong>Tên sách:<%=s.getTensach()%></strong> <br></a> <strong>Tác
                                            giả:<%=s.getTacgia()%></strong> <br> <strong>Giá:<%=s.getGia()%>vnd
                                    </strong> <br> <strong>Số lượng sách:<%=s.getSoluong()%></strong> <br>
                                        <a
                                        href="GioHang.jsp?ms=<%=s.getMasach()%>&ts=<%=s.getTensach()%>&gia=<%=s.getGia()%>&tg=<%=s.getTacgia()%>&anh=<%=s.getAnh()%>">
                                            <button type="button" class="btn btn-success">Đặt hàng</button>
                                    </a></td>
                                    <%
                                    i++;
                                    if (i < n) {
                                        s = ds.get(i);
                                    %>
                                    <td><a
                                        href="#?ms=<%=s.getMasach()%>&ts=<%=s.getTensach()%>&gia=<%=s.getGia()%>&tg=<%=s.getTacgia()%>&anh=<%=s.getAnh()%>&sl=<%=s.getSoluong()%>"
                                        class="text-decoration-none"> <img alt="sach"
                                            src="<%=s.getAnh()%>" width="200px" height="250px"> <br>
                                            <strong>Tên sách:<%=s.getTensach()%></strong> <br></a> <strong>Tác
                                            giả:<%=s.getTacgia()%></strong> <br> <strong>Giá:<%=s.getGia()%>vnd
                                    </strong> <br> <strong>Số lượng sách:<%=s.getSoluong()%></strong> <br>
                                        <a
                                        href="GioHang.jsp?ms=<%=s.getMasach()%>&ts=<%=s.getTensach()%>&gia=<%=s.getGia()%>&tg=<%=s.getTacgia()%>&anh=<%=s.getAnh()%>">
                                            <button type="button" class="btn btn-success">Đặt hàng</button>
                                    </a></td>
                                    <%
                                    i++;
                                    if (i < n) {
                                        s = ds.get(i);
                                    %>
                                    <td><a
                                        href="#?ms=<%=s.getMasach()%>&ts=<%=s.getTensach()%>&gia=<%=s.getGia()%>&tg=<%=s.getTacgia()%>&anh=<%=s.getAnh()%>&sl=<%=s.getSoluong()%>"
                                        class="text-decoration-none"> <img alt="sach"
                                            src="<%=s.getAnh()%>" width="200px" height="250px"> <br>
                                            <strong>Tên sách:<%=s.getTensach()%></strong> <br></a> <strong>Tác
                                            giả:<%=s.getTacgia()%></strong> <br> <strong>Giá:<%=s.getGia()%>vnd
                                    </strong> <br> <strong>Số lượng sách:<%=s.getSoluong()%></strong> <br>
                                        <a
                                        href="GioHang.jsp?ms=<%=s.getMasach()%>&ts=<%=s.getTensach()%>&gia=<%=s.getGia()%>&tg=<%=s.getTacgia()%>&anh=<%=s.getAnh()%>">
                                            <button type="button" class="btn btn-success">Đặt hàng</button>
                                    </a></td>

                                </tr>
                                <%
                                }
                                }
                                %>
                                <%
                                }
                                %>
                            </table>
                        </td>
                        <td></td>
                    </tr>
                </table>
</body>
</html>
