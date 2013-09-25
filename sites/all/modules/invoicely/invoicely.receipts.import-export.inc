<?php

function invoicely_receipts_import(){
    global $user;
    $view = new StdClass();

    $field_user = new magic_form_field_hidden('user','User');
    $field_import_file = new magic_form_field_file('import_file', 'Import CSV File');

    $field_user->set_value($user->uid);

    $view->form_import = new magic_form();
    $view->form_import->add_field($field_user);
    $view->form_import->add_field($field_import_file);
    $view->form_import->add_field(new magic_form_field_submit('upload_button', 'Upload'));
    $view->form_import->submit(function(magic_form $form){
        /* @var $upload magic_form_field_submit; */
        /* @var $uid magic_form_field_hidden; */
        $upload = $form->get_field('import_file');
        $csv = $upload->get_data();
        $data = invoicely_receipts_import_parse_csv($csv);
        $uid = $form->get_field('user');
        $uid = $uid->get_value();
        foreach($data as $transaction){
            $company = company_record::search()->where('name',$transaction['Name of Company'])->where('uid', $uid)->execOne();
            if(!$company instanceof company_record){
                $company = new company_record();
                $company->name = $transaction['Name of Company'];
                $company->vat_number = $transaction['VAT Number'];
                $company->uid = $uid;
                $company->save();
            }
            $tax_rate_number = preg_replace("/[^0-9.]/", "", trim($transaction['VAT Rate']));
            if(strlen($tax_rate_number) == 0){
                $tax_rate_number = 0;
            }
            $tax_rate = tax_rate_record::search()->where('rate', $tax_rate_number)->execOne();
            if(!$tax_rate instanceof tax_rate_record){
                $tax_rate = new tax_rate_record();
                $tax_rate->name = $tax_rate_number . "% VAT";
                $tax_rate->rate = $tax_rate_number;
                $tax_rate->start = date("Y-m-d H:i:s");
                $tax_rate->end = date("Y-m-d H:i:s");
                $tax_rate->save();
            }

            $reciept = new receipt_record();
            $reciept->uid = $uid;
            $reciept->cid = $company->cid;
            $reciept->date = date("Y-m-d", strtotime($transaction['Date']));
            $reciept->save();
            $reciept_line = new receipt_line_record();
            $reciept_line->name = isset($transaction['Description']) > 0?$transaction['Description']:'Unknown Item';
            $reciept_line->amount = preg_replace("/[^0-9.]/", "", $transaction['Gross']);
            $reciept_line->taxid = $tax_rate->taxid;
            $reciept_line->rid = $reciept->rid;
            $reciept_line->save();

        }

        header("Location: " . url('receipts/list'));
        exit;
    });

    return invoicely_template_view('templates/invoices/import.phtml', $view);
}

function invoicely_receipts_import_parse_csv($csv){
    $rows = explode("\n", $csv);
    foreach($rows as $i => &$row){
        $row = str_getcsv($row);
        $row_length = 0;
        foreach($row as $cell){
            $row_length+=strlen($cell);
        }
        if($row_length == 0){
            unset($rows[$i]);
        }
    }
    $column_titles = array_shift($rows);
    foreach($column_titles as &$column_title){
        $column_title = trim($column_title);
    }
    $output = array();
    foreach($rows as $j => $row){
        $object = array();
        foreach($row as $i => $cell){
            $new_title = $column_titles[$i];
            $object[$new_title] = $cell;
        }
        $output[$j] = $object;
    }
    return $output;
}