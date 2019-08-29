<div {$addExtraClass('pt-6').AttributesHTML}>
<% loop $Options %>
    <div class="form-check form-check-inline {$Class}">
        <input class="form-check-input" type="radio" id="{$ID}" name="{$Name}" value="{$Value}" <% if $isChecked %>checked<% end_if %> <% if $isDisabled %>disabled<% end_if %> <% if $Up.Required %>required<% end_if %> />
        <label class="form-check-label {$Class}" for="{$ID}">{$Title}</label>
    </div>
<% end_loop %>
</div>
