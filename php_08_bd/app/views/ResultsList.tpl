{extends file="main.tpl"}

{block name=content}


<table id="tab_results" class="pure-table pure-table-bordered">
<thead>
	<tr>
		<th>id</th>
		<th>kwota</th>
		<th>okres spłaty</th>
		<th>oprocentowanie</th>
                <th>data obliczeń</th>
	</tr>
</thead>
<tbody>
{foreach $results as $r}
{strip}
	<tr>
		<td>{$r["id_result"]}</td>
		<td>{$r["kwota"]}</td>
		<td>{$r["lata"]}</td>
                <td>{$r["oprocentowanie"]}</td>
                <td>{$r["timestamp"]}</td>
	</tr>
{/strip}
{/foreach}
</tbody>
</table>

<br/>

<a class="pure-button button-success" href="{$conf->action_root}calcShow">Powrót</a>

{/block}
