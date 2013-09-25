<?php

function invoicely_dash(){
  $user = user_active_record::current();
  $view = new StdClass();
  $view->user = $user;

  drupal_add_js("https://www.google.com/jsapi");
  drupal_add_js('google.load("visualization", "1", {packages:["corechart"]});', 'inline');

  return invoicely_template_view('templates/dashboard/dash.phtml', $view);
}