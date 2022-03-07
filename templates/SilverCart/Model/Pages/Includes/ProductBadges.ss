<% if $PriceIsLowerThanMsr || $isNewProduct || $IsTopProduct || $Highlights.exists %>
    <span class="position-absolute top-0 left-2">
    <% if $PriceIsLowerThanMsr %>
        <span class="badge badge-secondary" title="<%t SilverCart\Model\Product\Product.Sale 'Sale' %>"><i><%t SilverCart\Model\Product\Product.Sale 'Sale' %>!</i></span>
    <% end_if %>
    <% if $isNewProduct %>
        <span class="badge badge-primary" title="<%t SilverCart\Model\Product\Product.New 'New' %>"><i><%t SilverCart\Model\Product\Product.New 'New' %>!</i></span>
    <% end_if %>
    <% if $IsTopProduct %>
        <span class="badge badge-danger" title="<%t SilverCart\Model\Product\Product.Top 'Top Product' %>"><i><%t SilverCart\Model\Product\Product.Top 'Top Product' %>!</i></span>
    <% end_if %>
    {$HighlightsForTemplate}
    </span>
<% end_if %>