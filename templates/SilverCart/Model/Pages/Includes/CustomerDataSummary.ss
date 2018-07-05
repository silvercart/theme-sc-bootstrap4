
<% with $CurrentMember %>
<table class="table table-sm">
    <tbody>
        <tr>
            <td class="text-left text-nowrap"><strong>{$fieldLabel(FullName)}:</strong></td>
            <td class="text-left">{$TranslatedSalutation} {$AcademicTitle} {$FirstName} {$Surname}</td>
        </tr>
        <tr>
            <td class="text-left text-nowrap"><strong>{$fieldLabel(CustomerNumberShort)}:</strong></td>
            <td class="text-left">{$CustomerNumber}</td>
        </tr>
        <tr>
            <td class="text-left text-nowrap"><strong>{$fieldLabel(EmailAddress)}:</strong></td>
            <td class="text-left">{$Email}</td>
        </tr>
    </tbody>
</table>
<% end_with %>