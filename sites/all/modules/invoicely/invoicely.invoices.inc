<?php

function invoicely_invoices_list(){
    $user = user_active_record::current();
    $view = new StdClass();
    $view->invoices = invoice_record::search()
        ->where('uid', $user->uid)
        ->where('deleted', 'No')
        ->exec();
    return invoicely_template_view('templates/invoices.phtml', $view);
}

