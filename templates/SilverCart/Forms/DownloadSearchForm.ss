<% if $IncludeFormTag %>
<form {$addErrorClass('was-validated').AttributesHTML}>
<% end_if %>
<% include SilverCart/Forms/CustomFormMessages %>
<% loop $HiddenFields %>
    {$Field}
<% end_loop %>
    {$CustomFormSpecialFields}
    <% with $Fields.dataFieldByName(SearchQuery) %>
    <div id="{$HolderID}" class="input-group <% if $extraClass %>{$extraClass}<% end_if %>">
        <input id="{$ID}" class="text <% if $addErrorClass('is-invalid').extraClass %>{$extraClass}<% end_if %>" type="text" placeholder="{$Placeholder}" value="{$Value}" name="{$Name}">
    <% end_with %>
    <% loop $Actions %>
        <div class="input-group-append">
            <button title="{$Title}" class="btn btn-primary" data-placement="top" data-toggle="tooltip"><span class="fa fa-search"></span> {$Title}</button> 
        </div>
    <% end_loop %>
    </div>
<% if $IncludeFormTag %>
</form>
<% end_if %>