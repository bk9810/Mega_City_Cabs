<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ page session="true" %>
<%
    String adminUser = (String) session.getAttribute("adminUser");
    if (adminUser == null) {
        response.sendRedirect(request.getContextPath() + "/admin/admin_login.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Dashboard | Mega City Cab Service</title>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/js/all.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <style>
        /* Variables */
        :root {
            --primary: #3a56d4;
            --primary-light: #4a6cf7;
            --secondary: #6c757d;
            --dark: #1e293b;
            --success: #10b981;
            --warning: #f59e0b;
            --danger: #ef4444;
            --info: #3b82f6;
            --light: #f8fafc;
            --gray-100: #f1f5f9;
            --gray-200: #e2e8f0;
            --gray-300: #cbd5e1;
            --gray-400: #94a3b8;
            --shadow-sm: 0 1px 2px 0 rgba(0, 0, 0, 0.05);
            --shadow: 0 4px 6px -1px rgba(0, 0, 0, 0.1), 0 2px 4px -1px rgba(0, 0, 0, 0.06);
            --shadow-md: 0 10px 15px -3px rgba(0, 0, 0, 0.1), 0 4px 6px -2px rgba(0, 0, 0, 0.05);
            --shadow-lg: 0 20px 25px -5px rgba(0, 0, 0, 0.1), 0 10px 10px -5px rgba(0, 0, 0, 0.04);
            --radius: 0.5rem;
            --radius-lg: 1rem;
            --transition: all 0.3s ease;
        }

        /* General Styles */
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Inter', -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, Oxygen, Ubuntu, Cantarell, sans-serif;
            background-color: var(--gray-100);
            color: var(--dark);
            min-height: 100vh;
            overflow-x: hidden;
            line-height: 1.6;
        }

        a {
            text-decoration: none;
            color: inherit;
            transition: var(--transition);
        }

        /* Layout */
        .container {
            display: flex;
            width: 100%;
            min-height: 100vh;
        }

        /* Sidebar */
        .sidebar {
            width: 280px;
            background: var(--dark);
            height: 100vh;
            position: fixed;
            left: 0;
            top: 0;
            color: white;
            padding: 1.5rem 0;
            transition: var(--transition);
            z-index: 10;
            overflow-y: auto;
            box-shadow: var(--shadow-lg);
        }

        .sidebar-header {
            padding: 0 1.5rem 1.5rem;
            border-bottom: 1px solid rgba(255, 255, 255, 0.1);
            display: flex;
            align-items: center;
            justify-content: space-between;
        }

        .sidebar-logo {
            display: flex;
            align-items: center;
            gap: 0.75rem;
        }

        .logo-img {
            width: 40px;
            height: 40px;
            object-fit: contain;
        }

        .logo-text {
            font-size: 1.25rem;
            font-weight: 700;
            color: white;
        }

        .sidebar-toggle {
            background: rgba(255, 255, 255, 0.1);
            border: none;
            width: 32px;
            height: 32px;
            border-radius: 50%;
            color: white;
            display: flex;
            align-items: center;
            justify-content: center;
            cursor: pointer;
            transition: var(--transition);
        }

        .sidebar-toggle:hover {
            background: rgba(255, 255, 255, 0.2);
            transform: rotate(180deg);
        }

        .nav-section {
            padding: 1.5rem 1rem;
        }

        .nav-title {
            font-size: 0.75rem;
            text-transform: uppercase;
            letter-spacing: 0.05em;
            color: var(--gray-400);
            margin-bottom: 1rem;
            padding-left: 0.75rem;
        }

        .nav-menu {
            list-style: none;
        }

        .nav-item {
            margin-bottom: 0.25rem;
        }

        .nav-link {
            display: flex;
            align-items: center;
            padding: 0.75rem 1rem;
            border-radius: var(--radius);
            color: var(--gray-300);
            font-weight: 500;
            transition: var(--transition);
        }

        .nav-link:hover {
            background: rgba(255, 255, 255, 0.1);
            color: white;
            transform: translateX(5px);
        }

        .nav-link.active {
            background: var(--primary);
            color: white;
        }

        .nav-icon {
            width: 20px;
            margin-right: 0.75rem;
            font-size: 1rem;
        }

        .nav-text {
            flex-grow: 1;
        }

        .badge {
            background: var(--primary-light);
            color: white;
            font-size: 0.75rem;
            font-weight: 600;
            padding: 0.2rem 0.5rem;
            border-radius: 9999px;
        }

        .sidebar-footer {
            padding: 1rem 1.5rem;
            border-top: 1px solid rgba(255, 255, 255, 0.1);
            margin-top: auto;
        }

        .sidebar.collapsed {
            width: 80px;
        }

        .sidebar.collapsed .logo-text,
        .sidebar.collapsed .nav-text,
        .sidebar.collapsed .nav-title,
        .sidebar.collapsed .badge {
            display: none;
        }

        .sidebar.collapsed .nav-link {
            display: flex;
            justify-content: center;
            padding: 0.75rem;
        }

        .sidebar.collapsed .nav-icon {
            margin-right: 0;
            font-size: 1.25rem;
        }

        .sidebar.collapsed .sidebar-footer {
            display: none;
        }

        /* Main Content */
        .main-content {
            flex: 1;
            margin-left: 280px;
            transition: var(--transition);
            padding: 0;
            min-height: 100vh;
            display: flex;
            flex-direction: column;
        }

        .sidebar.collapsed ~ .main-content {
            margin-left: 80px;
        }

        /* Navbar */
        .top-nav {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 1rem 2rem;
            background: white;
            box-shadow: var(--shadow-sm);
            height: 70px;
            position: sticky;
            top: 0;
            z-index: 5;
        }

        .page-title {
            font-size: 1.5rem;
            font-weight: 600;
            color: var(--dark);
        }

        .top-nav-items {
            display: flex;
            align-items: center;
            gap: 1.5rem;
        }

        .nav-action {
            background: none;
            border: none;
            color: var(--secondary);
            font-size: 1.25rem;
            cursor: pointer;
            transition: var(--transition);
            position: relative;
        }

        .nav-action:hover {
            color: var(--primary);
        }

        .notification-indicator {
            position: absolute;
            top: -5px;
            right: -5px;
            width: 16px;
            height: 16px;
            border-radius: 50%;
            background: var(--danger);
            border: 2px solid white;
        }

        .search-bar {
            display: flex;
            align-items: center;
            background: var(--gray-100);
            border-radius: var(--radius);
            padding: 0.5rem 1rem;
            width: 300px;
        }

        .search-bar input {
            background: transparent;
            border: none;
            outline: none;
            padding: 0.25rem 0.5rem;
            font-size: 0.875rem;
            width: 100%;
        }

        .search-icon {
            color: var(--gray-400);
            font-size: 0.875rem;
        }

        .user-profile {
            display: flex;
            align-items: center;
            gap: 0.75rem;
            cursor: pointer;
        }

        .avatar {
            width: 40px;
            height: 40px;
            border-radius: 50%;
            background: var(--primary-light);
            display: flex;
            align-items: center;
            justify-content: center;
            color: white;
            font-weight: 600;
            font-size: 1rem;
        }

        .user-info {
            display: flex;
            flex-direction: column;
        }

        .user-name {
            font-weight: 600;
            font-size: 0.875rem;
            color: var(--dark);
        }

        .user-role {
            font-size: 0.75rem;
            color: var(--secondary);
        }

        /* Dashboard Content */
        .dashboard-content {
            padding: 2rem;
            flex: 1;
        }

        .grid-container {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
            gap: 1.5rem;
            margin-bottom: 2rem;
        }

        .card {
            background: white;
            border-radius: var(--radius);
            box-shadow: var(--shadow);
            padding: 1.5rem;
            transition: var(--transition);
        }

        .card:hover {
            box-shadow: var(--shadow-md);
            transform: translateY(-5px);
        }

        .card-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 1rem;
        }

        .card-title {
            font-size: 1rem;
            font-weight: 600;
            color: var(--dark);
        }

        .card-icon {
            width: 40px;
            height: 40px;
            border-radius: var(--radius);
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 1.25rem;
        }

        .bg-primary {
            background: rgba(58, 86, 212, 0.1);
            color: var(--primary);
        }

        .bg-success {
            background: rgba(16, 185, 129, 0.1);
            color: var(--success);
        }

        .bg-warning {
            background: rgba(245, 158, 11, 0.1);
            color: var(--warning);
        }

        .bg-danger {
            background: rgba(239, 68, 68, 0.1);
            color: var(--danger);
        }

        .card-value {
            font-size: 2rem;
            font-weight: 700;
            margin: 0.5rem 0;
            color: var(--dark);
        }

        .card-label {
            font-size: 0.875rem;
            color: var(--secondary);
        }

        .card-footer {
            display: flex;
            align-items: center;
            margin-top: 1rem;
            font-size: 0.875rem;
        }

        .trend-up {
            color: var(--success);
            display: flex;
            align-items: center;
            gap: 0.25rem;
        }

        .trend-down {
            color: var(--danger);
            display: flex;
            align-items: center;
            gap: 0.25rem;
        }

        .trend-flat {
            color: var(--secondary);
            display: flex;
            align-items: center;
            gap: 0.25rem;
        }

        .trend-period {
            color: var(--secondary);
            margin-left: 0.5rem;
        }

        .large-card {
            grid-column: span 2;
        }

        .chart-container {
            height: 300px;
            position: relative;
        }

        .table-card {
            overflow: auto;
        }

        .data-table {
            width: 100%;
            border-collapse: collapse;
        }

        .data-table th {
            text-align: left;
            padding: 1rem;
            background: var(--gray-100);
            font-weight: 600;
            color: var(--secondary);
            text-transform: uppercase;
            font-size: 0.75rem;
            letter-spacing: 0.05em;
        }

        .data-table td {
            padding: 1rem;
            border-top: 1px solid var(--gray-200);
            font-size: 0.875rem;
        }

        .data-table tr:hover {
            background: var(--gray-100);
        }

        .status {
            display: inline-flex;
            align-items: center;
            gap: 0.25rem;
            padding: 0.25rem 0.5rem;
            border-radius: 9999px;
            font-size: 0.75rem;
            font-weight: 600;
        }

        .status-complete {
            background: rgba(16, 185, 129, 0.1);
            color: var(--success);
        }

        .status-pending {
            background: rgba(245, 158, 11, 0.1);
            color: var(--warning);
        }

        .status-cancel {
            background: rgba(239, 68, 68, 0.1);
            color: var(--danger);
        }

        /* Action buttons */
        .btn {
            display: inline-flex;
            align-items: center;
            justify-content: center;
            gap: 0.5rem;
            padding: 0.5rem 1rem;
            border-radius: var(--radius);
            font-weight: 500;
            font-size: 0.875rem;
            cursor: pointer;
            transition: var(--transition);
            border: none;
        }

        .btn-primary {
            background: var(--primary);
            color: white;
        }

        .btn-primary:hover {
            background: var(--primary-light);
            transform: translateY(-2px);
            box-shadow: var(--shadow);
        }

        .btn-outline {
            background: transparent;
            border: 1px solid var(--gray-300);
            color: var(--secondary);
        }

        .btn-outline:hover {
            border-color: var(--primary);
            color: var(--primary);
        }

        .btn-sm {
            padding: 0.25rem 0.5rem;
            font-size: 0.75rem;
        }

        .action-buttons {
            display: flex;
            gap: 0.5rem;
        }

        /* Upload Form */
        .upload-container {
            background: white;
            border-radius: var(--radius);
            box-shadow: var(--shadow);
            padding: 1.5rem;
            margin-top: 2rem;
        }

        .upload-title {
            font-size: 1rem;
            font-weight: 600;
            margin-bottom: 1rem;
            color: var(--dark);
        }

        .upload-form {
            display: flex;
            gap: 1rem;
            align-items: center;
        }

        .file-input-container {
            position: relative;
            flex-grow: 1;
        }

        .file-input {
            width: 100%;
            padding: 0.75rem;
            border: 1px dashed var(--gray-300);
            border-radius: var(--radius);
            background: var(--gray-100);
            cursor: pointer;
            transition: var(--transition);
            color: var(--secondary);
        }

        .file-input:hover {
            border-color: var(--primary);
            background: rgba(58, 86, 212, 0.05);
        }

        /* Responsive styles */
        @media (max-width: 1024px) {
            .sidebar {
                width: 80px;
            }

            .sidebar .logo-text,
            .sidebar .nav-text,
            .sidebar .nav-title,
            .sidebar .badge {
                display: none;
            }

            .sidebar .nav-link {
                display: flex;
                justify-content: center;
                padding: 0.75rem;
            }

            .sidebar .nav-icon {
                margin-right: 0;
                font-size: 1.25rem;
            }

            .sidebar .sidebar-footer {
                display: none;
            }

            .main-content {
                margin-left: 80px;
            }

            .large-card {
                grid-column: auto;
            }
        }

        @media (max-width: 768px) {
            .grid-container {
                grid-template-columns: 1fr;
            }

            .search-bar {
                display: none;
            }

            .top-nav {
                padding: 1rem;
            }
        }

        @media (max-width: 480px) {
            .user-info {
                display: none;
            }

            .dashboard-content {
                padding: 1rem;
            }
        }
    </style>
