<?php

/**
 * @file
 * Provides views theme override functions for invoicely themes.
 */

/**
 * Display a view as a table style.
 */
function invoicely_preprocess_views_view_table(&$vars) {
  $vars['classes_array'][] = 'table';
}

function invoicely_preprocess_views_view_grid(&$vars) {
  $vars['class'] .= ' table';
}
