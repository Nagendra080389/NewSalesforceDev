/**
 * Created by Nagendra on 13-04-2019.
 */

trigger AccountTrigger on Account (after insert, after update) {

    Map<Id, Account> accountMap = (Map<Id, Account>)Trigger.newMap;

    List<Address__c> addresses = new List<Address__c>();

    Map<Id, Address__c> addressesByIds = new Map<Id, Address__c>([SELECT Id, Account__c FROM Address__c WHERE Account__c IN :accountMap.keySet()]);

    for (Id eachAccountId : accountMap.keySet()){
        Account eachAccount = accountMap.get(eachAccountId);
        if(!addressesByIds.isEmpty()) {
            for (Id eachAddressId : addressesByIds.keySet()) {
                Address__c eachAddress = addressesByIds.get(eachAddressId);
                addresses.add(eachAddress);
            }
        } else {
            Address__c address = new Address__c();
            address.Account__c = eachAccount.Id;
            addresses.add(address);
        }
    }


    if(!addresses.isEmpty()) {
        System.debug('addresses- > '+addresses);
        Database.upsert(addresses);
    }

}