<% cached $WidgetCacheKey %>
    <% if $FrontTitle %>
        <h2>{$FrontTitle}</h2>
    <% end_if %>
    <% if $FrontContent %>
        {$FrontContent}
    <% end_if %>
    <div class="silvercart-pagelist-widget">
        <% if $getPages %>
            <div class="row row-eq-height">
            <% loop $getPages %>
                <div class="col-xs-12 col-sm-6 col-md-6 col-lg-4 col-xl-4 col-xxl-3 d-flex align-items-stretch">
                    <div class="card">
                        <div class="card-block">
                            <div class="row">
                                <div class="col-xs-8 col-sm-8 col-md-9">
                                    <h4 class="card-title">
                                    <% if $widgetTitle %>
                                        <a href="{$Link}" title="{$widgetTitle}">{$widgetTitle}</a>
                                    <% else_if $Title %>
                                        <a href="{$Link}" title="{$Title}">{$MenuTitle}</a>
                                    <% end_if %>
                                    </h4>
                                    <p class="card-text">{$widgetText}</p>
                                </div>
                                <div class="col-xs-4 col-sm-4 col-md-3 widget-image">
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
                    </div>
                </div>
            <% end_loop %>
            </div>
        <% end_if %>
    </div>
<% end_cached %>