package com.kukuzjka.controller;


import com.kukuzjka.entity.Book;
import com.kukuzjka.service.BookService;
import org.jboss.logging.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.support.PagedListHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.List;


@Controller
public class BookController {
    private static final Logger logger = Logger.getLogger(BookController.class);

    @Autowired
    private BookService bookService;

    @RequestMapping("/")
    public String getBookList(Model model, @RequestParam(required = false) Integer page, @ModelAttribute Book book){
        logger.info("bookList method");
        List<Book> books = bookService.getAllBooks();
        pagination(model, page, books);
        model.addAttribute("book",book);
        return "BookList";
    }

    public void pagination(Model model, Integer page, @ModelAttribute List<Book> books){
        PagedListHolder<Book> pagedListHolder = new PagedListHolder<>(books);
        pagedListHolder.setPageSize(10);
        model.addAttribute("maxPages",pagedListHolder.getPageCount());
        if(page == null || page < 1 || page > pagedListHolder.getPageCount()){
            page=1;
        }
        model.addAttribute("page",page);
        if(page == null || page < 1 || page > pagedListHolder.getPageCount()) {
            pagedListHolder.setPage(0);
            model.addAttribute("books", pagedListHolder.getPageList());
        }
        else if(page <= pagedListHolder.getPageCount()) {
            pagedListHolder.setPage(page-1);
            model.addAttribute("books", pagedListHolder.getPageList());
        }

    }

    @RequestMapping("/add-book")
    public String addBook(@ModelAttribute Book book){
        logger.info("Adding book");
        bookService.createBook(book);
        return "redirect:/";
    }

    @RequestMapping("/search-book")
    public String searchBook(@RequestParam (required = false)String searchName, @RequestParam String searchCategory,
                             @RequestParam(required = false) String yearSearch, @RequestParam(required = false) String readStatus,
                             Model model)
    throws NoSuchMethodException, IllegalAccessException,InvocationTargetException{
        logger.info("Searching book");
        List<Book> books = bookService.getAllBooks();
        List<Book> result = new ArrayList<>();
        String get;
        if(searchCategory.equals("readAlready")) get = "is";
        else {get = "get"; }
            Method fieldGetter = Book.class.getMethod(get + Character.toUpperCase(searchCategory.charAt(0))
                    + searchCategory.substring(1));
            for (Book b : books) {
                String field = fieldGetter.invoke(b).toString();
                if (!searchCategory.equals("printYear")&&!searchCategory.equals("readAlready")) {
                    if (field.toLowerCase().contains(searchName.toLowerCase())) {
                        result.add(b);
                    }
                } else if (searchCategory.equals("printYear")) {
                    if (yearSearch.equals("before")) {
                        if (Integer.parseInt(field) < Integer.parseInt(searchName)) {
                            result.add(b);
                        }
                    } else if (yearSearch.equals("after")) {
                        if (Integer.parseInt(field) > Integer.parseInt(searchName)) {
                            result.add(b);
                        }
                    } else {
                        if (Integer.parseInt(field) == Integer.parseInt(searchName)) {
                            result.add(b);
                        }
                    }
                }
                else {
                    if(readStatus.equals("yes")){
                        if(field.equals("true")){
                            result.add(b);
                        }
                    }
                    else if (readStatus.equals("no")){
                        if(field.equals("false")){
                            result.add(b);
                        }
                    }
                }
            }
        model.addAttribute("books",result);
        model.addAttribute("searchResult",1);
        return "BookList";
    }

    @RequestMapping("read-book/{id}")
    public String isBookRead(@PathVariable int id){
        logger.info("Is book read");
        Book book = bookService.getBook(id);
        if(!book.isReadAlready()){
            book.setReadAlready(true);
            bookService.updateBook(book);
        }
        return "redirect:/";
    }


    @RequestMapping("/edit-book/{id}")
    public String editBook(@PathVariable int id, Model model){
        logger.info("Editing book");
        Book book = bookService.getBook(id);
        model.addAttribute("book",book);
        return "BookEditPage";
    }

    @RequestMapping("/delete-book/{id}")
    public String removeBook(@PathVariable int id){
        logger.info("Deleting book");
        bookService.deleteBook(id);
        return "redirect:/";
    }


    @RequestMapping("/update-book")
    public String updateBook(@ModelAttribute Book book){
        logger.info("Updating book");
        book.setReadAlready(false);
        bookService.updateBook(book);
        return "redirect:/";
    }

    @ModelAttribute
    public void addBookToModel(Model model){
        model.addAttribute("book",new Book());
    }

}
