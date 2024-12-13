<?php
session_start();
if (!isset($_SESSION["nomAdmin"])) {
    $_SESSION["nomAdmin"] = "Guest";
}
?>
<header>
    <nav class="navbar">
        <ul>
            <a href="../home.php" class="style1">
                <strong>TotCloud</strong>
            </a>
            <li class="welcome-message">
                Admin <span class="style1"><?php echo $_SESSION["nomAdmin"]; ?></span>
            </li>
            <li class="logout">
                <a href="<?php echo dirname(__DIR__) . '/LogOut.php'; ?>">
                    <span class="icon-user">&#128100;</span> <strong>Log Out</strong>
                </a>
            </li>
        </ul>
    </nav>
</header>