<% if $IncludeFormTag %>
<form {$AttributesHTML}>
<% end_if %>
<% include SilverCart/Forms/CustomFormMessages %>
    <fieldset>
        <% if $Legend %><legend>{$Legend}</legend><% end_if %>
        <% loop $Fields %>
            {$FieldHolder}
        <% end_loop %>
    </fieldset>
<% if $Actions %>
    <div class="btn-toolbar">
    <% loop $Actions %>
        <% if $InputType == 'submit' %>
            {$setUseButtonTag(1).addExtraClass('btn btn-primary').Field}
        <% else_if $InputType == 'reset' %>
            {$setUseButtonTag(1).addExtraClass('btn btn-outline-danger').Field}
        <% else %>
            {$setUseButtonTag(1).addExtraClass('btn btn-outline-primary').Field}
        <% end_if %>
    <% end_loop %>
    </div>
<% end_if %>
<% if $IncludeFormTag %>
</form>
<% end_if %>
