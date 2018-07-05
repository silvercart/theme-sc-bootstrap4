<% if $Headline %>
<header><h3>{$Headline}</h3>
    <% if $HeadlineLink %>
        <a class="btn btn-sm float-right" href="{$Link}"><span class="fa fa-arrow-right"></span> <%t SilverCart\Model\Pages\MyAccountHolder.MORE 'More' %></a>
    <% end_if %>
</header>
<% end_if %>
<div class="widget-text-with-link {$ExtraCssClasses}">
    {$FreeText.XML}<br/>
    <a href="{$Link}" class="read-more-link">{$LinkText} <span class="fa fa-arrow-right"></span></a>
</div>
