<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="Display Lab Report App PT. PAS">
  <meta name="author" content="ITE PT.PAS">
  <meta name="csrf-token" content="{{ csrf_token() }}">
  <link rel="shortcut icon" href="{{ asset('assets/img/favicon.png') }}">
  <title>Lab Report | Display sample result</title>
  {{-- Style --}}
  <link href="{{ asset('assets/css/style.css') }}" rel="stylesheet">
  <link href="{{ asset('assets/css/tempusdominus-bootstrap-4.min.css') }}" rel="stylesheet">
  <style type="text/css">
      .history td {
          padding: 0.25rem
      }
      h2.judul {
        border-bottom: 1px solid #000
      }
  </style>

</head>

<body class="app header-fixed sidebar-fixed aside-menu-fixed aside-menu-hidden sidebar-hidden" style="background: #fff">
  <div class="container-fluid">
    <!-- Header -->
    <header style="background: #fff;box-shadow: 0 2px 5px 0 rgba(0,0,0,.16), 0 2px 10px 0 rgba(0,0,0,.12)" class="row">
        <nav class="navbar navbar-light col-md-2">
            <a href="#" class="navbar-brand">
                <img width="150px" src="{{ asset('images/logo.png') }}" alt="Display App">
            </a>
        </nav>
        <div style="padding: 5px" class="text-center title col-md-8">
            <h3>Real Time Lab Report</h3>
            <input type="hidden" id="dept" value="{{ $dept }}">
            <input type="hidden" id="line" value="{{ $line }}">
            <span class="dept">@if($dept != '') {{ $dept }} @else DEPT @endif</span><span class="line"> @if($line != '') {!! str_replace('-', ' ', $line) !!} @else LINE @endif</span>
        </div>
        <div style="padding: 5px; padding-right: 15px" class="text-right col-md-2">
            <h4 class="time">11:30:00</h4>
            <span class="date">27 Maret 2018</span>
        </div>
    </header>
  </div>
  <div class="container-fluid row" style="flex-grow: 1; margin-top: 10px">
      <div class="col-sm-12">
        <!-- Sample Minyak -->
        <h2 class="col-sm-12 judul" >Sample Minyak</h2>
        <div id="sample-minyak" class="row">
            <div class="col-md-6 hasil-sample">
                <table rules="all" class="table" style="background: #fff;border-radius: 5px !important;box-shadow: 0 2px 5px 0 rgba(0,0,0,.16), 0 2px 10px 0 rgba(0,0,0,.12)">
                    <thead>
                        <tr style="background: #bc0303; color: #fff">
                            <th colspan="2">Minyak Proses</th>
                        </tr>
                    </thead>
                    <tbody class="text-center">
                        <tr>
                            <td style="padding: 0 !important">
                                <h2 style="padding: 0">PV</h2>
                                <table style="width: 100%;" rules="all">
                                    <thead>
                                        <tr>
                                            <th style="border-left: 0px !important"><span>BKA</span> <br>(<span class="jam-sample-pv-BKA">00:00</span>)</th>
                                            <th>MP <br>(<span class="jam-sample-pv-MP">00:00</span>)</th>
                                            <th style="border-right: 0px !important">BKB <br>(<span class="jam-sample-pv-BKB">00:00</span>)</th>
                                        </tr>
                                    </thead>
                                    <tbody style="font-weight: bold">
                                        <tr>
                                            <td style="border-left: 0px !important"> <span style="font-size: 25px" class="nilai-sample-pv-BKA">0.00</span></td>
                                            <td><span style="font-size: 25px" class="nilai-sample-pv-MP">0.00</span></td>
                                            <td style="border-right: 0px !important"><span style="font-size: 25px" class="nilai-sample-pv-BKB">0.00</span></td>
                                        </tr>
                                    </tbody>
                                </table>
                            </td>
                            <td style="padding: 0 !important">
                                <h2 style="padding: 0">FFA</h2>
                                <table style="width: 100%" rules="all">
                                    <thead>
                                        <tr>
                                            <th style="border-left: 0px !important">BKA <br>(<span class="jam-sample-ffa-BKA">07:00</span>)</th>
                                            <th>MP <br>(<span class="jam-sample-ffa-MP">07:00</span>)</th>
                                            <th style="border-right: 0px !important">BKB <br>(<span class="jam-sample-ffa-BKB">07:00</span>)</th>
                                        </tr>
                                    </thead>
                                    <tbody style="font-weight: bold">
                                        <tr>
                                            <td style="border-left: 0px !important"><span style="font-size: 25px" class="nilai-sample-ffa-BKA">0.0000</span></td>
                                            <td><span style="font-size: 25px" class="nilai-sample-ffa-MP">0.0000</span></td>
                                            <td style="border-right: 0px !important"><span style="font-size: 25px" class="nilai-sample-ffa-BKB">0.0000</span></td>
                                        </tr>
                                    </tbody>
                                </table>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>
            <div class="col-md-6 disposisi">
                <table style="background: #fff;border-radius: 5px;box-shadow: 0 2px 5px 0 rgba(0,0,0,.16), 0 2px 10px 0 rgba(0,0,0,.12)" class="table">
                    <thead>
                        <tr style="background: #bc0303; color: #fff" class="text-center">
                            <th class="text-center" rowspan="2" width="5px"><i class="fa fa-flask"></i></th>
                            <th rowspan="2">Komposisi</th>
                            <th rowspan="2">Dsiposisi</th>
                        </tr>                        
                    </thead>
                    <tbody class="text-center" style="font-weight: bold; font-size: 1.5em">
                        <tr>
                            <th>PV</th>
                            <td class="pv-komposisi">
                                No Data 
                            </td>
                            <td class="pv-disposisi">
                                No Data
                            </td>
                        </tr>
                        <tr>
                            <th>FFA</th>
                            <td class="ffa-komposisi">
                                No Data
                            </td>
                            <td class="ffa-disposisi">
                                No Data
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>
      </div>
      <div class="col-sm-4">
        <h2 class="col-sm-12 judul">Sample Mie</h2>
        <div id="sample-mie">
            <div class="hasil-sample">
                <table style="background: #fff;border-radius: 5px;box-shadow: 0 2px 5px 0 rgba(0,0,0,.16), 0 2px 10px 0 rgba(0,0,0,.12)" class="table">
                    <thead>
                        <tr style="background: #bc0303; color: #fff">
                            <th colspan="2">Shift : <span class="mie-shift"> ... </span>, Variant : <span class="mie-variant"> ... </span></th>
                        </tr>
                    </thead>
                    <tbody class="text-center" style="font-weight: bold">
                        <tr>
                            <td>
                                <h2 style="padding: 0">FC</h2>
                                <span style="font-size: 25px" class="mie-fc">No Data</span>
                            </td>
                            <td>
                                <h2>KA</h2>
                                <span style="font-size: 25px" class="mie-ka">No Data</span>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>
      </div>
      <div class="col-sm-8">
        <div class="row">
            <h2 class="col-sm-12 judul">History</h2>
            <div class="history col-sm-6">
                <table style="background: #fff;border-radius: 5px;box-shadow: 0 2px 5px 0 rgba(0,0,0,.16), 0 2px 10px 0 rgba(0,0,0,.12)" class="table">
                    <thead>
                        <tr style="background: #bc0303; color: #fff" class="text-center">
                            <th>#</th>
                            <th><i class="fa fa-clock-o"></i> Shift</th>
                            <th>FC</th>
                            <th>KA</th>
                        </tr>
                    </thead>
                    <tbody class="text-center" id="history-mie" style="font-weight: bold">
                        <tr>
                            <td colspan="4">No Data..</td>
                        </tr>
                    </tbody>
                </table>
            </div>
            <div class="history col-sm-6">
                <table style="background: #fff;border-radius: 5px;box-shadow: 0 2px 5px 0 rgba(0,0,0,.16), 0 2px 10px 0 rgba(0,0,0,.12)" class="table">
                    <thead>
                        <tr style="background: #bc0303; color: #fff" class="text-center">
                            <th>#</th>
                            <th><i class="fa fa-clock-o"></i> Sample</th>
                            <th><i class="fa fa-clock-o"></i> Create</th>
                            <th>PV</th>
                            <th>FFA</th>
                        </tr>
                    </thead>
                    <tbody class="text-center" style="font-weight: bold" id="history-minyak">
                        <tr>
                            <td colspan="4">No Data...</td>
                        </tr>
                    </tbody>
                </table>
            </div>
            </div>
          </div>
  </div>
