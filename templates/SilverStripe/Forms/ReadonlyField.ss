<strong id="{$ID}" class="btn font-weight-bold <% if $extraClass %>{$extraClass}<% end_if %>">{$Value}</strong>
<% if $IncludeHiddenField %>
    <input {$getAttributesHTML("id", "type")} id="hidden-{$ID}" type="hidden" />
<% end_if %>
