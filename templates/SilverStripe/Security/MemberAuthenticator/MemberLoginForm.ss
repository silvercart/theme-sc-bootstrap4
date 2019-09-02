<% if $IncludeFormTag %>
<form {$AttributesHTML}>
<% end_if %>
<div class="modal d-block" tabindex="-1" role="dialog" id="LoginFormModal">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
            <a class="logo-link d-inline-block" href="{$PageByIdentifierCode('SilvercartFrontPage').Link}" title="{$SiteConfig.Title} - {$SiteConfig.Tagline}">
                <img src="<% if $SiteConfig.ShopLogo %>{$SiteConfig.ShopLogo.ScaleHeight(40).Link}<% else %>{$BaseHref}resources/vendor/silvercart/silvercart/client/img/logo.png" style="height:40px<% end_if %>" class="img-fluid" alt="{$SiteConfig.Title}">
                <span class="sr-only">{$SiteConfig.Title} - {$SiteConfig.Tagline}</span>
            </a>
            <h5 class="modal-title"><span class="fa fa-lock"></span> <%t SilverStripe\Security\Security.LOGIN 'Log in' %></h5>
            </div>
            <div class="modal-body">
                <% if $Message %>
                <div id="{$FormName}_error" class="alert alert-{$MessageType}">{$Message}</div>
                <% else %>
                <div id="{$FormName}_error" class="alert alert-{$MessageType}" style="display: none">{$Message}</div>
                <% end_if %>
		<% loop $Fields %>
		    {$FieldHolder}
		<% end_loop %>
            </div>
            <div class="modal-footer justify-content-between">
	<% if $Actions %>
            <% with $Actions.fieldByName('forgotPassword') %>
                {$Field}
            <% end_with %>
            <% with $Actions.fieldByName('action_doLogin') %>
                {$setUseButtonTag(true).addExtraClass('btn btn-primary').Field}
            <% end_with %>
	<% end_if %>
            </div>
        </div>
    </div>
</div>
<% if $IncludeFormTag %>
</form>
<% end_if %>