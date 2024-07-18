<%
    if(session.getAttribute("login") == null){
        response.sendRedirect("login.html");
        return;
    }
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Controller.ReservationDAO,Model.ReservationBean"%>


<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Reservation Table Page</title>

    <!-- Custom fonts for this template -->
    <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link
        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
        rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="css/sb-admin-2.min.css" rel="stylesheet">

    <!-- Custom styles for this page -->
    <link href="vendor/datatables/dataTables.bootstrap4.min.css" rel="stylesheet">
    
</head>

<body id="page-top">

    <!-- Page Wrapper -->
    <div id="wrapper">

        <!-- Sidebar -->
        <ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">

            <!-- Sidebar - Brand -->
            <a class="sidebar-brand d-flex align-items-center justify-content-center" href="index.html">
                <div class="sidebar-brand-text mx-3">Admin Page</div>
            </a>

            <!-- Divider -->
            <hr class="sidebar-divider my-0">

            <!-- Nav Item - Dashboard -->
            <li class="nav-item active">
                <a class="nav-link" href="dashboard.jsp">
                    <i class="fas fa-fw fa-tachometer-alt"></i>
                    <span>Dashboard</span></a>
            </li>

            <!-- Divider -->
            <hr class="sidebar-divider">
            
            <!-- Nav Item - Utilities Collapse Menu -->
            <li class="nav-item">
                <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseUtilities"
                    aria-expanded="true" aria-controls="collapseUtilities">
                    <i class="fas fa-fw fa-table"></i>
                    <span>Reservation</span>
                </a>
                <div id="collapseUtilities" class="collapse" aria-labelledby="headingUtilities"
                    data-parent="#accordionSidebar">
                    <div class="bg-white py-2 collapse-inner rounded">
                        <h6 class="collapse-header">Reservation Data:</h6>
                        <a class="collapse-item" href="reservationTable.jsp">All Data</a>
                        <a class="collapse-item" href="unconfirmedTable.jsp">Unconfirmed</a>
                        <a class="collapse-item" href="confirmedTable.jsp">Confirmed</a>
                        <a class="collapse-item" href="completedTable.jsp">Completed</a>
                    </div>
                </div>
            </li>

            <!-- Divider -->
            <hr class="sidebar-divider d-none d-md-block">

            <!-- Sidebar Toggler (Sidebar) -->
            <div class="text-center d-none d-md-inline">
                <button class="rounded-circle border-0" id="sidebarToggle"></button>
            </div>

        </ul>
        <!-- End of Sidebar -->

        <!-- Content Wrapper -->
        <div id="content-wrapper" class="d-flex flex-column">

            <!-- Main Content -->
            <div id="content">

                <!-- Topbar -->
                <nav class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">

                    <!-- Sidebar Toggle (Topbar) -->
                    <form class="form-inline">
                        <button id="sidebarToggleTop" class="btn btn-link d-md-none rounded-circle mr-3">
                            <i class="fa fa-bars"></i>
                        </button>
                    </form>

                    <!-- Topbar Navbar -->
                    <ul class="navbar-nav ml-auto">

                        <!-- Nav Item - User Information -->
                        <li class="nav-item dropdown no-arrow">
                            <a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button"
                                data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <span class="mr-2 d-none d-lg-inline text-gray-600 small">Admin</span>
                                <img class="img-profile rounded-circle"
                                    src="img/undraw_profile.svg">
                            </a>
                            <!-- Dropdown - User Information -->
                            <div class="dropdown-menu dropdown-menu-right shadow animated--grow-in"
                                aria-labelledby="userDropdown">
                                <a class="dropdown-item" href="#" data-toggle="modal" data-target="#logoutModal">
                                    <i class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>
                                    Logout
                                </a>
                            </div>
                        </li>

                    </ul>

                </nav>
                <!-- End of Topbar -->

                <!-- Begin Page Content -->
                <div class="container-fluid">

                    <!-- DataTales Example -->
                    <div class="card shadow mb-4">
                        <div class="card-header py-3">
                            <h6 class="m-0 font-weight-bold text-primary">Manage Unconfirmed Data</h6>
                        </div>
                        <div class="card-body">
                            <form action="updateUnconfirmed.jsp" method="post">     
                                <%
                        String id = request.getParameter("id_reservation");
                        ReservationBean r = ReservationDAO.getRecordById(Integer.parseInt(id));
                    %>
                                <input type="hidden" name="id_reservation" value="<%=r.getId_reservation()%>"/>
                                <input type="hidden" name="status" value="confirmed"/>
                                <div class="row">
                                    <div class="col-xl-3 col-md-6 mb-4">
                                        <label>Name</label>
                                        <input class="input form-control" value="<%= r.getName()%>" name="name">
                                    </div>
                                    <div class="col-xl-3 col-md-6 mb-4">
                                        <label>Email</label>
                                        <input class="input form-control" value="<%= r.getEmail()%>" name="email">
                                    </div>
                                    <div class="col-xl-3 col-md-6 mb-4">
                                        <label>Phone</label>
                                        <div class="input-group">
                                            <input id="phoneInput" class="input form-control" value="<%= r.getPhone()%>" name="phone">
                                            <div class="input-group-append">
                                                <a id="chatButton" class="btn btn-success" target="_blank">Chat</a>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-xl-3 col-md-6 mb-4">
                                        <label>Location</label>
                                        <input class="input form-control" value="<%= r.getLocation()%>" name="location">
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-xl-3 col-md-6 mb-4">
                                        <label>Date</label>
                                        <input type="date" class="input form-control" value="<%= r.getDate()%>" name="date">
                                    </div>
                                    <div class="col-xl-3 col-md-6 mb-4">
                                        <label>Service</label>
                                        <input class="input form-control" value="<%= r.getService()%>" name="service">
                                    </div>
                                    <div class="col-xl-3 col-md-6 mb-4">
                                        <label>Price</label>
                                        <input class="input form-control" placeholder="Price" name="price">
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-xl-3 col-md-6 mb-4">
                                        <label>Message</label>
                                        <textarea class="input form-control" name="message"><%= r.getMessage()%></textarea>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-xl-3 col-md-6 mb-4">
                                        <button type="submit" class="btn btn-success btn-icon-split">
                                            <span class="text">Save</span>
                                        </button>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>

                </div>
                <!-- /.container-fluid -->

            </div>
            <!-- End of Main Content -->

            <!-- Footer -->
            <footer class="sticky-footer bg-white">
                <div class="container my-auto">
                    <div class="copyright text-center my-auto">
                        <span>Copyright &copy; Your Website 2020</span>
                    </div>
                </div>
            </footer>
            <!-- End of Footer -->

        </div>
        <!-- End of Content Wrapper -->

    </div>
    <!-- End of Page Wrapper -->

    <!-- Scroll to Top Button-->
    <a class="scroll-to-top rounded" href="#page-top">
        <i class="fas fa-angle-up"></i>
    </a>

    <!-- Logout Modal-->
    <div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
        aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Ready to Leave?</h5>
                    <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">×</span>
                    </button>
                </div>
                <div class="modal-body">Select "Logout" below if you are ready to end your current session.</div>
                <div class="modal-footer">
                    <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
                    <a class="btn btn-primary" href="LogoutServlet">Logout</a>
                </div>
            </div>
        </div>
    </div>

    <!-- Bootstrap core JavaScript-->
    <script src="vendor/jquery/jquery.min.js"></script>
    <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    <!-- Core plugin JavaScript-->
    <script src="vendor/jquery-easing/jquery.easing.min.js"></script>

    <!-- Custom scripts for all pages-->
    <script src="js/sb-admin-2.min.js"></script>

    <!-- Page level plugins -->
    <script src="vendor/datatables/jquery.dataTables.min.js"></script>
    <script src="vendor/datatables/dataTables.bootstrap4.min.js"></script>

    <!-- Page level custom scripts -->
    <script src="js/demo/datatables-demo.js"></script>

    <!-- Custom Script for Chat Button -->
    <script>
        document.getElementById('chatButton').onclick = function() {
            var phoneInput = document.getElementById('phoneInput').value;
            if (phoneInput) {
                window.open('https://wa.me/' + phoneInput);
            } else {
                alert('Please enter a valid phone number.');
            }
        };
    </script>

</body>

</html>
