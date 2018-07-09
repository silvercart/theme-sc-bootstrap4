<div id="{$HolderID}" class="form-group row <% if $extraClass %>{$extraClass}<% end_if %>">
    <% if $Title %>
    <label class="col-sm-2 col-form-label" for="{$ID}">{$Title}
        <% if $isRequiredField %><span class="required-field-marker">{$RequiredFieldMarker}</span><% end_if %>
    </label>
    <% end_if %>
    <div class="col-sm-10">
        {$addErrorClass('is-invalid').Field}
        <% if $Message %><div class="<% if $ValidationFailed %>invalid-feedback<% else %>valid-feedback<% end_if %> {$MessageType}">{$Message}</div><% end_if %>
        <% if $RightTitle %><small class="form-text text-muted">{$RightTitle}</small><% end_if %>
        <% if $Description %><small class="form-text text-muted">{$Description}</small><% end_if %>
    </div>
</div>