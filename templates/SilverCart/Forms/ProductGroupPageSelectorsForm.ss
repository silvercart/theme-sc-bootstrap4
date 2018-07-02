<% if $IncludeFormTag %>
<form {$addExtraClass('form-inline pull-sm-right').AttributesHTML}>
<% end_if %>
<% include SilverCart/Forms/CustomFormMessages %>
<% loop $HiddenFields %>
    {$Field}
<% end_loop %>
    <div class="sortBy inline-block input-group-sm">
    <% with $Fields.dataFieldByName('SortOrder') %>
        {$Title} {$RequiredFieldMarker} {$Field}
    <% end_with %>
    </div>
<% if $hasProductsPerPageOptions %>
    <div class="showItem inline-block input-group-sm">
    <% with $Fields.dataFieldByName('productsPerPage') %>
        {$Title} {$RequiredFieldMarker} {$Field}
    <% end_with %>
    </div>
<% end_if %>
    {$CustomFormSpecialFields}
    <% loop $Actions %>
        <button class="btn btn-sm btn-primary" name="{$name}"><span class="fa fa-filter"></span> {$Title}</button>
    <% end_loop %>
<% if $IncludeFormTag %>
</form>
<% end_if %>