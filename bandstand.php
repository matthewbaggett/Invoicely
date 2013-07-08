<?php
if(!file_exists('bandstand.json')){
  die("No bandstand.json found");
}
$configuration = file_get_contents('bandstand.json');

$configuration = json_decode($configuration);
foreach($configuration->dependencies as $dependency){
  echo "Unpacking {$dependency->name}...\n";
  if (file_exists($dependency->location)) {
    $command = "cd {$dependency->location}; git pull";
  } else {
    $command = "mkdir {$dependency->location} -p; cd {$dependency->location}; pwd; git clone {$dependency->url} . --verbose";
  }
  // Run it
  $tmp = shell_exec($command);
  // Output
  $output = "<span style=\"color: #6BE234;\">\$</span> <span style=\"color: #729FCF;\">{$command}\n</span>";
  $output .= htmlentities(trim($tmp)) . "\n";
  echo $output;
}