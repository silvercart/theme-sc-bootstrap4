<li class="slider-item small">
    <div class="card card-product my-1 clearfix text-center w-100 h-100 d-flex">
        <a class="d-inline-block" href="{$Link}" title="{$Title}" data-toggle="tooltip">
        <% if $ListImage %>
            <img class="img-fluid lazyload" src="{$BaseHref}_resources/vendor/silvercart/silvercart/client/img/loader-circle.gif" data-src="{$ListImage.Pad(70,70).URL}" alt="{$Title}" />
        <% end_if %>
        </a>
    </div>
</li>