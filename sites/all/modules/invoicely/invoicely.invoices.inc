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

function invoicely_invoices_edit($invoice_id = null){
  $user = user_record::current();
  if($invoice_id){
    $invoice = invoice_record::search()->where('iid', $invoice_id)->execOne();
  }else{
    $invoice = new invoice_record();
  }
  $view = new StdClass();
  $view->form = new magic_form();
  $view->form->add_field(
    magic_form_field_text::factory('invoice_number', 'Invoice Number', $invoice->invoice_number)
  );
  $view->form->add_field(
    magic_form_field_select::factory('company', 'Company', $invoice->cid)
      ->add_options($user->get_companies())
  );
  $view->form->add_field(
    magic_form_field_date::factory('date_issued', 'Date Issued', $invoice->date_issued)
  );
  $view->form->add_field(
    magic_form_field_date::factory('date_paid', 'Date Paid', $invoice->date_paid)
  );
  $view->form->add_field(
    magic_form_field_number::factory('amount_charged', 'Amount Charged', $invoice->amount_charged)
  );
  $view->form->add_field(
    magic_form_field_number::factory('amount_paid', 'Amount Paid', $invoice->amount_paid)
  );
  $view->form->add_field(
    magic_form_field_select::factory('paid', 'Paid?', $invoice->paid)
      ->add_options(array('No' => t('No'), 'Yes' => t('Yes')))
  );
  $view->form->add_field(
    magic_form_field_file::factory('attachment', 'Attach PDF Invoice')
  );
  $view->form->add_field(
    magic_form_field_textarea::factory('notes', 'Notes', $invoice->notes)
  );
  $view->form->add_field(
    magic_form_field_submit::factory('submit', 'Submit Invoice')
  );
  $view->form->submit(function(magic_form $form) use($user, $invoice){

    $invoice->uid = $user->uid;
    $invoice->invoice_number  = $form->get_field('invoice_number')->get_value();
    $invoice->date_issued     = $form->get_field('date_issued')->get_value();
    $invoice->date_paid       = $form->get_field('date_paid')->get_value();
    $invoice->amount_charged  = $form->get_field('amount_charged')->get_value();
    $invoice->amount_paid     = $form->get_field('amount_paid')->get_value();
    $invoice->paid            = $form->get_field('paid')->get_value();
    $invoice->cid             = $form->get_field('company')->get_value();
    if($form->get_field('attachment')->has_file()){
      $invoice->file            = $form->get_field('attachment')->get_data();
    }
    $invoice->notes           = $form->get_field('notes')->get_value();
    $invoice->deleted         = "No";

    $invoice->save();

    header("Location: " . url('invoices/list', array('query' => array('year' => $invoice->get_date_issued("Y"), 'month' => $invoice->get_date_issued("m")))));
    exit;
  });
  return invoicely_template_view('templates/invoices/add.phtml', $view);
}

