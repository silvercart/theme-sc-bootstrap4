<% if $Headline %>
<header><h3>{$Headline}</h3>
    <% if $HeadlineLink %>
        <a class="btn btn-sm float-right" href="{$Link}"><span class="fa fa-right-arrow"></span> <%t SilverCart\Model\Pages\MyAccountHolder.MORE 'More' %></a>
    <% end_if %>
</header>
<% end_if %>
<div class="widget-text">{$FreeText.RAW}</div>
