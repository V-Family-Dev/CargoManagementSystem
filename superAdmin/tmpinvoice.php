<?php
require 'session.php';
require 'dbconfig.php';
require 'superAdminFunctions.php';

$invoice = filter_input(INPUT_POST, 'invnumber', FILTER_SANITIZE_STRING);
$ordernumber = filter_input(INPUT_POST, 'order', FILTER_SANITIZE_STRING);
$recievedate = filter_input(INPUT_POST, 'rcdate', FILTER_SANITIZE_STRING);
$shippingcompany = filter_input(INPUT_POST, 'shpcompany', FILTER_SANITIZE_STRING);
$shippingdate = filter_input(INPUT_POST, 'shipdate', FILTER_SANITIZE_STRING);
$totalpackages = filter_input(INPUT_POST, 'totpack', FILTER_SANITIZE_NUMBER_INT);
$totalvolume = filter_input(INPUT_POST, 'totvol', FILTER_SANITIZE_NUMBER_FLOAT, FILTER_FLAG_ALLOW_FRACTION);
$totalweight = filter_input(INPUT_POST, 'totwei', FILTER_SANITIZE_NUMBER_FLOAT, FILTER_FLAG_ALLOW_FRACTION);
$totalvalue = filter_input(INPUT_POST, 'totval', FILTER_SANITIZE_NUMBER_FLOAT, FILTER_FLAG_ALLOW_FRACTION);
$freightcharges = filter_input(INPUT_POST, 'freight', FILTER_SANITIZE_NUMBER_FLOAT, FILTER_FLAG_ALLOW_FRACTION);
$handlingcharges = filter_input(INPUT_POST, 'handle', FILTER_SANITIZE_NUMBER_FLOAT, FILTER_FLAG_ALLOW_FRACTION);
$d2dcharges = filter_input(INPUT_POST, 'd2d', FILTER_SANITIZE_NUMBER_FLOAT, FILTER_FLAG_ALLOW_FRACTION);
$domesticcharges = filter_input(INPUT_POST, 'domestic', FILTER_SANITIZE_NUMBER_FLOAT, FILTER_FLAG_ALLOW_FRACTION);
$insurancecharges = filter_input(INPUT_POST, 'insurance', FILTER_SANITIZE_NUMBER_FLOAT, FILTER_FLAG_ALLOW_FRACTION);
$tax = filter_input(INPUT_POST, 'tax', FILTER_SANITIZE_NUMBER_FLOAT, FILTER_FLAG_ALLOW_FRACTION);
$cname = filter_input(INPUT_POST, 'cname', FILTER_SANITIZE_STRING);
$caddress = filter_input(INPUT_POST, 'caddress', FILTER_SANITIZE_STRING);
$cnum = filter_input(INPUT_POST, 'cnum', FILTER_SANITIZE_STRING);
$cpass = filter_input(INPUT_POST, 'cpass', FILTER_SANITIZE_STRING);
$pmethod = filter_input(INPUT_POST, 'pmethod', FILTER_SANITIZE_STRING);
$rname = filter_input(INPUT_POST, 'rname', FILTER_SANITIZE_STRING);
$raddress = filter_input(INPUT_POST, 'raddress', FILTER_SANITIZE_STRING);
$rnum = filter_input(INPUT_POST, 'rnum', FILTER_SANITIZE_STRING);
$rmethod = filter_input(INPUT_POST, 'rmethod', FILTER_SANITIZE_STRING);
$tot = filter_input(INPUT_POST, 'tot', FILTER_SANITIZE_NUMBER_FLOAT, FILTER_FLAG_ALLOW_FRACTION);
$ewdlarge = filter_input(INPUT_POST, 'ewdlarge', FILTER_SANITIZE_NUMBER_INT);
$ewdxlarge = filter_input(INPUT_POST, 'ewdxlarge', FILTER_SANITIZE_NUMBER_INT);
$ewd1m = filter_input(INPUT_POST, 'ewd1m', FILTER_SANITIZE_NUMBER_INT);
$ewd15m = filter_input(INPUT_POST, 'ewd15m', FILTER_SANITIZE_NUMBER_INT);
$ewd2m = filter_input(INPUT_POST, 'ewd2m', FILTER_SANITIZE_NUMBER_INT);
$ewd25m = filter_input(INPUT_POST, 'ewd25m', FILTER_SANITIZE_NUMBER_INT);
$ewd35m = filter_input(INPUT_POST, 'ewd35m', FILTER_SANITIZE_NUMBER_INT);
$ecsmall = filter_input(INPUT_POST, 'ecsmall', FILTER_SANITIZE_NUMBER_INT);
$ecmedium = filter_input(INPUT_POST, 'ecmedium', FILTER_SANITIZE_NUMBER_INT);
$eclarge = filter_input(INPUT_POST, 'eclarge', FILTER_SANITIZE_NUMBER_INT);
$ecjumbo = filter_input(INPUT_POST, 'ecjumbo', FILTER_SANITIZE_NUMBER_INT);
$ecxl = filter_input(INPUT_POST, 'ecxl', FILTER_SANITIZE_NUMBER_INT);
$etsmall = filter_input(INPUT_POST, 'etsmall', FILTER_SANITIZE_NUMBER_INT);
$etmedium = filter_input(INPUT_POST, 'etmedium', FILTER_SANITIZE_NUMBER_INT);
$etlarge = filter_input(INPUT_POST, 'etlarge', FILTER_SANITIZE_NUMBER_INT);
$etxl = filter_input(INPUT_POST, 'etxl', FILTER_SANITIZE_NUMBER_INT);
$etxxl = filter_input(INPUT_POST, 'etxxl', FILTER_SANITIZE_NUMBER_INT);

