<% if $IncludeFormTag %>
<form {$addErrorClass('was-validated').AttributesHTML}>
<% end_if %>
<% include SilverCart/Forms/CustomFormMessages %>
<% loop $HiddenFields %>
    {$Field}
<% end_loop %>
    <h3 class="mt-4"><%t SilverCart\Model\Pages\Page.NEWSLETTER_FORM 'Newsletter settings' %></h4>
    {$BeforeFormContent}
    <div class="clearfix">
        {$Fields.dataFieldByName(Salutation).setFieldHolderTemplate('SilverCart/Forms/FormField_holder_horizontal').FieldHolder}
        {$Fields.dataFieldByName(FirstName).setFieldHolderTemplate('SilverCart/Forms/FormField_holder_horizontal').FieldHolder}
        {$Fields.dataFieldByName(Surname).setFieldHolderTemplate('SilverCart/Forms/FormField_holder_horizontal').FieldHolder}
        {$Fields.dataFieldByName(Email).setFieldHolderTemplate('SilverCart/Forms/FormField_holder_horizontal').FieldHolder}
        <div class="row">
            <div class="col-sm-10 offset-sm-2">
                {$Fields.dataFieldByName(NewsletterAction).FieldHolder}
            </div>
        </div>
        {$CustomFormSpecialFields}
    <% loop $Actions %>
        <button class="btn btn-primary pull-right" type="submit" id="{$ID}" title="{$Title}"><span class="fa fa-arrow-right"></span> {$Title}</button> 
    <% end_loop %> 
    </div>
    {$AfterFormContent}
<% if $IncludeFormTag %>
</form>
<% end_if %>