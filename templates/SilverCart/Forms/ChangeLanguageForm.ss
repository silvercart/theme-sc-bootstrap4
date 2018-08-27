<div class="silvercart-change-language">
<% if $IncludeFormTag %>
<form {$AttributesHTML}>
<% end_if %>
<% include SilverCart/Forms/CustomFormMessages %>
<% loop $HiddenFields %>
    {$Field}
<% end_loop %>
    {$BeforeFormContent}
    {$Fields.dataFieldByName(Language).FieldHolder}
    {$CustomFormSpecialFields}
    <span><% loop $Actions %>{$Field}<% end_loop %></span>
    {$AfterFormContent}
<% if $IncludeFormTag %>
</form>
<% end_if %>
</div>