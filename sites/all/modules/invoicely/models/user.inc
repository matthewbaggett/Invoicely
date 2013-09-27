<?php
class user_record extends user_active_record{
  private $_companies;

  /**
   * Get current user.
   * @return user_record
   */
  static public function current(){
    return parent::current();
  }

  /**
   * Get this users list of companies.
   * @return array
   */
  public function get_companies(){
    if(!$this->_companies){
      $this->_companies = company_record::search()
        ->where('uid', $this->uid)
        ->order('name', 'ASC')
        ->exec();
    }
    return $this->_companies;
  }
}