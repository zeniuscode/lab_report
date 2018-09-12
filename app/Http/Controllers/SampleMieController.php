<?php

namespace App\Http\Controllers;

use Excel;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Auth;

use App\Department;
use App\VariantProduct;
use App\KA;
use App\FC;
use App\SampleMie;
use App\MShift;
use App\JamSample;

use App\LogSampleMie;

class SampleMieController extends Controller
{
    var $permissions = [];
    public function set_permissions()
    {
      // query untuk mendapatkan semua permission berdasarkan auth id milik user.
        $get_permissions = DB::table('auth_permission')
                          ->join('auth_group_permission', 'auth_permission.id', '=', 'auth_group_permission.permission_id')
                          ->join('auth_group', 'auth_group.id', '=', 'auth_group_permission.group_id')
                          ->select('auth_permission.codename as codename')
                          ->where('auth_group.id','=', Auth::user()->group_id)
                          ->get();
        foreach ($get_permissions as $permission) {
            array_push($this->permissions, $permission->codename);
        }
    }
    public function input()
    {
        $this->set_permissions();
        $department = DB::table('m_department')->where('dept_group', '=', Auth::user()->dept_group)->get();
        $shift = Mshift::all();
        return view('sample_mie.input', ['departments' => $department, 'shift' => $shift, 'permissions' => $this->permissions]);
    }
    public function delete_sample($id)
    {
      $sample_mie = SampleMie::find($id);
      $keterangan = 'deleted by '.Auth::user()->nik;
      $sample_mie->keterangan = $keterangan;
      $status = 'delete';
      $sample_mie->status = 4;
      $sample_mie->update();
      // Untuk Log
      $log = new LogSampleMie;
      $log->sample_id = $id;
      $log->nik = Auth::user()->nik;
      $log->log_time = date('Y-m-d H:i:s');
      $log->action = $status;
      $log->keterangan = $keterangan;
      $log->save();
      return response()->json(['success' => 1, 'id' => $id], 200);
    }
    public function per_status($status, $dept)
    {
        // Untuk menampilkan Ka saja
        if ($status == 9) {
            $sample = DB::table('t_sample_mie')
                ->join('m_variant_product', 't_sample_mie.mid_product', '=', 'm_variant_product.mid')
                ->join('t_fc', 't_sample_mie.id', '=', 't_fc.sample_id')
                ->join('t_ka', 't_sample_mie.id', '=', 't_ka.sample_id')
                ->join('m_department', 't_sample_mie.dept_id', '=', 'm_department.id')
                ->select('t_sample_mie.keterangan','t_sample_mie.approve','t_sample_mie.approver','t_sample_mie.with_fc','m_department.name as dept_name','m_variant_product.name as variant','t_sample_mie.*', 't_fc.id as fc_id', 't_ka.id as ka_id', 't_fc.labu_isi as labu_isi_fc', 't_fc.labu_awal as labu_awal_fc', 't_fc.nilai as nilai_fc', 't_fc.bobot_sample as bobot_sample_fc', 't_ka.w0 as w0_ka','t_ka.w1 as w1_ka', 't_ka.w2 as w2_ka', 't_ka.nilai as nilai_ka')
                ->where('t_sample_mie.dept_id', $dept)
                ->where('t_sample_mie.with_fc', 'Y')
                ->where('t_fc.nilai', 0)
                ->orderBy('t_sample_mie.line_id', 'asc')
                ->get();
        }else{
            $sample = DB::table('t_sample_mie')
                ->join('m_variant_product', 't_sample_mie.mid_product', '=', 'm_variant_product.mid')
                ->join('t_fc', 't_sample_mie.id', '=', 't_fc.sample_id')
                ->join('t_ka', 't_sample_mie.id', '=', 't_ka.sample_id')
                ->join('m_department', 't_sample_mie.dept_id', '=', 'm_department.id')
                ->select('t_sample_mie.with_fc','m_department.name as dept_name','m_variant_product.name as variant','t_sample_mie.*', 't_fc.id as fc_id', 't_ka.id as ka_id', 't_fc.labu_isi as labu_isi_fc', 't_fc.labu_awal as labu_awal_fc', 't_fc.nilai as nilai_fc', 't_fc.bobot_sample as bobot_sample_fc', 't_ka.w0 as w0_ka','t_ka.w1 as w1_ka', 't_ka.w2 as w2_ka', 't_ka.nilai as nilai_ka')
                ->where('t_sample_mie.status', $status)
                ->where('t_sample_mie.dept_id', $dept)
                ->orderBy('t_sample_mie.line_id', 'asc')
                ->get();
        }
        
        return json_encode($sample);
    }

