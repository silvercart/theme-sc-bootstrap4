<% if $IncludeFormTag %>
<form {$AttributesHTML}>
<% end_if %>
<% include SilverCart/Forms/CustomFormMessages %>
<% loop $HiddenFields %>
    {$Field}
<% end_loop %>
    <div class="widget-login-fields row">
    <% with $Fields.dataFieldByName(emailaddress) %>
        <div id="{$HolderID}" class="input-group col-12 col-sm-6 col-md-12 col-lg-6">
            <div class="input-group-prepend">
                <label class="input-group-text" for="{$ID}"><span class="fa fa-envelope"></span></label>
            </div>
            <input class="form-control" type="text" placeholder="{$Title}" name="{$Name}" id="{$ID}">
        </div>
    <% end_with %>
    <% with $Fields.dataFieldByName(password) %>
        <div id="{$HolderID}" class="input-group col-12 col-sm-6 col-md-12 col-lg-6 mt-2 mt-sm-0  mt-md-2  mt-lg-0">
            <div class="input-group-prepend">
                <label class="input-group-text" for="{$ID}"><span class="fa fa-lock"></span></label>
            </div>
            <input class="form-control" type="password" placeholder="{$Title}" name="{$Name}" id="{$ID}">
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