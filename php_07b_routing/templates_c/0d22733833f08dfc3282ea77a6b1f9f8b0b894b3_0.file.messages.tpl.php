<?php
/* Smarty version 3.1.30, created on 2022-11-16 09:38:16
  from "C:\xampp\htdocs\AS\php_07a_role\app\views\templates\messages.tpl" */

/* @var Smarty_Internal_Template $_smarty_tpl */
if ($_smarty_tpl->_decodeProperties($_smarty_tpl, array (
  'version' => '3.1.30',
  'unifunc' => 'content_6374a178ef19b0_77413532',
  'has_nocache_code' => false,
  'file_dependency' => 
  array (
    '0d22733833f08dfc3282ea77a6b1f9f8b0b894b3' => 
    array (
      0 => 'C:\\xampp\\htdocs\\AS\\php_07a_role\\app\\views\\templates\\messages.tpl',
      1 => 1668587892,
      2 => 'file',
    ),
  ),
  'includes' => 
  array (
  ),
),false)) {
function content_6374a178ef19b0_77413532 (Smarty_Internal_Template $_smarty_tpl) {
if ($_smarty_tpl->tpl_vars['msgs']->value->isError()) {?>
<div class="messages error">
	<ol>
	<?php
$_from = $_smarty_tpl->smarty->ext->_foreach->init($_smarty_tpl, $_smarty_tpl->tpl_vars['msgs']->value->getErrors(), 'err');
if ($_from !== null) {
foreach ($_from as $_smarty_tpl->tpl_vars['err']->value) {
?>
	<li><?php echo $_smarty_tpl->tpl_vars['err']->value;?>
</li>
	<?php
}
}
$_smarty_tpl->smarty->ext->_foreach->restore($_smarty_tpl);
?>

	</ol>
</div>
<?php }
if ($_smarty_tpl->tpl_vars['msgs']->value->isInfo()) {?>
<div class="messages info bottom-margin">
	<ol>
	<?php
$_from = $_smarty_tpl->smarty->ext->_foreach->init($_smarty_tpl, $_smarty_tpl->tpl_vars['msgs']->value->getInfos(), 'inf');
if ($_from !== null) {
foreach ($_from as $_smarty_tpl->tpl_vars['inf']->value) {
?>
	<li><?php echo $_smarty_tpl->tpl_vars['inf']->value;?>
</li>
	<?php
}
}
$_smarty_tpl->smarty->ext->_foreach->restore($_smarty_tpl);
?>

	</ol>
</div>
<?php }
}
}
