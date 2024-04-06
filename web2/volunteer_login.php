<?php
// Include the Supabase PHP library
require 'vendor/autoload.php';

// Initialize Supabase client
//$supabaseUrl = 'https://postgres://postgres.epectjzmhhtrttlpwghp:c!h)9yLU!JD6S@@aws-0-ap-south-1.pooler.supabase.com:5432/postgres.supabase.co';
//$supabaseKey = 'c!h)9yLU!JD6S@';
$supabaseUrl = 'https://epectjzmhhtrttlpwghp.supabase.co';
$supabaseKey = 'c!h)9yLU!JD6S@';
$supabase = Supabase\Client::builder($supabaseUrl, $supabaseKey)->build();

// Function to authenticate the user
function authenticateUser($phone, $password) {
    global $supabase;

    // Query the database to find the user with the provided phone number
    $response = $supabase->from('users')->select()->eq('phone', $phone)->execute();
    $user = $response->data->count() > 0 ? $response->data[0] : null;

    // Check if the user exists and the password matches
    if ($user && password_verify($password, $user['password'])) {
        return true; // Authentication successful
    }

    return false; // Authentication failed
}

// Check if the form is submitted
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    // Get form data
    $phone = $_POST['phone'];
    $password = $_POST['password'];

    // Authenticate the user
    if (authenticateUser($phone, $password)) {
        // Authentication successful, redirect to the dashboard
        header('Location: volunteerdashboard.html');
        exit;
    } else {
        // Authentication failed, redirect back to the login page with an error
        header('Location: volunteerlogin.html?error=1');
        exit;
    }
}
?>
