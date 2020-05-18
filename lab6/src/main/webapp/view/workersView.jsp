<%@ page language="java" contentType="text/html; charset=UTF-8"
 pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<fmt:setLocale value="${userLocale}" />
<fmt:setBundle basename="locale" />
<!DOCTYPE html>
<html>
 <head>
    <meta charset="UTF-8">
    <title><fmt:message key="worker.listTitle" /></title>
     <link href="http://localhost:8080/lab5_war_exploded/view/styles.css" rel="stylesheet">
 </head>
 <body>
    <h3><fmt:message key="worker.listTitle" /></h3>
 
    <p style="color: red;">${errorString}</p>
 
    <table border="1" cellpadding="5" cellspacing="1" style="border-collapse: collapse">
       <tr>
          <th><fmt:message key="table.id" /></th>
          <th><fmt:message key="table.name" /></th>
           <th><fmt:message key="table.profile" /></th>
       </tr>
       <c:forEach items="${workersList}" var="worker" >
          <tr>
             <td>${worker.worker_id}</td>
             <td>${worker.worker_name}</td>
              <td>${worker.worker_profile}</td>
          </tr>
       </c:forEach>
    </table>
 </body>
</html>