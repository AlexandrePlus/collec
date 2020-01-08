<?php
/**
 * Created : 11 déc. 2017
 * Creator : quinton
 * Encoding : UTF-8
 * Copyright 2017 - All rights reserved
 */
require_once 'framework/request/request.class.php';
$dataClass = new request($bdd,$ObjetBDDParam);
$keyName = "request_id";
$id = $_REQUEST[$keyName];
switch ($t_module["param"]) {
    case "list":
        /*
         * Display the list of all records of the table
         */
        $vue->set($dataClass->getListe(2), "data");
        $vue->set("framework/request/requestList.tpl" ,"corps");
        break;
    case "change":
        /*
         * open the form to modify the record
         * If is a new record, generate a new record with default value :
         * $_REQUEST["idParent"] contains the identifiant of the parent record
         */
        dataRead($dataClass, $id, "framework/request/requestChange.tpl");
        break;
    case "execListe":
    case "exec":
    $vue->set($dataClass->lire($id), "data");
        $vue->set("framework/request/requestChange.tpl" ,"corps");
        try{
        $vue->set($dataClass->exec($id), "result" );
        $module_coderetour = 1;
        }catch (Exception $e){
            $message->set($e->getMessage());
            $module_coderetour = -1;
        }
        break;
    case "write":
        /*
         * write record in database
         */
        $id = dataWrite($dataClass, $_REQUEST);
        if ($id > 0) {
            $_REQUEST[$keyName] = $id;
            $module_coderetour = 1;
        }
        break;
    case "delete":
        /*
         * delete record
         */
        dataDelete($dataClass, $id);
        break;
    case "copy":
        $data = dataRead($dataClass, 0, "framework/request/requestChange.tpl");
        if ($id > 0) {
            $dinit = $dataClass->lire($id);
            if ($dinit["request_id"] > 0){
                $data ["body"] = $dinit["body"];
                $data["datefields"] = $dinit["datefields"];
                $vue->set($data, "data");
            }
        }
        break;
    default :
}

?>