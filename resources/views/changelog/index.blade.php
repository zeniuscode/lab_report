@extends('layouts.base')

@section('title')
    Change Log Application
@endsection

@section('breadcrumb')
  Change Log
@endsection

@push('styles')

.card-body {
  background: #fff;
  color: #323232;
  font-family: "Open Sans", sans-serif;
  font-size: 112.5%;
  line-height: 1.6em;
}

.timeline {
  position: relative;
  width: 860px;
  margin: 0px auto;
  padding: 20px;
  list-style-type: none;
}
@media (max-width: 860px) {
  .timeline {
    width: 100%;
    padding: 4em 0 1em 0;
  }
}
.timeline:before {
  position: absolute;
  left: 50%;
  top: 0;
  content: " ";
  display: block;
  width: 6px;
  height: 100%;
  margin-left: -3px;
  background: #505050;
  z-index: 5;
}
.timeline li {
  padding: 1em 0;
}
@media (max-width: 860px) {
  .timeline li {
    padding: 2em 0;
  }
}
.timeline li::after {
  content: "";
  display: block;
  height: 0;
  clear: both;
  visibility: hidden;
}

.direction-l {
  position: relative;
  width: 400px;
  float: left;
  text-align: right;
  padding-right: 24px;
}
@media (max-width: 860px) {
  .direction-l {
    float: none;
    width: 100%;
    text-align: center;
  }
}
.direction-l .flag {
  box-shadow: -1px 1px 1px rgba(0, 0, 0, 0.15);
}
.direction-l .flag:after {
  content: "";
  position: absolute;
  left: 100%;
  top: 50%;
  height: 0;
  width: 0;
  margin-top: -8px;
  border: solid transparent;
  border-left-color: #f8f8f8;
  border-width: 8px;
  pointer-events: none;
}
@media (max-width: 860px) {
  .direction-l .flag:after {
    content: "";
    position: absolute;
    left: 50%;
    top: -8px;
    height: 0;
    width: 0;
    margin-left: -8px;
    border: solid transparent;
    border-bottom-color: white;
    border-width: 8px;
    pointer-events: none;
  }
}
.direction-l .time-wrapper {
  float: left;
}
@media (max-width: 860px) {
  .direction-l .time-wrapper {
    float: none;
  }
}

.direction-r {
  position: relative;
  width: 400px;
  float: right;
  padding-left: 24px;
}
@media (max-width: 860px) {
  .direction-r {
    float: none;
    width: 100%;
    text-align: center;
  }
}
.direction-r .flag {
  box-shadow: 1px 1px 1px rgba(0, 0, 0, 0.15);
}
.direction-r .flag:after {
  content: "";
  position: absolute;
  right: 100%;
  top: 50%;
  height: 0;
  width: 0;
  margin-top: -8px;
  border: solid transparent;
  border-right-color: #f8f8f8;
  border-width: 8px;
  pointer-events: none;
}
@media (max-width: 860px) {
  .direction-r .flag:after {
    content: "";
    position: absolute;
    left: 50%;
    top: -8px;
    height: 0;
    width: 0;
    margin-left: -8px;
    border: solid transparent;
    border-bottom-color: white;
    border-width: 8px;
    pointer-events: none;
  }
}
.direction-r .flag:before {
  left: -40px;
}
.direction-r .time-wrapper {
  float: right;
}
@media (max-width: 860px) {
  .direction-r .time-wrapper {
    float: none;
  }
}

.flag-wrapper {
  position: relative;
  display: inline-block;
  text-align: center;
}
@media (max-width: 860px) {
  .flag-wrapper {
    text-align: center;
  }
}
.flag-wrapper .flag {
  position: relative;
  display: inline;
  background: #f8f8f8;
  padding: 6px 10px;
  border-radius: 5px;
  font-weight: 600;
  text-align: left;
}
@media (max-width: 860px) {
  .flag-wrapper .flag {
    background: white;
    z-index: 15;
  }
}

.direction-l .flag:before,
.direction-r .flag:before {
  position: absolute;
  top: 50%;
  right: -40px;
  content: " ";
  display: block;
  width: 12px;
  height: 12px;
  margin-top: -10px;
  background: #fff;
  border-radius: 10px;
  border: 4px solid #58b96b;
  z-index: 10;
}
@media (max-width: 860px) {
  .direction-l .flag:before,
  .direction-r .flag:before {
    position: absolute;
    top: -30px;
    left: 50%;
    content: " ";
    display: block;
    margin-left: -10px;
  }
}

.time-wrapper {
  display: inline;
  line-height: 1em;
  font-size: 0.66666em;
  color: #58b96b;
  vertical-align: middle;
}
@media (max-width: 860px) {
  .time-wrapper {
    display: block;
    position: relative;
    margin: 4px 0 0 0;
    z-index: 14;
  }
}
.time-wrapper .time {
  display: inline-block;
  padding: 4px 6px;
  background: #f8f8f8;
}

.desc {
  margin: 1em 0.75em 0 0;
  font-size: 0.9em;
  font-style: italic;
  line-height: 1.5em;
}
.desc a {
  color: #58b96b;
  text-decoration: none;
}
.desc a:hover {
  text-decoration: underline;
}
@media (max-width: 860px) {
  .desc {
    position: relative;
    margin: 1em 1em 0 1em;
    padding: 1em;
    background: whitesmoke;
    box-shadow: 0 0 1px rgba(0, 0, 0, 0.2);
    z-index: 15;
  }
}


@endpush

@section('content')
  <div class="row">
  	<div class="col-md-12">
  		<div class="card">
  			<div class="card-header">
  				Change Log Application
  			</div>
  			<div class="card-body">
          <ul class="timeline">
            <?php $no = 1; ?>
            <?php foreach ($changelogs as $changelog): ?>
            <?php
              if ($no%2 == 0) {
                $position = 'l';
              }else{
                $position = 'r';
              }
            ?>
            <li>
              <div class="direction-<?php echo $position; ?>">
                <div class="flag-wrapper">
                  <span class="flag">{{ $changelog->title }}</span>
                  <span class="time-wrapper"><span class="time">v. {{ $changelog->version_number }}</span></span>
                </div>
                <div class="desc">
                  {{ $changelog->description }} <span class="date">{{ $changelog->date }}</span>
                </div>
              </div>
            </li>
            <?php $no++; ?>
            <?php endforeach ?>
          </ul>
  			</div>
  		</div>
  	</div>
  </div>
@endsection



@push('scripts')
<script type="text/javascript">

</script>
@endpush
