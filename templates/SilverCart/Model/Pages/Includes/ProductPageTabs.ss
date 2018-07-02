<div class="product-tab">
    <ul class="nav nav-tabs nav-justified" role="tablist">
        <li class="nav-item">
            <a class="nav-link active" data-toggle="tab" data-target="#productdescription" href="#productdescription" role="tab"><%t SilverCart\Model\Product\Product.DESCRIPTION 'product description' %></a>
        </li>
        <% if $Files %>
        <li class="nav-item">
            <a class="nav-link" data-toggle="tab" data-target="#downloads" href="#downloads" role="tab"><%t SilverCart\Model\Product\Product.DOWNLOADS 'Downloads' %></a>
        </li>
        <% end_if %>
        <% if $PluggedInTabs %>
            <% loop $PluggedInTabs %>
        <li class="nav-item">
            <a class="nav-link" data-toggle="tab" data-target="#<% if $TabID %>{$TabID}<% else %>pluggedInTab{$Pos}<% end_if %>" href="#<% if $TabID %>{$TabID}<% else %>pluggedInTab{$Pos}<% end_if %>" role="tab">{$Name}</a>
        </li>
            <% end_loop %>
        <% end_if %>
    </ul>
    <div class="tab-content">
        <div id="productdescription" class="tab-pane fade in active" role="tabpanel">
            <div class="tab-body">{$HtmlEncodedLongDescription}</div>
        </div>
        <% if $Files %>
        <div id="downloads" class="tab-pane fade" role="tabpanel">
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
        <div id="<% if $TabID %>{$TabID}<% else %>pluggedInTab{$Pos}<% end_if %>" class="tab-pane fade" role="tabpanel">
            <div class="tab-body"><h2 class="mobile-show-sm tab-heading">{$Name}:</h2>{$Content}</div>
        </div>
            <% end_loop %>
        <% end_if %>
    </div>
</div>