/**
 * Created by Nagendra on 7/28/2019.
 */

@IsTest
private class AccountTriggerTest {
    @IsTest
    static void testBehavior() {
        Account account = new Account(Name = 'Test');
        insert account;
    }
}