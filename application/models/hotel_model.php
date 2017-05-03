<?php
/**
 * Created by IntelliJ IDEA.
 * User: vishalkulkarni
 * Date: 4/29/17
 * Time: 10:41 PM
 */

class hotel_model extends CI_Model {

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

    public function get_room_types($hotel_id)
    {
        $query = $this->db->query("select distinct Rtype,Description from room where HotelID = $hotel_id");
        return $query->result();
    }

    public function get_room_information($hotel_id)
    {
        $query = $this->db->query("select * from room where HotelID = $hotel_id");
        return $query->result();
    }
    public function get_discount_for_room($room_number, $hotel_id)
    {
        $query = $this->db->query("SELECT * FROM hulton.discounted_room where RoomNo = $room_number and HotelID= $hotel_id");
        return $query->result();
    }
    public function get_total_rooms_available($hotel_id)
    {
        $query = $this ->db-> query("select count(RoomNo), HotelID from room where HotelID = $hotel_id group by HotelID");
        return $query->result();
    }


    public function get_hotel_information($hotel_id)
    {
        $query = $this->db->query("select * from Hotel where HotelID = $hotel_id");
        return $query->result();
    }


    public function get_breakfast_information($hotel_id)
    {
        $query = $this->db->query("select * from breakfast where HotelID = $hotel_id group by BType");
        return $query->result();
    }

    public function get_hotel_services($hotel_id)
    {

        $query = $this->db->query("SELECT * FROM service where HotelID = $hotel_id group by SType");
        return $query->result();
    }

    public function book($cid, $hotel_id, $card_type, $cardnumber, $address, $start_date, $end_date, $room_type, $breakfast_type, $cvv)
    {
        $invoice_numnber = rand(1111111111,9999999999);

        $query = $this->db->query("select RoomNo from room where HotelID = 1 and Rtype = '$room_type' limit 1");
        $result = $query->result()[0];
        $room_number = $result->RoomNo;

        $credit_card_data = array(
            'CNumber' => $cardnumber,
            'Ctype' => $card_type,
            'Name' => 'Vishal',
            'Baddress' => $address,
            'Code' => $cvv,
            'ExpDate' => '2022-01-01'
        );

        $this->db->insert('credit_card',$credit_card_data);


        $reservation_data = array(
            'InvoiceNo' => $invoice_numnber,
            'Cid' => $cid,
            'CNumber' => $cardnumber,
            'Rdate' => '2017-05-03'
        );

        $this->db->insert('Reservation',$reservation_data);

        $room_data = array(
            'CheckInDate' => $start_date,
            'HotelID' => $hotel_id,
            'InvoiceNo' => $invoice_numnber,
            'RoomNo' => $room_number,
            'CheckoutDate' => $end_date
        );

        $this->db->insert('room_reservation',$room_data);

        $b_data = array(
            'BType' => $breakfast_type,
            'HotelID' => $hotel_id,
            'RoomNo' => $room_number,
            'CheckInDate' => $start_date,
            'NoofOrders' => 2
        );

        $this->db->insert('rresv_breakfast',$b_data);


        return true;
        //return ($this->db->affected_rows() != 1) ? false : true;


    }
}