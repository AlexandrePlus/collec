<script>
	/*
	 * Impression de l'etiquette correspondant a l'echantillon courant
	 */
	$(document).ready(function() {
		$("#sampleSpinner2").hide();

		$("#samplelabels2").keypress(function() {
			$(this.form).find("input[name='module']").val("samplePrintLabel");
			$("#sampleSpinner2").show();
			$(this.form).submit();
		});
		$("#samplelabels2").click(function() {
			$(this.form).find("input[name='module']").val("samplePrintLabel");
			$("#sampleSpinner2").show();
			$(this.form).submit();
		});
		$("#sampledirect2").keypress(function() {
			$(this.form).find("input[name='module']").val("samplePrintDirect");
			$("#sampleSpinner2").show();
			$(this.form).submit();
		});
		$("#sampledirect2").click(function() {
			$(this.form).find("input[name='module']").val("samplePrintDirect");
			$("#sampleSpinner2").show();
			$(this.form).submit();
		});
	});
</script>

<h2>Détail d'un échantillon</h2>
<div class="row">
<div class="col-md-12">
<a href="index.php?module={$moduleListe}"><img src="{$display}/images/list.png" height="25">Retour à la liste</a>
{if $droits.gestion == 1}
&nbsp;
<a href="index.php?module=sampleChange&uid=0">
<img src="{$display}/images/new.png" height="25">
Nouvel échantillon
</a>
{if $modifiable == 1}
&nbsp;
<a href="index.php?module=sampleChange&uid={$data.uid}">
<img src="{$display}/images/edit.gif" height="25">Modifier...
</a>
{/if}
<!-- Entrée ou sortie -->
<span id="input">
<a href="index.php?module=movementsampleInput&movement_id=0&uid={$data.uid}" id="input" title="Entrer l'échantillon dans le stock">
<img src="{$display}/images/input.png" height="25">Entrée
</a>
</span>

<span id="output">
<a href="index.php?module=movementsampleOutput&movement_id=0&uid={$data.uid}" id="output" title="Sortir l'échantillon du stock">
<img src="{$display}/images/output.png" height="25">Sortie</a></span>

{/if}
&nbsp;
<a href="#echantillons">
<img src="{$display}/images/sample.png" height="25">Échantillons dérivés
</a>
&nbsp;
<a href="#documents">
<img src="{$display}/images/camera.png" height="25">Documents associés
</a>
&nbsp;
<a href="#bookings">
<img src="{$display}/images/crossed-calendar.png" height="25">Réservations
</a>
{if $data.multiple_type_id > 0}
<a href="#subsample">
<img src="{$display}/images/subsample.png" height="25">Sous-échantillonnage
</a>
{/if}
&nbsp;
<a href="index.php?module=sampleDisplay&uid={$data.uid}">
<img src="{$display}/images/refresh.png" title="Rafraîchir la page" height="15">
</a>
<div class="row">
<fieldset class="col-md-4">
<legend>Informations générales</legend>
{if $droits.gestion == 1}
<form method="GET" id="formListPrint" action="index.php">
	<input type="hidden" id="modulePrint" name="module" value="samplePrintLabel">
	<input type="hidden" id="uid2" name="uid[]" value="{$data.uid}">
	<div class="row">
		<div class="center">
			<select id="labels2" name="label_id">
			<option value="" {if $label_id == ""}selected{/if}>Étiquette par défaut</option>
			{section name=lst loop=$labels}
			<option value="{$labels[lst].label_id}" {if $labels[lst].label_id == $label_id}selected{/if}>
			{$labels[lst].label_name}
			</option>
			{/section}
			</select>
			<button id="samplelabels2" class="btn btn-primary">Étiquettes</button>
			<img id="sampleSpinner2" src="{$display}/images/spinner.gif" height="25">

			{if count($printers) > 0}
			<select id="printers2" name="printer_id">
			{section name=lst loop=$printers}
			<option value="{$printers[lst].printer_id}">
			{$printers[lst].printer_name}
			</option>
			{/section}
			</select>
			<button id="sampledirect2" class="btn btn-primary">Impression directe</button>
			{/if}
		</div>
	</div>
	</form>
	{/if}

<div class="form-display">
<dl class="dl-horizontal">
<dt>UID et référence :</dt>
<dd>{$data.uid} {$data.identifier}</dd>
</dl>

{if strlen($data.dbuid_origin) > 0}
<dl class="dl-horizontal">
<dt>DB et UID d'origine :</dt>
<dd>{$data.dbuid_origin}</dd>
</dl>
{/if}

