public class comboBoxAccount {
    @AuraEnabled
    public static List<Account> getAccounts()
    {
        List<Account> accList= [Select Id, Name from Account];
        return accList;
    }
    
    @AuraEnabled
    public static List<Contact> getContacts(String accId)
    {
        List<Contact> conList= [Select id, Name, Email from Contact where AccountId =: accId];
        return conList;
    }
}