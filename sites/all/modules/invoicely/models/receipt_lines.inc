<?php
class receipt_line_record extends active_record{
    protected $_table = "invoicely_receipt_lines";

    public function get_amount(){
        return 5;
    }

    public function get_vat(){
        return $this->get_amount() * 0.2;
    }
}