<?php
class company_record extends active_record{
    protected $_table = "invoicely_companies";

    public function get_label(){
      if($this->agency){
        return "{$this->name} ({$this->agency})";
      }
      return $this->name;
    }
}