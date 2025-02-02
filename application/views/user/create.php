<?php $this->load->view('layouts/header_admin'); ?>

<div class="d-sm-flex align-items-center justify-content-between mb-4">
	<h1 class="h3 mb-0 text-gray-800"><i class="fas fa-fw fa-users-cog"></i> Data Pengguna</h1>

	<a href="<?= base_url('User'); ?>" class="btn btn-secondary btn-icon-split"><span class="icon text-white-50"><i class="fas fa-arrow-left"></i></span>
		<span class="text">Kembali</span>
	</a>
</div>

<?= $this->session->flashdata('message'); ?>

<div class="card shadow mb-4">
	<div class="card-header py-3">
		<h6 class="m-0 font-weight-bold text-danger"><i class="fas fa-fw fa-plus"></i> Tambah Data Pengguna</h6>
	</div>

	<?php echo form_open('User/store'); ?>
	<div class="card-body">
		<div class="row">
			<div class="form-group col-md-6">
				<label class="font-weight-bold">Surel</label>
				<input autocomplete="off" type="email" name="email" required class="form-control" />
			</div>

			<div class="form-group col-md-6">
				<label class="font-weight-bold">Nama Pengguna</label>
				<input autocomplete="off" type="text" name="username" required class="form-control" />
			</div>

			<div class="form-group col-md-6">
				<label class="font-weight-bold">Kata Sandi</label>
				<input autocomplete="off" type="password" name="password" required class="form-control" />
			</div>

			<div class="form-group col-md-6">
				<label class="font-weight-bold">Nama Lengkap</label>
				<input autocomplete="off" type="text" name="nama" required class="form-control" />
			</div>

			<div class="form-group col-md-6">
				<label class="font-weight-bold">Level</label>
				<select class="form-control" name="privilege" required>
					<option value="">--Pilih Level--</option>
					<?php foreach ($user_level as $k) { ?>
						<option value="<?php echo $k->id_user_level ?>"><?php echo $k->user_level ?></option>
					<?php } ?>
				</select>
			</div>
		</div>
	</div>
	<div class="card-footer text-right">
		<button type="submit" class="btn btn-success"><i class="fa fa-save"></i> Simpan</button>
		<button type="reset" class="btn btn-info"><i class="fa fa-sync-alt"></i> Perbarui</button>
	</div>
	<?php echo form_close() ?>
</div>

<?php $this->load->view('layouts/footer_admin'); ?>