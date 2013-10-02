<?php
// Check password.
if ((!isset($_REQUEST['password']) || $_REQUEST['password'] !== $_SERVER['DRUPAL_UPDATE_PASSWORD']) && PHP_SAPI !== 'cli') {
  die("Wrong password");
}

ob_start();
chdir("./");

error_reporting(E_ALL);
ini_set('display_errors', true);
ini_set('display_startup_errors', true);
ini_set('memory_limit', '2G');
set_time_limit(0);

$libraries = array();

// The commands
$commands = array(
  'echo $PWD',
  'whoami',
  'hostname',
  'git reset --hard',
  'git pull',
  'git submodule init',
  'git submodule update'
);

if(count($libraries) > 0){
  foreach ($libraries as $path => $location) {
    if (file_exists("{$path}")) {
      $commands[] = "cd {$path}; git pull";
    } else {
      $commands[] = "mkdir {$path} -p; cd {$path}; pwd; git clone {$location} . --verbose";
    }
  }
}

// Run the commands for output
$output = '';
foreach ($commands AS $command) {
  // Run it
  $tmp = shell_exec($command);
  // Output
  $output .= "<span style=\"color: #6BE234;\">\$</span> <span style=\"color: #729FCF;\">{$command}\n</span>";
  $output .= htmlentities(trim($tmp)) . "\n";
}

// Log revision to txt file
exec("echo `git rev-parse --short HEAD`: `git log -n 1 HEAD --format=%s` > version.txt");

if (PHP_SAPI !== 'cli') {
  ?>
  <!DOCTYPE HTML>
  <html lang="en-US">
  <head>
    <meta charset="UTF-8">
    <title>GIT DEPLOYMENT SCRIPT</title>
  </head>
  <body style="background-color: #000000; color: #FFFFFF; font-weight: bold; padding: 0 10px;">
<pre>
 .  ____  .    ____________________________
 |/      \|   |                            |
[| <span style="color: #FF0000;">&hearts; &hearts;</span> |]  | Git Deployment Script v0.1 |
 |___==___|  / &copy; oodavid 2012 |
              |____________________________|

  <?php echo $output; ?>
</pre>
  </body>
  </html>
  <?php
  $output = ob_get_contents();

  ob_end_clean();
}
echo $output;

$to = "matthew@fouroneone.us";
// To send HTML mail, the Content-type header must be set
$headers = 'MIME-Version: 1.0' . "\r\n";
$headers .= 'Content-type: text/html; charset=iso-8859-1' . "\r\n";
$headers .= 'To: ' . $to . "\r\n";
$headers .= 'From: GitHub AutoDeploy on ' . gethostname() . " <service@pushy.fouroneone.us>\r\n";

mail(
  $to,
  "Deployment on " . gethostname() . " at " . date("d/m/Y H:i:s"),
  $output,
  $headers
);
?>