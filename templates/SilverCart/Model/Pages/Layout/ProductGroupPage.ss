<div class="row row-offcanvas row-offcanvas-right">
<% cached $CacheKey %>
    <div id="content-main" class="span9 col-lg-9 col-md-9 col-sm-12 col-xs-12">
        <% include SilverCart/Model/Pages/BreadCrumbs %>
        <div class="section-header clearfix">
            <h1>{$Title}</h1>
        </div>
    <% if $ViewableChildren %>
        <div class="silvercart-product-group-page-control-top clearfix">
            <% include SilverCart/Model/Pages/ProductGroupHolderControls %>
        </div>
        <div class="silvercart-product-group-page sc-products margin-bottom clearfix">
            {$RenderProductGroupHolderGroupView}
        </div>
    <% end_if %>
        {$InsertWidgetArea(Content)}
    <% if $HasMoreProductsThan(0) %>
        <div class="silvercart-product-group-page-control-top clearfix" id="scpgpct">
            <% include SilverCart/Model/Pages/ProductGroupPageControlsTop %>
        </div>
    <% end_if %>
        <div class="silvercart-product-group-page sc-products clearfix">
            {$RenderProductGroupPageGroupView}
        </div>
    <% if $HasMoreProductsThan(0) %>
        <div class="silvercart-product-group-page-control-bottom clearfix">
            <% include SilverCart/Model/Pages/ProductGroupPageControlsBottom %>
        </div>
    <% end_if %>
    <% if $isFirstPage %>
        {$PageContent}
    <% end_if %>
    </div>
<% end_cached %>
    <aside id="sidebar" class="span3 col-lg-3 col-md-3 col-sm-12 col-xs-12 sidebar-offcanvas">
        {$InsertWidgetArea(Sidebar)}
    </aside>
</div>