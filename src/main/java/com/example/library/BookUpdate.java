package com.example.library;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.HashMap;


@WebServlet("/book-update")
public class BookUpdate extends HttpServlet {

    HashMap<Long, Book> books = new HashMap<>();

    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("text/html;charset=UTF-8");
        PrintWriter out = resp.getWriter();
        books = (HashMap<Long, Book>) req.getAttribute("books");


        Long key = Long.parseLong(req.getParameter("key"));
        String name = req.getParameter("bookName1");
        String author = req.getParameter("author1");
        String publishDate = req.getParameter("publishDate1");

        if(name == null || author == null || publishDate == null){
            out.println("<h3>값을 잘못 입력 하셨습니다.</h3>");
            out.println("<br>\n" +
                    "<a href=\"bookUpdate.html\">다시 책 입력하기</a>");
        }else {
            Book b = new Book(name, author, LocalDate.parse(publishDate));
            books.put(key, b);
            req.setAttribute("books", books);
            req.getRequestDispatcher("/index.jsp").forward(req, resp);
        }
    }
}
