<% cached 'FrontPage',$LastEdited,$CurrentPage.MemberGroupCacheKey %>
<main id="main" class="main container-fluid">
    <% if $WidgetSetSidebar.exists %>
    <div class="row">
        <div id="content-main" class="col-12 col-md-6 col-lg-8">
        <% if $WidgetSetContent.exists %>
            <section class="frontpage-widgets">
                <h4 class="sr-only"><%t SilverCart\Model\Pages\Page.WELCOME_TO 'Welcome to' %> {$SiteConfig.Title}</h4>
                {$InsertWidgetArea(Content)}
            </section>
        <% end_if %>
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
        <h4 class="sr-only"><%t SilverCart\Model\Pages\Page.WELCOME_TO 'Welcome to' %> {$SiteConfig.Title}</h4>
        {$InsertWidgetArea(Content)}
    </section>
        <% if $Content %>
    <hr/>
    <article>{$Content}</article>
        <% end_if %>
    <% end_if %>
</main>
<% end_cached %>