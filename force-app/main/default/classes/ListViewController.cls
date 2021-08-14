/**************************************************
     * //File Name: ListViewController
     * //Created On: 28/07/2021
     * //Created By: Bharathi
     * //Test Classes: ListViewControllerTest
     * =======================================
     * Modification Log (Name - Change Summary – Initial) :
     ***************************************************************************/
public class ListViewController {
	
    @AuraEnabled
    public static List<listViewWrapper> getListValues(string objectInfo){
        List<listViewWrapper> listViewWrapperList = new List<listViewWrapper>();
        for(ListView lv: [SELECT Id, Name, DeveloperName FROM ListView WHERE sObjectType = :objectInfo ORDER BY Name ASC]){
            listViewWrapper listViewWrap = new listViewWrapper();
            listViewWrap.label = lv.Name;
            listViewWrap.developerName = lv.DeveloperName;
            listViewWrapperList.add(listViewWrap);
        }
        return listViewWrapperList;
    }
    public class listViewWrapper{
        @AuraEnabled public string label;
        @AuraEnabled public string developerName;
    }
}