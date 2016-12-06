package com.shuoshuren.web;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet("/ajax")
public class AjaxServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        //设置响应内容(纯字符串)
//        response.setContentType("text/plain;charset=UTF-8");
        String age = request.getParameter("age");
        String name = request.getParameter("name");
//        name = new String(name.getBytes("ISO8859-1"),"UTF-8");
        System.out.println(name + "->" +age);

        PrintWriter pw = response.getWriter();
        if("feng".equals(name)) {
            pw.print("不能用");
        } else {
            pw.print("能用");
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name = request.getParameter("name");
        name = new String(name.getBytes("ISO8859-1"),"UTF-8");
        System.out.println("lalalalalalla" + name);
    }
}
