<?php
require_once "../../include/config.php";
require_once "../../include/inventoryFunction.php"
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="../../style.css">
    <link rel="stylesheet" href="../../component/navbar/nav.css">
    <link rel="stylesheet" href="./inventory.css">
    <link rel="stylesheet" href="../../component/inventoryHeader/inventoryHeader.css">
     <link rel="stylesheet" href="../../component/inventoryTable/inventoryTable.css">
    <link href="https://fonts.googleapis.com/css2?family=Material+Icons+Outlined" rel="stylesheet">
    <title>Document</title>
</head>
<body>
    <?php include "../../component/navbar/nav.php"?>
    <div class="inventory-container">
        <?php include "../../component/inventoryHeader/inventoryHeader.php"?>
        <hr>
        <?php include '../../component/inventoryTable/inventoryTable.php'?>
    </div>
    <script src="../../component/navbar/nav.js"></script>
</body>
</html>