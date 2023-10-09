<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class API extends CI_Controller {

  public $menu_aktif = 'blok rumah';

  public function __construct() {
      parent::__construct();
      $this->load->library('form_validation');
      $this->load->model('M_mahasiswa');
  }

  public function get_blok() {
    $q = $this->input->get('q') ?? '';
    $query = $this->db->select('*')
      ->from('blok')
      ->like('nama_blok', $q)
      ->get();
    $result = $query->result_array();
    $json = json_encode($result);
    echo $json;
  }

  public function get_detail_blok() {
    $sub_blok = $this->input->get('sub_blok') ?? '';
    $id_blok = $this->input->get('id_blok') ?? '';
    $query = $this->db->select('*')
      ->from('detail_blok')
      ->where('id_blok', $id_blok)
      ->like('sub_blok', $sub_blok)
      ->get();
    $result = $query->result_array();
    $json = json_encode($result);
    echo $json;
  }

}
