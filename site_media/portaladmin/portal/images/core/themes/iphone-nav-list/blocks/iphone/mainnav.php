<?php
/*
# ------------------------------------------------------------------------
# JA Teline IV Template
# ------------------------------------------------------------------------
# Copyright (C) 2004-2010 JoomlArt.com. All Rights Reserved.
# @license - PHP files are GNU/GPL V2. CSS / JS are Copyrighted Commercial,
# bound by Proprietary License of JoomlArt. For details on licensing, 
# Please Read Terms of Use at http://www.joomlart.com/terms_of_use.html.
# Author: JoomlArt.com
# Websites:  http://www.joomlart.com -  http://www.joomlancers.com
# Redistribution, Modification or Re-licensing of this file in part of full, 
# is bound by the License applied. 
# ------------------------------------------------------------------------
*/
?>
<div id="ja-mainnav" class="main clearfix">

	<div id="ja-toolbar-top">

		<a class="toggle ip-button button-menu" href="#ja-iphonemenu" title="Menu">Menu</a>
		
		<?php if($this->countModules('search')) : ?>		
		<a class="toggle ip-button button-search" href="#ja-search" title="Search">Search</a>
		<?php endif; ?>

		<a class="toggle ip-button button-login" href="#ja-login" title="Login">Login</a>
		
		<?php
		//if (!($mobile = $this->mobile_device_detect())) return; 
		$handheld_view = $this->getParam('ui');
		$switch_to = $handheld_view=='desktop'?'default':'desktop';
		$text = $handheld_view=='desktop'?'Mobile Version':'Desktop Version';
		?>

		<a class="ja-tool-switchlayout toggle ip-button button-switchlayout" href="<?php echo JURI::base()?>?ui=<?php echo $switch_to?>" onclick="return confirm('<?php echo JText::_('Switch to standard mode confirmation')?>');" title="<?php echo JText::_($text)?>" ><span><?php echo JText::_($text)?></span></a>

	</div>

	<div id="ja-toolbar-main">
	<div id="ja-toolbar-wrap">

		<div id="ja-toolbar-title">
		<div class="inner">
			<a class="ip-button button-back" href="#" id="toolbar-back" title=""></a>
			<span id="toolbar-title">&nbsp;</span>
			<a class="ip-button button-close" href="#" id="toolbar-close" title="">Close</a>
		</div>
		</div>

		<div id="ja-iphonemenu" title="Menu" class="toolbox">
			<jdoc:include type="modules" name="menulist" />
		</div>
		
		<?php if($this->countModules('search')) : ?>
		<div id="ja-search" title="Search" class="toolbox">
			<jdoc:include type="module" name="search" />
		</div>
		<?php endif; ?>
		
		<div id="ja-login" title="Login" class="toolbox">
			<?php $this->showBlock ('iphone/login'); ?>
		</div>

	</div>
	</div>

</div>
<div id="ja-overlay">&nbsp;</div>