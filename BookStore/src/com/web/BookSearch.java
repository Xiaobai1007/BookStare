package com.web;


import com.dao.BookDAO;
import com.dao.BookInMemoryDAO;
import com.entity.Book;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/book/q")
public class BookSearch extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setCharacterEncoding("utf-8");
        resp.setContentType("text/html;charset=utf-8");

        String condition = req.getParameter("condition");

        BookDAO bookDAO = new BookInMemoryDAO();
        List<Book> books = ((BookInMemoryDAO) bookDAO).listAll2(condition);

        req.setAttribute("books", books);

        req.getSession().setAttribute("msg", "当前查询条件为:[" + condition + "]");

        req.getRequestDispatcher("/jsp/book_list.jsp").include(req, resp);
    }
}
