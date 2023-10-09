<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Select</title>
</head>
<body>
  <p>Menampilkan isi dari tabel mahasiswa</p>
  <?php 
    for ($i = 0; $i < count($mahasiswa); $i++) {
      echo "nama : {$mahasiswa[$i]} <br>";
    }
  ?>
</body>
</html>