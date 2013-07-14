<?php
if(!file_exists('bandstand.json')){
  die("No bandstand.json found");
}
$configuration = file_get_contents('bandstand.json');

$configuration = json_decode($configuration);
foreach($configuration->dependencies as $dependency){
  echo "Unpacking {$dependency->name}...\n";
  $tmp_location = "tmp/" . str_replace(" ", "_", $dependency->name);
  shell_exec("mkdir -p {$tmp_location}");
  shell_exec("git clone {$dependency->url} {$tmp_location}");
  shell_exec("mkdir -p {$dependency->location}");
  shell_exec("cp -Rv {$tmp_location}/* {$dependency->location}");
}exit;
echo "Cleaning up..\n";
shell_exec('rm -Rf tmp/ ');