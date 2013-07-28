<?php
class receipt_record extends active_record{
    protected $_table = "invoicely_receipts";

    public function get_date($format = "Y-m-d"){
        return date($format, strtotime($this->date));
    }

    public function get_retailer(){
        return company_record::search()->where('cid', $this->cid)->execOne();
    }

    public function get_receipt_lines(){
        return receipt_line_record::search()->where('rid', $this->rid)->exec();
    }

    public function get_total_amount(){
        $total = 0;
        foreach($this->get_receipt_lines() as $receipt_line){
            /* @val $receipt_line receipt_line_record */
            $total = $total + $receipt_line->get_amount();
        }
        return $total;
    }

    public function get_total_vat(){
        $total = 0;
        foreach($this->get_receipt_lines() as $receipt_line){
            /* @val $receipt_line receipt_line_record */
            $total = $total + $receipt_line->get_vat();
        }
        return $total;
    }
}