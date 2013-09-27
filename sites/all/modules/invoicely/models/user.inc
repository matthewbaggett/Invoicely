<?php
class user_record extends user_active_record{
  private $_companies;
  public function get_companies(){
    if(!$this->_companies){
      $this->_companies = company_record::search()
        ->where('uid', $this->uid)
        ->exec();
    }
    return $this->_companies;
  }
}