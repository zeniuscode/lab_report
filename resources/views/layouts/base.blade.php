<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="Lab Report App PT. PAS">
  <meta name="author" content="ITE PT.PAS">
  <meta name="csrf-token" content="{{ csrf_token() }}">
  <link rel="shortcut icon" href="{{ asset('assets/img/favicon.png') }}">
  <title>Lab Report | @yield('title')</title>
  {{-- Style --}}
  <link href="{{ asset('assets/css/style.css') }}" rel="stylesheet">
  <!-- Styles required by this views -->
  @stack('styles')

</head>

<body class="app header-fixed sidebar-fixed aside-menu-fixed aside-menu-hidden">
 {{-- header --}}
 @include('layouts.header')

  <div class="app-body">
    {{-- sidebar --}}
    @include('layouts.sidebar')

    <!-- Main content -->
    <main class="main">

      @include('layouts.breadcumb')

      <div class="container-fluid">

        <div class="animated fadeIn">
            @yield('main')
        </div>

      </div>
      <!-- /.conainer-fluid -->
    </main>


  </div>

  @include('layouts.footer')

  <script src="{{ asset('assets/js/script.js') }}"></script>

  <!-- Custom scripts required by this view -->
  @stack('scripts')


</body>
</html>
