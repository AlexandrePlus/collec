<h2>Modification des statuts des conteneurs</h2>
<div class="row">
<div class="col-md-6">
<a href="index.php?module=containerStatusList">{$LANG.appli.1}</a>

<form class="form-horizontal protoform" id="containerStatusForm" method="post" action="index.php">
<input type="hidden" name="moduleBase" value="containerStatus">
<input type="hidden" name="action" value="Write">
<input type="hidden" name="container_status_id" value="{$data.container_status_id}">
<div class="form-group">
<label for="containerStatusName"  class="control-label col-md-4">Nom<span class="red">*</span> :</label>
<div class="col-md-8">
<input id="containerStatusName" type="text" class="form-control" name="container_status_name" value="{$data.container_status_name}" autofocus required></div>
</div>
<div class="form-group center">
      <button type="submit" class="btn btn-primary button-valid">{$LANG["message"].19}</button>
      {if $data.container_status_id > 0 }
      <button class="btn btn-danger button-delete">{$LANG["message"].20}</button>
      {/if}
 </div>
</form>
</div>
</div>
<span class="red">*</span><span class="messagebas">{$LANG["message"].36}</span>