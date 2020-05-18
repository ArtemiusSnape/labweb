<%@ page import="model.entities.User" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="lang" value="${not empty param.lang ? param.lang : not empty lang ? lang : pageContext.request.locale}" scope="session" />
<fmt:setLocale value="${userLocale}" />
<fmt:setBundle basename="locale" />

<!DOCTYPE html>
<html lang="${lang}">
<head>
    <meta charset="UTF-8">
    <title><fmt:message key="homePage.title" /></title>
    <link href="http://localhost:8080/lab5_war_exploded/view/styles.css" rel="stylesheet">
</head>

<body>
<form method="POST">
    <select id="lang" name="lang" onchange="submit()">
        <option>Default</option>
        <option value="ru" ${lang == 'ru' ? 'selected' : ''}>Russian</option>
        <option value="en" ${lang == 'en' ? 'selected' : ''}>English</option>
    </select>
</form>
<p  style="color: red;">${errorString}</p>
<%User user = (User)session.getAttribute("user"); %>
<%int userType = (user == null ? -1 : user.getUser_type()); %>
<%if (userType == -1) {%>
<h2><fmt:message key="homePage.title" /></h2>
<%} else if (userType == 0) { %>
<h2><fmt:message key="homePage.userTitle" /></h2>
<%} else if (userType == 1) { %>
<h2><fmt:message key="homePage.adminTitle" /></h2>
<%}%>
<div >
    <%if (userType == -1) {%>
    <button class="return-button" onclick="location.href='${pageContext.request.contextPath}?command=login'"><fmt:message key="homePage.login" /></button>
    <button class="return-button" onclick="location.href='${pageContext.request.contextPath}?command=registration'"><fmt:message key="homePage.registration" /></button>
    <%} else {%>
    <button class="return-button" onclick="location.href='${pageContext.request.contextPath}?command=logout'"><fmt:message key="homePage.logout" /></button>

    <%}%>
</div>
<%if (userType >= 0) {%>
<h3  class="info-box"><fmt:message key="homePage.choose" /></h3>
<div class="numberlist">
    <ol>

        <li><a href="${pageContext.request.contextPath}?command=requestsList"><fmt:message key="homePage.requests" /></a></li>
        <li><a href="${pageContext.request.contextPath}?command=workersList"><fmt:message key="homePage.workers" /></a></li>

        <li><a href="${pageContext.request.contextPath}?command=tenantsList"><fmt:message key="homePage.tenants" /></a></li>
        <li><a href="${pageContext.request.contextPath}?command=workPlansList"><fmt:message key="homePage.workPlans" /></a></li>
        <%}%>
        <%if (userType >= 1) {%>
        <li><a href="${pageContext.request.contextPath}?command=setWorkerToJob"><fmt:message key="homePage.workerjob" /></a></li>
        <li><a href="${pageContext.request.contextPath}?command=overdueRequests"><fmt:message key="homePage.overdue" /></a></li>
        <li><a href="${pageContext.request.contextPath}?command=cancelRequest"><fmt:message key="homePage.cancel" /></a></li>
        <%}%>



    </ol>
</div>
</body>
</html>