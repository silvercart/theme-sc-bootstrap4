<div id="{$HolderID}" class="custom-control custom-switch <% if $extraClass %>{$extraClass}<% end_if %>">
    {$addErrorClass('is-invalid').addExtraClass('custom-control-input').Field}
    <% if $Title %>
    <label class="custom-control-label" for="{$ID}">{$Title}
        <% if $isRequiredField %><span class="required-field-marker">{$RequiredFieldMarker}</span><% end_if %>
    </label>
    <% end_if %>
    <% if $Message %><div class="<% if $ValidationFailed %>invalid-feedback<% else %>valid-feedback<% end_if %> {$MessageType}">{$Message}</div><% end_if %>
    <% if $RightTitle %><small class="form-text text-muted">{$RightTitle}</small><% end_if %>
    <% if $Description %><small class="form-text text-muted">{$Description}</small><% end_if %>
</div>