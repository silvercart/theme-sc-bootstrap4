<% if $slideImages %>
    <% if $FrontTitle %>
<header><h3>{$FrontTitle}</h3></header>
    <% else %>
<h4 class="sr-only"><%t SilverCart\Model\Widgets\ImageSliderWidget.TITLE 'Images' %></h4>
    <% end_if %>
    <% if $FrontContent %>
        {$FrontContent}
    <% end_if %>
    <% if $useSlider %>
    <div id="carousel-widget-{$ID}" class="carousel slide" data-ride="carousel">
        <ol class="carousel-indicators">
        <% loop $slideImages %>
            <li class="border border-light <% if $First %>active<% end_if %>" data-target="#carousel-widget-{$Up.ID}" data-slide-to="{$Pos(0)}"></li>
        <% end_loop %>
        </ol>
        <div class="carousel-inner">
        <% loop $slideImages %>
            <div class="carousel-item <% if $First %>active<% end_if %>">
            <% if $LinkedSite %><a href="{$LinkedSite.Link}" title="{$Title.XML}"><% end_if %>
            <% if $Image.Responsive %>
                {$Image.setExtraClasses('img-fluid').Responsive.SrcSet('300w','576w','1280w').Sizes('(max-width: 1279.99px) 100vw','(min-width: 1280px) 1280px')}
            <% else %>
                <img src="{$Image.URL}" alt="{$Title.XML}" class="d-block w-100" />
            <% end_if %>
            <% if $LinkedSite %></a><% end_if %>
            <% if $Title || $Content %>
                <div class="carousel-caption d-none d-md-block bg-dark rounded">
                <% if $LinkedSite %>
                    <% if $Title %><h5><a class="text-light" href="{$LinkedSite.Link}" title="{$Title.XML}">{$Title}<a></h5><% end_if %>
                    <% if $Content %><p>{$Content}</p><% end_if %>
                    <a class="btn btn-light position-absolute bottom-right-5" href="{$LinkedSite.Link}" title="{$Title}"><span class="fa fa-arrow-right"></span> <%t SilverCart\Model\Pages\MyAccountHolder.MORE 'More' %></a>
                <% else %>
                    <% if $Title %><h5>{$Title}</h5><% end_if %>
                    <% if $Content %><p>{$Content}</p><% end_if %>
                <% end_if %>
                </div>
            <% end_if %>
            </div>
        <% end_loop %>
        </div>
        <a class="carousel-control-prev" href="#" data-target="#carousel-widget-{$ID}" role="button" data-slide="prev">
            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
            <span class="sr-only"><%t SilverCart\Model\Pages\Page.PREV 'Previous' %></span>
        </a>
        <a class="carousel-control-next" href="#" data-target="#carousel-widget-{$ID}" role="button" data-slide="next">
            <span class="carousel-control-next-icon" aria-hidden="true"></span>
            <span class="sr-only"><%t SilverCart\Model\Pages\Page.NEXT 'Next' %></span>
        </a>
    </div>
    <% end_if %>
<% end_if %>