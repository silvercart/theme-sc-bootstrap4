<% if $Pages %>
<ol itemscope itemtype="http://schema.org/BreadcrumbList" class="breadcrumb"> 
    <% loop $Pages %>
        <% if $Last %>
    <li class="breadcrumb-item" itemprop="itemListElement" itemscope itemtype="http://schema.org/ListItem"><a class="active" href="<% if $OriginalLink %>{$OriginalLink}<% else %>{$Link}<% end_if %>" title="{$MenuTitle.XML}"><span itemprop="name">{$MenuTitle.XML}</span></a><meta itemprop="position" content="{$Pos}" /><meta itemprop="item" content="<% if $OriginalLink %>{$CurrentPage.MakeAbsoluteLink($OriginalLink)}<% else %>{$CurrentPage.MakeAbsoluteLink($Link)}<% end_if %>" /></li> 
        <% else %>
    <li class="breadcrumb-item" itemprop="itemListElement" itemscope itemtype="http://schema.org/ListItem"><a href="<% if $OriginalLink %>{$OriginalLink}<% else %>{$Link}<% end_if %>" title="{$MenuTitle.XML}"><span itemprop="name">{$MenuTitle.XML}</span></a><meta itemprop="position" content="{$Pos}" /><meta itemprop="item" content="<% if $OriginalLink %>{$CurrentPage.MakeAbsoluteLink($OriginalLink)}<% else %>{$CurrentPage.MakeAbsoluteLink($Link)}<% end_if %>" /></li>
        <% end_if %>
    <% end_loop %>
</ol>
<% end_if %>