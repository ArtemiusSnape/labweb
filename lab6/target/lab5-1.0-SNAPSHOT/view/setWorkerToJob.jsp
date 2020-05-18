<%--
  Created by IntelliJ IDEA.
  User: Lenovo
  Date: 3/27/2020
  Time: 2:57 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<fmt:setLocale value="${userLocale}" />
<fmt:setBundle basename="locale" />
<html>
<head>
    <title><fmt:message key="worker.workerTitle" /></title>
    <link href="http://localhost:8080/lab5_war_exploded/view/styles.css" rel="stylesheet">
</head>
<body>
<form  class="page-form" id="set-worker-to-job" method = "POST">
    <fmt:message key="worker.workerId" />: <input type = "number" min="1" name = "worker_id">
    <fmt:message key="cancelRequest.requestId" />: <input type = "number" min="1" name = "request_id">
    <input type = "submit" value = <fmt:message key="form.submit" /> />
</form>
</body>
</html>