if ($_SERVER['REQUEST_METHOD'] == 'POST') {
  if (isset($_POST['action'])) {
    if ($_POST['action'] == 'sub') {
      $result = createInvoice($conn, $invoice, $ordernumber, $recievedate, $shippingcompany, $shippingdate, $totalpackages, $totalvolume, $totalweight, $totalvalue, $freightcharges, $handlingcharges, $d2dcharges, $domesticcharges, $insurancecharges, $tax, $cname, $caddress, $cnum, $cpass, $pmethod, $rname, $raddress, $rnum, $rmethod, $tot, $ewdlarge, $ewdxlarge, $ewd1m, $ewd15m, $ewd2m, $ewd25m, $ewd35m, $ecsmall, $ecmedium, $eclarge, $ecjumbo, $ecxl, $etsmall, $etmedium, $etlarge, $etxl, $etxxl);
      if ($result) {
        echo "<script type='text/javascript'>
            alert('Successfully created the invoice');
            window.location.href='tmpinvoice.php';
          </script>";
      } else {
        echo "<script type='text/javascript'>
            alert('An error occurred');
            window.location.href='tmpinvoice.php';
          </script>";
      }
    }
  }
}


?>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8" />
  <meta http-equiv="X-UA-Compatible" content="IE=edge" />
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
  <meta name="description" content="" />
  <meta name="author" content="" />
  <title>create Invoice Temporary</title>
  <!--INCLUDING CSS-->
  <?php include 'css.php'; ?>
</head>

