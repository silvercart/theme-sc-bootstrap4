<div class="row">
    <section id="content-main" class="col-12 col-md-9">
        <article>
            <div class="alert alert-error alert-block">
                <h1 class="alert-heading"><%t SilverCart\Admin\Model\Config.ERROR_TITLE 'An error occured!' %></h1>
                <p><strong>{$ErrorMessage}</strong></p>
            </div>
        </article>
    </section>
    <aside class="col-12 col-md-3">
        {$SubNavigation}
        {$InsertWidgetArea(Sidebar)}
    </aside>
</div>