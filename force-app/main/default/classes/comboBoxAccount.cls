public with sharing class comboBoxAccount {

    @AuraEnabled(cacheable=true)
    public static List<Account> getAccounts() {
        return [
            SELECT Id, Name
            FROM Account
            ORDER BY Name
        ];
    }

    @AuraEnabled(cacheable=true)
    public static List<Contact> getContacts(String accId) {

        if(String.isBlank(accId)) {
            return new List<Contact>();
        }

        return [
            SELECT Id, Name, Email
            FROM Contact
            WHERE AccountId = :accId
            ORDER BY Name
        ];
    }
}