package com.kukuzjka.service;

import com.kukuzjka.dao.BookDAO;
import com.kukuzjka.entity.Book;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import javax.transaction.Transactional;
import java.util.List;
import java.util.stream.Collectors;

@Service
@Transactional
public class BookServiceImpl implements BookService {

    @Autowired
    private BookDAO bookDAO;

    public int createBook(Book book) {
        return bookDAO.createBook(book);
    }

    public Book updateBook(Book book) {
        return bookDAO.updateBook(book);
    }

    public void deleteBook(int id) {
        bookDAO.deleteBook(id);
    }

    public List<Book> getAllBooks() {
        return bookDAO.getAllBooks();
    }

    public Book getBook(int id) {
        return bookDAO.getBook(id);
    }
}
