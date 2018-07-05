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
                    <div class="row">
                        <div class="col-8 col-md-9">
                            <h4 class="card-title">
                            <% if $widgetTitle %>
                                <a href="{$Link}" title="{$widgetTitle}">{$widgetTitle}</a>
                            <% else_if $Title %>
                                <a href="{$Link}" title="{$Title}">{$MenuTitle}</a>
                            <% end_if %>
                            </h4>
                            <% if $widgetText %>
                                <p class="card-text">{$widgetText}</p>
                            <% else_if $MetaDescription %>
                                <p class="card-text">{$MetaDescription}</p>
                            <% else_if $Content %>
                                <p class="card-text">{$Content.Plain.LimitWordAndLineBreakCount(30,5)}</p>
                            <% end_if %>
                        </div>
                        <div class="col-4 col-md-3 widget-image">
                        <% if $widgetImage %>
                            <a href="{$Link}" title="{$Title}" class="silvercart-pagelist-widget-image"><img class="img-fluid" alt="{$Title}" src="{$widgetImage.URL}" /></a>
                        <% else_if $GroupPicture %>
                            <a href="{$Link}" title="{$Title}" class="silvercart-pagelist-widget-image"><img class="img-fluid" alt="{$Title}" src="{$GroupPicture.URL}" /></a>
                        <% else_if $getProductsToDisplay.first.ListImage %>
                            <a href="{$Link}" title="{$Title}" class="silvercart-pagelist-widget-image"><img class="img-fluid" alt="{$Title}" src="{$getProductsToDisplay.first.ListImage.URL}" /></a>
                        <% end_if %>
                        </div>
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