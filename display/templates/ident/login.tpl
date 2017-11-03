	<div class="col-sm-12 col-md-6">
	<div class="form-horizontal protoform">
	<div class="form-group">
	<label for="login" class="control-label col-sm-4">
	{$LANG.login.0} :
	</label>
	<div class="col-sm-8"> 
	<input class="form-control input-lg" name="login" id="login" maxlength="32" required autofocus>
	</div>
	</div>
	<div class="form-group">
	<label for="login" class="control-label col-sm-4">
	{$LANG.login.1} :
	</label>
	<div class="col-sm-8">
	<input  class="form-control input-lg" name="password" id="password" type="password" autocomplete="off" required maxlength="32">
	</div>
	</div>

	<form id="theForm" method="POST" action="index.php">
	<input type="hidden" name="module" value={$module}>
	<input type="hidden" id="hiddenUsername" name="login"/>
	<input type="hidden" id="hiddenPassword" name="password"/>
  {if $tokenIdentityValidity > 0}
  	<div class="form-group center checkbox col-sm-12 input-lg">
  	<label>
  {$duration = $tokenIdentityValidity / 3600}
  <input type="checkbox" name="loginByTokenRequested" class="" value="1" checked>
  {$LANG.login.46} {$duration} {$LANG.login.47} 
  </label>
  </div>
  {/if}
  {if $lostPassword == 1 }
  <div class="form-group center col-sm-12 input-lg">
  <a href="index.php?module=passwordlostIslost">{$LANG["login"].59}</a>
  </div>
  {/if}
  <div class="form-group center">
	<button type="submit" class="btn btn-primary button-valid input-lg">{$LANG["message"].19}</button>
	</div>
	</form>
	
	</div>
</div>

<script>
  $("#theForm").submit(function() {
    $("#hiddenUsername").val($("#login").val());
    $("#hiddenPassword").val($("#password").val());
  });
  $("#login,#password").keypress(function(e) {
    if (e.which == 13) {
      $("#theForm").submit();
    }
  });
</script>