</head>
<body>
    <div class="container">
        <!-- Sidebar -->
        <aside class="sidebar" id="sidebar">
            <div class="sidebar-header">
                <div class="sidebar-logo">
                    <img src="../img/aa.png" alt="Mega City Cab" class="logo-img">
                    <span class="logo-text">Mega City Cab</span>
                </div>
                <button class="sidebar-toggle" onclick="toggleSidebar()">
                    <i class="fas fa-chevron-left"></i>
                </button>
            </div>

            <div class="nav-section">
                <h3 class="nav-title">Main</h3>
                <ul class="nav-menu">
                    <li class="nav-item">
                        <a href="dashboard.jsp" class="nav-link active">
                            <i class="fas fa-tachometer-alt nav-icon"></i>
                            <span class="nav-text">Dashboard</span>
                        </a>
                    </li>
                    <li class="nav-item">
                        <a href="#" class="nav-link">
                            <i class="fas fa-taxi nav-icon"></i>
                            <span class="nav-text">Bookings</span>
                            <span class="badge">5</span>
                        </a>
                    </li>
                </ul>
            </div>

            <div class="nav-section">
                <h3 class="nav-title">Management</h3>
                <ul class="nav-menu">
                    <li class="nav-item">
                        <a href="customerManagement.jsp" class="nav-link">
                            <i class="fas fa-users nav-icon"></i>
                            <span class="nav-text">Customers</span>
                        </a>
                    </li>
                    <li class="nav-item">
                        <a href="customerManagement.jsp" class="nav-link">
                            <i class="fas fa-id-card nav-icon"></i>
                            <span class="nav-text">Drivers</span>
                        </a>
                    </li>
                    <li class="nav-item">
                        <a href="ManagePlaces.jsp" class="nav-link">
                            <i class="fas fa-map-marker-alt nav-icon"></i>
                            <span class="nav-text">Manage L & D</span>
                        </a>
                    </li>
                </ul>
            </div>

            <div class="nav-section">
                <h3 class="nav-title">Communications</h3>
                <ul class="nav-menu">
                    <li class="nav-item">
                        <a href="Customer_review.jsp" class="nav-link">
                            <i class="fas fa-star nav-icon"></i>
                            <span class="nav-text">Reviews</span>
                        </a>
                    </li>
                    <li class="nav-item">
                        <a href="#" class="nav-link">
                            <i class="fas fa-envelope nav-icon"></i>
                            <span class="nav-text">Messages</span>
                            <span class="badge">3</span>
                        </a>
                    </li>
                </ul>
            </div>

            <div class="nav-section">
                <h3 class="nav-title">Settings</h3>
                <ul class="nav-menu">
                    <li class="nav-item">
                        <a href="#" class="nav-link">
                            <i class="fas fa-cog nav-icon"></i>
                            <span class="nav-text">Settings</span>
                        </a>
                    </li>
                    <li class="nav-item">
                        <a href="<%= request.getContextPath() %>/admin/AdminLogout" class="nav-link">
                            <i class="fas fa-sign-out-alt nav-icon"></i>
                            <span class="nav-text">Logout</span>
                        </a>
                    </li>
                </ul>
            </div>
        </aside>

        <!-- Main Content -->
        <main class="main-content">
            <!-- Top Navigation -->
            <nav class="top-nav">
                <h1 class="page-title">Dashboard</h1>
                <div class="top-nav-items">
                    <div class="search-bar">
                        <i class="fas fa-search search-icon"></i>
                        <input type="text" placeholder="Search...">
                    </div>
                    <button class="nav-action">
                        <i class="fas fa-bell"></i>
                        <span class="notification-indicator"></span>
                    </button>
                    <button class="nav-action">
                        <i class="fas fa-envelope"></i>
                        <span class="notification-indicator"></span>
                    </button>
                    <div class="user-profile">
                        <div class="avatar">
                            <i class="fas fa-user"></i>
                        </div>
                        <div class="user-info">
                            <span class="user-name"><%= adminUser %></span>
                            <span class="user-role">Administrator</span>
                        </div>
                    </div>
                </div>
            </nav>

            <!-- Dashboard Content -->
            <div class="dashboard-content">
                <!-- Stats Cards -->
                <div class="grid-container">
                    <div class="card animate_animated animate_fadeInUp" style="animation-delay: 0.1s;">
                        <div class="card-header">
                            <h2 class="card-title">Total Bookings</h2>
                            <div class="card-icon bg-primary">
                                <i class="fas fa-taxi"></i>
                            </div>
                        </div>
                        <div class="card-value">1,248</div>
                        <div class="card-label">All-time bookings</div>
                        <div class="card-footer">
                            <div class="trend-up">
                                <i class="fas fa-arrow-up"></i>
                                <span>12.5%</span>
                            </div>
                            <span class="trend-period">vs last month</span>
                        </div>
                    </div>

                    <div class="card animate_animated animate_fadeInUp" style="animation-delay: 0.2s;">
                        <div class="card-header">
                            <h2 class="card-title">Active Customers</h2>
                            <div class="card-icon bg-success">
                                <i class="fas fa-users"></i>
                            </div>
                        </div>
                        <div class="card-value">756</div>
                        <div class="card-label">Registered users</div>
                        <div class="card-footer">
                            <div class="trend-up">
                                <i class="fas fa-arrow-up"></i>
                                <span>8.2%</span>
                            </div>
                            <span class="trend-period">vs last month</span>
                        </div>
                    </div>

                    <div class="card animate_animated animate_fadeInUp" style="animation-delay: 0.3s;">
                        <div class="card-header">
                            <h2 class="card-title">Active Drivers</h2>
                            <div class="card-icon bg-warning">
                                <i class="fas fa-id-card"></i>
                            </div>
                        </div>
                        <div class="card-value">124</div>
                        <div class="card-label">Available drivers</div>
                        <div class="card-footer">
                            <div class="trend-flat">
                                <i class="fas fa-minus"></i>
                                <span>0.5%</span>
                            </div>
                            <span class="trend-period">vs last month</span>
                        </div>
                    </div>

                    <div class="card animate_animated animate_fadeInUp" style="animation-delay: 0.4s;">
                        <div class="card-header">
                            <h2 class="card-title">Revenue</h2>
                            <div class="card-icon bg-danger">
                                <i class="fas fa-dollar-sign"></i>
                            </div>
                        </div>
                        <div class="card-value">$24,568</div>
                        <div class="card-label">This month</div>
                        <div class="card-footer">
                            <div class="trend-down">
                                <i class="fas fa-arrow-down"></i>
                                <span>3.1%</span>
                            </div>
                            <span class="trend-period">vs last month</span>
                        </div>
                    </div>
                </div>

                <!-- Charts -->
                <div class="grid-container">
                    <div class="card large-card animate_animated animate_fadeInUp" style="animation-delay: 0.5s;">
                        <div class="card-header">
                            <h2 class="card-title">Booking Statistics</h2>
                            <div>
                                <button class="btn btn-outline btn-sm">Daily</button>
                                <button class="btn btn-primary btn-sm">Weekly</button>
                                <button class="btn btn-outline btn-sm">Monthly</button>
                            </div>
                        </div>
                        <div class="chart-container">
                            <canvas id="bookingChart"></canvas>
                        </div>
                    </div>

                    <div class="card animate_animated animate_fadeInUp" style="animation-delay: 0.6s;">
                        <div class="card-header">
                            <h2 class="card-title">Customer Distribution</h2>
                        </div>
                        <div class="chart-container">
                            <canvas id="customerChart"></canvas>
                        </div>
                    </div>

                    <div class="card animate_animated animate_fadeInUp" style="animation-delay: 0.7s;">
                        <div class="card-header">
                            <h2 class="card-title">Popular Destinations</h2>
                        </div>
                        <div class="chart-container">
                            <canvas id="locationChart"></canvas>
                        </div>
                    </div>
                </div>

                <!-- Recent Bookings Table -->
                <div class="card table-card animate_animated animate_fadeInUp" style="animation-delay: 0.8s;">
                    <div class="card-header">
                        <h2 class="card-title">Recent Bookings</h2>
                        <a href="#" class="btn btn-primary btn-sm">View All</a>
                    </div>
                    <table class="data-table">
                        <thead>
                            <tr>
                                <th>Booking ID</th>
                                <th>Customer</th>
                                <th>Origin</th>
                                <th>Destination</th>
                                <th>Driver</th>
                                <th>Amount</th>
                                <th>Status</th>
                                <th>Actions</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>#BK-1234</td>
                                <td>John Smith</td>
                                <td>Central Park</td>
                                <td>JFK Airport</td>
                                <td>Michael Davis</td>
                                <td>$45.00</td>
                                <td><span class="status status-complete"><i class="fas fa-check-circle"></i> Completed</span></td>
                                <td>
                                    <div class="action-buttons">
                                        <button class="btn btn-outline btn-sm"><i class="fas fa-eye"></i> View</button>
                                        <button class="btn btn-outline btn-sm"><i class="fas fa-print"></i> Receipt</button>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td>#BK-1235</td>
                                <td>Emily Johnson</td>
                                <td>Downtown Mall</td>
                                <td>Harbor View Hotel</td>
                                <td>Robert Wilson</td>
                                <td>$28.50</td>
                                <td><span class="status status-complete"><i class="fas fa-check-circle"></i> Completed</span></td>
                                <td>
                                    <div class="action-buttons">
                                        <button class="btn btn-outline btn-sm"><i class="fas fa-eye"></i> View</button>
                                        <button class="btn btn-outline btn-sm"><i class="fas fa-print"></i> Receipt</button>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td>#BK-1236</td>
                                <td>Alex Brown</td>
                                <td>Westside Apartments</td>
                                <td>City Hospital</td>
                                <td>Pending</td>
                                <td>$32.00</td>
                                <td><span class="status status-pending"><i class="fas fa-clock"></i> Pending</span></td>
                                <td>
                                    <div class="action-buttons">
                                        <button class="btn btn-outline btn-sm"><i class="fas fa-eye"></i> View</button>
                                        <button class="btn btn-primary btn-sm"><i class="fas fa-user-check"></i> Assign</button>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td>#BK-1237</td>
                                <td>Sarah Miller</td>
                                <td>Grand Hotel</td>
                                <td>International Airport</td>
                                <td>David Clark</td>
                                <td>$55.00</td>
                                <td><span class="status status-cancel"><i class="fas fa-times-circle"></i> Cancelled</span></td>
                                <td>
                                    <div class="action-buttons">
                                        <button class="btn btn-outline btn-sm"><i class="fas fa-eye"></i> View</button>
                                        <button class="btn btn-outline btn-sm"><i class="fas fa-history"></i> Rebook</button>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td>#BK-1238</td>
                                <td>Thomas Anderson</td>
                                <td>City Center</td>
                                <td>Tech Park</td>
                                <td>James Wilson</td>
                                <td>$18.75</td>
                                <td><span class="status status-pending"><i class="fas fa-clock"></i> In Progress</span></td>
                                <td>
                                    <div class="action-buttons">
                                        <button class="btn btn-outline btn-sm"><i class="fas fa-eye"></i> View</button>
                                        <button class="btn btn-outline btn-sm"><i class="fas fa-map-marker-alt"></i> Track</button>
                                    </div>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>

                <!-- Profile Upload Form -->
                <div class="upload-container animate_animated animate_fadeInUp" style="animation-delay: 0.9s;">
                    <h2 class="upload-title">Update Admin Profile</h2>
                    <form action="UploadAdminImage" method="post" enctype="multipart/form-data" class="upload-form">
                        <div class="file-input-container">
                            <input type="file" name="profileImage" accept="image/*" class="file-input" required>
                        </div>
                        <button type="submit" class="btn btn-primary">Upload Image</button>
                    </form>
                </div>
            </div>
        </main>
    </div>

    <script>
        // Toggle Sidebar
        function toggleSidebar() {
            document.getElementById('sidebar').classList.toggle('collapsed');
        }

        // Charts
        document.addEventListener('DOMContentLoaded', function() {
            // Booking Statistics Chart
            const bookingCtx = document.getElementById('bookingChart').getContext('2d');
            const bookingChart = new Chart(bookingCtx, {
                type: 'line',
                data: {
                    labels: ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'],
                    datasets: [{
                        label: 'Bookings',
                        data: [65, 59, 80, 81, 56, 85, 90],
                        fill: true,
                        backgroundColor: 'rgba(58, 86, 212, 0.1)',
                        borderColor: '#3a56d4',
                        tension: 0.4,
                        pointBackgroundColor: '#3a56d4',
                        pointBorderColor: '#fff',
                        pointBorderWidth: 2,
                        pointRadius: 4
                    }]
                },
                options: {
                    responsive: true,
                    maintainAspectRatio: false,
                    plugins: {
                        legend: {
                            display: false
                        }
                    },
                    scales: {
                        y: {
                            beginAtZero: true,
                            grid: {
                                drawBorder: false
                            }
                        },
                        x: {
                            grid: {
                                display: false
                            }
                        }
                    }
                }
            });

            // Customer Distribution Chart
            const customerCtx = document.getElementById('customerChart').getContext('2d');
            const customerChart = new Chart(customerCtx, {
                type: 'doughnut',
                data: {
                    labels: ['New', 'Regular', 'VIP'],
                    datasets: [{
                        data: [30, 50, 20],
                        backgroundColor: ['#3a56d4', '#10b981', '#f59e0b'],
                        borderColor: '#ffffff',
                        borderWidth: 2
                    }]
                },
                options: {
                    responsive: true,
                    maintainAspectRatio: false,
                    plugins: {
                        legend: {
                            position: 'bottom'
                        }
                    }
                }
            });

            // Popular Locations Chart
            const locationCtx = document.getElementById('locationChart').getContext('2d');
            const locationChart = new Chart(locationCtx, {
                type: 'bar',
                data: {
                    labels: ['Airport', 'Downtown', 'Mall', 'Hospital', 'Hotel'],
                    datasets: [{
                        label: 'Rides',
                        data: [120, 90, 70, 60, 80],
                        backgroundColor: [
                            'rgba(58, 86, 212, 0.8)',
                            'rgba(58, 86, 212, 0.7)',
                            'rgba(58, 86, 212, 0.6)',
                            'rgba(58, 86, 212, 0.5)',
                            'rgba(58, 86, 212, 0.4)'
                        ],
                        borderWidth: 0,
                        borderRadius: 4
                    }]
                },
                options: {
                    responsive: true,
                    maintainAspectRatio: false,
                    plugins: {
                        legend: {
                            display: false
                        }
                    },
                    scales: {
                        y: {
                            beginAtZero: true,
                            grid: {
                                drawBorder: false
                            }
                        },
                        x: {
                            grid: {
                                display: false
                            }
                        }
                    }
                }
            });
        });

        // Add animation to cards
        document.addEventListener('DOMContentLoaded', function() {
            const cards = document.querySelectorAll('.card');
            
            cards.forEach((card, index) => {
                card.addEventListener('mouseenter', function() {
                    this.style.transform = 'translateY(-8px)';
                    this.style.boxShadow = 'var(--shadow-lg)';
                });
                
                card.addEventListener('mouseleave', function() {
                    this.style.transform = 'translateY(-5px)';
                    this.style.boxShadow = 'var(--shadow)';
                });
            });
        });
    </script>
</body>
</html>