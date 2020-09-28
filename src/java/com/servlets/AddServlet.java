/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.servlets;

import com.dao.bookdao;
import com.entities.book;
import com.entities.user;
import com.helper.connectionprovider;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author sarthak
 */
@MultipartConfig
public class AddServlet extends HttpServlet {
  public void doGet(HttpServletRequest request, HttpServletResponse response)
  throws ServletException, IOException {
    doPost(request, response);
  }

  public void doPost(HttpServletRequest request, HttpServletResponse response)
  throws ServletException, IOException {
    HttpSession s=request.getSession(false);
    PrintWriter out = response.getWriter();
    user U=(user)s.getAttribute("currentuser");
    if(U==null)
    {
        out.print("1");
        return;
    }
    String name = request.getParameter("name");
    String author= request.getParameter("author");
    String link= request.getParameter("link");
    book B=new book(name,author,link);
    bookdao dao=new bookdao(connectionprovider.getconnection());    
    if(dao.saveub(B, U))
    {
        out.print("2");
    }
    else
    {
        out.print("3");
    }
  }
}
