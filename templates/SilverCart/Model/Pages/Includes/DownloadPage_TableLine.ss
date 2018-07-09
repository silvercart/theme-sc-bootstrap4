<tr>
    <td class="text-left" data-title=""><a href="{$File.Link}"><img class="img-fluid" src="{$FileIconURL}" alt="{$File.FileType}" title="{$File.Title}" /></a></td>
    <td class="text-left" data-title="<%t SilverCart\Model\Product\File.DESCRIPTION 'Description' %>">
    <% if $Thumbnail %>
        <a href="{$File.Link}"><img src="{$Thumbnail.SetWidth(100).URL}" class="float-left thumbnail" alt="{$Title}" /></a>
    <% end_if %>
        <h3><a href="{$File.Link}">{$Title}</a></h3>{$Description}
    </td>
    <td class="text-right" data-title="<%t SilverCart\Model\Product\File.TYPE 'Type' %>"><a href="{$File.Link}">{$File.FileType}</a></td>
    <td class="text-right text-nowrap" data-title="<%t SilverCart\Model\Product\File.SIZE 'Size' %>"><a href="{$File.Link}">{$File.Size}</a></td>
    <td class="text-right text-nowrap clearfix" data-title=""><a href="{$File.Link}" class="btn btn-primary float-right"><span class="fa fa-download"></span> Download</a></td>
</tr>