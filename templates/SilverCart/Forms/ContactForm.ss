<% if $IncludeFormTag %>
<form {$addErrorClass('was-validated').AttributesHTML}>
<% end_if %>
<% include SilverCart/Forms/CustomFormMessages %>
<% loop $HiddenFields %>
    {$Field}
<% end_loop %>
    <h3><%t SilverCart\Model\Pages\Page.CONTACT_FORM 'Contact form' %></h3>
    {$BeforeFormContent}
    <div class="clearfix">
        {$Fields.dataFieldByName(Salutation).FieldHolder}
        {$Fields.dataFieldByName(FirstName).FieldHolder}
        {$Fields.dataFieldByName(Surname).FieldHolder}
        {$Fields.dataFieldByName(Email).FieldHolder}
    <% if $EnableStreetNumber %>
        {$Fields.dataFieldByName(Street).FieldHolder}
        {$Fields.dataFieldByName(StreetNumber).FieldHolder}
    <% end_if %>
    <% if $EnableCityNumber %>
        {$Fields.dataFieldByName(Postcode).FieldHolder}
        {$Fields.dataFieldByName(City).FieldHolder}
    <% end_if %>
    <% if $EnableCountryNumber %>
        {$Fields.dataFieldByName(CountryID).FieldHolder}
    <% end_if %>
    <% if $EnablePhoneNumber %>
        {$Fields.dataFieldByName(Phone).FieldHolder}
    <% end_if %>
        {$Fields.dataFieldByName(Message).FieldHolder}
        {$CustomFormSpecialFields}
    <% loop $Actions %>
        <button class="btn btn-primary float-right" type="submit" id="{$ID}" title="{$Title}"><span class="fa fa-arrow-right"></span> {$Title}</button> 
    <% end_loop %> 
    </div>
    {$AfterFormContent}
<% if $IncludeFormTag %>
</form>
<% end_if %>