<?php
/* Smarty version 4.2.1, created on 2022-10-25 18:25:50
  from 'C:\xampp\htdocs\AS\php_04_szablony_smarty\app\calc.html' */

/* @var Smarty_Internal_Template $_smarty_tpl */
if ($_smarty_tpl->_decodeProperties($_smarty_tpl, array (
  'version' => '4.2.1',
  'unifunc' => 'content_63580e0e1f8a87_62401699',
  'has_nocache_code' => false,
  'file_dependency' => 
  array (
    '6499ea208f452af0cbbffeb9c57b019db94b2408' => 
    array (
      0 => 'C:\\xampp\\htdocs\\AS\\php_04_szablony_smarty\\app\\calc.html',
      1 => 1666715145,
      2 => 'file',
    ),
  ),
  'includes' => 
  array (
  ),
),false)) {
function content_63580e0e1f8a87_62401699 (Smarty_Internal_Template $_smarty_tpl) {
$_smarty_tpl->_loadInheritance();
$_smarty_tpl->inheritance->init($_smarty_tpl, true);
?>


<?php 
$_smarty_tpl->inheritance->instanceBlock($_smarty_tpl, 'Block_90778577063580e0e1c74b1_96570988', 'footer');
?>


<?php 
$_smarty_tpl->inheritance->instanceBlock($_smarty_tpl, 'Block_131020583963580e0e1c89d8_48524307', 'content');
$_smarty_tpl->inheritance->endChild($_smarty_tpl, "../templates/main.html");
}
/* {block 'footer'} */
class Block_90778577063580e0e1c74b1_96570988 extends Smarty_Internal_Block
{
public $subBlocks = array (
  'footer' => 
  array (
    0 => 'Block_90778577063580e0e1c74b1_96570988',
  ),
);
public function callBlock(Smarty_Internal_Template $_smarty_tpl) {
?>
przykładowa tresć stopki wpisana do szablonu głównego z szablonu kalkulatora kredytowego<?php
}
}
/* {/block 'footer'} */
/* {block 'content'} */
class Block_131020583963580e0e1c89d8_48524307 extends Smarty_Internal_Block
{
public $subBlocks = array (
  'content' => 
  array (
    0 => 'Block_131020583963580e0e1c89d8_48524307',
  ),
);
public function callBlock(Smarty_Internal_Template $_smarty_tpl) {
?>


<h2 class="content-head is-center">Prosty kalkulator kredytowy</h2>

<div class="pure-g">
<div class="l-box-lrg pure-u-1 pure-u-med-2-5">
	<form class="pure-form pure-form-stacked" action="<?php echo $_smarty_tpl->tpl_vars['app_url']->value;?>
/app/calc.php" method="post">
		<fieldset>

			<label for="kwota">Kwota</label>
			<input id="kwota" type="text" placeholder="kwota kredytu" name="kwota" value="<?php echo $_smarty_tpl->tpl_vars['form']->value['kwota'];?>
">

<!--			<label for="op">Operacja</label>
					<select id="op" name="op">

<?php if ((isset($_smarty_tpl->tpl_vars['form']->value['op_name']))) {?>
<option value="<?php echo $_smarty_tpl->tpl_vars['form']->value['op'];?>
">ponownie: <?php echo $_smarty_tpl->tpl_vars['form']->value['op_name'];?>
</option>
<option value="" disabled="true">---</option>
<?php }?>
						<option value="plus">(+) dodaj</option>
						<option value="minus">(-) odejmij </option>
						<option value="times">(*) pomnóż</option>
						<option value="div">(/) podziel</option>
					</select>-->
			<label for="lata">Okres spłaty</label>
			<input id="lata" type="text" placeholder="okres spłaty" name="lata" value="<?php echo $_smarty_tpl->tpl_vars['form']->value['lata'];?>
">
					
			<label for="oprocentowanie">Oprocentowanie</label>
			<input id="oprocentowanie" type="text" placeholder="Oprocentowanie" name="oprocentowanie" value="<?php echo $_smarty_tpl->tpl_vars['form']->value['oprocentowanie'];?>
">

			<button type="submit" class="pure-button">Oblicz ratę</button>
		</fieldset>
	</form>
</div>

<div class="l-box-lrg pure-u-1 pure-u-med-3-5">

<?php if ((isset($_smarty_tpl->tpl_vars['messages']->value))) {?>
	<?php if (count($_smarty_tpl->tpl_vars['messages']->value) > 0) {?> 
		<h4>Wystąpiły błędy: </h4>
		<ol class="err">
		<?php
$_from = $_smarty_tpl->smarty->ext->_foreach->init($_smarty_tpl, $_smarty_tpl->tpl_vars['messages']->value, 'msg');
$_smarty_tpl->tpl_vars['msg']->do_else = true;
if ($_from !== null) foreach ($_from as $_smarty_tpl->tpl_vars['msg']->value) {
$_smarty_tpl->tpl_vars['msg']->do_else = false;
?>
		<li><?php echo $_smarty_tpl->tpl_vars['msg']->value;?>
</li>
		<?php
}
$_smarty_tpl->smarty->ext->_foreach->restore($_smarty_tpl, 1);?>
		</ol>
	<?php }
}?>

<?php if ((isset($_smarty_tpl->tpl_vars['infos']->value))) {?>
	<?php if (count($_smarty_tpl->tpl_vars['infos']->value) > 0) {?> 
		<h4>Informacje: </h4>
		<ol class="inf">
		<?php
$_from = $_smarty_tpl->smarty->ext->_foreach->init($_smarty_tpl, $_smarty_tpl->tpl_vars['infos']->value, 'msg');
$_smarty_tpl->tpl_vars['msg']->do_else = true;
if ($_from !== null) foreach ($_from as $_smarty_tpl->tpl_vars['msg']->value) {
$_smarty_tpl->tpl_vars['msg']->do_else = false;
?>
		<li><?php echo $_smarty_tpl->tpl_vars['msg']->value;?>
</li>
		<?php
}
$_smarty_tpl->smarty->ext->_foreach->restore($_smarty_tpl, 1);?>
		</ol>
	<?php }
}?>

<?php if ((isset($_smarty_tpl->tpl_vars['result']->value))) {?>
	<h4>Rata miesięczna</h4>
	<p class="res">
	<?php echo round($_smarty_tpl->tpl_vars['result']->value,2);?>
 PLN
	</p>
<?php }?>

</div>
</div>

<?php
}
}
/* {/block 'content'} */
}
