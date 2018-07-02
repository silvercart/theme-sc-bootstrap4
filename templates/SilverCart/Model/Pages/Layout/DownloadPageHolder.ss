<div class="row">
    <div id="content-main" class="span9 col-lg-9 col-md-9 col-sm-12 col-xs-12">
        <% include SilverCart/Model/Pages/BreadCrumbs %>
        <div class="section-header clearfix">
            <h1>{$Title}</h1>
        </div>
        {$Content}
        {$DownloadSearchForm}
<% if $Children %>
    <% loop $Children %>
        <h2>{$Title}</h2>
        <% if $Content %>
            {$Content}
        <% end_if %>
        <% include SilverCart/Model/Pages/DownloadPage_Table %>
    <% end_loop %>
<% end_if %>
    </div>
    <aside class="span3 col-lg-3 col-md-3 col-sm-12 col-xs-12">
        {$InsertWidgetArea(Sidebar)}
    </aside>
</div>