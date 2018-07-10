<ul {$addExtraClass("list-unstyled").AttributesHTML}>
<% loop $Options %>
    <li class="form-check {$Class}">
        <input class="form-check-input" type="radio" id="{$ID}" name="{$Name}" value="{$Value}" <% if $isChecked %>checked<% end_if %> <% if $isDisabled %>disabled<% end_if %> <% if $Up.Required %>required<% end_if %> />
        <label class="form-check-label {$Class}" for="{$ID}">{$Title}</label>
    </li>
<% end_loop %>
</ul>
