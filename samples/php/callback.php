<?php                                    
/**
 * This is sample subscription endpoint for using Facebook real-time update
 * See http://developers.facebook.com/docs/api/realtime to additional
 * documentation
 */

// Please make sure to REPLACE the value of VERIFY_TOKEN 'abc' with 
// your own secret string. This is the value to pass to Facebook 
//  when adding/modifying this subscription.
define('VERIFY_TOKEN', 'abc');                                    
$method = $_SERVER['REQUEST_METHOD'];                             
   
// In PHP, dots and spaces in query parameter names are converted to 
// underscores automatically. So we need to check "hub_mode" instead
//  of "hub.mode".                                                      
if ($method == 'GET' && $_GET['hub_mode'] == 'subscribe' &&       
    $_GET['hub_verify_token'] == VERIFY_TOKEN) {
  echo $_GET['hub_challenge'];
} else if ($method == 'POST') {                                   
  $updates = json_decode(file_get_contents("php://input"), true); 
  // Replace with your own code here to handle the update 
  // Note the request must complete within 15 seconds.
  // Otherwise Facebook server will consider it a timeout and 
  // resend the push notification again.
  error_log('updates = ' . print_r($updates, true));              
}