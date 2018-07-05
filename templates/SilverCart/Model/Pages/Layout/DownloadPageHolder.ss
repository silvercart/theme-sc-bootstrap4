<div class="row">
    <section id="content-main" class="col-12 col-md-9">
        <% include SilverCart/Model/Pages/BreadCrumbs %>
        <article>
            <header><h1>{$Title}</h1></header>
            {$Content}
            {$DownloadSearchForm}
        <% if $Children %>
            <% loop $Children %>
            <section>
                <h2>{$Title}</h2>
                <% if $Content %>
                    {$Content}
                <% end_if %>
                <% include SilverCart/Model/Pages/DownloadPage_Table %>
            </section>
            <% end_loop %>
        <% end_if %>
        </article>
        <% if $WidgetSetContent.exists %>
        <section class="sc-widget-holder">
            {$InsertWidgetArea(Content)}
        </section>
        <% end_if %>
    </section>
    <aside class="col-12 col-md-3">
        {$InsertWidgetArea(Sidebar)}
    </aside>
</div>