    public function upload_sample_result()
    {
        $this->set_permissions();
        $department = DB::table('m_department')->where('dept_group', '=', Auth::user()->dept_group)->get();
        return view('qa.upload-hasil-sample-mie', ['departments' => $department, 'permissions' => $this->permissions]);
    }
    public function upload_sample_result_fc()
    {
        $this->set_permissions();
        $department = DB::table('m_department')->where('dept_group', '=', Auth::user()->dept_group)->get();
        return view('qa.upload-hasil-sample-mie-fc', ['departments' => $department, 'permissions' => $this->permissions]);
    }

    public function generate_report($tanggal)
    {
      $sample_mie = Db::table('t_sample_mie')
                          ->join('t_ka', 't_sample_mie.id', '=', 't_ka.sample_id')
                          ->join('t_fc', 't_sample_mie.id', '=', 't_fc.sample_id')
                          ->select('t_sample_mie.*', 't_fc.labu_isi', 't_fc.labu_awal', 't_fc.nilai as nilai_fc', 't_fc.bobot_sample', 't_ka.w0','t_ka.w1', 't_ka.w2', 't_ka.nilai as nilai_ka')
                          ->where('t_sample_mie.approve', null)
                          ->where('t_sample_mie.tanggal', date('Y-m-d', strtotime($request['tanggal_sample'])))
                          ->get();
      $no = 0;
      $data = array();
      foreach ($sample_mie as $list) {
        $no++;
        $row = array();
        $row[] = $list->mid_product;
        $row[] = $list->bobot_sample;
        $row[] = $list->labu_awal;
        $row[] = $list->labu_isi;
        $row[] = $list->nilai_ka;
        $row[] = $list->w0;
        $row[] = $list->w1;
        $row[] = $list->w2;
        $row[] = $list->nilai_fc;
        $data[] = $row;
      }
      $output = array("data" => $data);
      return response()->json($output);
    }

    public function hasil()
    {
        $this->set_permissions();
        return view('sample_mie.hasil', ['permissions' => $this->permissions]);
    }

    public function approve(Request $request)
    {
        $sample_mie = SampleMie::find($request['id']);
        if ($request['status'] == 'Y') {
            $sample_mie->approve = $request['status'];
        }
        if ($request['keterangan']) {
            $sample_mie->keterangan = $request['keterangan'];
            $status = 'reject';
            $sample_mie->status = 1;
            $keterangan = $request['keterangan'];
        }else{
            $keterangan = 'Approved by '.Auth::user()->nik;
            $sample_mie->keterangan = 'Approved by '.Auth::user()->nik;
            $status = 'approve';
            $sample_mie->status = 3;
        }
        $sample_mie->approver = Auth::user()->nik;
        $sample_mie->approve_date = date('Y-m-d');
        $sample_mie->approve_time = date('H:i:s');
        $sample_mie->update();
        // Untuk Log
        $log = new LogSampleMie;
        $log->sample_id = $request['id'];
        $log->nik = Auth::user()->nik;
        $log->log_time = date('Y-m-d H:i:s');
        $log->action = $status;
        $log->keterangan = $keterangan;
        $log->save();
        return response()->json(['success' => 1, 'id' => $request['id']], 200);
    }

    public function create_sample_id()
    {
        $this->set_permissions();
        $variant_products = VariantProduct::all();
        $shift = MShift::all();
        $department = Department::where('dept_group', '=', Auth::user()->dept_group)->get();
        return view('qc.create-sample-mie', ['departments' => $department, 'variant_products' => $variant_products, 'shifts' => $shift, 'permissions' => $this->permissions]);
    }

