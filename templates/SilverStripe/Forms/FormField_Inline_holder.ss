<div id="{$HolderID}" class="form-group row <% if $extraClass %>{$extraClass}<% end_if %>">
    <% if $Title %>
    <label class="col-sm-3 col-form-label" for="{$ID}">{$Title}
        <% if $isRequiredField %><span class="required-field-marker">{$RequiredFieldMarker}</span><% end_if %>
    </label>
    <% end_if %>
    <div class="col-sm-9">{$addErrorClass('is-invalid').Field}</div>
    <% if $Message %><div class="col-sm-12 <% if $ValidationFailed %>invalid-feedback<% else %>valid-feedback<% end_if %> {$MessageType}">{$Message}</div><% end_if %>
    <% if $RightTitle %><small class="col-sm-12 form-text text-muted">{$RightTitle}</small><% end_if %>
    <% if $Description %><small class="col-sm-12 form-text text-muted">{$Description}</small><% end_if %>
</div>