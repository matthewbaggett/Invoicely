<?php
// Check password.
if ((!isset($_REQUEST['password']) || $_REQUEST['password'] !== $_ENV['DRUPAL_UPDATE_PASSWORD']) && PHP_SAPI !== 'cli') {
  die("Wrong password");
}
error_reporting(E_ALL);
ini_set('display_errors', TRUE);
ini_set('display_startup_errors', TRUE);
ini_set('memory_limit', '2G');
set_time_limit (0);

define('DRUPAL_ROOT', getcwd());

$_SERVER['REMOTE_ADDR'] = isset($_SERVER['REMOTE_ADDR']) ? $_SERVER['REMOTE_ADDR'] : '127.0.0.1';
include_once './includes/bootstrap.inc';
drupal_bootstrap(DRUPAL_BOOTSTRAP_FULL);

echo "<pre>";
echo "Clear.php running...\n\n"; flush();

echo "Rebuilding registry:";
registry_rebuild();
echo " OKAY\n\n"; flush();

if(function_exists('entitycache_flush_clear_cache')){
    echo "Flushing Entity Cache:";
    entitycache_flush_clear_cache('user');
    entitycache_flush_clear_cache('node');
    entitycache_flush_clear_cache('file');
    entitycache_flush_clear_cache('comment');
    echo " OKAY\n\n"; flush();
}

echo "Flushing CSS & JS:";
_drupal_flush_css_js();
drupal_clear_css_cache();
drupal_clear_js_cache();
echo " OKAY\n\n"; flush();

// Rebuild the theme data. Note that the module data is rebuilt above, as
// part of registry_rebuild().
echo "Rebuilding themes:";
system_rebuild_theme_data();
drupal_theme_rebuild();
echo " OKAY\n\n"; flush();

echo "Rebuilding node types: ";
node_types_rebuild();
echo " OKAY\n\n"; flush();

echo "Rebuilding menu:";
menu_rebuild();
echo " OKAY\n"; flush();

echo "Synchronise actions:";
actions_synchronize();
echo " OKAY\n\n"; flush();

echo "Truncating truncatable tables:\n";
$truncatable_tables = array('flood');
foreach($truncatable_tables as $table){
    echo " > {$table}\n"; flush();
    db_query("TRUNCATE $table");
}
echo "done...\n\n"; flush();

echo "Clearing cache tables:\n";
$core = array('cache', 'cache_path', 'cache_filter', 'cache_bootstrap', 'cache_page');
$cache_tables = array_merge(module_invoke_all('flush_caches'), $core);
foreach ($cache_tables as $table) {
    echo " > {$table}\n"; flush();
    cache_clear_all('*', $table, TRUE);
}
echo "done...\n\n"; flush();

echo "Rebuild bootstrap:";
_system_update_bootstrap_status();
echo " done\n\n"; flush();
echo "</pre>";

menu_router_build();