    public function showHasil()
    {
        $sample_mie = Db::table('t_sample_mie')
                            ->join('m_variant_product', 't_sample_mie.mid_product', '=', 'm_variant_product.mid')
                            ->join('t_ka', 't_sample_mie.id', '=', 't_ka.sample_id')
                            ->join('t_fc', 't_sample_mie.id', '=', 't_fc.sample_id')
                            ->select('m_variant_product.name as variant','t_sample_mie.*', 't_fc.labu_isi', 't_fc.labu_awal', 't_fc.nilai as nilai_fc', 't_fc.bobot_sample', 't_ka.w0','t_ka.w1', 't_ka.w2', 't_ka.nilai as nilai_ka')
                            ->where('t_sample_mie.approve', null)
                            ->where('t_sample_mie.status', 2)
                            ->orderBy('t_sample_mie.line_id', 'asc')
                            ->get();
        $no = 0;
        $data = array();
        foreach ($sample_mie as $list) {
          $no++;
          $row = array();
          $row[] = $list->line_id;
          $row[] = $list->variant;
          $row[] = $list->shift;
          $row[] = $list->labu_isi;
          $row[] = $list->labu_awal;
          $row[] = $list->bobot_sample;
          $row[] = $list->nilai_fc;
          $row[] = $list->w0;
          $row[] = $list->w1;
          $row[] = $list->w2;
          $row[] = $list->nilai_ka;
          $row[] = "<div class=\"btn-group\">
                    <a title=\"Approve\" onClick=\"Approve('".$list->id."')\" class=\"btn btn-primary btn-sm text-white\"><i class=\"fa fa-check\"></i></a>
                    <a title=\"Revis\" onClick=\"Reject('".$list->id."')\" class=\"btn btn-danger btn-sm text-white\"><i class=\"fa fa-reply\"></i></a>
                    </div>";
          $data[] = $row;
        }
        $output = array("data" => $data);
        return response()->json($output);
    }

    public function create_sample(Request $request)
    {
        // Untuk Id
        $last = DB::table('t_sample_mie')->orderBy('id', 'desc')->first();
        if($last == null) {
            $number = '001';
        }else{
            $number = substr($last->id, 9, 3);
            $number = $number + 1;
            if($number < 10 ) {
                $number = '00'.$number;
            }elseif ($number < 100) {
                $number = '0'.$number;
            }
        }

        $id = "MIE".date('ymd').$number;
        // Untuk kebutuhan lain
        $dept_id = $request['department'];
        $mid_product = $request['mid'];
        $sample_date = $request['tanggal_sample'];
        $line = $request['line'];
        $input_date = date('Y-m-d');
        $input_time = date('H:i');
        $shift = $request['shift'];
        $created_by = Auth::user()->nik;
        $keterangan = 'created by '.$created_by;
        // Mulai menyimpan
        $sample_mie = new SampleMie;
        $sample_mie->id = $id;
        $sample_mie->dept_id = $dept_id;
        $sample_mie->line_id = $line;
        $sample_mie->mid_product = $mid_product;
        $sample_mie->sample_date = $sample_date;
        $sample_mie->input_date = $input_date;
        $sample_mie->input_time = $input_time;
        $sample_mie->shift = $shift;
        $sample_mie->status = '1';
        $sample_mie->created_by = $created_by;
        $sample_mie->save();

        $ka = new KA;
        $ka->sample_id = $id;
        $ka->save();
        // Insert ke FC
        $fc = new FC;
        $fc->sample_id = $id;
        $fc->save();
        // Untuk Log
        $log = new LogSampleMie;
        $log->sample_id = $id;
        $log->nik = Auth::user()->nik;
        $log->log_time = date('Y-m-d H:i:s');
        $log->action = 'create';
        $log->keterangan = Auth::user()->nik.' created sample sample '.$id.' at '.date('Y-m-d H:i:s');
        $log->save();
        return response()->json(['success' => 1, 'id' => $id], 200);
    }

