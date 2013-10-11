<?php

header("Content-type: text/plain");
var_dump($_SERVER);


echo "\n\n*********\n\n";

echo file_get_contents("sites/default/settings.php");