<% if $Link && $Content %>
    <a href="{$Link.LinkURL}" data-toggle="tooltip" title="{$Content}"><% if $FontAwesomeIcon %><span class="{$FontAwesomeIcon}"></span> <% end_if %><span class="text-underline">{$Title}</span></a>
<% else_if $Link %>
    <a href="{$Link.LinkURL}"><% if $FontAwesomeIcon %><span class="{$FontAwesomeIcon}"></span> <% end_if %><span class="text-underline">{$Title}</span></a>
<% else_if $Content %>
    <span data-toggle="tooltip" title="{$Content}"><% if $FontAwesomeIcon %><span class="{$FontAwesomeIcon}"></span> <% end_if %><span class="text-underline">{$Title}</span></span>
<% else %>
    <span><% if $FontAwesomeIcon %><span class="{$FontAwesomeIcon}"></span> <% end_if %><span class="text-underline">{$Title}</span></span>
<% end_if %>