<?php

function invoicely_receipts_dash(){
  $user = user_active_record::current();
  $view = new StdClass();
  $view->monthly_totals = active_record_dumb_model::query("
    SELECT
      *
    FROM
      invoicely_reciept_view_monthly_totals -- TODO: Rename this view - I can't spell.
    WHERE
      uid = {$user->uid}
  ");
  $view->monthly_totals_chart_data = array();
  foreach($view->monthly_totals as $monthly_total){
    $view->monthly_totals_chart_data[] = array($monthly_total->yearmonth, $monthly_total->amount_cumulative);
  }
  return invoicely_template_view('templates/receipts/dash.phtml', $view);
}

function invoicely_receipts_list(){
    $user = user_active_record::current();
    $view = new StdClass();
    $view->receipts_search = receipt_record::search()
        ->where('uid', $user->uid)
        ->where('deleted', 'No')
        ->order('date','DESC');

    // Search by dates
    if(isset($_REQUEST['year']) && isset($_REQUEST['month'])){
      $date       = strtotime("{$_REQUEST['year']}-{$_REQUEST['month']}-01");
      drupal_set_title(strip_tags(t("Receipts for :date", array(':date' => date("F Y", $date)))));
      $view->receipts_search->where('date', date("Y-m-01", $date), '>=');
      $view->receipts_search->where('date', date("Y-m-31", $date), '<=');
    }elseif(isset($_REQUEST['year'])){
      $date       = strtotime("{$_REQUEST['year']}-01-01");
      drupal_set_title(strip_tags(t("Receipts for :date", array(':date' => date("Y", $date)))));
      $view->receipts_search->where('date', date("Y-01-01", $date), '>=');
      $view->receipts_search->where('date', date("Y-12-31", $date), '<=');
    }elseif(isset($_REQUEST['year_start']) && isset($_REQUEST['year_end']) && isset($_REQUEST['month_start']) && isset($_REQUEST['month_end'])){
      $date_start = strtotime("{$_REQUEST['year_start']}-{$_REQUEST['month_start']}-01");
      $date_end   = strtotime("{$_REQUEST['year_end']}-{$_REQUEST['month_end']}-01");
      drupal_set_title(strip_tags(t("Receipts for :date", array(':date' => date("F Y", $date_start) . " " . t("to") . " " . date("F Y", $date_end)))));
      $view->receipts_search->where('date', date("Y-m-01", $date_start), '>=');
      $view->receipts_search->where('date', date("Y-m-31", $date_end), '<=');
    }else{
      drupal_set_title(strip_tags(t("Receipts for :date", array(':date' => t("All Time")))));
    }

    $view->receipts = $view->receipts_search->exec();
    return invoicely_template_view('templates/receipts/list.phtml', $view);
}

function invoicely_receipts_add(){
    return receipt_record::magic_form()->__toString();
}

function invoicely_receipts_edit($receipt_slug = false){
  if($receipt_slug){
    $receipt_id = reset(explode("-",$receipt_slug,2));
    $receipt = receipt_record::loadById($receipt_id);
  }else{
    $receipt = new receipt_record();
  }
  return $receipt->_get_magic_form()->__toString();
}

function invoicely_receipts_view($receipt_slug){
  $receipt_id = reset(explode("-", $receipt_slug, 2));
  $receipt = receipt_record::loadById($receipt_id);
  return $receipt->_get_magic_form()->__toString();
}