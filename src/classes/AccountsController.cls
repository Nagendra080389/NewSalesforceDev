/**
 * Created by Nagendra on 13-04-2019.
 */

public with sharing class AccountsController {

    @AuraEnabled
    public static List<Account> getListOfAllAccounts (){
        return [SELECT Id,Name FROM Account];
    }

}