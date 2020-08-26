<% if $IncludeFormTag %>
<form {$addExtraClass('page form').addErrorClass('was-validated').AttributesHTML}>
<% end_if %>
<% include SilverCart/Forms/CustomFormMessages %>
<% loop $HiddenFields %>
    {$Field}
<% end_loop %>
    {$BeforeFormContent}
    {$Fields.dataFieldByName('emailaddress').FieldHolder}
    {$Fields.dataFieldByName('password').FieldHolder}
    {$CustomFormSpecialFields}
    <hr/>
    <div class="justify-content-between">
    <% loop $Actions %>
        <button class="btn btn-primary float-right" title="{$Title}" value="{$Title}" name="{$Name}" id="{$Id}" type="submit"><span class="fa fa-arrow-right"></span> {$Title}</button>
    <% end_loop %>
        <a href="{$BaseHref}Security/lostpassword" class="btn btn-sm btn-link forgot-password-plain"><%t SilverStripe\Security\Member.BUTTONLOSTPASSWORD 'I\'ve lost my password' %></a>
    </div>
    {$AfterFormContent}
<% if $IncludeFormTag %>
</form>
<% end_if %>