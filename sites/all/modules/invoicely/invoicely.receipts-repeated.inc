<?php

function invoicely_receipts_repeated_list(){
    $user = user_active_record::current();
    $view = new StdClass();
    $view->repeated_receipts = receipt_repeated_record::search()
        ->where('uid', $user->uid)
        ->where('deleted', 'No')
        ->order('date_first_occurrence','DESC')
        ->exec();
    return invoicely_template_view('templates/receipts-repeated/list.phtml', $view);
}

function invoicely_receipts_repeated_add(){
    $form = receipt_repeated_record::magic_form();
    return $form->__toString();
}