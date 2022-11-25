<?php
/* Smarty version 3.1.30, created on 2022-11-24 06:41:32
  from "C:\xampp\htdocs\AS\php_08_bd\app\views\ResultsList.tpl" */

/* @var Smarty_Internal_Template $_smarty_tpl */
if ($_smarty_tpl->_decodeProperties($_smarty_tpl, array (
  'version' => '3.1.30',
  'unifunc' => 'content_637f040c101ac1_55394897',
  'has_nocache_code' => false,
  'file_dependency' => 
  array (
    '63aee48af6a9ee4b65946348db01b46f297cda26' => 
    array (
      0 => 'C:\\xampp\\htdocs\\AS\\php_08_bd\\app\\views\\ResultsList.tpl',
      1 => 1669268488,
      2 => 'file',
    ),
  ),
  'includes' => 
  array (
    'file:main.tpl' => 1,
  ),
),false)) {
function content_637f040c101ac1_55394897 (Smarty_Internal_Template $_smarty_tpl) {
$_smarty_tpl->_loadInheritance();
$_smarty_tpl->inheritance->init($_smarty_tpl, true);
?>


<?php 
$_smarty_tpl->inheritance->instanceBlock($_smarty_tpl, 'Block_816457570637f040c100f93_08250152', 'content');
?>

<?php $_smarty_tpl->inheritance->endChild();
$_smarty_tpl->_subTemplateRender("file:main.tpl", $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, 0, $_smarty_tpl->cache_lifetime, array(), 2, false);
}
/* {block 'content'} */
class Block_816457570637f040c100f93_08250152 extends Smarty_Internal_Block
{
public function callBlock(Smarty_Internal_Template $_smarty_tpl) {
?>



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
<?php
$_from = $_smarty_tpl->smarty->ext->_foreach->init($_smarty_tpl, $_smarty_tpl->tpl_vars['results']->value, 'r');
if ($_from !== null) {
foreach ($_from as $_smarty_tpl->tpl_vars['r']->value) {
?>
<tr><td><?php echo $_smarty_tpl->tpl_vars['r']->value["id_result"];?>
</td><td><?php echo $_smarty_tpl->tpl_vars['r']->value["kwota"];?>
</td><td><?php echo $_smarty_tpl->tpl_vars['r']->value["lata"];?>
</td><td><?php echo $_smarty_tpl->tpl_vars['r']->value["oprocentowanie"];?>
</td><td><?php echo $_smarty_tpl->tpl_vars['r']->value["timestamp"];?>
</td></tr>
<?php
}
}
$_smarty_tpl->smarty->ext->_foreach->restore($_smarty_tpl);
?>

</tbody>
</table>

<br/>

<a class="pure-button button-success" href="<?php echo $_smarty_tpl->tpl_vars['conf']->value->action_root;?>
calcShow">Powrót</a>

<?php
}
}
/* {/block 'content'} */
}
