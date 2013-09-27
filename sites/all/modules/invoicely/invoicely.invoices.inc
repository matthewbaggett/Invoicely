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
  $view->invoice_chart_results = active_record_dumb_model::query("
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
    $date       = strtotime("{$_REQUEST['year']}-{$_REQUEST['month']}-01");
    $view->invoices_search->where('date_issued', date("Y-m-01", $date), '>=');
    $view->invoices_search->where('date_issued', date("Y-m-31", $date), '<=');
  }elseif(isset($_REQUEST['year'])){
    $date       = strtotime("{$_REQUEST['year']}-01-01");
    $view->invoices_search->where('date_issued', date("Y-01-01", $date), '>=');
    $view->invoices_search->where('date_issued', date("Y-12-31", $date), '<=');
  }elseif(isset($_REQUEST['year_start']) && isset($_REQUEST['year_end']) && isset($_REQUEST['month_start']) && isset($_REQUEST['month_end'])){
    $date_start = strtotime("{$_REQUEST['year_start']}-{$_REQUEST['month_start']}-01");
    $date_end   = strtotime("{$_REQUEST['year_end']}-{$_REQUEST['month_end']}-01");
    $view->invoices_search->where('date_issued', date("Y-m-01", $date_start), '>=');
    $view->invoices_search->where('date_issued', date("Y-m-31", $date_end), '<=');
  }

  $view->invoices = $view->invoices_search->exec();
  return invoicely_template_view('templates/invoices/list.phtml', $view);
}

function invoicely_invoices_add(){
  $user = user_active_record::current();
  $view = new StdClass();
  $view->form = new magic_form();
  $view->form->add_field(
    magic_form_field_text::factory('invoice_number', 'Invoice Number')
  );
  $view->form->add_field(
    magic_form_field_select::factory('company','Company')
      ->add_options($user->get_companies())
  );
  $view->form->add_field(
    magic_form_field_date::factory('date_issued','Date Issued')
  );
  $view->form->add_field(
    magic_form_field_date::factory('date_paid','Date Paid')
  );
  $view->form->add_field(
    magic_form_field_number::factory('amount_charged','Amount Charged')
  );
  $view->form->add_field(
    magic_form_field_number::factory('amount_paid','Amount Paid')
  );
  $view->form->add_field(
    magic_form_field_file::factory('attachment', 'Attach PDF Invoice')
  );
  $view->form->add_field(
    magic_form_field_textarea::factory('notes', 'Notes')
  );
  $view->form->add_field(
    magic_form_field_submit::factory('submit', 'Submit Invoice')
  );
  $view->form->submit(function(magic_form $form){
    header("Content-type: text/plain");
    var_dump($form);
    exit;
  });
  return invoicely_template_view('templates/invoices/add.phtml', $view);
}

