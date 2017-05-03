<?php
/**
 * Created by IntelliJ IDEA.
 * User: vishalkulkarni
 * Date: 4/30/17
 * Time: 7:51 PM
 */
class register_model extends CI_Model {

    function __construct()
    {
        parent::__construct();
    }

    public function get_all_hotels()
    {
        /*
        $query = $this->db->query("select A.* from A LEFT JOIN B ON A.AId=B.BId where
    (A.Title like '%$searchstring%' OR B.Name like '%$searchstring%') and A.Status='1' and A.Type IN (0) and
    (A.UserId = '$userid' or A.Public='0')  Limit $start,20",false);
*/
        $query = $this->db->get('Hotel', 10);
        return $query->result();
    }

    public function register($username, $password, $address, $email, $phone)
    {

        $data = array(
            'CID' => uniqid(),
            'Password' => md5($password),
            'CName' => $username,
            'Address' => $address,
            'Phone_No' => $phone,
            'Email' => $email
        );

        $this->db->insert('customer',$data);
        return ($this->db->affected_rows() != 1) ? false : true;
    }

    public function gen_uuid() {
        return sprintf( '%04x%04x-%04x-%04x-%04x-%04x%04x%04x',
            // 32 bits for "time_low"
            mt_rand( 0, 0xffff ), mt_rand( 0, 0xffff ),

            // 16 bits for "time_mid"
            mt_rand( 0, 0xffff ),

            // 16 bits for "time_hi_and_version",
            // four most significant bits holds version number 4
            mt_rand( 0, 0x0fff ) | 0x4000,

            // 16 bits, 8 bits for "clk_seq_hi_res",
            // 8 bits for "clk_seq_low",
            // two most significant bits holds zero and one for variant DCE1.1
            mt_rand( 0, 0x3fff ) | 0x8000,

            // 48 bits for "node"
            mt_rand( 0, 0xffff ), mt_rand( 0, 0xffff ), mt_rand( 0, 0xffff )
        );
    }

}