<dl class="dl-horizontal">
<dt>Collection :</dt>
<dd>{$data.collection_name}</dd>
</dl>
<dl class="dl-horizontal">
<dt>Type :</dt>
<dd>{$data.sample_type_name}
{if strlen($data.container_type_name) > 0}
<br>
{$data.container_type_name}
{/if}
{if strlen($data.clp_classification) > 0}
<br>
clp : {$data.clp_classification}
{/if}
</dd>
</dl>
{if $data.operation_id > 0}
<dl class="dl-horizontal">
<dt>Protocole et<br>opération :</dt>
<dd>{$data.protocol_year} {$data.protocol_name} {$data.protocol_version} / {$data.operation_name} {$data.operation_version} 
</dd>
</dl>
{/if}
<dl class="dl-horizontal">
<dt>Statut :</dt>
<dd>{$data.object_status_name}</dd>
</dl>

<dl class="dl-horizontal">
<dt title="Date de création de l'échantillon">Date de création<br>de l'échantillon<br>(d'échantillonnage) :</dt>
<dd>{$data.sampling_date}</dd>
</dl>
<dl class="dl-horizontal">
<dt title="Date d'import dans la base de données">Date d'import dans<br>la base de données :</dt>
<dd>{$data.sample_creation_date}</dd>
</dl>
{if strlen($data.expiration_date) > 0}
<dl class="dl-horizontal">
<dt title="Date d'expiration de l'échantillon">Date d'expiration :</dt>
<dd>{$data.expiration_date}</dd>
</dl>
{/if}
{if $data.multiple_type_id > 0}
<dl class="dl-horizontal">
<dt title="Quantité de sous-échantillons ({$data.multiple_unit})">Qté de sous-échantillons ({$data.multiple_unit}) : </dt>
<dd>{$data.multiple_value}</dd>
</dl>
{/if}
{if $data.parent_uid > 0}
<dl class="dl-horizontal">
<dt title="Échantillon parent">Échantillon parent :</dt>
<dd><a href="index.php?module=sampleDisplay&uid={$data.parent_uid}">
{$data.parent_uid} {$data.parent_identifier}
</a>
</dd>
</dl>
{/if}
{if $data.sampling_place_id > 0}
<dl class="dl-horizontal">
<dt>Lieu de prélèvement :</dt>
<dd>{$data.sampling_place_name}</dd>
</dl>
{/if}
{if strlen($data.wgs84_x) > 0 || strlen($data.wgs84_y) > 0}
<dl class="dl-horizontal">
  <dt>Latitude :</dt>
  <dd>{$data.wgs84_y}</dd>
</dl>
<dl class="dl-horizontal">
  <dt>Longitude :</dt>
  <dd>{$data.wgs84_x}</dd>
</dl>
{/if}

<dl class="dl-horizontal">
<dt>Emplacement :</dt>
<dd>
{section name=lst loop=$parents}
<a href="index.php?module=containerDisplay&uid={$parents[lst].uid}">
{$parents[lst].uid} {$parents[lst].identifier} {$container_type_name}
</a>
{if not $smarty.section.lst.last}
<br>
{/if}
{/section}
</dd>
</dl>

{if count($metadata) >0}
<fieldset>
<legend>Métadonnées associées</legend>

{foreach $metadata as $key=>$value}
{if strlen($value) > 0 || count($value) > 0}
<dl class="dl-horizontal">
<dt>{$key} :</dt>
<dd>
{if is_array($value) }
{foreach $value as $val}
{$val}<br>
{/foreach}
{else}
{$value}
{/if}
</dd>
</dl>
{/if}
{/foreach}
</fieldset>
{/if}
</div>
{include file="gestion/objectIdentifierList.tpl"}

{if strlen($data.wgs84_x) > 0 && strlen($data.wgs84_y) > 0}

{include file="gestion/objectMapDisplay.tpl"}

{/if}
</fieldset>

<div class="col-md-8">

<fieldset>
<legend>Événements</legend>
{include file="gestion/eventList.tpl"}
</fieldset>
<fieldset>
<legend>Mouvements</legend>
{include file="gestion/objectMovementList.tpl"}
</fieldset>

</div>

</div>




<fieldset class="col-md-12" id="echantillons">
<legend>Échantillons dérivés</legend>
{if $droits.gestion == 1 && $modifiable == 1}
<a href="index.php?module=sampleChange&uid=0&parent_uid={$data.uid}">
<img src="{$display}/images/new.png" height="25">
Nouvel échantillon dérivé...
</a>
{/if}
{include file="gestion/sampleListDetail.tpl"}
</fieldset>
</div>
</div>
<fieldset class="col-md-12" id="bookings">
<legend>Réservations</legend>
{include file="gestion/bookingList.tpl"}
</fieldset>

<fieldset class="col-md-12" id="documents">
<legend>Documents associés</legend>
{include file="gestion/documentList.tpl"}
</fieldset>

{if $data.multiple_type_id > 0}
<fieldset class="col-md-12" id="subsample">
<legend>Sous-échantillons</legend>
{include file="gestion/subsampleList.tpl"}
</fieldset>
{/if}