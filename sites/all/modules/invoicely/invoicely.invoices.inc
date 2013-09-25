<?php

function invoicely_invoices_dash(){
  $user = user_active_record::current();
  $view = new StdClass();
  $view->invoices = invoice_record::search()
    ->where('uid', $user->uid)
    ->where('deleted', 'No')
    ->order('date_issued', 'DESC')
    ->exec();

  $view->mileage_chart_data = array(array('Date', 'Pounds'));
  $results = db_query("SELECT yearmonth, amount_paid_cumulative FROM invoicely_invoice_view_monthly_totals WHERE uid = {$user->uid}");

  foreach($results as $result){
    $view->mileage_chart_data[] = array($result->yearmonth, floatval($result->amount_paid_cumulative));
  }
  drupal_add_js("https://www.google.com/jsapi");
  drupal_add_js('google.load("visualization", "1", {packages:["corechart"]});', 'inline');

  return invoicely_template_view('templates/invoices/dash.phtml', $view);
}


function invoicely_invoices_list(){
  $user = user_active_record::current();
  $view = new StdClass();
  $view->invoices_search = invoice_record::search()
    ->where('uid', $user->uid)
    ->where('deleted', 'No')
    ->order('date_issued', 'DESC');

  // Search by dates
  if(isset($_REQUEST['year']) && isset($_REQUEST['month'])){
    $view->invoices_search->where('date_issued','<=',date("Y-m-\3\1", strtotime("{$_REQUEST['year']}-{$_REQUEST['month']}-01")));
    $view->invoices_search->where('date_issued','>=',date("Y-m-\0\1", strtotime("{$_REQUEST['year']}-{$_REQUEST['month']}-01")));
  }elseif(isset($_REQUEST['year'])){
    $view->invoices_search->where('date_issued','<=',date("Y-\1\2-\3\1", strtotime("{$_REQUEST['year']}-01-01")));
    $view->invoices_search->where('date_issued','>=',date("Y-\0\1-\0\1", strtotime("{$_REQUEST['year']}-01-01")));
  }

  $view->invoices = $view->invoices_search->exec();
  return invoicely_template_view('templates/invoices/list.phtml', $view);
}

