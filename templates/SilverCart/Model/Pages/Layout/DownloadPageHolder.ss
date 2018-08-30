<div class="row">
    <section id="content-main" class="col-12 col-md-9">
        <h2 class="sr-only">{$Title}</h2>
        <% include SilverCart/Model/Pages/BreadCrumbs %>
        <article>
            <header><h1>{$Title}</h1></header>
            {$Content}
            {$DownloadSearchForm}
        <% if $Children %>
            <hr/>
            <% loop $Children %>
            <section class="mt-2">
                <h2>{$Title}</h2>
                <% if $Content %>
                    {$Content}
                <% end_if %>
                <% include SilverCart/Model/Pages/DownloadPage_Table %>
            </section>
            <% end_loop %>
        <% end_if %>
        </article>
        <% include SilverCart/Model/Pages/WidgetSetContent %>
    </section>
    <aside class="col-12 col-md-3">
        {$InsertWidgetArea(Sidebar)}
    </aside>
</div>