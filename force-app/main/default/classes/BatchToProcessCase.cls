global class BatchToProcessCase implements Database.Batchable<sObject>,Database.Stateful {
    /**************************************************
     * //File Name: BatchToProcessCase
     * //Created On: 12/07/2021
     * //Created By: Bharathi
     * //Test Classes: BatchToProcessCaseTest
     * =======================================
     * Modification Log (Name - Change Summary – Initial) :
     ***************************************************************************/
    Map<String, DynamicBatchConfiguration__mdt> mdtMap = new Map<String, DynamicBatchConfiguration__mdt>();
    String fieldString = '';
    String objName;
    String emailBody = '';
    
    global BatchToProcessCase(String objectName){
        this.objName = objectName;
        //Query the metadata configurations
        for(DynamicBatchConfiguration__mdt mdt: [SELECT ID,Feature_Available__c,Feature_Depend_on_Object__c,Feature_uses_Fields__c,Filter__c FROM DynamicBatchConfiguration__mdt WHERE Feature_Available__c = true AND Feature_Depend_on_Object__c = :objName]){
            if(String.isNotBlank(mdt.Feature_uses_Fields__c) && String.isNotBlank(mdt.Filter__c)){
                mdtMap.put(mdt.Feature_uses_Fields__c, mdt);
                fieldString += mdt.Feature_uses_Fields__c+',';
            }
        }
        fieldString = fieldString.removeEnd(',');
    }
    global Database.QueryLocator start(Database.BatchableContext bc){
        String query = 'SELECT Id, '+fieldString+' FROM '+objName;
        return Database.getQueryLocator(query);
    }
    global void execute(Database.BatchableContext bc, List<sObject> sObjectList){
        Boolean result = false;
        Integer passCount = 0;
        String caseString = '';
        for(sObject obj: sObjectList){
            passCount = 0;
            caseString = (String)obj.get('Id');
            for(String field:mdtMap.keySet()){
                result = false;
                if(field == 'Priority'){
                    result = Utility.priorityCheck(obj, mdtMap.get(field));
                    if(result) passCount += 1;
                }
                if(field == 'Status'){ 
                    result = Utility.StatusCheck(obj, mdtMap.get(field));
                    if(result) passCount += 1;
                }
                if(field == 'IsEscalated'){ 
                    result = Utility.escalationCheck(obj, mdtMap.get(field));
                    if(result) passCount += 1;
                }
                if(field == 'Origin'){ 
                    result = Utility.originCheck(obj, mdtMap.get(field));
                    if(result) passCount += 1;
                }
                if(field == 'Product__c'){ 
                    result = Utility.productCheck(obj, mdtMap.get(field));
                    if(result) passCount += 1;
                }
                if(field == 'Reason'){ 
                    result = Utility.reasonCheck(obj, mdtMap.get(field));
                    if(result) passCount += 1;
                }
                if(field == 'Subject'){ 
                    result = Utility.subjectCheck(obj, mdtMap.get(field));
                    if(result) passCount += 1;
                }
                if(field == 'Type'){ 
                    result = Utility.typeCheck(obj, mdtMap.get(field));
                    if(result) passCount += 1;
                }
                if(field == 'OwnerId'){ 
                    result = Utility.ownerCheck(obj, mdtMap.get(field));
                    if(result) passCount += 1;
                }
                if(field == 'AssetId'){ 
                    result = Utility.assetCheck(obj, mdtMap.get(field));
                    if(result) passCount += 1;
                }
                caseString += ','+obj.get(field);
            }
            if(passCount != 0){//If anyone of metadata configuration pass, added the case details in email string
                emailBody += caseString+'\n';
            }
        }
    }
    global void finish(Database.BatchableContext bc){
        //Send mail with case details
        Messaging.SingleEmailMessage semail = new Messaging.SingleEmailMessage();
        Messaging.EmailFileAttachment efa = new Messaging.EmailFileAttachment();
        String vehfailedrecString = 'Id,'+fieldString+'\r\n';
        
        semail.setSubject('Case'); 
        semail.setHTMLBody('<b>Please find attachment for case records.</b>');
        vehfailedrecString += emailBody;
        
        Blob exportFile = Blob.valueof(vehfailedrecString);
        efa.setFileName('Case_Records.csv');
        efa.setBody(exportFile);
        semail.setFileAttachments(new Messaging.EmailFileAttachment[] {efa});
        
		String[] toAddresses = new String[]{};
        String mails = Configuration__c.getOrgDefaults().Email_Id_For_Case_Configuration__c;//Email Id configured in custom settings
        if( !String.isBlank(mails) ) {
            if(mails.contains(',')){
                toAddresses = mails.split(',');
            }else{
                toAddresses.add(mails);
            }
        }
        semail.setToAddresses(toAddresses);
        Messaging.sendEmail(new Messaging.SingleEmailMessage[] {semail});     
    }
}