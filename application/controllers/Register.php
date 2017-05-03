<?php
/**
 * Created by IntelliJ IDEA.
 * User: vishalkulkarni
 * Date: 4/30/17
 * Time: 4:42 AM
 */
defined('BASEPATH') OR exit('No direct script access allowed');

class Register extends CI_Controller {

    public $logged_in = false;
    public function __construct()
    {
        parent::__construct();
        $this->load->model('register_model');

        session_start();
        $this->logged_in = isset($_SESSION['login']) ? $_SESSION['login'] : false;

    }

    public function index()
    {
        $registered = true;
        if($this->logged_in)
        {
            redirect("/home");
            exit;
        }

        $method = $this->input->method();
        if (strtolower($method) == 'post')
        {

            $username = $this->input->post('username');
            $password = $this->input->post('password');
            $address = $this->input->post('address');
            $email = $this->input->post('email');
            $phonenumber = $this->input->post('phonenumber');

            $registered = $this->register_model->register($username, $password, $address, $email, $phonenumber);
            if($registered)
            {
                $_SESSION['login'] = true;
                $_SESSION['username'] = $username;
                //$_SESSION['cid'] = $cid;

                if (isset($_COOKIE['redirect_url']))
                {
                    $redirect_url = $_COOKIE['redirect_url'];
                    setcookie("redirect_url", "", time() - 3600);   //ecxpire the cookie..
                    redirect($redirect_url);
                }
                else {
                    redirect("/home");
                }
                exit;
            }
        }

        $data = array(
            'valid' =>$registered,
            'show_header_logo' => true,
            'title' => 'Register',
            'logged_in' => false,
            'username' => ''
        );

        $this->load->view('register/index',$data);

    }

}