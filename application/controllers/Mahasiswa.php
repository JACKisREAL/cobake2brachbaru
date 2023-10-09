<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Mahasiswa extends CI_Controller {
    public function __construct() {
        parent::__construct();
        $this->load->model('M_mahasiswa');
    }

	public function index()
	{
        $data['nama_mahasiswa'] = 'Ardiansyah Latif';
        $data['dosen'] = [
            [
                'niy'=> '60110648',
                'nama'=> 'Herman Yuliansyah',
                'alamat' => 'Jogyakarta'
            ],
            [
                'niy'=> '60110647',
                'nama'=> 'Fiftin Noviyanto',
                'alamat' => 'Sleman'
            ],
            [
                'niy'=> '60110649',
                'nama'=> 'Supriyanto',
                'alamat' => 'Jogja'
            ]
        ];
        $data['data_mahasiswa'] = $this->M_mahasiswa->data_mahasiswa();
		$this->load->view('view_mahasiswa', $data);
        // echo "Hello Mahasiswa";
        
	}

    public function input() {
        if (count($_GET) > 0) {
            print_r($_GET);
            $data = $_GET;
            $result = $this->db->insert('mahasiswa', $data);
            // if ($result) {
            //     echo "<p>Data berhasil ditambahkan</P>"
            // }
        }
        else {
            $this->load->view('input_mahasiswa');
        }
    }

    public function tes() {
        $this->load->view('header');
        // $this->load->view('content');
        $this->load->view('footer');
    }
}
