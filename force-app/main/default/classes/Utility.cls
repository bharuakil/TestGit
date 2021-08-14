global class Utility {
    /**************************************************
     * //File Name: Utility
     * //Created On: 12/07/2021
     * //Created By: Bharathi
     * //Test Classes: BatchToProcessCaseTest
     * =======================================
     * Modification Log (Name - Change Summary – Initial) :
     ***************************************************************************/
    global static Boolean priorityCheck(sObject sObjectRecord, DynamicBatchConfiguration__mdt mdt){
        if(sObjectRecord != NUll && sObjectRecord.get(mdt.Feature_uses_Fields__c) == mdt.Filter__c){
            return true;
        }
        return false;
    }
    global static Boolean StatusCheck(sObject sObjectRecord, DynamicBatchConfiguration__mdt mdt){
        if(sObjectRecord != NUll && sObjectRecord.get(mdt.Feature_uses_Fields__c) == mdt.Filter__c){
            return true;
        }
        return false;
    }
    global static Boolean originCheck(sObject sObjectRecord, DynamicBatchConfiguration__mdt mdt){
        if(sObjectRecord != NUll && sObjectRecord.get(mdt.Feature_uses_Fields__c) == mdt.Filter__c){
            return true;
        }
        return false;
    }
    global static Boolean reasonCheck(sObject sObjectRecord, DynamicBatchConfiguration__mdt mdt){
        if(sObjectRecord != NUll && sObjectRecord.get(mdt.Feature_uses_Fields__c) == mdt.Filter__c){
            return true;
        }
        return false;
    }
    global static Boolean subjectCheck(sObject sObjectRecord, DynamicBatchConfiguration__mdt mdt){
        if(sObjectRecord != NUll && sObjectRecord.get(mdt.Feature_uses_Fields__c) == mdt.Filter__c){
            return true;
        }
        return false;
    }
    global static Boolean typeCheck(sObject sObjectRecord, DynamicBatchConfiguration__mdt mdt){
        if(sObjectRecord != NUll && sObjectRecord.get(mdt.Feature_uses_Fields__c) == mdt.Filter__c){
            return true;
        }
        return false;
    }
    global static Boolean productCheck(sObject sObjectRecord, DynamicBatchConfiguration__mdt mdt){
        if(sObjectRecord != NUll && sObjectRecord.get(mdt.Feature_uses_Fields__c) == mdt.Filter__c){
            return true;
        }
        return false;
    }
    global static Boolean escalationCheck(sObject sObjectRecord, DynamicBatchConfiguration__mdt mdt){
        if(sObjectRecord != NUll && sObjectRecord.get(mdt.Feature_uses_Fields__c) == mdt.Filter__c){
            return true;
        }
        return false;
    }
    global static Boolean assetCheck(sObject sObjectRecord, DynamicBatchConfiguration__mdt mdt){
        if(sObjectRecord != NUll && sObjectRecord.get(mdt.Feature_uses_Fields__c) == mdt.Filter__c){
            return true;
        }
        return false;
    }
    global static Boolean ownerCheck(sObject sObjectRecord, DynamicBatchConfiguration__mdt mdt){
        if(sObjectRecord != NUll && sObjectRecord.get(mdt.Feature_uses_Fields__c) == mdt.Filter__c){
            return true;
        }
        return false;
    }
}