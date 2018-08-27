<% if $IncludeFormTag %>
<form {$addExtraClass('page form form-vertical').addErrorClass('was-validated').AttributesHTML}>
<% end_if %>
<% include SilverCart/Forms/CustomFormMessages %>
<% loop $HiddenFields %>
    {$Field}
<% end_loop %>
    {$BeforeFormContent}
    <div class="row">
        <div class="col-12 col-sm-6 col-lg-4">{$Fields.dataFieldByName('emailaddress').FieldHolder}</div>
        <div class="col-12 col-sm-6 col-lg-4">{$Fields.dataFieldByName('password').FieldHolder}</div>
    </div>
    {$CustomFormSpecialFields}
    <div class="row">
        <div class="col-12 col-lg-8">
        <% loop $Actions %>
            <button class="btn btn-primary float-right" title="{$Title}" value="{$Title}" name="{$Name}" id="{$Id}" type="submit"><span class="fa fa-arrow-right"></span> {$Title}</button>
        <% end_loop %>
            <a href="{$BaseHref}Security/lostpassword" class="btn btn-sm btn-link forgot-password-plain"><%t SilverStripe\Security\Member.BUTTONLOSTPASSWORD 'I\'ve lost my password' %></a>
        </div>
    </div>
    {$AfterFormContent}
<% if $IncludeFormTag %>
</form>
<% end_if %>