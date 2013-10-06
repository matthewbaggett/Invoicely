<?php
class receipts_repeated_frequencies_record extends receipt_line_record {
  protected $_table = "invoicely_receipts_repeated_frequencies";
  protected $name;
  protected $machine_name;

  private function parse($string_date) {
    $result = date("Y-m-d", strtotime($string_date));
    return $result;
  }

  private function get_next_date($timestamp) {
    $year  = date("Y", $timestamp);
    $month = date("m", $timestamp);
    $day   = date("d", $timestamp);

    switch ($this->machine_name) {
      case 'monthly':
        $month++;
        if ($month > 12) {
          $month = 1;
          $year++;
        }
        #echo "{$this->machine_name}: " . date("Y-m-d", $timestamp) . " - " . "{$year}-{$month}-{$day} <br />";
        return $this->parse("{$year}-{$month}-{$day}");

      case 'weekly':
        $day = $day + 7;
        #echo "{$this->machine_name}: " . date("Y-m-d", $timestamp) . " - " . "{$year}-{$month}-{$day} <br />";
        return $this->parse("{$year}-{$month}-{$day}");

      case 'quarterly':
        $month = $month + 3;
        if ($month > 12) {
          $month = $month - 12;
          $year++;
        }
        #echo "{$this->machine_name}: " . date("Y-m-d", $timestamp) . " - " . "{$year}-{$month}-{$day} <br />";
        return $this->parse("{$year}-{$month}-{$day}");

      default:
        throw new exception("Missing frequency machine name: {$this->machine_name}");
    }
  }

  public function get_following_dates($date) {
    $timestamp      = strtotime($date);
    $array_of_dates = array();
    $done           = false;

    while ($done == false) {
      $next_date = $this->get_next_date($timestamp);
      #echo time() . " < " . strtotime($next_date) . "<br/>";
      if (time() < strtotime($next_date)) {
        $done = true;
      } else {
        $occurrence = new StdClass();
        $occurrence->date = $next_date;
        $occurrence->exists = false; // TODO: Make this do a look up for a matching receipt.
        // $occurrence->receipt = ?? // TODO: And write the receipt into here.

        $array_of_dates[strtotime($next_date)] = $occurrence;
        $timestamp                             = strtotime($next_date);
      }
    }

    ksort($array_of_dates);
    $array_of_dates = array_values($array_of_dates);
    #krumo($array_of_dates);
    return $array_of_dates;
  }
}