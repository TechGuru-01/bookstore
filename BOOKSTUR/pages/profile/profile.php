<?php
require_once '../../include/config.php';
require_once '../../include/auth_checker.php';

// Fetch current user details
$user_id = $_SESSION['user_id'];
$user_query = $conn->prepare("SELECT * FROM users WHERE id = ?");
$user_query->bind_param("i", $user_id);
$user_query->execute();
$current_user = $user_query->get_result()->fetch_assoc();

$is_admin = (strtolower($current_user['course'] ?? '') == 'admin');

if ($is_admin) {
    $status = "error";
    $msg_text = "";

    $total_result = mysqli_query($conn, "SELECT COUNT(*) as total FROM users");
    $row_total = mysqli_fetch_assoc($total_result);
    $total_users = $row_total['total'];

    $online_query = "SELECT COUNT(*) as online_count FROM users WHERE last_seen >= DATE_SUB(NOW(), INTERVAL 1 HOUR)";
    $result_online = mysqli_query($conn, $online_query);
    $row_online = mysqli_fetch_assoc($result_online);
    $online_now = $row_online['online_count'];

    $new_this_week_query = "SELECT COUNT(*) as new_count FROM users WHERE created_at >= DATE_SUB(NOW(), INTERVAL 7 DAY)";
    $result_new_users = mysqli_query($conn, $new_this_week_query);
    $row_new_users = mysqli_fetch_assoc($result_new_users);
    $new_user = $row_new_users['new_count'];

    $users_list_query = "SELECT * FROM users ORDER BY created_at DESC";
    $users_result = mysqli_query($conn, $users_list_query);

    if (isset($_GET['id'])) {
        $id = $_GET['id'];
        $delete_query = $conn->prepare("DELETE FROM users WHERE id = ?");
        $delete_query->bind_param("i", $id);
        if ($delete_query->execute()) {
            $status = "success";
            $msg_text = "User has been deleted successfully";
        } else {
            $status = "error";
            $msg_text = "Error: this user cannot be deleted";
        }
        header('Content-Type: application/json');
        echo json_encode([
            'status' => $status,
            'msg' => $msg_text
        ]);
        exit;
    }
    // Magkasama dapat ito sa taas ng profile.php kasama ng Delete logic
    if (isset($_GET['reset_id']) && isset($_GET['new_password'])) {
        $id = (int) $_GET['reset_id'];
        $new_pass = $_GET['new_password'];

        // I-hash ang bagong password
        $hashed_password = password_hash($new_pass, PASSWORD_DEFAULT);

        $update_query = $conn->prepare("UPDATE users SET password = ? WHERE id = ?");
        $update_query->bind_param("si", $hashed_password, $id);

        $status = "error";
        $msg_text = "Failed to update password.";

        if ($update_query->execute()) {
            $status = "success";
            $msg_text = "Password updated successfully.";
        }

        header('Content-Type: application/json');
        echo json_encode(['status' => $status, 'msg' => $msg_text]);
        exit;
    }
}
?>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="../../component/navbar/navbar.css">
    <link rel="stylesheet" href="../../component/footer/footer.css">
    <link rel="stylesheet" href="profile.css">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600;800;900&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Material+Icons+Outlined" rel="stylesheet">
    <title>Account | SSCR-C Bookstore</title>
</head>

