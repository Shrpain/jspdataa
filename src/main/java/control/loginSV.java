package control;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import modal.Admin;
import bo.giohangbo; // Import giohangbo

import java.io.IOException;

import dal.dao;

@WebServlet("/loginSV")
public class loginSV extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public loginSV() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("login.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String u = request.getParameter("username");
        String p = request.getParameter("password");
        dao d = new dao();
        Admin a = d.Check(u, p);
        HttpSession ss = request.getSession();
        
        if (a == null) {
            request.setAttribute("error", "Tài khoản hoặc mật khẩu không đúng");
            request.getRequestDispatcher("login.jsp").forward(request, response);
        } else {
        	// Khởi tạo giỏ hàng cho tài khoản
            a.setGioHang(new giohangbo());
            // Lưu tài khoản vào phiên làm việc
            ss.setAttribute("account", a);
            request.setAttribute("username", u);
            
            if (a.getRole() == 1) {
                request.getRequestDispatcher("AdminHome.jsp").forward(request, response);
            } else {
                request.getRequestDispatcher("UserHome.jsp").forward(request, response);
            }
        }
    }
}
