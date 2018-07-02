<% if $IncludeFormTag %>
<form {$addExtraClass('page form form-vertical').AttributesHTML}>
<% end_if %>
<% include SilverCart/Forms/CustomFormMessages %>
<% loop $HiddenFields %>
    {$Field}
<% end_loop %>
    <div class="row">
        <div class="span4 col-sm-4">{$Fields.dataFieldByName('emailaddress').addExtraClass('col-xs-12').FieldHolder}</div>
        <div class="span4 col-sm-4">{$Fields.dataFieldByName('password').addExtraClass('col-xs-12').FieldHolder}</div>
    </div>
    {$CustomFormSpecialFields}
    <div class="row">
        <div class="span4 col-sm-4">
        <% loop $Actions %>
            <button title="{$Title}" value="{$Title}" name="{$Name}" id="{$Id}" class="btn btn-sm btn-primary" type="submit">{$Title}</button>
        <% end_loop %>
        </div>
        <div class="span4 col-sm-4">
            <a href="{$BaseHref}Security/lostpassword" class="btn btn-sm btn-link forgot-password-plain"><%t SilverStripe\Security\Member.BUTTONLOSTPASSWORD 'I\'ve lost my password' %></a>
        </div>
    </div>
<% if $IncludeFormTag %>
</form>
<% end_if %>