<?php
class receipt_repeated_record extends receipt_record{
  protected $_table = "invoicely_receipts_repeated";
  private $_frequency;

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

  /**
   * @return receipts_repeated_frequencies_record
   */
  public function get_frequency(){
    if(!$this->_frequency){
      $this->_frequency = receipts_repeated_frequencies_record::search()->where('fid', $this->fid)->execOne();
    }
    return $this->_frequency;
  }

  public function get_occurrence_dates(){
    $frequency = $this->get_frequency();
    $dates = $frequency->get_following_dates($this->get_date_first_occurrence());

    $occurrences = array();
    foreach($dates as $date){
      $date_min = $frequency->get_date_min($date);
      $date_max = $frequency->get_date_max($date);

      $related_receipts = receipt_record::search()
        ->where('rrid', $this->rrid)
        ->where('date', $date_max, '<=')
        ->where('date', $date_min, '>=')
        ->exec();

      drupal_set_message("Found " . count($related_receipts) . " between {$date_min} and {$date_max} (based on {$date}) for rrid {$this->rrid}");

      // Create the new occurrence object
      $occurrence = new StdClass();
      $occurrence->date = $date;
      $occurrence->exists = count($related_receipts) > 0 ? true:false;
      $occurrence->receipts = $related_receipts;

      // Add it to the array
      $occurrences[$occurrences->date] = $occurrence;
    }

    ksort($occurrences);
    return $occurrences;
  }

  public function get_occurrence_dates_html(){
    $occurrences = $this->get_occurrence_dates();
    $output = t("There are :count occurrences", array(':count' => count($occurrences))) . "\n";
    $output.= "<ul>";
    foreach($occurrences as $occurrence){
      $output.= "<li>";
      if($occurrence->exists){
        $output.= l($occurrence->date, "receipts/view/{$occurrence->receipt->get_slug()}");
      }else{
        $output.= $occurrence->date . " (" . t("Receipt Missing.") . " " . l("Create it?", "receipts/add") . ")";
      }
      $output.= "</li>";
    }
    $output.= "</ul>";
    return $output;
  }
}