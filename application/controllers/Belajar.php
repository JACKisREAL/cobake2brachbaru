<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Belajar extends CI_Controller {

	/**
	 * Index Page for this controller.
	 *
	 * Maps to the following URL
	 * 		http://example.com/index.php/welcome
	 *	- or -
	 * 		http://example.com/index.php/welcome/index
	 *	- or -
	 * Since this controller is set as the default controller in
	 * config/routes.php, it's displayed at http://example.com/
	 *
	 * So any other public methods not prefixed with an underscore will
	 * map to /index.php/welcome/<method_name>
	 * @see https://codeigniter.com/userguide3/general/urls.html
	 */

  public function __construct() {
    // echo "ini dijalankan terlebih sebelum fungsi lainnya";
    parent::__construct();
    $this->load->model('M_transfer');
  }
  
	public function index()
	{
		// echo "<br>ini adalah controller index";
    // $data['mahasiswa'] = $this->M_kuliah->select();
    // $this->load->view('Mahasiswa/select', $data);
	}

  public function tes() {
    $data = [];
    $data['nama'] = 'wahyu';
    $data['umur'] = 21;
    // var_dump($data);
    // var_dump($data['umur']);
    $this->load->view('Blok/belajar_tes', $data);
  }

  public function detail(){
	$data = [];
	$data['transfer'] = $this->M_transfer->select();
	$this->load->view('Blok/detail',$data);	
  }
}
