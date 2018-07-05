<div class="row">
    <section id="content-main" class="col-12 col-md-9">
        <% include SilverCart/Model/Pages/BreadCrumbs %>
        <article>
            <header><h1>{$Title}</h1></header>
            {$Content}
            {$DownloadSearchForm}
            <p><%t SilverCart\Model\Pages\DownloadPageHolder\ResultsText 'Your search for <strong>&quot;{term}&quot;</strong> resulted in <strong>{count} results</strong>.' term=$SearchQuery count=$SearchResultsCount %></p>
            <hr>
            <% include SilverCart/Model/Pages/DownloadPage_Table %>
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