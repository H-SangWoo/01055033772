<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<%@ include file="/WEB-INF/views/include/header.jspf"%>

<%response.sendRedirect(request.getContextPath()+"/planner/shareboard"); %>
<body>
<h1>
	Hello world!  
</h1>

<P>  The time on the server is ${serverTime}. </P>
</body>

<%@ include file="/WEB-INF/views/include/footer.jspf"%>