<% if $IncludeFormTag %>
<form {$addErrorClass('was-validated').AttributesHTML}>
<% end_if %>
<% include SilverCart/Forms/CustomFormMessages %>
<% loop $HiddenFields %>
    {$Field}
<% end_loop %>
    {$BeforeFormContent}
<% if $EnablePackstation %>
    <div class="row">
        <div class="col-sm-8">{$Fields.dataFieldByName(IsPackstation).FieldHolder}</div>
    </div>   
<% end_if %>
<% if $EnableBusinessCustomers %>
    <div class="row">
        <div class="col-sm-4">{$Fields.dataFieldByName(IsBusinessAccount).FieldHolder}</div>
        <div class="col-sm-4">{$Fields.dataFieldByName(TaxIdNumber).FieldHolder}</div>
        <div class="col-sm-4">{$Fields.dataFieldByName(Company).FieldHolder}</div>
    </div>   
    <hr/> 
<% end_if %>
    <div class="row">
        <div class="col-sm-4">{$Fields.dataFieldByName(Salutation).FieldHolder}</div>
        <div class="col-sm-4">{$Fields.dataFieldByName(Company).FieldHolder}</div>
    </div>
    <div class="row">
        <div class="col-sm-4">{$Fields.dataFieldByName(FirstName).FieldHolder}</div>
        <div class="col-sm-4">{$Fields.dataFieldByName(Surname).FieldHolder}</div>
    </div>
    <div class="absolute-address-data">
        <div class="row">
            <div class="col-sm-4">{$Fields.dataFieldByName(Addition).FieldHolder}</div>
            <div class="col-sm-4">{$Fields.dataFieldByName(Street).FieldHolder}</div>
            <div class="col-sm-4">{$Fields.dataFieldByName(StreetNumber).FieldHolder}</div>
        </div>   
    </div>
<% if $EnablePackstation %>
    <div class="packstation-address-data">
         <div class="row">
            <div class="col-sm-4">{$Fields.dataFieldByName(PostNumber).FieldHolder}</div>
            <div class="col-sm-4">{$Fields.dataFieldByName(Packstation).FieldHolder}</div>
        </div>   
    </div>
<% end_if %>
    <div class="row">
        <div class="col-sm-4">{$Fields.dataFieldByName(Postcode).FieldHolder}</div>
        <div class="col-sm-4">{$Fields.dataFieldByName(City).FieldHolder}</div>
        <div class="col-sm-4">{$Fields.dataFieldByName(Country).FieldHolder}</div>
    </div>
    <div class="row">
        <div class="col-sm-4">{$Fields.dataFieldByName(Phone).FieldHolder}</div>
        <div class="col-sm-4">{$Fields.dataFieldByName(Fax).FieldHolder}</div>
    </div>
    {$CustomFormSpecialFields}
    <div class="clearfix">
    <% loop $Actions %>
        <button class="btn btn-primary float-right" id="{$ID}" title="{$Title}" name="{$Name}" type="submit"><span class="fa fa-arrow-right"></span> {$Title}</button>
    <% end_loop %>
        <a class="btn btn-sm btn-secondary float-left" id="silvercart-edit-address-form-cancel-id" href="{$Controller.Link}" title="<%t SilverCart\Model\Pages\Page.CANCEL 'Cancel' %>"><span class="fa fa-arrow-left"></span> <%t SilverCart\Model\Pages\Page.CANCEL 'Cancel' %></a>
    </div>
    {$AfterFormContent}
<% if $IncludeFormTag %>
</form>
<% end_if %>