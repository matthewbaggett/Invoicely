<?php

/**
 * @file
 * Provides theme overrides and implementations for the Node module.
 */

/**
 * Processes variables for node.tpl.php.
 */
function invoicelyui_process_node(&$vars) {
  list($vars['title'], ) = _invoicelyui_parse_title($vars['title']);
}
