package com.shuoshuren.web;

import org.apache.commons.io.IOUtils;
import org.apache.http.HttpResponse;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClients;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;

@WebServlet("/dict")
public class DictServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String query = request.getParameter("query");
        CloseableHttpClient httpClient = HttpClients.createDefault();
        HttpGet httpGet = new HttpGet("http://fanyi.youdao.com/openapi.do?keyfrom=kaishengit&key=1587754017&type=data&doctype=json&version=1.1&q=" + query);
        HttpResponse httpResponse = httpClient.execute(httpGet);
        InputStream inputStream = httpResponse.getEntity().getContent();
        response.setCharacterEncoding("UTF-8");
        response.setContentType("application/json;charest=UTF-8");
        String result = IOUtils.toString(inputStream);
        PrintWriter pw = response.getWriter();
        pw.print(result);
        pw.flush();
        pw.close();
    }
}
