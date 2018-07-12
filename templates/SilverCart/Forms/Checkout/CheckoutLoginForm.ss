<% if $IncludeFormTag %>
<form {$AttributesHTML}>
<% end_if %>
<% include SilverCart/Forms/CustomFormMessages %>
<% loop $HiddenFields %>
    {$Field}
<% end_loop %>
    {$CustomFormSpecialFields}
    <div class="row">
        <div class="span6 col-md-6">{$Fields.dataFieldByName(emailaddress).FieldHolder}</div>
        <div class="span6 col-md-6">{$Fields.dataFieldByName(password).FieldHolder}</div>
    </div>
    <div class="row">
        <div class="span6 col-md-6">
            <% loop $Actions %>
                <button class="btn btn-primary" type="submit" id="{$ID}" title="{$Title}" value="{$Value}" name="{$Name}">{$Title} <span class="fa fa-caret-right"></span></button>
            <% end_loop %>
        </div>
        <div class="span6 col-md-6">
            <a href="{$BaseHref}Security/lostpassword" class="btn btn-sm btn-link forgot-password-plain"><%t SilverStripe\Security\Member.BUTTONLOSTPASSWORD 'I\'ve lost my password' %></a>
        </div>
    </div>
<% if $IncludeFormTag %>
</form>
<% end_if %>