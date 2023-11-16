package com.example.library;

import javax.servlet.ServletConfig;
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

@WebServlet("/book-insert")
public class BookInsert extends HttpServlet {

//    ArrayList<Book> books = new ArrayList<>();
    HashMap<Long, Book> books = new HashMap<>();

    static long i=0;
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("text/html;charset=UTF-8");
        PrintWriter out = resp.getWriter();

        String name = req.getParameter("bookName");
        String author = req.getParameter("author");
        String publishDate = req.getParameter("publishDate");

        if(name == null || author == null || publishDate == null){
            out.println("<h3>값을 잘못 입력 하셨습니다.</h3>");
            out.println("<br>\n" +
                    "<a href=\"bookInsert.html\">다시 책 입력하기</a>");
        }
//        else {
//            Book book = new Book(i++, name, author, LocalDate.parse(publishDate));
//            books.add(book);
//            req.setAttribute("books", books);
//            req.getRequestDispatcher("/index.jsp").forward(req,resp);
//        }
        else {
            Book book = new Book( name, author, LocalDate.parse(publishDate));
            books.put(i++, book);
            req.setAttribute("books", books);
            req.getRequestDispatcher("/index.jsp").forward(req,resp);
        }

    }
}
