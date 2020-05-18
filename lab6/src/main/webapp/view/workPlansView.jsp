<%--
  Created by IntelliJ IDEA.
  User: Lenovo
  Date: 3/27/2020
  Time: 2:07 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<fmt:setLocale value="${userLocale}" />
<fmt:setBundle basename="locale" />
<html>
<head>
    <title><fmt:message key="workplan.listTile" /></title>
    <link href="http://localhost:8080/lab5_war_exploded/view/styles.css" rel="stylesheet">
</head>
<body>
<h3><fmt:message key="workplan.listTile" /></h3>

<p style="color: red;">${errorString}</p>

<table border="1" cellpadding="5" cellspacing="1" style="border-collapse: collapse">
    <tr>
        <th><fmt:message key="table.id" /></th>
        <th><fmt:message key="cancelRequest.requestId" /></th>
        <th><fmt:message key="worker.workerId" /></th>
        <th><fmt:message key="workplan.isComplited" /></th>
    </tr>
    <c:forEach items="${workPlanList}" var="workPlan" >
        <tr>
            <td>${workPlan.plan_id}</td>
            <td>${workPlan.request_id}</td>
            <td>${workPlan.worker_id}</td>
            <td>${workPlan.is_completed}</td>
        </tr>
    </c:forEach>
</table>
</body>
</html>
