{extends file="main.tpl"}

{block name=footer}przykładowa tresć stopki wpisana do szablonu głównego z szablonu kalkulatora kredytowego{/block}

{block name=content}

<h2 class="content-head is-center">Prosty kalkulator kredytowy</h2>

<div class="pure-g">
<div class="l-box-lrg pure-u-1 pure-u-med-2-5">
	<form class="pure-form pure-form-stacked" action="{$conf->action_root}calcCompute" method="post">
		<fieldset>

			<label for="kwota">Kwota</label>
			<input id="kwota" type="text" placeholder="kwota kredytu" name="kwota" value="{$form->kwota}">

			<label for="lata">Okres spłaty</label>
			<input id="lata" type="text" placeholder="okres spłaty" name="lata" value="{$form->lata}">
					
			<label for="oprocentowanie">Oprocentowanie</label>
			<input id="oprocentowanie" type="text" placeholder="oprocentowanie" name="oprocentowanie" value="{$form->oprocentowanie}">

			<button type="submit" class="pure-button">Oblicz ratę</button>
		</fieldset>
	</form>
</div>

<div class="l-box-lrg pure-u-1 pure-u-med-3-5">

{* wyświeltenie listy błędów, jeśli istnieją *}
{if $msgs->isError()}
            <h4>Wystąpiły błędy: </h4>
            <ol class="err">
            {foreach $msgs->getErrors() as $err}
            {strip}
                    <li>{$err}</li>
            {/strip}
            {/foreach}
            </ol>
{/if}

{* wyświeltenie listy informacji, jeśli istnieją *}
{if $msgs->isInfo()}
            <h4>Informacje: </h4>
            <ol class="inf">
            {foreach $msgs->getInfos() as $inf}
            {strip}
                    <li>{$inf}</li>
            {/strip}
            {/foreach}
            </ol>
{/if}

{if isset($res->result)}
	<h4>Rata miesięczna</h4>
	<p class="res">
	{$res->result|round:2} PLN
	</p>
{/if}

</div>
</div>

{/block}