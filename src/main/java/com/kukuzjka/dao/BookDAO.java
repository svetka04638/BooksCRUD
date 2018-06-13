package com.kukuzjka.dao;

import com.kukuzjka.entity.Book;

import java.util.List;

public interface BookDAO {

    int createBook(Book book);
    Book updateBook(Book book);
    void deleteBook(Book book);
    void deleteBook(int id);
    List<Book> getAllBooks();
    Book getBook(int id);
    List<Book> getAllBooks(String bookName);



}
