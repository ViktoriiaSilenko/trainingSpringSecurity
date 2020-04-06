<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<sec:authentication property="principal.username" var="username"/>
<sec:authentication property="authorities" var="roles"/>

<table cellpadding="0" cellspacing="3" border="0">
    <tr>
        <td>Username:</td>
        <td>${username}</td>
        <td>(<a href="<c:url value="/public/logout.jsp"/>">Logout</a>)</td>
    </tr>
    <tr>
        <td>Roles:</td>
        <td colspan="2">
            <c:forEach items="${roles}" var="role" varStatus="status">
                <c:if test="${!status.first}">,</c:if> ${role}
            </c:forEach>
        </td>
    </tr>
</table>