    public function store_sample(Request $request)
    {
        $saved_id = array();
        for ($i=0; $i <= $request['row']; $i++) {
            if ($request['nilai_fc_'.$i] != '' || $request['nilai_ka_'.$i] != '') {
                if ($request['w_fc_'.$i]) {
                    $with_fc = 'Y';
                }else{
                    $with_fc = 'N';
                }
                // Untuk kebutuhan lain
                $upload_date = date('Y-m-d');
                $upload_time = date('H:i');
                $uploaded_by = Auth::user()->nik;
                $keterangan = 'uploaded by '.$uploaded_by;
                // Mulai menyimpan
                $sample_mie = SampleMie::find($request['id_'.$i]);
                $sample_mie->upload_date = $upload_date;
                $sample_mie->upload_time = $upload_time;
                $sample_mie->uploaded_by = $uploaded_by;
                $sample_mie->keterangan  = $keterangan;
                $sample_mie->status = '2';
                $sample_mie->with_fc  = $with_fc;
                $sample_mie->update();
                // Insert ke FC
                $fc = FC::find($request['id_fc_'.$i]);
                $fc->labu_isi = str_replace(',', '.', $request['labu_isi_fc_'.$i]);
                $fc->labu_awal = str_replace(',', '.', $request['labu_awal_fc_'.$i]);
                $fc->bobot_sample = str_replace(',', '.', $request['bobot_sample_fc_'. $i]);
                $fc->nilai = str_replace(',', '.', $request['nilai_fc_'.$i]);
                $fc->update();
                // Insert ke KA
                $ka = KA::find($request['id_ka_'.$i]);
                $ka->w0 = str_replace(',', '.', $request['w0_ka_'.$i]);
                $ka->w1 = str_replace(',', '.', $request['w1_ka_'.$i]);
                $ka->w2 = str_replace(',', '.', $request['w2_ka_'. $i]);
                $ka->nilai = str_replace(',', '.', $request['nilai_ka_'.$i]);
                $ka->update();
                // Untuk Log
                $log = new LogSampleMie;
                $log->sample_id = $request['id_'.$i];
                $log->nik = Auth::user()->nik;
                $log->log_time = date('Y-m-d H:i:s');
                $log->action = 'upload';
                $log->keterangan = Auth::user()->nik.' uploaded sample result '.$request['id_'.$i].' at '.date('Y-m-d H:i:s');
                $log->labu_isi_fc = str_replace(',', '.', $request['labu_isi_fc_'.$i]);
                $log->labu_awal_fc = str_replace(',', '.', $request['labu_awal_fc_'.$i]);
                $log->bobot_sample_fc = str_replace(',', '.', $request['bobot_sample_fc_'. $i]);
                $log->nilai_fc = str_replace(',', '.', $request['nilai_fc_'. $i]);
                $log->w0_ka = str_replace(',', '.', $request['w0_ka_'.$i]);
                $log->w1_ka = str_replace(',', '.', $request['w1_ka_'.$i]);
                $log->w2_ka = str_replace(',', '.', $request['w2_ka_'.$i]);
                $log->nilai_ka = str_replace(',', '.', $request['nilai_ka_'. $i]);
                $log->save();
                array_push($saved_id, $request['id_'.$i]);
            }

            if ($i == $request['row']) {
                return response()->json(['success' => 1, 'saved_id' => $saved_id], 200);
            }
        }
    }

    public function store_sample_fc(Request $request)
    {
        $saved_id = array();
        for ($i=0; $i <= $request['row']; $i++) {
            if ($request['nilai_fc_'.$i] != '' && $request['nilai_fc_'.$i] != 0) {
                // Untuk kebutuhan lain
                $upload_date = date('Y-m-d');
                $upload_time = date('H:i');
                $uploaded_by = Auth::user()->nik;
                $keterangan = 'fc uploaded by '.$uploaded_by;
                // Mulai menyimpan
                $sample_mie = SampleMie::find($request['id_'.$i]);
                $sample_mie->upload_date = $upload_date;
                $sample_mie->upload_time = $upload_time;
                $sample_mie->uploaded_by = $uploaded_by;
                $sample_mie->keterangan  = $keterangan;
                $sample_mie->status = '2';
                $sample_mie->update();
                // Insert ke FC
                $fc = FC::find($request['id_fc_'.$i]);
                $fc->labu_isi = str_replace(',', '.', $request['labu_isi_fc_'.$i]);
                $fc->labu_awal = str_replace(',', '.', $request['labu_awal_fc_'.$i]);
                $fc->bobot_sample = str_replace(',', '.', $request['bobot_sample_fc_'. $i]);
                $fc->nilai = str_replace(',', '.', $request['nilai_fc_'.$i]);
                $fc->update();
                // Untuk Log
                $log = new LogSampleMie;
                $log->sample_id = $request['id_'.$i];
                $log->nik = Auth::user()->nik;
                $log->log_time = date('Y-m-d H:i:s');
                $log->action = 'upload_fc';
                $log->keterangan = Auth::user()->nik.' fc uploaded sample result '.$request['id_'.$i].' at '.date('Y-m-d H:i:s');
                $log->labu_isi_fc = str_replace(',', '.', $request['labu_isi_fc_'.$i]);
                $log->labu_awal_fc = str_replace(',', '.', $request['labu_awal_fc_'.$i]);
                $log->bobot_sample_fc = str_replace(',', '.', $request['bobot_sample_fc_'. $i]);
                $log->nilai_fc = str_replace(',', '.', $request['nilai_fc_'. $i]);
                $log->save();
                array_push($saved_id, $request['id_'.$i]);
            }

            if ($i == $request['row']) {
                return response()->json(['success' => 1, 'saved_id' => $saved_id], 200);
            }
        }
    }

}
