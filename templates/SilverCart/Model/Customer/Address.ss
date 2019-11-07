<% if not $isEmpty %>
<address class="">
<% if $HeadLine %>
    <strong>{$HeadLine}</strong><br/>
<% end_if %>
    {$BeforeAddressContent}
<% if $TaxIdNumber %>
    {$fieldLabel('TaxIdNumber')}: {$TaxIdNumber}<br/>
<% end_if %>
<% if $Company %>
    {$Company}<br/>
<% end_if %>
    {$Salutation} {$AcademicTitle} {$FullName}<br/>
<% if $Addition %>
    {$Addition}<br/>
<% end_if %>
<% if $IsPackstation == 1 %>
    {$fieldLabel('PostNumber')}: {$PostNumber}<br/>
    {$fieldLabel('PackstationPlain')}: {$Packstation}<br/>
<% else %>
    {$Street} {$StreetNumber}<br/>
<% end_if %>
    {$Country.ISO2}-{$Postcode} {$City}<br/>
<% if $Phone %>
    {$fieldLabel('PhoneShort')}: {$Phone}<br/>
<% end_if %>
<% if $Fax %>
    {$fieldLabel('Fax')}: {$Fax}<br/>
<% end_if %>
    {$AfterAddressContent}
</address>
<% else %>
<div class="alert alert-info">{$fieldLabel('NoAddressData')}</div>
<% end_if %>