<body class="bg-theme bg-theme1">

  <!-- start loader -->
  <div id="pageloader-overlay" class="visible incoming">
    <div class="loader-wrapper-outer">
      <div class="loader-wrapper-inner">
        <div class="loader"></div>
      </div>
    </div>
  </div>
  <!-- end loader -->

  <!-- Start wrapper-->
  <div id="wrapper">

    <?php include 'sidebar.php'; ?>

    <!--Start topbar header-->
    <?php include 'topbar.php'; ?>
    <!--End topbar header-->

    <div class="clearfix"></div>

    <div class="content-wrapper">
      <div class="container-fluid">

        <div class="row mt-3">
          <div class="col-lg-8">
            <div class="card">
              <div class="card-body">
                <div class="card-title">Create Invoice Form</div>
                <hr>
                <form method="post">
                  <div class="form-group">
                    <label for="input-1">Order Id</label>
                    <input type="text" class="form-control" name="order" placeholder="Order Number" required>
                  </div>
                  <div class="form-group">
                    <label for="input-1">Invoice Number</label>
                    <input type="text" class="form-control" name="invnumber" placeholder="Invoice Number" required>
                  </div>
                  <div class="form-group">
                    <label for="input-1">Customer Name</label>
                    <input type="text" class="form-control" name="cname" placeholder="customer name" required>
                  </div>
                  <div class="form-group">
                    <label for="input-2">Customer Address</label>
                    <textarea class="form-control" name="caddress" placeholder="Customer Address" required rows="5"></textarea>
                  </div>
                  <div class="form-group">
                    <label for="input-3">Customer Contact Number</label>
                    <input type="text" class="form-control" name="cnum" placeholder="Customer contact number" required>
                  </div>
                  <div class="form-group">
                    <label for="input-4">Customer Passport Number</label>
                    <input type="text" class="form-control" name="cpass" placeholder="Customer Passport Number" required>
                  </div>
                  <div class="form-group">
                    <label for="input-5">Payment Method</label>
                    <select class="form-control" name="pmethod" required>
                      <option value="">Select Payment Method</option>
                      <option value="Full Payment">Full Payment</option>
                      <option value="Installments">Installments</option>
                      <option value="Cash on delivery">Cash on Delivery</option>
                    </select>
                  </div>
                  <div class="form-group">
                    <label for="input-1">Reciever Name</label>
                    <input type="text" class="form-control" name="rname" placeholder="Reciever name" required>
                  </div>
                  <div class="form-group">
                    <label for="input-2">Reciever Address</label>
                    <textarea class="form-control" name="raddress" placeholder="Reciever Address" required rows="5"></textarea>
                  </div>
                  <div class="form-group">
                    <label for="input-3">Reciever Contact Number</label>
                    <input type="text" class="form-control" name="rnum" placeholder="Reciever contact number" required>
                  </div>
                  <div class="form-group">
                    <label for="input-3">Receive Method</label>
                    <select class="form-control" name="rmethod" required>
                      <option value="">Select a Method</option>
                      <option value="Door to Door">Door to Door</option>
                      <option value="Pickup">Pickup</option>
                    </select>
                  </div>
                  <hr>
                  <hr>
                  <div class="form-group">
                    <label for="input-3">Box/Packages</label>
                  </div>
                  <div class="form-group">
                    <label for="input-3">-----Empty wood box-----</label>
                  </div>
                  <div class="form-group">
                    <label for="input-3">Large</label>
                    <input type="number" min="0" class="form-control" name="ewdlarge" placeholder="Large" required value="0">
                  </div>
                  <div class="form-group">
                    <label for="input-3">Extra Large</label>
                    <input type="number" min="0" class="form-control" name="ewdxlarge" placeholder="Extra Large" required value="0">
                  </div>
                  <div class="form-group">
                    <label for="input-3">1M</label>
                    <input type="number" min="0" class="form-control" name="ewd1m" placeholder="1M" required value="0">
                  </div>
                  <div class="form-group">
                    <label for="input-3">1.5M</label>
                    <input type="number" min="0" class="form-control" name="ewd15m" placeholder="1.5M" required value="0">
                  </div>
                  <div class="form-group">
                    <label for="input-3">2M/4X4</label>
                    <input type="number" min="0" class="form-control" name="ewd2m" placeholder="2M/4X4" required value="0">
                  </div>
                  <div class="form-group">
                    <label for="input-3">2.5M=6X4</label>
                    <input type="number" min="0" class="form-control" name="ewd25m" placeholder="2.5M=6X4" required value="0">
                  </div>
                  <div class="form-group">
                    <label for="input-3">3.5M=8X4</label>
                    <input type="number" min="0" class="form-control" name="ewd35m" placeholder="3.5M=8X4" required value="0">
                  </div>
                  <div class="form-group">
                    <label for="input-3">-----Empty Cartoon-----</label>
                  </div>
                  <div class="form-group">
                    <label for="input-3">Small</label>
                    <input type="number" min="0" class="form-control" name="ecsmall" placeholder="Small" required value="0">
                  </div>
                  <div class="form-group">
                    <label for="input-3">Medium</label>
                    <input type="number" min="0" class="form-control" name="ecmedium" placeholder="Medium" required value="0">
                  </div>
                  <div class="form-group">
                    <label for="input-3">Large</label>
                    <input type="number" min="0" class="form-control" name="eclarge" placeholder="Large" required value="0">
                  </div>
                  <div class="form-group">
                    <label for="input-3">Jumbo</label>
                    <input type="number" min="0" class="form-control" name="ecjumbo" placeholder="Jumbo" required value="0">
                  </div>
                  <div class="form-group">
                    <label for="input-3">XL</label>
                    <input type="number" min="0" class="form-control" name="ecxl" placeholder="XL" required value="0">
                  </div>
                  <div class="form-group">
                    <label for="input-3">-----Empty Trunk-----</label>
                  </div>
                  <div class="form-group">
                    <label for="input-3">Small</label>
                    <input type="number" min="0" class="form-control" name="etsmall" placeholder="small" required value="0">
                  </div>
                  <div class="form-group">
                    <label for="input-3">Medium</label>
                    <input type="number" min="0" class="form-control" name="etmedium" placeholder="medium" required value="0">
                  </div>
                  <div class="form-group">
                    <label for="input-3">Large</label>
                    <input type="number" min="0" class="form-control" name="etlarge" placeholder="large" required value="0">
                  </div>
                  <div class="form-group">
                    <label for="input-3">XL</label>
                    <input type="number" min="0" class="form-control" name="etxl" placeholder="xl" required value="0">
                  </div>
                  <div class="form-group">
                    <label for="input-3">XXL</label>
                    <input type="number" min="0" class="form-control" name="etxxl" placeholder="xxl" required value="0">
                  </div>
                  <div class="form-group">
                    <label for="input-3">-----Invoice Related Details-----</label>
                  </div>
                  <div class="form-group">
                    <label for="input-5">Recieved Date</label>
                    <input type="date" class="form-control" name="rcdate" placeholder="Recieved Date" required>
                  </div>
                  <div class="form-group">
                    <label for="input-5">Shipping Date</label>
                    <input type="date" class="form-control" name="shipdate" placeholder="Shipping Date" required>
                  </div>
                  <div class="form-group">
                    <label for="input-1">Shipping company</label>
                    <input type="text" class="form-control" name="shpcompany" placeholder="shipping company Name" required>
                  </div>
                  <div class="form-group">
                    <label for="input-3">Total Packages</label>
                    <input type="number" min="0" class="form-control" name="totpack" placeholder="Total Packages" required value="0">
                  </div>
                  <div class="form-group">
                    <label for="input-3">Total Volume</label>
                    <input type="number" min="0" step="any" class="form-control" name="totvol" placeholder="Total Volume" required value="0">
                  </div>
                  <div class="form-group">
                    <label for="input-3">Total Weight</label>
                    <input type="number" min="0" step="any" class="form-control" name="totwei" placeholder="Total Weight" required value="0">
                  </div>
                  <div class="form-group">
                    <label for="input-3">Total Value</label>
                    <input type="number" min="0" step="any" class="form-control" name="totval" placeholder="Total Value" required value="0">
                  </div>
                  <div class="form-group">
                    <label for="input-3">Freight charges</label>
                    <input type="number" min="0" step="any" class="form-control" name="freight" placeholder="Freight charges" required value="0">
                  </div>
                  <div class="form-group">
                    <label for="input-3">Handling charges</label>
                    <input type="number" min="0" step="any" class="form-control" name="handle" placeholder="Handling charges" required value="0">
                  </div>
                  <div class="form-group">
                    <label for="input-3">Door to door charges</label>
                    <input type="number" min="0" step="any" class="form-control" name="d2d" placeholder="Door to door charges" required value="0">
                  </div>
                  <div class="form-group">
                    <label for="input-3">Domestic Charges</label>
                    <input type="number" min="0" step="any" class="form-control" name="domestic" placeholder="Domestic charges" required value="0">
                  </div>
                  <div class="form-group">
                    <label for="input-3">Insurance Charges</label>
                    <input type="number" min="0" step="any" class="form-control" name="insurance" placeholder="Unsurance charges" required value="0">
                  </div>
                  <div class="form-group">
                    <label for="input-3">Tax</label>
                    <input type="number" min="0" step="any" class="form-control" name="tax" placeholder="Tax" required value="0">
                  </div>
                  <div class="form-group">
                    <label for="input-3">Total Payment</label>
                    <input type="number" min="0" step="any" class="form-control" name="tot" placeholder="Total Payment" required value="0">
                  </div>
                  <div class="form-group">
                    <button type="submit" name="action" value="sub" class="btn btn-success px-3"><i class="icon-lock"></i> Create Invoice</button>
                    <button type="reset" class="btn btn-danger ml-3 px-3"><i class="fas fa-undo"></i> Reset</button>
                  </div>
                </form>
              </div>
            </div>
          </div>
        </div><!--End Row-->

        <!--start overlay-->
        <div class="overlay toggle-menu"></div>
        <!--end overlay-->

      </div>
      <!-- End container-fluid-->

    </div><!--End content-wrapper-->
    <!--Start Back To Top Button-->
    <a href="javaScript:void();" class="back-to-top"><i class="fa fa-angle-double-up"></i> </a>
    <!--End Back To Top Button-->

    <!--Start footer-->
    <?php include 'footer.php'; ?>
    <!--End footer-->


    <!--start color switcher-->
    <?php include 'colorswitch.php'; ?>
    <!--end color switcher-->

  </div><!--End wrapper-->


  <!---INCLUDEING JS-->
  <?php include 'js.php'; ?>

</body>

</html>