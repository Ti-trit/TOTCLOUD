<?php
session_start();
if (!isset($_SESSION["nomAdmin"])) {
    $_SESSION["nomAdmin"] = "Guest";
}
?>
<header>
    <nav class="navbar">
        <ul>
        <?php 
                $basePath = (basename(dirname($_SERVER['PHP_SELF'])) == 'totCloud') ? './' : '../';
                ?>
            <a href="<?php echo $basePath; ?>home.php" class="style1">
                <strong>TotCloud</strong>
            </a>
            <li class="welcome-message">
                Admin <span class="style1"><?php echo $_SESSION["nomAdmin"]; ?></span>
            </li>
            <li class="logout">
                <?php 
                $basePath = (basename(dirname($_SERVER['PHP_SELF'])) == 'totCloud') ? './' : '../';
                ?>
                <a href="<?php echo $basePath; ?>LogOut.php">
                    <span class="icon-user">&#128100;</span> <strong>Log Out</strong>
                </a>
            </li>
        </ul>
    </nav>
</header>
