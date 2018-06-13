
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<html>
<head>
    <title>Books Page</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <script src="<c:url value="/resources/validations.js"/>"></script>
    <style type="text/css">@import url("<c:url value="/resources/main.css"/>");</style>
</head>
<body>

<h1 class="text-center">List of Books</h1>
<div class="container">
<button type="button" class="btn buttons" data-toggle="collapse" data-target="#demo">Add <span class="glyphicon
glyphicon-book"></span></button>
<div id="demo" class="collapse">
    <form:form  commandName="book" action="/add-book" method="post" name="addForm"  onsubmit="return(validate())" >
        <fieldset>
            <legend>Add Book</legend>
            <p>
                <label for="title">Title:</label>
                <form:input path="title" id="title" required="true"/>
            </p>
            <p>
                <label for="author">Author:</label>
                <form:input path="author" id="author" required="true"/>
            </p>
            <p>
                <label for="isbn">ISBN:</label>
                <form:input path="isbn" id="isbn"/>
            </p>
            <p>
                <label for="description">Description:</label>
                <form:input path="description" id="description"/>
            </p>
            <p>
                <label for="printYear">Print Year:</label>
                <form:input path="printYear" id="printYear"/>
                <p id="validation" style="color:red"></p>
            </p>
            <p>
                <label for="readAlready">Have you read it already?</label>
                <form:input path="readAlready" id="readAlready"/>
            </p>
            <p>
                <input type="submit" class="buttons btn" value="Add Book">
            </p>
        </fieldset>
    </form:form>
</div>
<button type="button" class="btn buttons" data-toggle="collapse" data-target="#demo1">Search <span class="glyphicon
glyphicon-search"></span></button>
<div id="demo1" class="collapse">
    <form action="/search-book" onsubmit="return(validate2())">
        <fieldset>
            <legend>Search for book</legend>
            <p>
                <label>Search by: </label>
                <div>
                <select name="searchCategory" id="search" onchange="checkSelect()">
                    <option value="Title">Title</option>
                    <option value="Author">Author</option>
                    <option value="Isbn">ISBN</option>
                    <option value="printYear">Year</option>
                    <option value="readAlready">readAlready</option>
                </select>

                <select name = "yearSearch" id="yearSearch" hidden>
                    <option value = "before">Before year</option>
                    <option value = "after">After year</option>
                    <option value="exact">Exact year</option>
                </select>

                <select name = "readStatus" id="readStatus" hidden>
                    <option value = "yes">Yes</option>
                    <option value = "no">No</option>
                </select>
            </div>
            </p>
            <p>
                <label></label>
                <input type="text" name="searchName" id="searchInput"/>
                <p id="validation2" style="color:red"></p>
            </p>
            <p>
                <input type="submit" value="Search" class="buttons btn"/>
            </p>
        </fieldset>
    </form>
</div>

    <c:if test="${searchResult==1}">
        <form action="/">
            <input type="submit" value=" <- Back to full Books List" class="buttons btn"/>
        </form>
    </c:if>

<table class="table table-bordered">
    <tr>
      <%--  <th>ID</th>--%>
        <th>Title</th>
        <th>Description</th>
        <th>Author</th>
        <th>ISBN</th>
        <th>printYear</th>
        <th>ReadAlready</th>
        <th>Edit Book</th>
        <th>Remove Book</th>
    </tr>

    <c:forEach items="${books}" var="book">
        <c:url var="readChange" value = "/read-book/${book.id}"/>
        <tr>
      <%--  <td>${book.id}</td>--%>
        <td>${book.title}</td>
        <td>${book.description}</td>
        <td>${book.author}</td>
        <td>${book.isbn}</td>
        <td>${book.printYear}</td>
        <td>
            <c:if test="${book.readAlready==false}">
                <form action="/read-book/${book.id}">
                    <button type="submit" value="Yes " class="btn readButton lala">Click, if Read<span class="fa fa-smile-o"/></button>
                </form>
            </c:if>
            <c:if test="${book.readAlready==true}">
                <p>It's finished!</p>
            </c:if>
        </td>
        <td><a href="edit-book/${book.id}"><span class="glyphicon glyphicon-edit"/></a> </td>
        <td><a href="delete-book/${book.id}"><span class="glyphicon glyphicon-remove"/></a> </td>
        </tr>
    </c:forEach>
</table>

<div align="center" class="panel-footer" id="pagination">
    <c:url value="/" var="prev">
        <c:param name="page" value="${page-1}"/>
    </c:url>
    <ul class="pagination">
    <c:if test="${page > 1}">
        <li class="page-item"> <a href="<c:out value="${prev}" />" class="pn prev">Prev</a></li>
    </c:if>

    <c:forEach begin="1" end="${maxPages}" step="1" varStatus="i">
        <c:choose>
            <c:when test="${page == i.index}">
                <li class="page-item active"><span>${i.index}</span></li>
            </c:when>
            <c:otherwise>
                <c:url value="/"  var="url">
                    <c:param name="page" value="${i.index}"/>
                </c:url>
                <li class="page-item"> <a href='<c:out value="${url}" />'>${i.index}</a></li>
            </c:otherwise>
        </c:choose>
    </c:forEach>
    <c:url value="/" var="next">
        <c:param name="page" value="${page + 1}"/>
    </c:url>
    <c:if test="${page + 1 <= maxPages}">
        <li class="page-item"> <a href='<c:out value="${next}" />' class="pn next">Next</a></li>
    </c:if>
    </ul>
</div>
</div>
</body>
</html>

