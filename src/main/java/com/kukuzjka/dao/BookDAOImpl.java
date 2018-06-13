package com.kukuzjka.dao;

import com.kukuzjka.entity.Book;
import com.kukuzjka.util.HibernateUtil;
import org.hibernate.Hibernate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.ArrayList;
import java.util.List;
@Repository
public class BookDAOImpl implements BookDAO {

    @Autowired
    private HibernateUtil hibernateUtil;

    public int createBook(Book book) {
        return (Integer)hibernateUtil.create(book);
    }

    public Book updateBook(Book book) {
        return hibernateUtil.update(book);
    }

    public void deleteBook(Book book) {
        hibernateUtil.delete(book);
    }

    public void deleteBook(int id){
        hibernateUtil.delete(id,Book.class);
    }

    public List<Book> getAllBooks() {
        return hibernateUtil.fetchAll(Book.class);
    }

    public Book getBook(int id) {
        return hibernateUtil.fetchById(id, Book.class);
    }
@SuppressWarnings("unchecked")

    public List<Book> getAllBooks(String bookName) {
        return new ArrayList<Book>() ;

    }
}
