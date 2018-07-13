<% cached $WidgetCacheKey %>
    <% if $FrontTitle %>
<header><h3>{$FrontTitle}</h3></header>
    <% end_if %>
    <% if $FrontContent %>
        {$FrontContent}
    <% end_if %>
    <div class="widget-pagelist">
    <% if $getPages %>
        <div class="card-columns">
        <% loop $getPages %>
            <div class="card">
                <div class="card-body">
                    <h4 class="card-title">
                    <% if $widgetTitle %>
                        <a href="{$Link}" title="{$widgetTitle}">{$widgetTitle}</a>
                    <% else_if $Title %>
                        <a href="{$Link}" title="{$Title}">{$MenuTitle}</a>
                    <% end_if %>
                    </h4>
                    <div class="card-text">
                        <% if $widgetImage %>
                            <a href="{$Link}" title="{$Title}" class="d-inline-block float-right mr-1 mb-1"><img class="img-fluid" alt="{$Title}" src="{$widgetImage.ScaleWidth(60).URL}" /></a>
                        <% else_if $GroupPicture %>
                            <a href="{$Link}" title="{$Title}" class="d-inline-block float-right mr-1 mb-1"><img class="img-fluid" alt="{$Title}" src="{$GroupPicture.ScaleWidth(60).URL}" /></a>
                        <% else_if $getProductsToDisplay.first.ListImage %>
                            <a href="{$Link}" title="{$Title}" class="d-inline-block float-right mr-1 mb-1"><img class="img-fluid" alt="{$Title}" src="{$getProductsToDisplay.first.ListImage.ScaleWidth(60).URL}" /></a>
                        <% end_if %>
                        <% if $widgetText %>
                            {$widgetText}
                        <% else_if $MetaDescription %>
                            {$MetaDescription}
                        <% else_if $Content %>
                            {$Content.Plain.LimitWordAndLineBreakCount(30,5)}
                        <% end_if %>
                    </div>
                </div>
                <div class="card-footer clearfix">
                    <a class="btn btn-sm btn-light float-right" href="{$Link}" title="{$Title}"><span class="fa fa-arrow-right"></span> <%t SilverCart\Model\Pages\MyAccountHolder.MORE 'More' %></a>
                </div>
            </div>
        <% end_loop %>
        </div>
    <% end_if %>
    </div>
<% end_cached %>