<?php
class invoice_record extends active_record{
    protected $_table = "invoicely_invoices";

    public function get_date_issued($format = "Y-m-d"){
      return date($format, strtotime($this->date));
    }

    public function get_client(){
      return company_record::search()->where('cid', $this->cid)->execOne();
    }
}