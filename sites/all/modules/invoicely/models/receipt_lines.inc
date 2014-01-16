<?php
class receipt_line_record extends active_record{
    protected $_table = "invoicely_receipt_lines";

    public $rlid;
    public $rid;
    public $name;
    public $amount;
    public $taxid;
    public $file;

    public function get_amount(){
        return $this->amount;
    }

    public function get_tax_code(){
        return tax_rate_record::search()->where('taxid', $this->taxid)->execOne();
    }

    public function get_vat(){
        return $this->get_tax_code()->compute($this->amount);
    }
}