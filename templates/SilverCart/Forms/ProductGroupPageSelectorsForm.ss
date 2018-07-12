<% if $IncludeFormTag %>
<form {$addExtraClass('form-inline pull-sm-right').addErrorClass('was-validated').AttributesHTML}>
<% end_if %>
<% include SilverCart/Forms/CustomFormMessages %>
<% loop $HiddenFields %>
    {$Field}
<% end_loop %>
    <div class="input-group mt-1 mt-sm-0">
    <% with $Fields.dataFieldByName('SortOrder') %>
        <div class="input-group-prepend">
            <span class="input-group-text">{$Title}</span>
        </div>
        {$addExtraClass('custom-select').Field}
    <% end_with %>
    </div>
<% if $hasProductsPerPageOptions %>
    <div class="input-group mt-1 mt-sm-0 ml-0 ml-sm-1">
    <% with $Fields.dataFieldByName('productsPerPage') %>
        <div class="input-group-prepend">
            <span class="input-group-text">{$Title}</span>
        </div>
        {$addExtraClass('custom-select').Field}
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