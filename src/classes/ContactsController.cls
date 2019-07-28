/**
 * Created by Nagendra on 13-04-2019.
 */

public with sharing class ContactsController {

    public List<FieldsWrapper> lstCaseAPIName { get ; set; }


    public ContactsController(ApexPages.StandardController controller) {

    }

    public void fecthListAPINamesFromCase() {
        String sObjectName = 'Case';
        if (sObjectName != null && sObjectName != '') {
            lstCaseAPIName = new List<FieldsWrapper>();
            Schema.SObjectType gd = Schema.getGlobalDescribe().get(sObjectName);
            Schema.DescribeSobjectResult a11 = gd.getDescribe();
            Map<String, Schema.SObjectField> M = a11.fields.getMap();
            for (Schema.SObjectField s1 : m.values()) {
                FieldsWrapper fieldsWrapper = new FieldsWrapper();
                Schema.DescribeFieldResult f = M.get(s1.getDescribe().getName()).getDescribe();
                if (f.getName() == 'Reason' || f.getName() == 'Description' || f.getName() == 'ContactId' || f.getName() == 'Status' || f.getName() == 'Origin') {
                    fieldsWrapper.apiName = f.getName();
                    fieldsWrapper.columnNumber = 2;
                    if(f.getName() == 'Description'){
                        fieldsWrapper.columnNumber = 1;
                    }
                    lstCaseAPIName.add(fieldsWrapper);
                }
            }
        }
    }

    //method to return random value between 2 numbers
    public static Integer generateRandomFromRange(Integer startNum, Integer endNum) {
        Integer returnValue;
        //Logic- first we will generate random boolean value which will decide if we want to
        //add the random number from startNum or will subtract random number from endNum
        Integer randomNumber = Integer.valueOf((Math.random() * 10));
        Boolean addSubFlag = Math.mod(randomNumber, 2) == 0 ? true : false;

        Integer diffInRange = endNum - startNum;
        //Now find random number staring from 0 to diffInRange
        Integer randomNum = Math.mod(Math.round(Math.random() * diffInRange + 1), diffInRange);

        //If addSubFlag is true, we will add random number generated between 0 and diffInRange from start number
        //else we will subtract random number from end number
        if (addSubFlag) {
            if (diffInRange > 1) {
                returnValue = startNum + randomNum;
            } else {
                returnValue = startNum;
            }
        } else {
            if (diffInRange > 1) {
                returnValue = endNum - randomNum;
            } else {
                returnValue = endNum;
            }
        }
        return returnValue;
    }
}