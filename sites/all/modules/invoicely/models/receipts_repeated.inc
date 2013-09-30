<?php
class receipt_repeated_record extends receipt_record{
  protected $_table = "invoicely_receipts_repeated";

  public function get_date_first_occurrence($format = "Y-m-d"){
    return date($format, strtotime($this->date_first_occurrence));
  }

  public function get_receipt_lines(){
    return receipt_line_repeated_record::search()->where('rrid', $this->rrid)->exec();
  }

  public function get_summary(){
    $output = "<ul>";
    foreach($this->get_receipt_lines() as $repeated_receipt_line){
      /** var $repeated_receipt_line receipt_line_repeated_record */
      $output .= "<li>" . l($repeated_receipt_line->name, "receipts/repeated/list/{$this->get_id()}") . "</li>";
    }
    $output.= "</ul>";
    return $output;
  }
}