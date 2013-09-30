<?php
class receipts_repeated_frequencies_record extends receipt_line_record{
    protected $_table = "invoicely_receipts_repeated_frequencies";

    private function parse($string_date){
      $result = date("Y-m-d", strtotime($string_date));
      echo "{$string_date} -> {$result}<br />";
      return $result;
    }

    private function get_next_date($date){
      $timestamp = strtotime($date);
      $year = date("Y", $timestamp);
      $month = date("m", $timestamp);
      $day = date("d", $timestamp);
      switch($this->machine_name){
        case 'monthly':
          $month++;
          return $this->parse("{$year}-{$month}-{$day}");
        case 'weekly':
          $day = $day + 7;
          return $this->parse("{$year}-{$month}-{$day}");
        case 'quarterly':
          $month = $month + 3;
          return $this->parse("{$year}-{$month}-{$day}");
        default:
          throw new exception("Missing frequency machine name: {$this->machine_name}");
      }
    }

    public function get_following_dates($date){
      $array_of_dates = array();
      $done = false;
      $cycle = 0;
      while($done == false){
        $next_date = $this->get_next_date($date);
        if(!time() < strtotime($next_date)){
          $array_of_dates[strtotime($next_date)] = $next_date;
          $date = strtotime($next_date);
        }else{
          $done = true;
        }
        $cycle++;
        if($cycle > 15){
          $done = true;
        }
      }
      ksort($array_of_dates);
      krumo($array_of_dates);
      return $array_of_dates;
    }
}