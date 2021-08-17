<?php 
defined('BASEPATH') OR exit('No direct script access allowed');

class Mod_login extends CI_Model {
    function Aplikasi()
    {
        return $this->db->get('tb_aplikasi');
    }

    function Auth($username, $password)
    {

        //menggunakan active record . untuk menghindari sql injection
        $this->db->where("username", $username);
        $this->db->where("password", $password);
        $this->db->where("is_active", 'Y');
        return $this->db->get("tb_user");    
    }

    function check_db($username)
    {
        return $this->db->get_where('tb_admin', array('username' => $username));
    }



}

/* End of file Mod_login.php */
