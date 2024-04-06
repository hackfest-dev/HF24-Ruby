<?php
// Supabase credentials
$supabaseUrl = 'https://postgres://postgres.epectjzmhhtrttlpwghp:c!h)9yLU!JD6S@,@aws-0-ap-south-1.pooler.supabase.com:5432/postgres.supabase.co';
$supabaseKey = 'c!h)9yLU!JD6S@,';

// Endpoint for user authentication
$endpoint = $supabaseUrl . '/auth/v1/token?grant_type=password';

// User credentials from the login form
$phone = $_POST['phone'];
$password = $_POST['password'];

// Create the request body
$data = http_build_query([
    'phone' => $phone,
    'password' => $password,
]);

// Initialize cURL session
$curl = curl_init($endpoint);

// Set cURL options
curl_setopt($curl, CURLOPT_RETURNTRANSFER, true);
curl_setopt($curl, CURLOPT_POST, true);
curl_setopt($curl, CURLOPT_POSTFIELDS, $data);
curl_setopt($curl, CURLOPT_HTTPHEADER, [
    'Content-Type: application/x-www-form-urlencoded',
    'apikey: ' . $supabaseKey,
]);

// Execute the request
$response = curl_exec($curl);

// Check for errors
if (curl_errno($curl)) {
    echo 'Error: ' . curl_error($curl);
} else {
    // Decode the response JSON
    $responseData = json_decode($response, true);

    // Check if authentication was successful
    if (isset($responseData['access_token'])) {
        // Authentication successful, you can now handle the user session
        $accessToken = $responseData['access_token'];
        // Redirect user to the dashboard page
        header("Location: volunteerdashboard.html");
        exit;
    } else {
        // Authentication failed
        // Display error message or redirect back to login page with error
        header("Location: volunteerlogin.html?error=1");
        exit;
    }
}

// Close cURL session
curl_close($curl);
?>
