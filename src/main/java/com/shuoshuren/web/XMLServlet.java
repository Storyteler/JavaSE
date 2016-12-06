package com.shuoshuren.web;

import com.shuoshuren.entity.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.lang.reflect.Array;
import java.util.Arrays;
import java.util.List;


@WebServlet("/getXml.xml")
public class XMLServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        User user1 = new User(110,"fu","江西");
        User user2 = new User(120,"ze","江苏");
        User user3 = new User(130,"fu","浙江");
        List<User> list = Arrays.asList(user1, user2, user3);

        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/xml;charset=UTF-8");

        PrintWriter pw = response.getWriter();
        pw.print("<?xml version=\"1.0\" encoding=\"UTF-8\" ?>");
        pw.print("<users>");
        for (User u : list) {
            pw.print("<user>");
            pw.print("<id>" + u.getId() + "</id>");
            pw.print("<name>" + u.getName() + "</name>");
            pw.print("<address>" + u.getAddress() + "</address>");
            pw.print("</user>");
        }
        pw.print("</users>");
        pw.flush();
        pw.close();

    }
}
