<% if $IncludeFormTag %>
<form {$addExtraClass('quickSearch').addErrorClass('was-validated').AttributesHTML} data-moveto="mobile-quicksearch" data-breakpoint="md-down" data-extraclass="absolute-right">
<% end_if %>
<% include SilverCart/Forms/CustomFormMessages %>
<% loop $HiddenFields %>
    {$Field}
<% end_loop %>
    {$BeforeFormContent}
    <div class="input-group">
    <% with $Fields.dataFieldByName(quickSearchQuery) %>
        <label class="sr-only" for="{$ID}">{$Title}</label>
        <input id="{$ID}" class="form-control" type="text" placeholder="{$Placeholder}" value="{$Value}" name="{$Name}">
    <% end_with %>
        {$CustomFormSpecialFields}
    <% loop $Actions %>
        <div class="input-group-append">
            <button class="btn btn-primary" name="quickSearchButton" type="submit"><span class="fa fa-search"></span></button>
        </div>
    <% end_loop %>
    </div>
    {$AfterFormContent}
<% if $IncludeFormTag %>
</form>
<% end_if %>