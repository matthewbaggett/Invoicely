<?php

function invoicely_receipts_dash(){
  $view = new StdClass();
  $view->monthly_totals = active_record_dumb_model::query("SELECT * FROM invoicely.invoicely_reciept_view_monthly_totals WHERE uid = 1");
  $view->monthly_totals_chart_data = array();
  foreach($view->monthly_totals as $monthly_total){
    $view->monthly_totals_chart_data[] = array($monthly_total->yearmonth, $monthly_total->amount_cumulative);
  }
  return invoicely_template_view('templates/receipts/dash.phtml', $view);
}

function invoicely_receipts_list(){
    $user = user_active_record::current();
    $view = new StdClass();
    $view->receipts = receipt_record::search()
        ->where('uid', $user->uid)
        ->where('deleted', 'No')
        ->order('date','DESC')
        ->exec();
    return invoicely_template_view('templates/receipts/list.phtml', $view);
}

function invoicely_receipts_add(){
    $form = receipt_record::magic_form();
    return $form->__toString();
}