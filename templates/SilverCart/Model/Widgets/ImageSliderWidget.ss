<% if $slideImages %>
    <% if $FrontTitle %>
<div><strong class="h2">{$FrontTitle}</strong></div>
    <% end_if %>
    <% if $FrontContent %>
        {$FrontContent}
    <% end_if %>
    <% if not $useSlider %>
<div class="noslider">
    <% end_if %>
    <div id="carousel-widget-{$ID}" class="carousel slide" data-ride="carousel">
        <ol class="carousel-indicators">
    <% loop $slideImages %>
            <li data-target="#carousel-widget-{$Up.ID}" data-slide-to="{$Pos(0)}" <% if $First %>class="active"<% end_if %> ></li>
    <% end_loop %>
        </ol>
    <%--  Wrapper for slides. Use carousel-inner vertical for vertical Slides --%>
        <div class="carousel-inner" role="listbox" id="ImageSliderWidget{$ID}">
    <% loop $slideImages %>
            <div class="carousel-item item <% if $First %>active<% end_if %>">
        <% if $LinkedSite %><a href="{$LinkedSite.Link}" title="{$Title.XML}"><% end_if %>
        <% if $Image.Responsive %>
            {$Image.setExtraClasses('img-fluid').Responsive.SrcSet('300w','576w','1280w').Sizes('(max-width: 1279.99px) 100vw','(min-width: 1280px) 1280px')}
        <% else %>
                <img src="{$Image.URL}" alt="{$Title.XML}" width="100%" class="img-fluid" />
        <% end_if %>
        <% if $LinkedSite %></a><% end_if %>
        <% if $SlideAnimationsEnabled %>
                <div class="carousel-caption">
            <% if $Title %>
                    <div class="h2" data-animation="<% if TitleAnimationEffectID %>animated {$TitleAnimationEffectID}<% end_if %>">
                        <a target="_self" title="{$Up.AltText}" href="{$LinkedSite.Link}"><i class="fa fa-angle-left bg-primary" aria-hidden="true"></i><span>{$Title}</span></a>
                    </div>
            <% end_if %>
            <% if $Content %>
                    <div class="h6" data-animation="<% if $ContentAnimationEffectID %>animated {$ContentAnimationEffectID}<% end_if %>">{$Content}</div>
            <% end_if %>
            <% if $AltText %>
                    <a href="{$LinkedSite.Link}" class="btn btn-primary btn-lg" <% if $AltAnimationEffectID %>data-animation="animated {$AltAnimationEffectID}"<% end_if %> ><%t SilverCart\Model\Pages\Page.SHOW_DETAILS 'show details' %></a>
            <% end_if %>
                </div>
        <% end_if %>
            </div>
    <% end_loop %>
        </div>
        <a class="left carousel-control" data-target="#carousel-widget-{$ID}" role="button" data-slide="prev">
            <span class="fa fa-prev" aria-hidden="true"></span>
            <span class="sr-only">Previous</span>
        </a>
        <a class="right carousel-control" data-target="#carousel-widget-{$ID}" role="button" data-slide="next">
            <span class="fa fa-next" aria-hidden="true"></span>
            <span class="sr-only">Next</span>
        </a>
    </div>
    <% if not $useSlider %>
</div>
    <% end_if %>
<% end_if %>