<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>REKAYASA WEB</title>
</head>
<body>
    Hallo <?php echo $nama_mahasiswa ?>
    <br>
    <h4>Daftar Nama Dosen</h4>
    <table border="1">
        <tr>
            <td>Niy</td>
            <td>Nama</td>
            <td>Alamat</td>
        </tr>
        <?php foreach($dosen as $data):?>
        <tr>
            <td><?php echo $data['niy']?></td>
            <td><?php echo $data['nama']?></td>
            <td><?php echo $data['alamat']?></td>
        </tr>
        <?php endforeach?>
    </table>
    <hr>
    <h4>Daftar Nama Mahasiswa</h4>
    <table border="1">
        <tr>
            <td>Nim</td>
            <td>Nama</td>
            <td>Alamat</td>
        </tr>
        <?php foreach($data_mahasiswa as $data):?>
            <tr>
                <td><?php echo $data->nim ?></td>
                <td><?php echo $data->nama ?></td>
                <td><?php echo $data->alamat ?></td>
            </tr>
        <?php endforeach ?>
    </table>
    <hr>
</body>
</html>