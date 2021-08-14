/**************************************************
     * //File Name: BatchToProcessCaseTest
     * //Created On: 15/07/2021
     * //Created By: Bharathi
     * =======================================
     * Modification Log (Name - Change Summary – Initial) :
*********************************************************************/
@isTest
public class BatchToProcessCaseTest {
    @isTest
    public static void TestMethod1(){
        Configuration__c con = new Configuration__c(Email_Id_For_Case_Configuration__c = 'test@test.com');
        INSERT con;
        TestDataFactory.createCases(2, true);
        BatchToProcessCase batch = new BatchToProcessCase('Case');
        Database.executeBatch(batch);
    }
}