<% cached 'FrontPage',$CurrentPage.MemberGroupCacheKey %>
<main id="main" class="main container-fluid">
    <% if $WidgetSetSidebar.exists %>
    <div class="row">
        <div id="content-main" class="col-lg-8 col-sm-6 col-xs-12">
            <section class="frontpage-widgets">
                {$InsertWidgetArea(Content)}
            </section>
        <% if $Content %>
            <hr/>
            <article>{$Content}</article>
        <% end_if %>
        </div>
        <aside class="col-lg-4 col-sm-6 col-xs-12">
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
<% end_cached %>