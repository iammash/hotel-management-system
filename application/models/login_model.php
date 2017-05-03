<?php
/**
 * Created by IntelliJ IDEA.
 * User: vishalkulkarni
 * Date: 4/30/17
 * Time: 7:51 PM
 */
class login_model extends CI_Model {

    function __construct()
    {
        parent::__construct();
    }

    public function isValidUser($username, $password)
    {
        $password_encypted = md5($password);
        $password_encypted = substr($password_encypted, 0, 20);

        $q = "SELECT count(CID) as cnt, CID FROM customer where CName = '$username' and Password = '$password_encypted'";
        $query = $this->db->query($q);
        $result = $query->result()[0];

        if($result->cnt == 1)
            return $result->CID;
        else
            return 0;
    }

}