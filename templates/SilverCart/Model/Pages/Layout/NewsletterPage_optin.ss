<div class="row">
    <section id="content-main" class="col-12 col-md-9">
        <h2 class="sr-only">{$OptInPageTitle}</h2>
        <% include SilverCart/Model/Pages/BreadCrumbs %>
        <article>
            <header><h1>{$OptInPageTitle}</h1></header>
            <div class="alert alert-info">{$OptInMessage}</div>
        </article>
    </section>
    <aside class="col-12 col-md-3">
        {$SubNavigation}
        {$InsertWidgetArea(Sidebar)}
    </aside>
</div>