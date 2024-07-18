<%@page import="Controller.ReservationDAO"%>
<jsp:useBean id="rb" class="Model.ReservationBean"></jsp:useBean>
<jsp:setProperty property="*" name="rb"/>


<%
    int status = ReservationDAO.updateUnconfirmed(rb);
    
    if (status > 0) {
        response.sendRedirect("unconfirmedTable.jsp?status=success");
    } else {
        response.sendRedirect("unconfirmedTable.jsp?status=error");
    }

%>