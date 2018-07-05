<div class="row">
    <section id="content-main" class="col-12 col-md-9">
        <article>
            {$Content}
        <% if $Form %>
            {$Form}
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
