<%@page import="Controller.ReservationDAO"%>
<jsp:useBean id="b" class="Model.ReservationBean"></jsp:useBean>
<jsp:setProperty property="*" name="b"/>

<%
    int i = ReservationDAO.save(b);
    if (i > 0) {
        response.sendRedirect("contact.html?status=success");
    } else {
        response.sendRedirect("contact.html?status=error");
    }
%>
