<?php

function invoicely_receipts_import(){
  $view = new StdClass();

  $field_import_file = new magic_form_field_file('import_file', 'Import CSV File');

  $view->form_import = new magic_form();
  $view->form_import->add_field($field_import_file);
  $view->form_import->add_field(new magic_form_field_submit('upload', 'Upload'));
  $view->form_import->submit(function(magic_form $form){
    krumo($form->get_field('upload'));
    exit;
  });

  return invoicely_template_view('templates/invoices/import.phtml', $view);
}