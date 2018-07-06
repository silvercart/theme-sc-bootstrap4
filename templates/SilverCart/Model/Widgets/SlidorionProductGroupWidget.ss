<% cached $WidgetCacheKey %>
    <% if $ImagesToDisplay %>
    <div class="silvercart-widget-slidorion-productgroup">
        <% if $FrontTitle %>
        <div class="section-header clearfix">
            <h3>$FrontTitle</h3> 
        </div>
        <% end_if %>
        <% if $FrontContent %>
            {$FrontContent}
        <% end_if %>
        <div id="silvercart-slidorion-{$ID}" class="silvercart-widget-slidorion-productgroup-slider rounded border border-light">
            <div class="silvercart-slidorion-slider">
            <% loop $ImagesToDisplay %>
                <div class="silvercart-slidorion-slide" style="background: url('{$resizedImage.URL}') no-repeat center;">
                    <div class="silvercart-slidorion-slide-prev text-center"><span class="fa fa-chevron-up fa-2x position-absolute top"></span></div>
                    <div class="silvercart-slidorion-slide-next text-center"><span class="fa fa-chevron-down fa-2x position-absolute bottom"></span></div>
                    {$Content}
                </div>
            <% end_loop %>
            </div>
            <div class="silvercart-slidorion-accordeon">
            <% loop $ImagesToDisplay %>
                <div class="silvercart-slidorion-link-header"><span>{$Title}</span></div>
                <div class="silvercart-slidorion-link-content position-relative">
                    {$Description}
                    <% if $Link %>
                        <a class="btn btn-sm btn-primary float-right position-absolute bottom-right-5" href="{$Link}"><span class="fa fa-arrow-right"></span> <%t SilverCart\Model\Pages\MyAccountHolder.MORE 'More' %></a>
                    <% end_if %>
                </div>
            <% end_loop %>
            </div>
        </div>
    </div>
    <% end_if %>
<% end_cached %>