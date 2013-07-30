<?php

function invoicely_receipts_list(){
    $user = user_active_record::current();
    $view = new StdClass();
    $view->receipts = receipt_record::search()
        ->where('uid', $user->uid)
        ->where('deleted', 'No')
        ->exec();
    return invoicely_template_view('templates/receipts.phtml', $view);
}

function invoicely_receipts_add(){
    $form = receipt_record::magic_form();
    return $form->__toString();
}