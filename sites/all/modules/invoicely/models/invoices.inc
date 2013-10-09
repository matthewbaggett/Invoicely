<?php
class invoice_record extends active_record{
    protected $_table = "invoicely_invoices";
    private $_client;

    public $iid;
    public $uid;
    public $invoice_number;
    public $date_issued;
    public $date_paid;
    public $amount_charged;
    public $amount_paid;
    public $paid;
    public $cid;
    public $deleted;
    public $file;
    public $notes;

    public function get_date_issued($format = "Y-m-d"){
      return date($format, strtotime($this->date_issued));
    }

    public function get_date_paid($format = "Y-m-d"){
      return date($format, strtotime($this->date_paid));
    }

    public function is_paid(){
      if($this->paid == 'Yes'){
        return true;
      }
      return false;
    }

    public function get_amount_charged(){
      return $this->amount_charged;
    }

    public function get_amount_paid(){
      if($this->is_paid()){
        return $this->amount_charged;
      }else{
        return $this->amount_paid;
      }
    }

    public function get_client(){
      if(!$this->_client){
        $this->_client = company_record::search()->where('cid', $this->cid)->execOne();
      }
      return $this->_client;
    }
}