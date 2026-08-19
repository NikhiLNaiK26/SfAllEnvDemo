@isTest
private class comboBoxAccountTest {

    @testSetup
    static void createTestData() {

        Account acc = new Account(
            Name = 'Test Account'
        );
        insert acc;

        Contact con1 = new Contact(
            LastName = 'Contact 1',
            Email = 'contact1@test.com',
            AccountId = acc.Id
        );

        Contact con2 = new Contact(
            LastName = 'Contact 2',
            Email = 'contact2@test.com',
            AccountId = acc.Id
        );

        insert new List<Contact>{con1, con2};
    }

    @isTest
    static void testGetAccounts() {

        Test.startTest();

        List<Account> accList = comboBoxAccount.getAccounts();

        Test.stopTest();

        System.assert(accList.size() > 0,
            'At least one account should be returned');
    }

    @isTest
    static void testGetContacts() {

        Account acc = [
            SELECT Id
            FROM Account
            LIMIT 1
        ];

        Test.startTest();

        List<Contact> conList =
            comboBoxAccount.getContacts(acc.Id);

        Test.stopTest();

        System.assertEquals(
            2,
            conList.size(),
            'Two contacts should be returned'
        );
    }

    @isTest
    static void testGetContactsWithNullAccountId() {

        Test.startTest();

        List<Contact> conList =
            comboBoxAccount.getContacts(null);

        Test.stopTest();

        System.assertEquals(
            0,
            conList.size(),
            'Empty list should be returned'
        );
    }
}