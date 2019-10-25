<% if $IncludeFormTag %>
<form {$AttributesHTML}>
<% end_if %>
<% if $Message %>
    <div id="{$FormName}_error" class="alert alert-{$MessageType}">{$Message}</div>
<% else %>
    <div id="{$FormName}_error" class="alert alert-{$MessageType}" style="display: none">{$Message}</div>
<% end_if %>
    <fieldset>
        <% if $Legend %><legend>$Legend</legend><% end_if %>
        <% loop $Fields %>
            {$FieldHolder}
        <% end_loop %>
    </fieldset>
<% if $Actions %>
    <div class="btn-toolbar">
    <% loop $Actions %>
        {$Field}
    <% end_loop %>
    </div>
<% end_if %>
<% if $IncludeFormTag %>
</form>
<% end_if %>