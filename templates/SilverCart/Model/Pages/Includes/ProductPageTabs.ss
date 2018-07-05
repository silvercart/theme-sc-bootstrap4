<div class="product-tab mt-3 mb-3">
    <ul class="nav nav-tabs nav-justified" id="nav-tab" role="tablist">
        <li class="nav-item">
            <a class="nav-link active" id="descriptionTabLink" data-toggle="tab" aria-controls="productdescription" data-target="#productdescription" href="#productdescription" role="tab" aria-selected="true"><%t SilverCart\Model\Product\Product.DESCRIPTION 'product description' %></a>
        </li>
        <% if $Files %>
        <li class="nav-item">
            <a class="nav-link" id="downloads-tab" data-toggle="tab" aria-controls="downloads" data-target="#downloads" href="#downloads" role="tab" aria-selected="false"><%t SilverCart\Model\Product\Product.DOWNLOADS 'Downloads' %></a>
        </li>
        <% end_if %>
        <% if $PluggedInTabs %>
            <% loop $PluggedInTabs %>
        <li class="nav-item">
            <a class="nav-link" data-toggle="tab" aria-controls="<% if $TabID %>{$TabID}<% else %>pluggedInTab{$Pos}<% end_if %>" data-target="#<% if $TabID %>{$TabID}<% else %>pluggedInTab{$Pos}<% end_if %>" href="#<% if $TabID %>{$TabID}<% else %>pluggedInTab{$Pos}<% end_if %>" role="tab" aria-selected="false">{$Name}</a>
        </li>
            <% end_loop %>
        <% end_if %>
    </ul>
    <div class="tab-content border border-top-0 p-3" id="navtabContent">
        <div id="productdescription" class="tab-pane active" role="tabpanel" aria-labelledby="descriptionTabLink"> 
            <div class="tab-body">{$HtmlEncodedLongDescription}</div>
        </div>
        <% if $Files %>
        <div id="downloads" class="tab-pane" role="tabpanel" aria-labelledby="downloads-tab">
            <div class="tab-body">
                <h2 class="mobile-show-sm tab-heading"><%t SilverCart\Model\Product\Product.DOWNLOADS 'Downloads' %>:</h2>
                <table class="table table-striped silvercart-default-table">
                    <thead>
                        <tr>
                            <th><%t SilverCart\Model\Product\File.TYPE 'Type' %></th>
                            <th><%t SilverCart\Model\Product\File.TITLE 'Display name' %></th>
                            <th class="text-right"><%t SilverCart\Model\Product\File.SIZE 'Size' %></th>
                        </tr>
                    </thead>
                    <tbody>
                    <% loop $Files %>
                        <tr class="{$EvenOdd}">
                            <td><a href="{$File.Link}">{$FileIcon}</a></td>
                            <td><a href="{$File.Link}">{$Title}</a></td>
                            <td class="text-right"><a href="{$File.Link}">{$File.Size}</a></td>
                        </tr>
                    <% end_loop %>
                    </tbody>
                </table>
            </div>
        </div>
        <% end_if %>
        <% if $PluggedInTabs %>
            <% loop $PluggedInTabs %>
        <div id="<% if $TabID %>{$TabID}<% else %>pluggedInTab{$Pos}<% end_if %>" class="tab-pane" role="tabpanel" aria-labelledby="<% if $TabID %>{$TabID}<% else %>pluggedInTabLink{$Pos}<% end_if %>">
            <div class="tab-body"><h2 class="mobile-show-sm tab-heading">{$Name}:</h2>{$Content}</div>
        </div>
            <% end_loop %>
        <% end_if %>
    </div>
</div>