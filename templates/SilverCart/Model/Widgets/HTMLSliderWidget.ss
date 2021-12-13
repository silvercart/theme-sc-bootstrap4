<% cached $WidgetCacheKey %>
    <% if $FrontTitle %>
<header><h3>{$FrontTitle}</h3></header>
    <% end_if %>
    <% if $FrontContent %>
<p class="mb-0">{$FrontContent}</p>
    <% end_if %>
    <% if $Slides %>
<div class="sly-container">
    <div id="widget-sly-{$ID}">
        <ul class="slider">
        <% loop $Slides %>
            <li class="slider-item">{$HTMLContent}</li>
        <% end_loop %>
        </ul>
    </div>
    <div class="scrollbar">
        <div class="handle">
            <div class="mousearea"></div>
        </div>
    </div>
    <button class="btn prev"><span class="fa fa-chevron-left"></span><span class="sr-only"> prev</span></button>
    <button class="btn next"><span class="sr-only">next </span><span class="fa fa-chevron-right"></span></button>
</div>
    <% end_if %>
<% end_cached %>