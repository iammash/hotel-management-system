<?php
/**
 * Created by IntelliJ IDEA.
 * User: vishalkulkarni
 * Date: 4/29/17
 * Time: 9:40 PM
 */
defined('BASEPATH') OR exit('No direct script access allowed');

class Login extends CI_Controller {

    public function __construct()
    {
        parent::__construct();
        $this->load->model('login_model');

        session_start();

    }

    public function index()
    {

        $logged_in = isset($_SESSION['login']) ? $_SESSION['login'] : false;
        $redirect_url = $this->input->get("redirect");
        setcookie('redirect_url', $redirect_url, time() + (86400 * 30), "/");

        if($logged_in)
        {
            redirect("/home");
            exit;
        }

        $_SESSION['login'] = false;

        $error = false;
        $method = $this->input->method();
        if (strtolower($method) == 'post')
        {
            $username = $this->input->post('username');
            $password = $this->input->post('password');

            $cid = $this->login_model->isValidUser($username, $password);

            if ($cid != 0)
            {
                $_SESSION['login'] = true;
                $_SESSION['username'] = $username;
                $_SESSION['cid'] = $cid;

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
            else
            {
                $error = true;
            }
        }

        $data = array(
            'show_header_logo' => true,
            'title'=> 'Login',
            'error'=> $error,
            'logged_in' => false,
            'username' => ''

        );

        $this->load->view('login/index',$data);
    }

    public function sign_out()
    {
        session_destroy();
        redirect("/home");
        exit;
    }


}