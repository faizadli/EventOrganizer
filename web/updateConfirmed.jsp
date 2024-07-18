<%@page import="Controller.ReservationDAO"%>
<jsp:useBean id="rb" class="Model.ReservationBean"></jsp:useBean>
<jsp:setProperty property="*" name="rb"/>


<%
    int status = ReservationDAO.updateToCompleted(rb);
    
    if (status > 0) {
        response.sendRedirect("confirmedTable.jsp?status=success");
    } else {
        response.sendRedirect("confirmedTable.jsp?status=error");
    }

%>