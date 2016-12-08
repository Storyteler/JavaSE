package com.shuoshuren.web;

import com.google.gson.Gson;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;

@WebServlet("/login")
public class Login extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        String username = req.getParameter("username");
        String password = req.getParameter("password");
        resp.setCharacterEncoding("UTF-8");
        resp.setContentType("application/json;charest:UTF-8");

        Map result = new HashMap();

        if("feng".equals(username) && "123".equals(password)) {
            result.put("state","success");
        } else {
            result.put("state","error");
        }

        String json = new Gson().toJson(result);

        PrintWriter pw = resp.getWriter();
        pw.print(json);
        pw.flush();
        pw.close();
    }
}
