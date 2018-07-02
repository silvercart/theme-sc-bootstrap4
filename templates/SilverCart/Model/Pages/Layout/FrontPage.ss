<% cached 'FrontPage',$CurrentPage.MemberGroupCacheKey %>
<div id="main" class="main">
    <div class="content container">
    <% if $WidgetSetSidebar.exists %>
        <div class="row">
            <div id="content-main" class="col-lg-8 col-sm-6 col-xs-12">
                <div class="frontpage-widgets">
                    {$InsertWidgetArea(Content)}
                </div>
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
        <div class="frontpage-widgets">
            {$InsertWidgetArea(Content)}
        </div>
        <% if $Content %>
            <hr/>
            <article>{$Content}</article>
        <% end_if %>
    <% end_if %>
    </div>
</div>
<% end_cached %>