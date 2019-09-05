<div class="input-group flex-nowrap {$extraClass}" id="{$ID}" <% include SilverStripe/Forms/AriaAttributes %>>
<% if $CurrencyIsReadonly %>
    {$AmountField.addExtraClass('text-right').Field}
    {$CurrencyField.Field}
    <div class="input-group-append">
        <span class="input-group-text">{$CurrencySymbol}</span>
    </div>
<% else %>
    {$CurrencyField.SmallFieldHolder}
    {$AmountField.SmallFieldHolder}
<% end_if %>
</div>
