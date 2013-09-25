<?php

function invoicely_invoices_dash(){
  $user = user_active_record::current();
  $view = new StdClass();
  $view->invoices = invoice_record::search()
    ->where('uid', $user->uid)
    ->where('deleted', 'No')
    ->order('date_issued', 'DESC')
    ->exec();

  $view->invoice_chart_data = array(array('Date', 'Pounds'));
  $view->invoice_chart_results = db_query("
    SELECT
      yearmonth,
      amount_paid_cumulative,
      financial_year
    FROM
      invoicely_invoice_view_monthly_totals
    WHERE
      uid = {$user->uid}
  ");

  foreach($view->invoice_chart_results as $result){
    $view->invoice_chart_data[] = array(
      $result->yearmonth,
      floatval($result->amount_paid_cumulative)
    );
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
    ->order('date_issued', 'ASC');

  // Search by dates
  if(isset($_REQUEST['year']) && isset($_REQUEST['month'])){
    $date = strtotime("{$_REQUEST['year']}-{$_REQUEST['month']}-01");
    $view->invoices_search->where('date_issued', date("Y-m-01", $date), '>=');
    $view->invoices_search->where('date_issued', date("Y-m-31", $date), '<=');
  }elseif(isset($_REQUEST['year'])){
    $date = strtotime("{$_REQUEST['year']}-01-01");
    $view->invoices_search->where('date_issued', date("Y-01-01", $date), '>=');
    $view->invoices_search->where('date_issued', date("Y-12-31", $date), '<=');
  }

  $view->invoices = $view->invoices_search->exec();
  return invoicely_template_view('templates/invoices/list.phtml', $view);
}

