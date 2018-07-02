<div class="row">
    <div id="content-main" class="col-9 col-lg-9 col-md-9 col-sm-12 col-xs-12">
        <% include SilverCart/Model/Pages/BreadCrumbs %>
<% cached $CacheKey %>
        <h1>{$Title}</h1>
        {$Content}
    <% if $ViewableChildren %>
        <div class="silvercart-product-group-page-control-top clearfix">
            <% include SilverCart/Model/Pages/ProductGroupHolderControls %>
        </div>
        {$RenderProductGroupHolderGroupView}
    <% end_if %>
<% end_cached %>
    </div>
    <aside class="span3 col-lg-3 col-md-3 col-sm-12 col-xs-12 scrollspy">
        {$InsertWidgetArea(Sidebar)}
    </aside>
</div>