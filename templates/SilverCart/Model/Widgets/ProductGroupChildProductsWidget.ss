<% if $ShowWidget %>
    <% if $ExtraCssClasses %>
<div class="{$ExtraCssClasses}">
    <% end_if %>
    <% if $FrontTitle %>
    <div class="section-header clearfix">
        <h3>{$FrontTitle}</h3>
    </div>
    <% end_if %>

    <% if $FrontContent %>
        {$FrontContent.RAW}
    <% end_if %>
    <section class="silvercart-product-group-page-control-top productFilter clearfix">
        <h2 class="sr-only">{$CurrentPage.Title} filter</h2>
        <% include SilverCart/Model/Pages/ProductGroupPageControlsTop %>
    </section>
    <section class="silvercart-product-group-page sc-products" aria-labelledby="maintitle">
        {$RenderProductGroupPageGroupView}
    </section>
    <section class="silvercart-product-group-page-control-bottom productFilter clearfix">
        <h2 class="sr-only">{$CurrentPage.Title} pagination</h2>
        <% include SilverCart/Model/Pages/ProductGroupPageControlsBottom %>
    </section>
    <% if $ExtraCssClasses %>
</div>
    <% end_if %>
<% end_if %>