<!--    <footer class="app-footer" style="top: 0">
      <span>ITE © 2018 PT. Prakarsa Alam Segar.</span>
    </footer> -->
  <script src="{{ asset('assets/js/moment.min.js') }}"></script>
  <script type="text/javascript">
      moment.locale('id');
  </script>
  <script src="{{ asset('assets/js/app.js') }}"></script>

  <script>
       window.Laravel = {!! json_encode([
           'csrfToken' => csrf_token(),
       ]) !!};
   </script>
   <script type="text/javascript">
    var count = 1;
    function setTime(time)
    {
        if (time < 10) {
           return '0'+time;
        }
        return time;
    }
    var no = 1;
    setInterval(function() {
        var date = new Date();
        var h = setTime(date.getHours());
        var i = setTime(date.getMinutes());
        var s = setTime(date.getSeconds());
        var d = setTime(date.getDate());
        var dateString = date.toString();
        var arrDate = dateString.split(' ');
        htmlDate = arrDate[0] + ", " + arrDate[2] + " " + arrDate[1] + " " + arrDate[3];
        $('.time').text(h+':'+i+':'+s);
        $('.date').html(htmlDate);
        // if (no%2 == 0) {
        //     $('body').attr('style', 'background: #000');
        // }else{
        //     $('body').attr('style', 'background: #fff');
        // }
        // no++;
     }, 1000)

    // History 5 sample minyak
    function get_history_minyak()
    {
        $.ajax({
          url : "{{ URL::to('display/minyak/get-history') }}/"+$('#dept').val()+"/"+$('#line').val(),
          type : "GET",
          dataType : 'JSON',
          success : function (response)
          {
            if (response.length != 0) {
              var no = 0;
              $('#history-minyak').html('');
              $.each(response, (index, item) => {
                  no++;
                  $('#history-minyak').append(`
                      <tr>
                          <td>`+no+`</td>
                          <td>`+item.sample_time+`</td>
                          <td>`+item.input_time+`</td>
                          <td>`+item.nilai_pv+`</td>
                          <td>`+item.nilai_ffa+`</td>
                      </tr>
                  `);
              })
            }
          },
          error : function (error)
          {
              console.log(error)
          }
        })
    }

    // History 5 sample mie
    function get_history_mie()
    {
        $.ajax({
          url : "{{ URL::to('display/mie/get-history') }}/"+$('#dept').val()+"/"+$('#line').val(),
          type : "GET",
          dataType : 'JSON',
          success : function (response)
          {
            if (response.length != 0) {
              var no = 0;
              $('#history-mie').html('');
              $.each(response, (index, item) => {
                  no++;
                  $('#history-mie').append(`
                      <tr>
                          <td>`+no+`</td>
                          <td>`+item.shift+`</td>
                          <td>`+item.nilai_fc+`</td>
                          <td>`+item.nilai_ka+`</td>
                      </tr>
                  `);
              })
            }
          },
          error : function (error)
          {
              console.log(error)
          }
        })
    }

    function get_sample_mie_result()
    {
        $.ajax({
          url : "{{ URL::to('display/mie/get-result') }}/"+$('#dept').val()+"/"+$('#line').val(),
          type : "GET",
          dataType : 'JSON',
          success : function (response)
          {
            if (response != null) {
              $('.mie-shift').html(response.shift);
              $('.mie-variant').html(response.variant);
              $('.mie-fc').html(response.nilai_fc);
              $('.mie-ka').html(response.nilai_ka);
            }
          },
          error : function (error)
          {
              console.log(error)
          }
        })
    }

    function get_sample_result(tangki) {
         $.ajax({
            url: "{{ URL::to('display/minyak/get-last/') }}/"+tangki+"/"+$('#dept').val()+"/"+$('#line').val(),
            type: "GET",
            dataType: "JSON",
            success: function (response) {
              if (response !== null) {
                $('.jam-sample-pv-'+tangki).text(response.sample_time.substr(0,5))
                $('.nilai-sample-pv-'+tangki).text(response.nilai_pv)
                $('.jam-sample-ffa-'+tangki).text(response.sample_time.substr(0,5))
                $('.nilai-sample-ffa-'+tangki).text(response.nilai_ffa)
                if (tangki == 'MP') {
                    /////// Ini untuk Local
                    if (response.jenis_variant == 'lokal')
                    {
                        if(response.nilai_pv < 2.50) {
                          $('.pv-komposisi').html('0');
                          $('.pv-disposisi').html('OK');
                        }
                        if(response.nilai_pv >= 2.50 && response.nilai_pv <= 3.00 ) {
                          $('.pv-komposisi').html('0');
                          $('.pv-disposisi').html('OK');
                        }
                        if(response.nilai_pv >= 3.00 && response.nilai_pv <= 3.50 ) {
                          $('.pv-komposisi').html('20% BB<br>80% BK');
                          $('.pv-disposisi').html('OK');
                        }
                        if(response.nilai_pv >= 3.51 && response.nilai_pv <= 3.80 ) {
                          $('.pv-komposisi').html('30% BB<br>70% BK');
                          $('.pv-disposisi').html('OK, sample ulang 1/2 jam');
                        }
                        if(response.nilai_pv >= 3.81 && response.nilai_pv <= 4.00 ) {
                          $('.pv-komposisi').html('40%<br>60% BK');
                          $('.pv-disposisi').html('Realase, Cut Proses, Komposisi');
                        }
                        if(response.nilai_pv >= 4.01 && response.nilai_pv <= 4.50 ) {
                          $('.pv-komposisi').html('50%<br> 50% BK');
                          $('.pv-disposisi').html('Realase Pasar Tradisional');
                        }
                        if(response.nilai_pv >= 4.51 && response.nilai_pv <= 5.00 ) {
                          $('.pv-komposisi').html('70%<br>30% BK');
                          $('.pv-disposisi').html('Inkubasi 1 minggu');
                        }
                        if(response.nilai_pv > 5.00 ) {
                          $('.pv-komposisi').html('100%<br>0% BK');
                          $('.pv-disposisi').html('Repack Mie Eko');
                        }
                        // Untuk menampilkan komposisi FFA
                        if(response.nilai_ffa < 0.2000) {
                          $('.ffa-komposisi').html('0');
                          $('.ffa-disposisi').html('OK');
                        }
                        if(response.nilai_ffa >= 0.2000 && response.nilai_ffa <= 0.2350 ) {
                          $('.ffa-komposisi').html('30%<br>70% BK');
                          $('.ffa-disposisi').html('OK');
                        }
                        if(response.nilai_ffa >= 0.2351 && response.nilai_ffa <= 2.500 ) {
                          $('.ffa-komposisi').html('40%<br>60% BK');
                          $('.ffa-disposisi').html('Realase, Cut Proses, Komposisi');
                        }
                        if(response.nilai_ffa >= 0.2501 && response.nilai_ffa <= 0.2750 ) {
                          $('.ffa-komposisi').html('50%<br>50% BK');
                          $('.ffa-disposisi').html('Inkubasi 1 minggu. Jika panel OK, Release Pasar Tradisional');
                        }
                        if(response.nilai_ffa >= 0.2751 && response.nilai_ffa <= 0.4000 ) {
                          $('.ffa-komposisi').html('70%<br> 30% BK');
                          $('.ffa-disposisi').html('Inkubasi 1 minggu. Jika panel OK, Release Pasar Tradisional');
                        }
                        if(response.nilai_ffa > 0.4000 ) {
                          $('.ffa-komposisi').html('100%<br>0% BK');
                          $('.ffa-disposisi').html('Repack Mie Eko');
                        }
                    }
                    else if(response.jenis_variant == 'export')
                    {
                        /////// Ini untuk export
                        // Untuk menampilkan komposisi pv
                        if(response.nilai_pv < 3.00) {
                          $('.pv-komposisi').html('0');
                          $('.pv-disposisi').html('OK');
                        }
                        if(response.nilai_pv >= 3.00 && response.nilai_pv <= 3.30 ) {
                          $('.pv-komposisi').html('20% BB<br>80% BK');
                          $('.pv-disposisi').html('OK');
                        }
                        if(response.nilai_pv >= 3.31 && response.nilai_pv <= 3.50 ) {
                          $('.pv-komposisi').html('30% BB<br>70% BK');
                          $('.pv-disposisi').html('OK, sample ulang 1/2 jam');
                        }
                        if(response.nilai_pv >= 3.51 && response.nilai_pv <= 4.10 ) {
                          $('.pv-komposisi').html('40% BB<br>60% BK');
                          $('.pv-disposisi').html('Release, Cut Proses, Komposisi');
                        }
                        if(response.nilai_pv >= 4.11 && response.nilai_pv <= 4.50 ) {
                          $('.pv-komposisi').html('50% BB<br>50% BK');
                          $('.pv-disposisi').html('Repack & Release Pasar Tradisional');
                        }
                        if(response.nilai_pv >= 4.51 && response.nilai_pv <= 5.0 ) {
                          $('.pv-komposisi').html('70% BB<br>30% BK');
                          $('.pv-disposisi').html('Inkubasi 1 minggu & Repack Tradisional');
                        }
                        if(response.nilai_pv > 5.0 ) {
                          $('.pv-komposisi').html('100% BB<br>0% BK');
                          $('.pv-disposisi').html('Repack Mie Eko');
                        }
                        // Untuk menampilkan komposisi FFA
                        if(response.nilai_ffa < 0.2000) {
                          $('.ffa-komposisi').html('0');
                          $('.ffa-disposisi').html('OK');
                        }
                        if(response.nilai_ffa >= 0.2000 && response.nilai_ffa <= 0.2350 ) {
                          $('.ffa-komposisi').html('30% BB<br>70% BK');
                          $('.ffa-disposisi').html('OK, sample ulang 1/2 jam');
                        }
                        if(response.nilai_ffa >= 0.2351 && response.nilai_ffa <= 0.2500 ) {
                          $('.ffa-komposisi').html('40% BB<br>60% BK');
                          $('.ffa-disposisi').html('Release, Cut Proses, Komposisi');
                        }
                        if(response.nilai_ffa >= 0.2501 && response.nilai_ffa <= 0.2750 ) {
                          $('.ffa-komposisi').html('50% BB<br>50% BK');
                          $('.ffa-disposisi').html('Inkubasi 1 minggu & Repack Tradisional');
                        }
                        if(response.nilai_ffa >= 0.2751 && response.nilai_ffa <= 0.4000 ) {
                          $('.ffa-komposisi').html('70% BB<br>30% BK');
                          $('.ffa-disposisi').html('Inkubasi 1 minggu & Repack Tradisional');
                        }
                        if(response.nilai_ffa > 0.4000 ) {
                          $('.ffa-komposisi').html('100% BB<br>0% BK');
                          $('.ffa-disposisi').html('Repack Mie Eko');
                        }
                    }

                }
              }
            },
            error: function (error) {
                console.log(error.response);
            }
         })
     }
   if ($('#dept').val() != '' && $('#line').val() != '') {
        // Data refresh setiap 10 detik
        setInterval(function() {
            // Untuk mendapatkan nilai sample minyak terakhir
            get_sample_result('MP')
            get_sample_result('BKA')
            get_sample_result('BKB')
            // Untuk mendapatkan nilai history minyak
            get_history_minyak();
            // Untuk mendapatkan nilai history mie
            get_history_mie();
            // Untuk mendapatkan nilai sample mie terakhir
            get_sample_mie_result();
        }, 10000);
        // Untuk menampilkan data sebelum sepuluh detik
        // Untuk mendapatkan nilai sample minyak terakhir
        get_sample_result('MP')
        get_sample_result('BKA')
        get_sample_result('BKB')
        // Untuk mendapatkan nilai history minyak
        get_history_minyak();
        // Untuk mendapatkan nilai history mie
        get_history_mie();
        // Untuk mendapatkan nilai sample mie terakhir
        get_sample_mie_result();
    }

   </script>
</body>
</html>
