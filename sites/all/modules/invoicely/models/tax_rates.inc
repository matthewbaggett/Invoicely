<?php
class tax_rate_record extends active_record{
    protected $_table = "invoicely_tax_rates";

    public function compute($amount){
        return $amount * $this->get_ratio();
    }

    private function get_ratio(){
        return $this->rate / 100;
    }
}