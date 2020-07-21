<div {$AttributesHTML}>
<% loop $Options %>
    <div class="custom-control custom-radio {$Class}">
        <input class="custom-control-input" type="radio" id="{$ID}" name="{$Name}" value="{$Value}" <% if $isChecked %>checked<% end_if %> <% if $isDisabled %>disabled<% end_if %> <% if $Up.Required %>required<% end_if %> />
        <label class="custom-control-label {$Class}" for="{$ID}">{$Title}</label>
    </div>
<% end_loop %>
</div>
