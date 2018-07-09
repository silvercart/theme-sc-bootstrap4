<% if $Files %>
<table id="downloads-{$ID}" class="table table-striped responsive-table">
    <thead>
        <tr>
            <th class="file-icon text-left">&nbsp;</th>
            <th class="file-text text-left"><%t SilverCart\Model\Product\File.DESCRIPTION 'Description' %></th>
            <th class="file-type text-right"><%t SilverCart\Model\Product\File.TYPE 'Type' %></th>
            <th class="file-size text-right"><%t SilverCart\Model\Product\File.SIZE 'Size' %></th>
            <th class="file-link text-right">&nbsp;</th>
        </tr>
    </thead>
    <tbody>
    <% loop $Files %>
        <% include SilverCart/Model/Pages/DownloadPage_TableLine %>
    <% end_loop %>
    </tbody>
</table>
<% end_if %>