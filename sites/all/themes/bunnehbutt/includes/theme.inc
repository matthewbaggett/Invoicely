<?php

/**
 * @file
 * Provides custom theme overrides and implementations.
 */

/**
 * Processes variables for preface.tpl.php.
 */
function bunnehbutt_process_preface(&$vars) {
  list($vars['title'], $vars['subtitle']) = _bunnehbutt_parse_title($vars['title']);
}

/**
 * Returns HTML for the navbar brand.
 */
function bunnehbutt_navbar_brand($vars) {
  $out = '<a class="brand" href="' . $vars['href'] . '">';
  if ($vars['logo']) {
    $out .= '<img src="' . $vars['logo'] . '" /> ';
  }
  $out .= $vars['name'];
  $out .= '</a>';
  return $out;
}

/**
 * Returns HTML for the navbar toggler.
 */
function bunnehbutt_navbar_toggler($vars) {
  $out = '<button type="button" class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse">';
  $out .= '<span class="icon-bar"></span>';
  $out .= '<span class="icon-bar"></span>';
  $out .= '<span class="icon-bar"></span>';
  $out .= '</button>';
  return $out;
}

/**
 * Returns HTML for the copyright text.
 */
function bunnehbutt_copyright($vars) {
  return date('Y') . ' &copy; ' . $vars['name'];
}

/**
 * Cleans up form markup leaving only <form> and <input> tags.
 */
function bunnehbutt_pure_form_wrapper($vars) {
  return strip_tags($vars['element']['#children'], '<form><input>');
}
