<% if $ProductAttributeValuesWithImage.exists %>
<div class="row">
    <% loop $ProductAttributeValuesWithImage %>
    <div class="col-6 col-sm-4 col-md-3 col-lg-2 d-flex mb-3">
        <div class="card w-100 clickable-silvercart-attribute" data-attribute-id="{$ProductAttributeID}" data-attribute-value-id="{$ID}">
        <% if $Image %>
            <a href="javascript:;"><img class="card-img-top" src="{$Image.Pad(116,116).URL}" alt="{$Title}"></a>
        <% end_if %>
            <div class="card-body text-center">
                <h5 class="card-title"><a href="javascript:;">{$Title}</a></h5>
            </div>
            <div class="card-footer text-center">
                <a href="javascript:;" class="btn btn-secondary btn-sm"><%t SilverCart\Forms\ChangeLanguageForm.CHOOSE 'choose' %></a>
            </div>
        </div>
    </div>
    <% end_loop %>
</div>
<% end_if %>