package com.shuoshuren.web;

import com.google.gson.Gson;
import com.shuoshuren.entity.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "/jsonp")
public class JsonpServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String method = request.getParameter("method");

        User user = new User(1,"feng","江西");
        String json = new Gson().toJson(user);

        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset:UTF-8");

        PrintWriter printWriter = response.getWriter();
        printWriter.print(method + "(" + json + ")");
        printWriter.flush();
        printWriter.close();
    }
}
