<%@ Page Language="C#" AutoEventWireup="true" CodeFile="500Error.aspx.cs" Inherits="_500Error" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <title>500Error</title>
    <!-- plugins:css -->
    <link rel="stylesheet" href="Admin/assets/vendors/mdi/css/materialdesignicons.min.css"/>
    <link rel="stylesheet" href="Admin/assets/vendors/css/vendor.bundle.base.css"/>
    <link rel="stylesheet" href="Admin/assets/css/style.css"/>
    <!-- End layout styles -->
    <link rel="shortcut icon" href="Admin/Images/hlogo.jpg" />
    <style>
        .content-wrapper{
            background-image: radial-gradient( circle farthest-corner at 10% 20%,  rgba(38,51,97,1) 0%, rgba(65,143,222,1) 79% );
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    <div class="container-scroller">
      <div class="container-fluid page-body-wrapper full-page-wrapper">
        <div class="content-wrapper d-flex align-items-center text-center error-page">
          <div class="row flex-grow">
            <div class="col-lg-7 mx-auto text-white">
              <div class="row align-items-center d-flex flex-row">
                <div class="col-lg-6 text-lg-right pr-lg-4">
                  <h1 class="display-1 mb-0">500</h1>
                </div>
                <div class="col-lg-6 error-page-divider text-lg-left pl-lg-4">
                  <h2>SORRY!</h2>
                  <h3 class="font-weight-light">Internal server error!</h3>
                </div>
              </div>
              <div class="row mt-5">
                <div class="col-12 text-center mt-xl-2">
                  <a class="text-white font-weight-medium" href="">Back to home</a>
                </div>
              </div>
              <div class="row mt-5">
                <div class="col-12 mt-xl-2">
                  <p class="text-white font-weight-medium text-center">Copyright &copy; 2024 Hotel All rights reserved.</p>
                </div>
              </div>
            </div>
          </div>
        </div>
        <!-- content-wrapper ends -->
      </div>
      <!-- page-body-wrapper ends -->
    </div>
        
    </div>
    </form>
    
    <!-- container-scroller -->
    <!-- plugins:js -->
    <script src="Admin/assets/vendors/js/vendor.bundle.base.js"></script>
    <!-- endinject -->
    <!-- Plugin js for this page -->
    <!-- End plugin js for this page -->
    <!-- inject:js -->
    <script src="Admin/assets/js/off-canvas.js"></script>
    <script src="Admin/assets/js/hoverable-collapse.js"></script>
    <script src="Admin/assets/js/misc.js"></script>
    <!-- endinject -->
</body>
</html>
