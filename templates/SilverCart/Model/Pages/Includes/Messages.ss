<% with $CurrentPage %>
    <% if $ErrorMessage %>
<div class="alert alert-danger alert-dismissible fade show mt-2" role="alert">
    <span class="fas fa-exclamation-triangle"></span> {$ErrorMessage}
    <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
</div>
    <% end_if %>
    <% if $SuccessMessage %>
<div class="alert alert-success alert-dismissible fade show mt-2" role="alert">
    <span class="fas fa-check"></span> {$SuccessMessage}
    <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
</div>
    <% end_if %>
<% end_with %>