<ul {$addExtraClass("list-unstyled").AttributesHTML}>
<% loop $Options %>
    <li class="{$Class}">
        <label class="radio {$Class}" for="{$ID}">
            <input id="{$ID}" name="{$Name}" value="{$Value}" type="radio"<% if $isChecked %> checked<% end_if %><% if $isDisabled %> disabled<% end_if %><% if $Up.Required %> required<% end_if %> />
            {$Title}
        </label>
    </li>
<% end_loop %>
</ul>
