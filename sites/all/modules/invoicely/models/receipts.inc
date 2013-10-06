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

    public function get_number_of_items(){
        return count($this->get_receipt_lines());
    }

    public function get_total_amount_pretax(){
        $total = $this->get_total_amount() - $this->get_total_vat();
        return number_format($total,2,'.','');
    }

    public function get_total_amount(){
        $total = 0;
        $receipt_lines = $this->get_receipt_lines();
        foreach($receipt_lines as $receipt_line){
            /* @val $receipt_line receipt_line_record */
            $total+= $receipt_line->get_amount();
        }
        return number_format($total,2,'.','');
    }

    public function get_total_vat(){
        $total = 0;
        foreach($this->get_receipt_lines() as $receipt_line){
            /* @val $receipt_line receipt_line_record */
            $total = $total + $receipt_line->get_vat();
        }
        return number_format($total,2,'.','');
    }

    public function get_summary(){
      $output = "<ul>";
      foreach($this->get_receipt_lines() as $receipt_line){
        /** var $receipt_line receipt_line_record */
        $output .= "<li>" . l($receipt_line->name, "receipts/view/{$this->get_slug()}") . "</li>";
      }
      $output.= "</ul>";
      return $output;
    }
}