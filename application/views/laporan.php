<!DOCTYPE html>
<html>

<head>
	<title>Penilaian Kinerja Perangkat Desa Claket Menggunakan Metode SAW</title>
</head>
<style>
	table {
		border-collapse: collapse;
	}

	table,
	th,
	td {
		border: 1px solid black;
	}

	.description {
		margin-top: 40px;
	}

	.description table {
		/* border: none !important; */
		border-style: none;

	}

	.description table tbody tr td {
		/* width: 100px; */
		padding: 12px 15px 12px 0;
		text-align: left;
		border-style: none;
	}
</style>
<?php
date_default_timezone_set("Asia/Jakarta");
function tgl_indo($tanggal)
{
	$bulan = array(
		1 =>   'Januari',
		'Februari',
		'Maret',
		'April',
		'Mei',
		'Juni',
		'Juli',
		'Agustus',
		'September',
		'Oktober',
		'November',
		'Desember'
	);
	$pecahkan = explode('-', $tanggal);

	// variabel pecahkan 0 = tanggal
	// variabel pecahkan 1 = bulan
	// variabel pecahkan 2 = tahun

	return $pecahkan[2] . ' ' . $bulan[(int)$pecahkan[1]] . ' ' . $pecahkan[0];
}

?>

<body>
	<img src="<?= base_url('assets/') ?>img/header.png" width="100%">
	<h4 style="text-align: center;">SURAT HASIL PERANGKINGAN PERANGKAT DESA CLAKET
	</h4>
	<table border="1" width="100%">
		<thead>
			<tr align="center">
				<th>Alternatif</th>
				<th>Nilai</th>
				<th width="15%">Ranking</th>
			</tr>
		</thead>
		<tbody>
			<?php
			$no = 1;
			foreach ($hasil as $keys) : ?>
				<tr align="center">
					<td align="left">
						<?php
						$nama_alternatif = $this->Perhitungan_model->get_hasil_alternatif($keys->id_alternatif);
						echo $nama_alternatif['nama'];
						?>

					</td>
					<td><?= $keys->nilai ?></td>
					<td><?= $no; ?></td>
				</tr>
			<?php
				$no++;
			endforeach ?>
		</tbody>
	</table>
	<div class="description">
		<h3 class="description-title">Perangkat desa dengan data :</h3>
		<table>
			<thead></thead>
			<tbody>
				<tr>
					<td class="table-title">
						Nama
					</td>
					<td>
						:
					</td>
					<td>
						<?php
						$hasil_terbaik = $this->Perhitungan_model->get_hasil_terbaik();
						// echo $tes
						$nama_pegawai = $this->Perhitungan_model->get_hasil_alternatif_terbaik($hasil_terbaik['id_alternatif']);
						echo $nama_pegawai['nama']
						?>
					</td>
				</tr>
				<tr>
					<td>
						Nilai
					</td>
					<td>
						:
					</td>
					<td>
						<?php
						// echo $tes
						echo $hasil_terbaik['nilai']
						?>
					</td>
				<tr>
					<td>
						Ranking
					</td>
					<td>
						:
					</td>
					<td>
						1
					</td>
				</tr>
				</tr>
			</tbody>
		</table>
		<p class="">Mendapatkan predikat perangkat desa <b>TERBAIK</b></p>
		<p>Demikian surat ini dibuat agar dapat menjadi bahan pertimbangan dalam pengambilan keputusan</p>

		<div style=" padding:40px 0">
			<div style="float:right">
				<p>Mojokerto, <?php echo tgl_indo(date('Y-m-d'));  ?></p>
				<p>Mengetahui</p>
				<p style="margin-top: 90px;"><u>Umbar Mulyadi</u></p>
			</div>
		</div>
	</div>
	<script>
		window.print();
	</script>
</body>

</html>