<body>
    <?php include '../../component/navbar/navbar.php' ?>

    <main class="account-wrapper">
        <section class="account-main">
            <!-- Cinematic Header -->
            <header class="profile-header"
                style="background-image: url('../../src/admin_banner.jpg'); background-size: cover; background-position: center;">
                <div class="header-overlay"></div>
                <div class="profile-main-info">
                    <div class="avatar-container">
                        <img src="../../src/SSCRLogo1.png" alt="Profile">
                    </div>
                    <div class="user-titles">
                        <h1><?php echo htmlspecialchars($current_user['full_name']); ?></h1>
                        <p class="student-id">Student ID:
                            <?php echo htmlspecialchars($current_user['student_number']); ?>
                        </p>
                    </div>
                </div>
            </header>

            <!-- Dashboard Grid Layout -->
            <div class="dashboard-grid">
                <!-- Left Sidebar -->
                <aside class="dashboard-sidebar">
                    <div class="identity-pill">
                        <div class="pill-brand">
                            <span class="material-icons-outlined">account_circle</span>
                            ACCOUNT
                        </div>
                    </div>

                    <div class="nav-pill-box">
                        <nav class="vertical-nav">
                            <button class="nav-btn active" onclick="switchTab('profile', this)">
                                <span class="material-icons-outlined">person</span>
                                My Profile
                            </button>

                            <?php if ($is_admin): ?>
                                <button class="nav-btn" onclick="switchTab('users', this)">
                                    <span class="material-icons-outlined">manage_accounts</span>
                                    User Manager
                                </button>
                            <?php else: ?>
                                <button class="nav-btn" onclick="switchTab('transactions', this)">
                                    <span class="material-icons-outlined">receipt_long</span>
                                    Transactions
                                </button>
                            <?php endif; ?>

                            <button class="nav-btn" onclick="switchTab('settings', this)">
                                <span class="material-icons-outlined">settings</span>
                                Settings
                            </button>

                            <button type="button" class="nav-btn logout" onclick="showLogoutModal()">
                                <span class="material-icons-outlined">logout</span>
                                Logout
                            </button>
                        </nav>
                    </div>
                </aside>

                <!-- Right Content Area -->
                <div class="tab-content-wrapper">
                    <!-- Profile Tab (Available to both) -->
                    <div id="profile-tab" class="tab-pane active">
                        <div class="content-card">
                            <div class="card-header">
                                <h2>Personal Information</h2>
                                <p>Verify and manage your <?php echo $is_admin ? 'Admin' : 'student'; ?> profile
                                    details.
                                </p>
                            </div>
                            <div class="info-form">
                                <div class="form-group">
                                    <label>Full Name</label>
                                    <input type="text"
                                        value="<?php echo htmlspecialchars($current_user['full_name']); ?>" readonly>
                                </div>
                                <div class="form-group">
                                    <label>Student ID Number</label>
                                    <input type="text"
                                        value="<?php echo htmlspecialchars($current_user['student_number']); ?>"
                                        readonly>
                                </div>
                                <div class="form-group">
                                    <label>Course / Program</label>
                                    <input type="text" value="<?php echo htmlspecialchars($current_user['course']); ?>"
                                        readonly>
                                </div>
                                <div class="form-group">
                                    <label>Account Status</label>
                                    <div class="status-badge <?php echo $is_admin ? 'admin' : ''; ?>">
                                        <span
                                            class="material-icons-outlined"><?php echo $is_admin ? 'security' : 'verified'; ?></span>
                                        <?php echo $is_admin ? 'System Administrator' : 'Verified Student'; ?>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <?php if ($is_admin): ?>
                        <!-- Admin User Management Tab -->
                        <?php
                        $users_query = $conn->query("SELECT * FROM users WHERE course != 'Admin' ORDER BY full_name ASC");
                        ?>
                        <div id="users-tab" class="tab-pane">
                            <div class="content-card">
                                <div class="card-header">
                                    <h2>User Management</h2>
                                    <p>View and manage all registered student accounts.</p>
                                </div>
                                <div class="table-responsive">
                                    <table class="admin-table">
                                        <thead>
                                            <tr>
                                                <th>Name</th>
                                                <th>Student ID</th>
                                                <th>Course</th>
                                                <th>Action</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <?php while ($user = $users_query->fetch_assoc()): ?>
                                                <tr>
                                                    <td><?php echo htmlspecialchars($user['full_name']); ?></td>
                                                    <td><?php echo htmlspecialchars($user['student_number']); ?></td>
                                                    <td><?php echo htmlspecialchars($user['course']); ?></td>
                                                    <td>
                                                        <div class="action-btns">
                                                            <button class="btn-icon reset" title="Reset Password"><span
                                                                    class="material-icons-outlined">restart_alt</span></button>
                                                            <button class="btn-icon delete" title="Delete User"><span
                                                                    class="material-icons-outlined">delete</span></button>
                                                        </div>
                                                    </td>
                                                </tr>
                                            <?php endwhile; ?>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    <?php else: ?>
                        <!-- Student Transactions Tab -->
                        <div id="transactions-tab" class="tab-pane">
                            <div class="content-card">
                                <div class="card-header">
                                    <h2>Transaction History</h2>
                                    <p>Your recent purchases and order history.</p>
                                </div>
                                <div class="empty-state">
                                    <span class="material-icons-outlined">history_edu</span>
                                    <p>No recent transactions found.</p>
                                    <a href="../dashboard/dashboard.php" class="btn-shop">Explore Bookstore</a>
                                </div>
                            </div>
                        </div>
                    <?php endif; ?>

                    <div id="settings-tab" class="tab-pane">
                        <div class="content-card">
                            <div class="card-header">
                                <h2>Account Settings</h2>
                                <p>Manage your password and security.</p>
                            </div>
                            <form class="info-form">
                                <div class="form-group">
                                    <label>Current Password</label>
                                    <input type="password" placeholder="••••••••">
                                </div>
                                <div class="form-group">
                                    <label>New Password</label>
                                    <input type="password" placeholder="Enter new password">
                                </div>
                                <button type="button" class="btn-save">Save Changes</button>
                            </form>
                        </div>
                    </div>
                </div><!-- /.tab-content-wrapper -->
            </div><!-- /.dashboard-grid -->
        </section>
    </main>

    <?php include '../../component/footer/footer.php' ?>

    <script src="../../component/navbar/nav.js"></script>
    <script>
        function switchTab(tabId, btn) {
            document.querySelectorAll('.tab-pane').forEach(tab => tab.classList.remove('active'));
            document.querySelectorAll('.nav-btn').forEach(nav => nav.classList.remove('active'));
            document.getElementById(tabId + '-tab').classList.add('active');
            btn.classList.add('active');
        }

        function showLogoutModal() {
            document.getElementById('logoutModal').classList.add('active');
            document.body.style.overflow = 'hidden';
        }

        function hideLogoutModal() {
            document.getElementById('logoutModal').classList.remove('active');
            document.body.style.overflow = 'auto';
        }

        window.onclick = function(event) {
            const modal = document.getElementById('logoutModal');
            if (event.target == modal) {
                hideLogoutModal();
            }
        }
    </script>

    <!-- Logout Confirmation Modal -->
    <div id="logoutModal" class="modal-overlay">
        <div class="modal-content logout-modal">
            <div class="modal-icon">
                <span class="material-icons-outlined">logout</span>
            </div>
            <h3>Confirm Logout</h3>
            <p>Are you sure you want to end your session? Any unsaved changes may be lost.</p>
            <div class="modal-actions">
                <button class="btn-cancel" onclick="hideLogoutModal()">Cancel</button>
                <a href="../../include/logout.php" class="btn-confirm-logout">Logout</a>
            </div>
        </div>
    </div>
</body>

</html>