<?php $this->load->view('layouts/header_admin'); ?>

<div class="d-sm-flex align-items-center justify-content-between mb-4">
	<h1 class="h3 mb-0 text-gray-800"><i class="fas fa-fw fa-user"></i> Data Profil</h1>
</div>

<?= $this->session->flashdata('message'); ?>

<div class="card shadow mb-4">
	<div class="card-header py-3">
		<h6 class="m-0 font-weight-bold text-danger"><i class="fas fa-fw fa-edit"></i> Ubah Data Profil</h6>
	</div>

	<?php echo form_open('Profile/update/' . $profile->id_user); ?>
	<div class="card-body">
		<div class="row">
			<?php echo form_hidden('id_user', $profile->id_user) ?>
			<div class="form-group col-md-6">
				<label class="font-weight-bold">Surel</label>
				<input autocomplete="off" type="email" name="email" value="<?php echo $profile->email ?>" required class="form-control" />
			</div>

			<div class="form-group col-md-6">
				<label class="font-weight-bold">Nama Pengguna</label>
				<input autocomplete="off" type="text" name="username" value="<?php echo $profile->username ?>" required class="form-control" />
			</div>

			<div class="form-group col-md-6">
				<label class="font-weight-bold">Kata Sandi</label>
				<input autocomplete="off" type="password" name="password" required class="form-control" />
			</div>

			<div class="form-group col-md-6">
				<label class="font-weight-bold">Nama Lengkap</label>
				<input autocomplete="off" type="text" name="nama" value="<?php echo $profile->nama ?>" required class="form-control" />
			</div>
		</div>
	</div>
	<div class="card-footer text-right">
		<button type="submit" class="btn btn-success"><i class="fa fa-save"></i> Perbarui</button>
		<button type="reset" class="btn btn-info"><i class="fa fa-sync-alt"></i> Atur Ulang</button>
	</div>
	<?php echo form_close() ?>
</div>

<?php $this->load->view('layouts/footer_admin'); ?>