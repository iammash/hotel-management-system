<?php
/**
 * Created by IntelliJ IDEA.
 * User: vishalkulkarni
 * Date: 4/29/17
 * Time: 9:44 PM
 */
defined('BASEPATH') OR exit('No direct script access allowed');

class Hotels extends CI_Controller {

    private $logged_in = false;
    private $username = '';

    public function __construct()
    {
        parent::__construct();
        $this->load->model('hotel_model');
        session_start();

        $this->logged_in = isset($_SESSION['login']) ? $_SESSION['login'] : false;
        $this->username = (isset($_SESSION['username']) ? $_SESSION['username'] : '');
    }

    /**
     * @param $id
     */
    public function view($hotel_id)
    {

        $hotel_info = $this->hotel_model->get_hotel_information($hotel_id)[0];

        $room_types = $this->hotel_model->get_room_types($hotel_id);

        $number_of_rooms = $this->hotel_model->get_total_rooms_available($hotel_id);
        $breakfast_info = $this->hotel_model->get_breakfast_information($hotel_id);
        $hotel_services = $this->hotel_model->get_hotel_services($hotel_id);


        //print_r($hotel_info);

        $data = array(
            'room_types' => $room_types,
            'logged_in' => $this->logged_in,
            'username' => $this->username,
            'show_header_logo' => true,
            'title' => 'Hotel Information',
            'hotel_name' => $hotel_info->Street,
            'hotel_street' => $hotel_info->Street,
            'hotel_state' => $hotel_info->State,
            'hotel_zip' => $hotel_info->Zip,
            'hotel_country' => $hotel_info->Country,
            'hotel' => $hotel_info,
            'breakfast_info' => $breakfast_info,
            'hotel_services' => $hotel_services


        );
        $this->load->view('hotels/view', $data);
    }

    public function book($hotel_id)
    {
        if (!$this->logged_in)
        {
            redirect("/login?redirect=http://hulton.com/hotels/book/$hotel_id");
            exit;
        }

        $hotel_info = $this->hotel_model->get_hotel_information($hotel_id)[0];
        $room_types = $this->hotel_model->get_room_types($hotel_id);
        $number_of_rooms = $this->hotel_model->get_total_rooms_available($hotel_id);
        $breakfast_info = $this->hotel_model->get_breakfast_information($hotel_id);
        $hotel_services = $this->hotel_model->get_hotel_services($hotel_id);

        $data = array(
            'room_types' => $room_types,
            'logged_in' => $this->logged_in,
            'username' => $this->username,
            'show_header_logo' => true,
            'title' => 'Book a room',
            'hotel_name' => $hotel_info->Street,
            'hotel_street' => $hotel_info->Street,
            'hotel_state' => $hotel_info->State,
            'hotel_zip' => $hotel_info->Zip,
            'hotel_country' => $hotel_info->Country,
            'hotel' => $hotel_info,
            'breakfast_info' => $breakfast_info,
            'hotel_services' => $hotel_services,
            'hotel_id' => $hotel_info->HotelID,

        );



        $this->load->view('hotels/book', $data);

        //print($id);
    }

    public function payment()
    {
        $method = $this->input->method();
        if (strtolower($method) == 'post') {

            $hotel_id = $this->input->post('hotel_id');
            $start_date = $this->input->post('start_date');
            $end_date = $this->input->post('end_date');
            $room_type = $this->input->post('room_type');
            $breakfast_type = $this->input->post('breakfast_type');

            setcookie('hotel_id', $hotel_id, time() + (86400 * 30), "/");
            setcookie('start_date', $start_date, time() + (86400 * 30), "/");
            setcookie('end_date', $end_date, time() + (86400 * 30), "/");
            setcookie('room_type', $room_type, time() + (86400 * 30), "/");
            setcookie('breakfast_type', $breakfast_type, time() + (86400 * 30), "/");

            $hotel_info = $this->hotel_model->get_hotel_information($hotel_id)[0];
            $room_types = $this->hotel_model->get_room_types($hotel_id);
            $number_of_rooms = $this->hotel_model->get_total_rooms_available($hotel_id);
            $breakfast_info = $this->hotel_model->get_breakfast_information($hotel_id);
            $hotel_services = $this->hotel_model->get_hotel_services($hotel_id);

            $data = array(
                'room_types' => $room_types,
                'logged_in' => $this->logged_in,
                'username' => $this->username,
                'show_header_logo' => true,
                'title' => 'Book a room',
                'hotel_name' => $hotel_info->Street,
                'hotel_street' => $hotel_info->Street,
                'hotel_state' => $hotel_info->State,
                'hotel_zip' => $hotel_info->Zip,
                'hotel_country' => $hotel_info->Country,
                'hotel' => $hotel_info,
                'breakfast_info' => $breakfast_info,
                'hotel_services' => $hotel_services,
                'valid' => true
            );

            $this->load->view('hotels/payment', $data);

        }
        else{
            redirect("/home");

        }

    }

    public function payment_checkout()
    {
        $method = $this->input->method();

        if (strtolower($method) == 'post') {

            $card_type = $this->input->post('card_type');
            $cardnumber = $this->input->post('cardnumber');
            $address = $this->input->post('address');
            $cvv = $this->input->post('security_code');

            $hotel_id = $_COOKIE['hotel_id'];
            $start_date = $_COOKIE['start_date'];
            $end_date = $_COOKIE['end_date'];
            $room_type = $_COOKIE['room_type'];
            $breakfast_type = $_COOKIE['breakfast_type'];

            $cid = $_SESSION['cid'];

            $booked = $this->hotel_model->book($cid, $hotel_id, $card_type, $cardnumber, $address, $start_date, $end_date, $room_type, $breakfast_type, $cvv);

            redirect("/customer/$cid");
        }

    }


}
