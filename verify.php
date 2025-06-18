<?php
require_once 'functions.php';

$email = $_GET['email'] ?? '';
$code = $_GET['code'] ?? '';
$success = false;

if (!empty($email) && !empty($code)) {
    $success = verifySubscription($email, $code);
}
?>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Subscription Verification</title>
    <style>
        body { font-family: Arial, sans-serif; max-width: 600px; margin: 0 auto; padding: 20px; }
        .message { padding: 15px; margin: 20px 0; border-radius: 4px; }
        .success { background-color: #dff0d8; color: #3c763d; }
        .error { background-color: #f2dede; color: #a94442; }
        a { color: #337ab7; text-decoration: none; }
        a:hover { text-decoration: underline; }
    </style>
</head>
<body>
    <h2 id="verification-heading">Subscription Verification</h2>
    
    <?php if ($success): ?>
        <div class="message success">
            <p>Your email has been verified successfully. You will now receive task reminders.</p>
        </div>
    <?php else: ?>
        <div class="message error">
            <p>Invalid verification link. Please try subscribing again.</p>
        </div>
    <?php endif; ?>
    
    <p><a href="index.php">Return to Task Planner</a></p>
</body>
</html>
