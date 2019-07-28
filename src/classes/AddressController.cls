/**
 * Created by Nagendra on 13-04-2019.
 */

public with sharing class AddressController {
    @AuraEnabled
    public static List<Address__c> getAddresses (String accountId){
        System.debug('accountId -> '+accountId);
        return [SELECT Id,Name,Account__r.BillingAddress, Account__r.BillingCity, Account__r.BillingCountry FROM Address__c WHERE Account__c =:accountId];
    }
}