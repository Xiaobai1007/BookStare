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


@WebServlet(value = "/jsp/detail")
public class BookDetail extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int id = Integer.parseInt(req.getParameter("id"));
        BookDAO bookDAO = new BookInMemoryDAO();
        Book book = bookDAO.getBookById(id);
        req.setAttribute("book", book);
        req.getRequestDispatcher("/jsp/book_detail.jsp").forward(req, resp);
    }
}
