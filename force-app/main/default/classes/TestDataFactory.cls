/**************************************************
     * //File Name: TestDataFactory
     * //Created On: 15/07/2021
     * //Created By: Bharathi
     * =======================================
     * Modification Log (Name - Change Summary – Initial) :
     ***************************************************************************/
@isTest
public class TestDataFactory {
    public static List<Case> createCases(Integer numCase, Boolean isCreate){
        //Branch1 change
        List<Case> caseList = new List<Case>();
        for(Integer i=0;i<numCase;i++){
            Case cs = new Case(Priority = 'High', Subject='New Case'+i, Status = 'Working');
            caseList.add(cs);
        }
        if(isCreate){
            INSERT caseList;
        }
        return caseList;
    }
}