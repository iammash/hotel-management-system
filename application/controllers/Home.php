<?php
/**
 * Created by IntelliJ IDEA.
 * User: vishalkulkarni
 * Date: 4/29/17
 * Time: 9:40 PM
 */
defined('BASEPATH') OR exit('No direct script access allowed');

class Home extends CI_Controller {

    public function __construct()
    {
        parent::__construct();
        session_start();
        $this->load->model('hotel_model');
    }

    public function index()
    {
        $logged_in = isset($_SESSION['login']) ? $_SESSION['login'] : false;
        $username = (isset($_SESSION['username']) ? $_SESSION['username'] : '');

        $hotels = $this->hotel_model->get_all_hotels();
        //print_r($hotels);
        $data = array(
            'hotels' => $hotels,
            'title' => 'Welcome to Hulton.',
            'show_header_logo' => true,
            'logged_in' => $logged_in,
            'username' => $username
        );

        $this->load->view('home/index', $data);
    }

    public function all()
    {

    }

}

/***
 *
 *
 *  hulton.com/home/
 *
 */