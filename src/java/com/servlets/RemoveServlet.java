/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.servlets;

import com.dao.bookdao;
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
public class RemoveServlet extends HttpServlet {
  public void doGet(HttpServletRequest request, HttpServletResponse response)
  throws ServletException, IOException {
    doPost(request, response);
  }

  public void doPost(HttpServletRequest request, HttpServletResponse response)
  throws ServletException, IOException {
    String name = request.getParameter("name");
    HttpSession s=request.getSession(false);
    user U=(user)s.getAttribute("currentuser");
    bookdao dao=new bookdao(connectionprovider.getconnection());
    PrintWriter out = response.getWriter();
    if(dao.delbook(U.getUsername(), name))
    {
        out.print("1");
    }
    else
    {
        out.print("0");
    }
  }
}
