<?php
function invoicely_options_dashboard(){
  $view = new StdClass();
  $view->user = user_active_record::current();
  return invoicely_template_view('templates/options/dashboard.phtml', $view);
}

function invoicely_options_auditors(){
  $view = new StdClass();
  $view->user = user_active_record::current();
  return invoicely_template_view('templates/options/auditors.phtml', $view);
}