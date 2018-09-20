<% if $Elements %>
<div class="sly-container">
    <div id="widget-sly-{$ID}">
        <ul class="slider">
        <% loop $Elements %>
            <% include SilverCart\View\GroupView\ProductSliderEntry %>
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