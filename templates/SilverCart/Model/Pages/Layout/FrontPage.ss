<main id="main" class="main container-fluid">
    <% if $WidgetSetSidebar.exists %>
    <div class="row">
        <div id="content-main" class="col-12 col-md-6 col-lg-8">
            <section class="frontpage-widgets">
                {$InsertWidgetArea(Content)}
            </section>
        <% if $Content %>
            <hr/>
            <article>{$Content}</article>
        <% end_if %>
        </div>
        <aside class="col-12 col-md-6 col-lg-4">
            {$InsertWidgetArea(Sidebar)}
        </aside>
    </div>
    <% else %>
    <section class="frontpage-widgets">
        {$InsertWidgetArea(Content)}
    </section>
        <% if $Content %>
    <hr/>
    <article>{$Content}</article>
        <% end_if %>
    <% end_if %>
</main>