package com.shuoshuren.web;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet("/checkEmail")
public class CheckEmailServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String email = request.getParameter("email");
        PrintWriter pw = response.getWriter();
        if("feng@123.com".equals(email)) {
            pw.print("false");
        } else {
            pw.print("true");
        }
        pw.flush();
        pw.close();
    }

}
