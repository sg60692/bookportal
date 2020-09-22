/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.servlets;

import com.dao.userdao;
import com.entities.user;
import com.helper.connectionprovider;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;
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
public class loginServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Preprocess request: we actually don't need to do any business stuff, so just display JSP.
        request.getRequestDispatcher("login.jsp").forward(request, response);
    }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {            
            String username=request.getParameter("username");
            String password=request.getParameter("password");
            userdao dao=new userdao(connectionprovider.getconnection());
            user u=dao.getUserEmail(username, password);
            String message;
            Map<String, String> messages = new HashMap<String, String>();
            request.setAttribute("messages", messages);
            if(u==null)
            {
                messages.put("error","Invalid credentials");
                request.getRequestDispatcher("login.jsp").forward(request, response);
            }
            else
            {
                messages.put("error","");
                HttpSession usersession=request.getSession();
                usersession.setAttribute("currentuser", u);
                request.getRequestDispatcher("login.jsp").forward(request, response);
            }
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
    }
}
