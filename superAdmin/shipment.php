<?php
require 'session.php';
require 'dbconfig.php';
require 'superAdminFunctions.php';

$containerId = filter_input(INPUT_GET, 'containerId', FILTER_SANITIZE_STRING);
if (changeLocOfConIn($conn, $containerId)) {
    echo "<script>alert('Location updated succesfully'); window.location.href='containers.php';</script>"; 
}
else
{
    echo "<script>alert('An error occured!!!'); window.location.href='containers.php';</script>"; 
}
?>
