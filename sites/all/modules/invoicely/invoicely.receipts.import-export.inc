<?php

function invoicely_receipts_import(){
  $view = new StdClass();

  $field_import_file = new magic_form_field_file('import_file', 'Import CSV File');

  $view->form_import = new magic_form();
  $view->form_import->add_field($field_import_file);
  $view->form_import->add_field(new magic_form_field_submit('upload_button', 'Upload'));
  $view->form_import->submit(function(magic_form $form){
    /* @var $upload magic_form_field_submit; */
    $upload = $form->get_field('import_file');
    $csv = $upload->get_data();
    $data = invoicely_receipts_import_parse_csv($csv);
    krumo($data);
    exit;
  });

  return invoicely_template_view('templates/invoices/import.phtml', $view);
}

function invoicely_receipts_import_parse_csv($csv){
  $rows = explode("\n", $csv);
  foreach($rows as &$row){
    $row = explode(",", $row);
  }
  return $rows;
}