<%@page import="Controller.ReservationDAO"%>
<jsp:useBean id="rb" class="Model.ReservationBean"></jsp:useBean>
<jsp:setProperty property="*" name="rb"/>


<%
    int status = ReservationDAO.deleteUnconfirmed(rb);
    
    if (status > 0) {
        response.sendRedirect("unconfirmedTable.jsp");
    } else {
        response.sendRedirect("unconfirmedTable.jsp");
    }

%>