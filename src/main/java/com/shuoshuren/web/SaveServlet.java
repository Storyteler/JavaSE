package com.shuoshuren.web;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/save")
public class SaveServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        request.setCharacterEncoding("UTF-8");
        String name = request.getParameter("name");
        String address = request.getParameter("address");

//        address = new String(address.getBytes("UTF-8"),"ISO8859-1");
        System.out.println(name + " -> " + address);



    }
}