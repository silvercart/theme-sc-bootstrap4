<% if $IncludeFormTag %>
<form {$addExtraClass('form').AttributesHTML}>
<% end_if %>
<% include SilverCart/Forms/CustomFormMessages %>
<% loop $HiddenFields %>
    {$Field}
<% end_loop %>
    {$CustomFormSpecialFields}
<% loop $Actions %>
    <button class="btn btn-sm btn-secondary" id="{$ID}" name="{$Name}" title="{$Title}" data-placement="top" data-toggle="tooltip" type="submit"><span class="fa fa-plus"></span></button>
<% end_loop %>
<% if $IncludeFormTag %>
</form>
<% end_if %>