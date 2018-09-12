@extends('layouts.base')

@section('title')
    Report Sample Mie
@endsection

@section('breadcrumb')
    Sample Mie
@endsection

@section('content')
    <div class="row">
        <div class="col-md-12">
            <div id="alert">
            </div>
            <div class="card">
                <div class="card-header">
                    Report Sample Mie
                </div>
                <div class="card-body row">
                    <div class="col-md-12">
                        <div>
                            <div class="form-group row">
                                <div class="col-md-2">
                                  <select id='filter-department' class="form-control" name="">
                                      <option value="null"> Department </option>
                                      @foreach ($departments as $department)
                                          <option value="{{ $department->id }}">{{ $department->name }}</option>
                                      @endforeach
                                  </select>
                                </div>
                                <div id="start_time" class="col-md-2 input-group date" data-target-input="nearest">
                                    <input name="start_time" placeholder="Tanggal Awal" class="form-control datetimepicker-input" type="text" data-target="#start_time" id="start">
                                    <div class="input-group-append" data-target="#start_time" data-toggle="datetimepicker">
                                        <div class="input-group-text"><i class="fa fa-calendar"></i></div>
                                    </div>
                                    <span class="invalid-feedback"></span>
                                </div>
                                <div id="end_time" class="col-md-2 input-group date" data-target-input="nearest">
                                    <input name="end_time" placeholder="Tanggal Akhir" class="form-control datetimepicker-input" type="text" data-target="#end_time" id="start">
                                    <div class="input-group-append" data-target="#end_time" data-toggle="datetimepicker">
                                        <div class="input-group-text"><i class="fa fa-calendar"></i></div>
                                    </div>
                                    <span class="invalid-feedback"></span>
                                </div>
                                <div id="generate" class="col-md-2">
                                    <button type="button" name="generate_report" class="btn btn-primary">Generate Report</button>
                                </div>
                            </div>
                        </div>
                        <table class="table table-bordered table-striped table-report table-hover">
                            <thead>
                              <tr>
                                  <th>
                                      <select class="form-control" name="">
                                          <option value=""></option>
                                      </select>
                                  </th>
                                  <th>
                                      <select id='filter-status' class="form-control" name="">
                                          <option value="null"></option>
                                          <option value="1">Created</option>
                                          <option value="2">Uploaded</option>
                                          <option value="3">Approved</option>
                                      </select>
                                  </th>
                                  <th>
                                      <select id='filter-line' class="form-control" name="">
                                          <option value="null"><i class="fa fa-filter"></i></option>
                                      </select>
                                  </th>
                                  <th>
                                      <select id='filter-variant' class="form-control" name="">
                                          <option value="null"><i class="fa fa-filter"></i></option>
                                          @foreach ($variants as $variant)
                                              <option value="{{ $variant->mid }}">{{ $variant->name }}</option>
                                          @endforeach
                                      </select>
                                  </th>
                                  <th colspan="4" style="text-align: center;">FC</th>
                                  <th colspan="4" style="text-align: center;">KA</th>
                              </tr>
                              <tr style="text-align: center; cursor: pointer">
                                  <th style="vertical-align: middle;" width="160">Sample Id</th>
                                  <th style="vertical-align: middle;" width="100">Status</th>
                                  <th style="vertical-align: middle;" width="150">Line</th>
                                  <th style="vertical-align: middle;" width="80">Variant</th>
                                  <th width="150">Bobot</th>
                                  <th width="110">Labu Awal</th>
                                  <th width="100">Labu Isi</th>
                                  <th width="100">Nilai</th>
                                  <th width="150">W Cawan 0</th>
                                  <th width="110">W Cawan 1</th>
                                  <th width="120">W Cawan 2</th>
                                  <th width="120">Nilai</th>
                              </tr>
                            </thead>
                            <tbody>
                            </tbody>
                            <tfoot>
                                <tr>
                                  <td colspan="12">
                                    <a id="link-download-excel" href="" class="btn btn-sm btn-outline-success">
                                      <i class="fa fa-file-excel-o"></i> Download Excel
                                    </a>
                                  </td>
                                </tr>
                            </tfoot>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
@endsection

@push('scripts')
    <script type="text/javascript">
    $('#start_time').datetimepicker({
        locale:'id',
        format: 'Y-MM-D'
    })
    $('#start_time input').val("{{ date('Y-m-d') }}");
    $('#end_time').datetimepicker({
        locale:'id',
        format: 'Y-MM-D'
    });
    var table;
    $(function() {
        get_data();
        function get_data()
        {
            var department = $('#filter-department').val();
            var line = $('#filter-line').val();
            var status = $('#filter-status').val();
            var tangki = $('#filter-tangki').val();
            var start_time = $('#start_time input').val();
            var end_time = $('#end_time input').val();
            var variant = $('#filter-variant').val();            
            $('#link-download-excel').attr('href', "{{ URL::to('sample-mie/report-sample/excel')}}/"+department+"/"+status+"/"+line+"/"+variant+"/"+start_time+"/"+end_time);
            table = $('.table').DataTable( {
                "ajax" : {
                    "url" : "{{ URL::to('sample-mie/report-sample/data')}}/"+department+"/"+status+"/"+line+"/"+variant+"/"+start_time+"/"+end_time,
                    "type" : "GET"
                }
            });
            $('.dataTables_wrapper').removeClass('container-fluid');
            $('.table').removeAttr('style');
        }
        $('#filter-department').on('change', () => {
            table.destroy();
            get_data();
            var line = $('#filter-line');
            $('#filter-line').html('');
            $.ajax({
                url : "{{ URL::to('line/per_department')}}/"+$('#filter-department').val(),
                type : "GET",
                dataType : 'JSON',
                success: function (response) {
                  line.append(`<option value="null"></option>`);
                  $.each(response, (index, item) => {
                      var option1 = `<option value="`+item.id+`">`+item.id+`</option>`;
                      line.append(option1);
                  });
                },
                error : function (error) {
                    console.log(error);
                }
            })
        })
        $('#generate button').on('click', function() {
          table.destroy();
          get_data();
        })
        $('#filter-line').on('change', () => {
            table.destroy();
            get_data();
        })
        $('#filter-status').on('change', () => {
            table.destroy();
            get_data();
        })
        $('#filter-tangki').on('change', () => {
            table.destroy();
            get_data();
        })
    });
    </script>
@endpush
