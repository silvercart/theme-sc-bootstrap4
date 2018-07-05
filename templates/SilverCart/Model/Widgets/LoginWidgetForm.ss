<% if $IncludeFormTag %>
<form {$AttributesHTML}>
<% end_if %>
<% include SilverCart/Forms/CustomFormMessages %>
<% loop $HiddenFields %>
    {$Field}
<% end_loop %>
    <div class="widget-login-fields">
    <% with $Fields.dataFieldByName(emailaddress) %>
        <div id="{$Up.FormName}_{$Name}_Box" class="control-group">
            <div class="input-prepend row-fluid">
                <span class="add-on"><label class="control-label" for="{$ID}"><i class="icon-envelope"></i></label></span>
                <input class="span10" type="text" placeholder="{$Title}" name="{$Name}" id="{$ID}">
            </div>
        </div>
    <% end_with %>
    <% with $Fields.dataFieldByName(password) %>
        <div id="{$Up.FormName}_{$Name}_Box" class="control-group">
            <div class="input-prepend row-fluid">
                <span class="add-on"><label class="control-label" for="{$ID}"><i class="icon-lock"></i></label></span>
                <input class="span6" type="password" placeholder="{$Title}" name="{$Name}" id="{$ID}">
            </div>
        </div>
    <% end_with %>
    </div>
    <div class="clearfix mt-2">
    <% loop $Actions %>
        <button class="btn btn-primary float-right" id="{$ID}" title="{$Title}" value="{$Title}" name="{$Name}" type="submit">{$Title} <span class="fa fa-arrow-right"></span></button>
    <% end_loop %>
        <a class="btn btn-sm float-left mt-2" href="{$BaseHref}Security/lostpassword"><%t SilverStripe\Security\Member.BUTTONLOSTPASSWORD 'I\'ve lost my password' %></a>
    </div>
    {$CustomFormSpecialFields}
<% if $IncludeFormTag %>
</form>
<% end_if %>