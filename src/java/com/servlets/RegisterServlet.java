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
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author sarthak
 */
@MultipartConfig
public class RegisterServlet extends HttpServlet {
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            String fname=request.getParameter("user_first_name");
            String lname=request.getParameter("user_last_name");
            String name=fname+" "+lname;
            String gender=request.getParameter("user_gender");
            String username=request.getParameter("user_username");
            String password=request.getParameter("user_password");
            String email=request.getParameter("user_email");
            String phone=request.getParameter("user_phone");
            user U=new user(name,gender,email,password,username,phone);
            userdao dao=new userdao(connectionprovider.getconnection());  
            if((name.length()==1)||(username.length()==0)||(password.length()==0)||(email.length()==0)||(phone.length()==0))
            {
                out.println("1");
            }
            else if(phone.length()!=10)
            {
                out.println("2");
            }
            else if(dao.saveuser(U))
            {
                out.println("4");
            }
            else
            {
                out.println("3");
            }
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}