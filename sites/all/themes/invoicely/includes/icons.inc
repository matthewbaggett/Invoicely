<?php

/**
 * @file icons.inc
 * Provides invoicely icon support via Icon API.
 */

/**
 * Implements hook_icon_providers().
 */
function invoicely_icon_providers() {
  $providers['invoicely'] = array(
    'title' => t('invoicely'),
    'url' => 'http://twitter.github.com/invoicely/base-css.html#icons',
  );
  return $providers;
}

/**
 * Implements hook_icon_bundles().
 */
function invoicely_icon_bundles() {
  $bundles['invoicely'] = array(
    'render' => 'sprite',
    'provider' => 'invoicely',
    'title' => t('invoicely'),
    'version' => t('Icons by Glyphicons'),
    'variations' => array(
      'icon-white' => t('White'),
    ),
    'settings' => array(
      'tag' => 'i',
    ),
    'icons' => array(
      'icon-glass' => 'glass',
      'icon-music' => 'music',
      'icon-search' => 'search',
      'icon-envelope' => 'envelope',
      'icon-heart' => 'heart',
      'icon-star' => 'star',
      'icon-star-empty' => 'star-empty',
      'icon-user' => 'user',
      'icon-film' => 'film',
      'icon-th-large' => 'th-large',
      'icon-th' => 'th',
      'icon-th-list' => 'th-list',
      'icon-ok' => 'ok',
      'icon-remove' => 'remove',
      'icon-zoom-in' => 'zoom-in',
      'icon-zoom-out' => 'zoom-out',
      'icon-off' => 'off',
      'icon-signal' => 'signal',
      'icon-cog' => 'cog',
      'icon-trash' => 'trash',
      'icon-home' => 'home',
      'icon-file' => 'file',
      'icon-time' => 'time',
      'icon-road' => 'road',
      'icon-download-alt' => 'download-alt',
      'icon-download' => 'download',
      'icon-upload' => 'upload',
      'icon-inbox' => 'inbox',
      'icon-play-circle' => 'play-circle',
      'icon-repeat' => 'repeat',
      'icon-refresh' => 'refresh',
      'icon-list-alt' => 'list-alt',
      'icon-lock' => 'lock',
      'icon-flag' => 'flag',
      'icon-headphones' => 'headphones',
      'icon-volume-off' => 'volume-off',
      'icon-volume-down' => 'volume-down',
      'icon-volume-up' => 'volume-up',
      'icon-qrcode' => 'qrcode',
      'icon-barcode' => 'barcode',
      'icon-tag' => 'tag',
      'icon-tags' => 'tags',
      'icon-book' => 'book',
      'icon-bookmark' => 'bookmark',
      'icon-print' => 'print',
      'icon-camera' => 'camera',
      'icon-font' => 'font',
      'icon-bold' => 'bold',
      'icon-italic' => 'italic',
      'icon-text-height' => 'text-height',
      'icon-text-width' => 'text-width',
      'icon-align-left' => 'align-left',
      'icon-align-center' => 'align-center',
      'icon-align-right' => 'align-right',
      'icon-align-justify' => 'align-justify',
      'icon-list' => 'list',
      'icon-indent-left' => 'indent-left',
      'icon-indent-right' => 'indent-right',
      'icon-facetime-video' => 'facetime-video',
      'icon-picture' => 'picture',
      'icon-pencil' => 'pencil',
      'icon-map-marker' => 'map-marker',
      'icon-adjust' => 'adjust',
      'icon-tint' => 'tint',
      'icon-edit' => 'edit',
      'icon-share' => 'share',
      'icon-check' => 'check',
      'icon-move' => 'move',
      'icon-step-backward' => 'step-backward',
      'icon-fast-backward' => 'fast-backward',
      'icon-backward' => 'backward',
      'icon-play' => 'play',
      'icon-pause' => 'pause',
      'icon-stop' => 'stop',
      'icon-forward' => 'forward',
      'icon-fast-forward' => 'fast-forward',
      'icon-step-forward' => 'step-forward',
      'icon-eject' => 'eject',
      'icon-chevron-left' => 'chevron-left',
      'icon-chevron-right' => 'chevron-right',
      'icon-plus-sign' => 'plus-sign',
      'icon-minus-sign' => 'minus-sign',
      'icon-remove-sign' => 'remove-sign',
      'icon-ok-sign' => 'ok-sign',
      'icon-question-sign' => 'question-sign',
      'icon-info-sign' => 'info-sign',
      'icon-screenshot' => 'screenshot',
      'icon-remove-circle' => 'remove-circle',
      'icon-ok-circle' => 'ok-circle',
      'icon-ban-circle' => 'ban-circle',
      'icon-arrow-left' => 'arrow-left',
      'icon-arrow-right' => 'arrow-right',
      'icon-arrow-up' => 'arrow-up',
      'icon-arrow-down' => 'arrow-down',
      'icon-share-alt' => 'share-alt',
      'icon-resize-full' => 'resize-full',
      'icon-resize-small' => 'resize-small',
      'icon-plus' => 'plus',
      'icon-minus' => 'minus',
      'icon-asterisk' => 'asterisk',
      'icon-exclamation-sign' => 'exclamation-sign',
      'icon-gift' => 'gift',
      'icon-leaf' => 'leaf',
      'icon-fire' => 'fire',
      'icon-eye-open' => 'eye-open',
      'icon-eye-close' => 'eye-close',
      'icon-warning-sign' => 'warning-sign',
      'icon-plane' => 'plane',
      'icon-calendar' => 'calendar',
      'icon-random' => 'random',
      'icon-comment' => 'comment',
      'icon-magnet' => 'magnet',
      'icon-chevron-up' => 'chevron-up',
      'icon-chevron-down' => 'chevron-down',
      'icon-retweet' => 'retweet',
      'icon-shopping-cart' => 'shopping-cart',
      'icon-folder-close' => 'folder-close',
      'icon-folder-open' => 'folder-open',
      'icon-resize-vertical' => 'resize-vertical',
      'icon-resize-horizontal' => 'resize-horizontal',
      'icon-hdd' => 'hdd',
      'icon-bullhorn' => 'bullhorn',
      'icon-bell' => 'bell',
      'icon-certificate' => 'certificate',
      'icon-thumbs-up' => 'thumbs-up',
      'icon-thumbs-down' => 'thumbs-down',
      'icon-hand-right' => 'hand-right',
      'icon-hand-left' => 'hand-left',
      'icon-hand-up' => 'hand-up',
      'icon-hand-down' => 'hand-down',
      'icon-circle-arrow-right' => 'circle-arrow-right',
      'icon-circle-arrow-left' => 'circle-arrow-left',
      'icon-circle-arrow-up' => 'circle-arrow-up',
      'icon-circle-arrow-down' => 'circle-arrow-down',
      'icon-globe' => 'globe',
      'icon-wrench' => 'wrench',
      'icon-tasks' => 'tasks',
      'icon-filter' => 'filter',
      'icon-briefcase' => 'briefcase',
      'icon-fullscreen' => 'fullscreen',
    ),
  );
  return $bundles;
}