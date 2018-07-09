<% if $Message %>
    <div id="{$FormName}_message" class="alert alert-<% if $MessageType == 'error' %>danger<% else_if $MessageType == 'good' %>success<% else_if $MessageType == 'warning' %>warning<% else %>info<% end_if %> message {$MessageType}">{$Message}</div>
<% else %>
    <div id="{$FormName}_message" class="alert alert-danger message" style="display: none"></div>
<% end_if %>