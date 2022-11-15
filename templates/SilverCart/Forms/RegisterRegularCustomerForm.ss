<div class="register">
<% if $IncludeFormTag %>
<form {$addExtraClass('form').addErrorClass('was-validated').AttributesHTML}>
<% end_if %>
<% include SilverCart/Forms/CustomFormMessages %>
<% loop $HiddenFields %>
    {$Field}
<% end_loop %>
    {$BeforeFormContent}
<% if $EnableBusinessCustomers %>
    <h4><%t SilverCart\Model\Customer\Customer.BUSINESSCUSTOMER 'Business customer' %></h4>
    <div class="row">
        <div class="col-sm-4">{$Fields.dataFieldByName('IsBusinessAccount').FieldHolder}</div>
        <div class="col-sm-4">{$Fields.dataFieldByName('TaxIdNumber').FieldHolder}</div>
        <div class="col-sm-4">{$Fields.dataFieldByName('Company').FieldHolder}</div>
    </div>
<% end_if %>
    <h4><%t SilverCart\Model\Pages\Page.ADDRESS_DATA 'Address data' %></h4>
    <div class="row">
        <div class="col-sm-4">{$Fields.dataFieldByName('Salutation').FieldHolder}</div>
        <div class="col-sm-4">{$Fields.dataFieldByName('AcademicTitle').FieldHolder}</div>
    </div>
    <div class="row">
        <div class="col-sm-4">{$Fields.dataFieldByName('FirstName').FieldHolder}</div>
        <div class="col-sm-4">{$Fields.dataFieldByName('Surname').FieldHolder}</div>
    </div>
    <div class="row">
        <div class="col-sm-4">{$Fields.dataFieldByName('Street').FieldHolder}</div>
        <div class="col-sm-4">{$Fields.dataFieldByName('StreetNumber').FieldHolder}</div>
        <div class="col-sm-4">{$Fields.dataFieldByName('Addition').FieldHolder}</div>
    </div>
    <div class="row">
        <div class="col-sm-4">{$Fields.dataFieldByName('Postcode').FieldHolder}</div>
        <div class="col-sm-4">{$Fields.dataFieldByName('City').FieldHolder}</div>
        <div class="col-sm-4">{$Fields.dataFieldByName('Country').FieldHolder}</div>
    </div>
    <div class="row">
        <div class="col-sm-4">{$Fields.dataFieldByName('Phone').FieldHolder}</div>
        <div class="col-sm-4">{$Fields.dataFieldByName('Fax').FieldHolder}</div>
    </div>
<% if $demandBirthdayDate %>
    <h4><%t SilverCart\Model\Pages\Page.BIRTHDAY 'Birthday' %></h4>
    <div class="row">
        <div class="col-sm-4">{$Fields.dataFieldByName('BirthdayDay').FieldHolder}</div>
        <div class="col-sm-4">{$Fields.dataFieldByName('BirthdayMonth').FieldHolder}</div>
        <div class="col-sm-4">{$Fields.dataFieldByName('BirthdayYear').FieldHolder}</div>
    </div>
<% end_if %>
    <h4><%t SilverCart\Model\Pages\Page.ACCESS_CREDENTIALS 'Access Credentials' %></h4>
    <div class="row">
        <div class="col-sm-4">{$Fields.dataFieldByName('Email').FieldHolder}</div>
        <div class="col-sm-4">{$Fields.dataFieldByName('EmailCheck').FieldHolder}</div>
    </div>
    <div class="row">
        <div class="col-sm-4">{$Fields.dataFieldByName('Password').FieldHolder}</div>
        <div class="col-sm-4">{$Fields.dataFieldByName('PasswordCheck').FieldHolder}</div>
    </div>
    <h4><%t SilverCart\Model\Pages\RegistrationPage.OTHERITEMS 'Miscellaneous' %></h4>
    <div class="row">
        <div class="span12 col-md-12">{$Fields.dataFieldByName('SubscribedToNewsletter').FieldHolder}</div>
    </div>
    <div class="row">
        <div class="span12 col-md-12">{$CustomFormSpecialFields}</div>
    </div>
    <% if $EnableHoneyPot %>
        {$HoneyPotField.FieldHolder}
    <% end_if %>
    <div class="clearfix">
    <% loop $Actions %>
        <button class="btn btn-primary float-right" type="submit" id="{$ID}" title="{$Title}" value="{$Value}" name="{$Name}">{$Title} <span class="fa fa-caret-right"></span></button>
    <% end_loop %>
    </div>
    {$AfterFormContent}
<% if $IncludeFormTag %>
</form>
<% end_if %>
</div>