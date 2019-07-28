<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <fieldUpdates>
        <fullName>Address_Update_on_Address_object</fullName>
        <field>Full_Address__c</field>
        <formula>IF(NOT(ISBLANK(Account__r.BillingStreet)),      Account__r.BillingStreet            + BR(), NULL) +
IF(NOT(ISBLANK(Account__r.BillingCity)),        Account__r.BillingCity              + BR(), NULL) +
IF(NOT(ISBLANK(Account__r.BillingState)),       Account__r.BillingState,                    NULL) +
IF(NOT(ISBLANK(Account__r.BillingPostalCode)),  &quot;, &quot; + Account__r.BillingPostalCode + BR(), NULL) +
IF(NOT(ISBLANK(Account__r.BillingCountry)),     Account__r.BillingCountry,                  NULL)</formula>
        <name>Address Update on Address object</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <rules>
        <fullName>Update Address from account</fullName>
        <actions>
            <name>Address_Update_on_Address_object</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <formula>true</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
</Workflow>
