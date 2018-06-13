
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Book edit page</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <script src="<c:url value="/resources/validations.js"/>"></script>
    <style type="text/css">@import url("<c:url value="/resources/main.css"/>");</style>
</head>
<body>
<h1></h1>
<div class="container">
<c:url var="formAction" value="/update-book"/>
<form:form  commandName="book" action="${formAction}" method="post"  onsubmit="return validate()" >
    <fieldset>
        <legend>Edit BOOK by ${book.author}</legend>
        <form:hidden path="id"/>
        <form:hidden path="author"/>
        <p>
            <label for="title">Title:</label>
            <form:input path="title" id="title"/>
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
            <input type="submit" value="Edit book" class="buttons btn ">

        </p>
    </fieldset>

</form:form>
</div>
</body>
</html>
