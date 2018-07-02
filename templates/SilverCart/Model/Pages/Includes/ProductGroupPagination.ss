<% if $ViewableChildren && $ViewableChildren.MoreThanOnePage %>
<nav class="text-center">
    <ul class="pagination">
    <% if $ViewableChildren.MoreThanOnePage %>
        <% if $ViewableChildren.NotFirstPage %>
        <li class="page-item"><a href="{$ViewableChildren.PrevLink}" rel="prev" aria-label="<%t SilverCart\Model\Pages\Page.PREV 'Prev' %>" class="page-link" title="<%t SilverCart\Model\Pages\Page.PREV 'Prev' %>">
            <span aria-hidden="true">&laquo;</span>
            <span class="sr-only"><%t SilverCart\Model\Pages\Page.PREV 'Prev' %></span></a></li>
        <% else %>
        <li class="page-item disabled"><a href="#" rel="prev" aria-label="<%t SilverCart\Model\Pages\Page.PREV 'Prev' %>" class="page-link" title="<%t SilverCart\Model\Pages\Page.PREV 'Prev' %>">
            <span aria-hidden="true">&laquo;</span>
            <span class="sr-only"><%t SilverCart\Model\Pages\Page.PREV 'Prev' %></span></a></li>
        <% end_if %>
        <% loop $ViewableChildren.PaginationSummary(4) %>
            <% if $CurrentBool %>
        <li class="page-item active"><a class="page-link highlight" href="javascript:;">{$PageNum}</a></li>
            <% else_if $Link %>
        <li class="page-item"><a href="{$Link}" class="page-link" title="<%t SilverCart\Model\Pages\Page.GOTO_PAGE 'go to page {count}' count=$PageNum %>">{$PageNum}</a></li>
            <% else %>
        <li class="page-item disabled"><a href="#" class="page-link">&hellip;</a></li>
            <% end_if %>
        <% end_loop %>
        <% if $ViewableChildren.NotLastPage %>
        <li class="page-item"><a href="{$ViewableChildren.NextLink}" rel="next" aria-label="<%t SilverCart\Model\Pages\Page.NEXT 'Next' %>" class="page-link" title="<%t SilverCart\Model\Pages\Page.NEXT 'Next' %>">
            <span aria-hidden="true">&raquo;</span>
            <span class="sr-only"><%t SilverCart\Model\Pages\Page.NEXT 'Next' %></span></a></li>
        <% else %>
        <li class="page-item disabled"><a href="#" rel="next" aria-label="<%t SilverCart\Model\Pages\Page.NEXT 'Next' %>" class="page-link" title="<%t SilverCart\Model\Pages\Page.NEXT 'Next' %>">
            <span aria-hidden="true">&raquo;</span>
            <span class="sr-only"><%t SilverCart\Model\Pages\Page.NEXT 'Next' %></span></a></li>
        <% end_if %>
    <% end_if %>
    </ul>
</nav>
<% end_if %>

