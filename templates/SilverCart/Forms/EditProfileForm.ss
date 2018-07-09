<% if $IncludeFormTag %>
<form {$addErrorClass('was-validated').AttributesHTML}>
<% end_if %>
<% include SilverCart/Forms/CustomFormMessages %>
<% loop $HiddenFields %>
    {$Field}
<% end_loop %>

    <h3 class="mt-4"><%t SilverCart\Model\Pages\Page.ADDRESS_DATA 'Address data' %></h4>
    <div class="form-group row">
        <label class="col-sm-2 col-form-label" for=""><%t SilverCart\Model\Pages\MyAccountHolder.YOUR_CUSTOMERNUMBER 'Your customer number' %></label>
        <div class="col-sm-10">
            <strong class="btn font-weight-bold">{$CurrentMember.CustomerNumber}</strong>
        </div>
    </div>
    {$Fields.dataFieldByName(Salutation).setFieldHolderTemplate('SilverCart/Forms/FormField_holder_horizontal').FieldHolder}
    {$Fields.dataFieldByName(FirstName).setFieldHolderTemplate('SilverCart/Forms/FormField_holder_horizontal').FieldHolder}
    {$Fields.dataFieldByName(Surname).setFieldHolderTemplate('SilverCart/Forms/FormField_holder_horizontal').FieldHolder}
    {$Fields.dataFieldByName(Email).setFieldHolderTemplate('SilverCart/Forms/FormField_holder_horizontal').FieldHolder}
    
    <% if $demandBirthdayDate %>
        <h4><%t SilverCart\Model\Pages\Page.BIRTHDAY 'Birthday' %></h4>
        {$Fields.dataFieldByName(BirthdayDay.FieldHolder}
        {$Fields.dataFieldByName(BirthdayMonth.FieldHolder}
        {$Fields.dataFieldByName(BirthdayYear).FieldHolder}
    <% end_if %>

    <h3 class="mt-5"><%t SilverCart\Model\Pages\Page.PASSWORD 'Password' %></h4>
    <div class="row">
        <div class="col-sm-10 offset-sm-2">
            <div class="alert alert-info">
                <%t SilverCart\Model\Pages\Page.PASSWORD_CASE_EMPTY 'If You leave this field empty, Your password will not be changed.' %>
            </div>
        </div>
    </div>

    {$Fields.dataFieldByName(Password).setFieldHolderTemplate('SilverCart/Forms/FormField_holder_horizontal').FieldHolder}
    {$Fields.dataFieldByName(PasswordCheck).setFieldHolderTemplate('SilverCart/Forms/FormField_holder_horizontal').FieldHolder}

    <h3 class="mt-5"><%t SilverCart\Model\Pages\Page.NEWSLETTER 'Newsletter' %></h4>
    <div class="row">
        <div class="col-sm-10 offset-sm-2">
            {$Fields.dataFieldByName(SubscribedToNewsletter).FieldHolder}
        </div>
    </div>

    {$CustomFormSpecialFields}
    <hr>
    <div class="clearfix">
    <% loop $Actions %>
        <button class="btn btn-primary float-right" id="{$ID}" title="{$Title}" value="{$Title}" name="{$Name}" type="submit">{$Title}</button>
    <% end_loop %>
    </div>
<% if $IncludeFormTag %>
</form>
<% end_if %>