package com.kukuzjka.service;

import com.kukuzjka.entity.Book;

import java.util.List;

public interface BookService {

        public int createBook(Book book);
        public Book updateBook(Book book);
        public void deleteBook(int id);
        public List<Book> getAllBooks();
        public Book getBook(int id);
}
