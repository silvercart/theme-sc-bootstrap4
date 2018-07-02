<div class="row">
    <div id="content-main" class="span9 col-lg-9 col-md-9 col-sm-12 col-xs-12">
        <% include SilverCart/Model/Pages/BreadCrumbs %>
        <article>
            <div class="section-header clearfix">
                <h1>{$Title}</h1>
            </div>
            {$Content}
        </article>
        <% if $Form %>
        <div class="form">
            {$Form}
        </div>
        <% end_if %>
        <div class="silvercartWidgetHolder">
            {$InsertWidgetArea(Content)}
        </div>
    </div>
    <aside class="span3 col-lg-3 col-md-3 col-sm-12 col-xs-12">
        {$InsertWidgetArea(Sidebar)}
    </aside>
</div>
