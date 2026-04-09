<div class="table-wrapper">
    <table>
        <thead>
            <tr>
                <?php foreach($cols as $columnName): ?>
                    <th>
                        <div class="th-content">
                            <?php 
                                $displayHeader = ucwords(str_replace('_', ' ', $columnName));
                                echo htmlspecialchars($displayHeader); 
                            ?>   
                        </div>
                    </th>
                <?php endforeach; ?>
            </tr>
        </thead>
        <tbody>
    <?php 

    if ($result && $result->num_rows > 0): 
        while($row = $result->fetch_assoc()): 
    ?>
        <tr>
            <?php foreach($cols as $column): ?>
                <td>
                    <?php 
                        $value = $row[$column];
                        
                        if (strpos($column, 'price') !== false) {
                            echo "₱" . number_format((float)$value, 2);
                        } 
                        else if ($column == 'date_added') {
                            echo date("M d, Y", strtotime($value));
                        }
                        else {
                            echo htmlspecialchars($value);
                        }
                    ?>
                </td>
            <?php endforeach; ?>
        </tr>
    <?php 
        endwhile; 
    else: 
    ?>
        <tr>
            <td colspan="<?php echo count($cols); ?>" style="text-align:center; padding: 50px;">
               Empty Inventory
            </td>
        </tr>
    <?php endif; ?>
</tbody>
    </table>
</div>