<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

use App\Department;
class DepartmentController extends Controller
{
    public function index()
    {
      return view('department.index');
    }

    public function listData()
    {
        $department = Department::orderBy('name', 'asc')->get();
        $no = 0;
        $data = array();
        foreach ($department as $list) {
          $no++;
          $row = array();
          $row[] = $no;
          $row[] = $list->id;
          $row[] = $list->name;
          $row[] = $list->status;
          $row[] = '<div class="btn-group">
                    <a onClick="editForm('.$list->id.')" class="btn btn-primary btn-sm text-white"><i class="fa fa-pencil"></i></a>
                    <a onClick="deleteData('.$list->id.')" class="btn btn-danger btn-sm text-white"><i class="fa fa-trash"></i></a>
                    </div>';
          $data[] = $row;
        }
        $output = array("data" => $data);
        return response()->json($output);
    }
    public function store(Request $request)
    {
        $department = new Department;
        $department->id = $request['id'];
        $department->name = $request['name'];
        $department->created_by = '25749';
        $department->updated_by = '25749';
        $department->save();
    }
    public function edit($id)
    {
        $department = Department::find($id);
        echo json_encode($department);
    }
    public function update($id, Request $request)
    {
        $department = Department::find($id);
        $department->name = $request['name'];
        $department->update();
    }
    public function status($status, $id)
    {
        $department = Department::find($id);
        $department->status = $status;
        $department->update();
    }
    public function destroy($id)
    {
        $department = Department::find($id);
        $department->delete();
    }
}
