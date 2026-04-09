<?php
$cols = [
    'date_added', 
    'item', 
    'size_xs', 
    'size_s', 
    'size_m', 
    'size_l', 
    'size_xl', 
    'size_xxl', 
    'size_xxxl', 
    'total_quantity', 
    'price_xs', 
    'price_s', 
    'price_m', 
    'price_l', 
    'price_xl', 
    'price_xxl', 
    'price_xxxl'
];
$order = (isset($_GET['order']) && $_GET['order'] == 'ASC') ? 'ASC' : 'DESC';
$sql = "SELECT * FROM inventory 
        ORDER BY date_added $order";

$result = $conn->query($sql);
?>