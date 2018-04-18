@extends('layouts.base')

@section('title')
    Create Sample Mie
@endsection

@section('breadcrumb')
  Create Sample
@endsection

@section('content')
  <a href='{{ URL::to('home') }}' class="btn btn-primary" style="z-index: 9999;position:fixed;right:100px;bottom:100px">
      <i class="fa fa-arrow-left"></i> Kembali</a>
  </a>
  <div class="row">
  	<div class="col-md-12">
  		<div class="card">
  			<div class="card-header">
          Create Sample ID Mie
          {{-- @elseif ($jenis == 'mie')
              <a class="btn btn-sm btn-primary text-white" href='{{ URL::to('sample-minyak/create-sample') }}'><i class="fa fa-arrow-left"></i> Kembali</a> Create Sample ID Mie
          @endif --}}

  			</div>
  			<div class="card-body">
              {{-- <div class="container-fluid">
                  <a href='{{ URL::to('sample-minyak/create-sample') }}' style='height: 80px; margin: 2px;' class='btn btn-outline-info text-center'><i class="fa fa-tint fa-2x"></i><br><strong>Sample Minyak</strong></a>
                  <a href='{{ URL::to('sample-minyak/create-sample') }}/mie' style='height: 80px; margin: 2px;' class='btn btn-outline-info text-center'><i class="fa icon-layers fa-2x"></i><br><strong>Sample Mie</strong></a>
              </div> --}}
              <div class="container-fluid">
                <div id="alert">
                  <div class="alert alert-success alert-dismissible" style="display: none">
                      <i class="fa fa-check"></i> <span class="text">Sample berhasil dibuat!. ID : </span><strong><span class="id-sample"></span></strong>
                      <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                      </button>
                  </div>
                </div>
                <form id="create-sample" method="post">
                    @csrf
                </form>
                  <div class="form-group row">
                      <div id="tanggal_sample" class="col-md-3 input-group" data-target-input="nearest">
                          <input name="tanggal_sample" placeholder="Tanggal Sample" class="form-control datetimepicker-input" type="text" data-target="#tanggal_sample" id="tanggal">
                          <div class="input-group-append" data-target="#tanggal_sample" data-toggle="datetimepicker">
                              <div class="input-group-text"><i class="fa fa-calendar"></i></div>
                          </div>
                          <span class="invalid-feedback"></span>
                      </div>
                      <select id="department" class="form-control col-md-2" name="department" style="margin-right: 15px">
                          <option value="">-- Pilih Department --</option>
                          @foreach ($departments as $department)
                              <option value="{{ $department->id }}">{{ $department->name }}</option>
                          @endforeach
                      </select>
                      <select id="shift" class="form-control col-md-2" name="shift" style="margin-right: 15px">
                          <option value="">-- Pilih Shift --</option>
                          @foreach ($shifts as $shift)
                              <option value="{{ $shift->name }}">{{ $shift->name }}</option>
                          @endforeach
                      </select>
                  </div>
                  <div class="form-group row">
                    <div class="col-md-12">
                        <ul class="nav nav-tabs" role="tablist">
                            <li class="nav-item">
                                <a href="#line" class="nav-link active" data-toggle="tab" role="tab" aria-controls="line">Lines :</a>
                            </li>
                        </ul>
                        <div class="tab-content">
                            <div class="tab-pane active" id="variants" role="tabpanel">
                                <span class="first">Select Shift first</span>
                                <div style="display: none">
                                  @foreach ($variant_products as $variant)
                                      <button onClick="createSample({{ $variant->mid }})" style="height: 80px; margin: 2px; width: 130px" type="button" class="btn btn-outline-primary text-left">
                                        <strong>{{ $variant->name }}</strong><br>
                                        <span style="font-size: 10px;">Status</span><br>
                                        <span style="font-size: 10px">ID : Sample ID</span>
                                      </button>
                                  @endforeach
                                </div>
                            </div>
                        </div>
                    </div>
                  </div>
              </div>

  			</div>
  		</div>
  	</div>
  </div>
@endsection
@push('scripts')
<script type="text/javascript">
    var sekarang = "{{ date('Y-m-d') }}";
    $('#tanggal').val(sekarang);
    $('#tanggal_sample').datetimepicker({
        locale: 'id',
        format: 'Y-MM-D'
    });
    $('#department').change(function () {
        $('#variants div').hide();
        $('#variants .first').show();
    })
    $('#shift').change(function () {
        $('#variants .first').hide();
        $('#variants div').show();
    })


    function get_lines()
    {
      var dept_id = $('#department').val();
      if (dept_id == "") {
          alert('select department first');
          return false;
      }
      var jam_sample = $('#jam_sample').val();
      var tanggal_sample = $('#tanggal').val();
      $.ajax({
          url : "{{ URL::to('line') }}/"+dept_id+"/"+tanggal_sample+"/"+jam_sample+"/get",
          type: 'GET',
          dataType: 'JSON',
          success: (response) => {
              $('#lines').html(response.option)
          },
          error: (error) => {
              console.log(error)
          }
      })
    }

    function createSample(mid)
    {
      if (confirm('buat sample ini?')) {
        $('#alert').html('');
        var data_form = $('#create-sample').serializeArray();
        var department = $('#department').val();
        var tanggal_sample = $('#tanggal').val();
        var shift = $('#shift').val();
        data_form.push({
          name: "mid",
          value: mid
        });
        data_form.push({
          name: "department",
          value: department
        });
        data_form.push({
          name: "tanggal_sample",
          value: tanggal_sample
        });
        data_form.push({
          name: "shift",
          value: shift
        });
        $.ajax({
            data : data_form,
            url: "{{ route('sample.mie.create') }}",
            type: "POST",
            success: (response) => {
                if(response.success != 1) {
                    alert(response.error);
                }
                $('#alert').html(`
                  <div class=\"alert alert-success alert-dismissible\">
                      <i class=\"fa fa-check\"></i> <span class=\"text\">Sample berhasil dibuat!. ID : </span><strong><span class=\"id-sample\"></span></strong>
                      <button type=\"button\" class=\"close\" data-dismiss=\"alert\" aria-label=\"Close\">
                        <span aria-hidden=\"true\">&times;</span>
                      </button>
                  </div>
                `);
                $('.alert-success .id-sample').text(response.id)
            },
            error: (error) => {
                console.log(error)
            }
        });
      }
    }

    $('#create_sample').submit( (event) => {
        event.preventDefault();
        var data_form = $('#create_sample').serializeArray();
        var department = $('#department').val();
        var tanggal_sample = $('#tanggal').val();
        var jam_sample = $('#jam_sample').val();
        var line = $('#line').val();
        data_form.push({
          name: "department",
          value: department
        });
        data_form.push({
          name: "tanggal_sample",
          value: tanggal_sample
        });
        data_form.push({
          name: "jam_sample",
          value: jam_sample
        });
        $.ajax({
            data : data_form,
            url: "{{ route('sample.minyak.create') }}",
            type: "POST",
            success: (response) => {
                if(response.success != 1) {
                    alert(response.error);
                }
                $('#confirm').modal('hide');
                $('#line').val('');
                get_lines();
            },
            error: (error) => {
                console.log(error)
            }
        });
    });

</script>
@endpush
