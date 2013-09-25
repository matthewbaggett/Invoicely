<?php

/**
 * @file
 * Provides theme overrides and implementations for the Block module.
 */

/**
 * Preprocesses variables for block.tpl.php.
 */
function invoicelyui_preprocess_block(&$vars) {
  $block = $vars['block'];

  if ($block->region == 'featured') {
    $vars['classes_array'][] = 'item';
    if ($vars['block_id'] == 1) {
      $vars['classes_array'][] = 'active';
    }
  }
}
