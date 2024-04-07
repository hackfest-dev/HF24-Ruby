<?php
require 'vendor/autoload.php';

use Supabase\SupabaseClient;
$supabaseUrl = 'https://epectjzmhhtrttlpwghp.supabase.co';
$supabaseKey = 'c!h)9yLU!JD6S@';
$supabase = new SupabaseClient($supabaseUrl, $supabaseKey);

function authenticateDriver($phone, $password) {
    global $supabase;
    $response = $supabase->from('drivers')->select()->eq('phone', $phone)->execute();
    $driver = $response->data->count() > 0 ? $response->data[0] : null;

    if ($driver && password_verify($password, $driver['password'])) {
        return true;
    }

    return false;
}

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $phone = $_POST['phone'];
    $password = $_POST['password'];

    if (authenticateDriver($phone, $password)) {
        header('Location: driverdashboard.html');
        exit;
    } else {
        // Display an error message
        echo "Incorrect phone number or password. Please sign up first.";
    }
}
?>
