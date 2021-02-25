package com.mvc.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.mvc.bean.LoginBean;
import com.mvc.dao.LoginDao;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {
	
    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private LoginDao loginDao;
    
    public void init() {
        loginDao = new LoginDao();
    }
    
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    	    throws ServletException, IOException {
    	request.getRequestDispatcher("Login/Login.jsp").forward(request, response);
    }
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    	    throws ServletException, IOException {

    			PrintWriter out=response.getWriter();
    	        String username = request.getParameter("username");
    	        String password = request.getParameter("password");
    	        LoginBean loginBean = new LoginBean();
    	        loginBean.setUsername(username);
    	        loginBean.setPassword(password);

    	        if (loginDao.loginUser(loginBean)) {
				    HttpSession session = request.getSession();
				    session.setAttribute("username",username);
    	        	request.getRequestDispatcher("Todo/todo-list.jsp").forward(request, response);
				} else {
					
					request.getRequestDispatcher("Login/Login.jsp").include(request, response);;
					out.println("<center><p>Sorry, username or password incorrect!</p></center>");
				}
    	    }
}
