<% if $ShowWidget %>
    <% if $ExtraCssClasses %>
<div class="{$ExtraCssClasses}">
    <% end_if %>
    <% if $FrontTitle %>
    <header><h3>{$FrontTitle}</h3></header>
    <% end_if %>
    <% if $FrontContent %>
        {$FrontContent.RAW}
    <% end_if %>
    <section class="silvercart-product-group-page-control-top clearfix">
        <h4 class="sr-only">{$CurrentPage.Title} filter</h4>
        <% include SilverCart/Model/Pages/ProductGroupPageControlsTop %>
    </section>
    <section class="silvercart-product-group-page sc-products" aria-labelledby="maintitle">
        <h4 class="sr-only">{$CurrentPage.Title}</h4>
        {$RenderProductGroupPageGroupView}
    </section>
    <nav class="silvercart-product-group-page-control-bottom navbar clearfix">
        <h4 class="sr-only">{$CurrentPage.Title} pagination</h4>
        <% include SilverCart/Model/Pages/ProductGroupPageControlsBottom %>
    </nav>
    <% if $ExtraCssClasses %>
</div>
    <% end_if %>
<% end_if %>