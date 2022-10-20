<% if $IncludeFormTag %>
<form {$addExtraClass('form form-inline').AttributesHTML}>
<% end_if %>
<% include SilverCart/Forms/CustomFormMessages %>
<% loop $HiddenFields %>
    {$Field}
<% end_loop %>
    {$BeforeFormContent}
    {$CustomFormSpecialFields}
<% loop $Actions %>
    <button class="btn btn-xs btn-link pl-0" id="{$ID}" name="{$Name}" title="{$Title}" data-placement="top" data-toggle="tooltip" ><span class="fa fa-trash"></span> {$Title}</button>
<% end_loop %>
    {$AfterFormContent}
<% if $IncludeFormTag %>
</form>
<% end_if %>