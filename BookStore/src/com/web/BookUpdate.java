package com.web;

import com.dao.BookDAO;
import com.dao.BookInMemoryDAO;
import com.entity.Book;
import com.util.JsonUtils;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;


@WebServlet("/book/update")
public class BookUpdate extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setCharacterEncoding("utf-8");
        resp.setContentType("application/json;charset=utf-8");
        req.setCharacterEncoding("utf-8");
        int id = Integer.parseInt(req.getParameter("id"));
        BookDAO bookDAO = new BookInMemoryDAO();
        Book book = bookDAO.getBookById(id);
        String result = JsonUtils.toJson(book);
        resp.getWriter().println(result);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setCharacterEncoding("utf-8");
        resp.setContentType("application/json;charset=utf-8");
        req.setCharacterEncoding("utf-8");

        int id = Integer.parseInt(req.getParameter("id"));
        String name = req.getParameter("name");
        float price = Float.parseFloat(req.getParameter("price"));
        String author = req.getParameter("author");
        String press = req.getParameter("press");

        Book book = new Book(id, name, price, author, press);

        BookDAO bookDAO = new BookInMemoryDAO();
        if(bookDAO.update(book)){
            resp.getWriter().print("{\"msg\":\"修改成功\"}");
        }else{
            resp.getWriter().print("{\"msg\":\"修改失败\"}");
        }
    }
}
