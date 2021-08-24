//We can also schedule the BatchToProcessCase using CaseScheduler
public class CaseScheduler implements Schedulable{
    String objName;
    public CaseScheduler(String objectName){
        this.objName = objectName;
    }
    public void execute(SchedulableContext context){
        //New Branch1 Changes//scrach org change
        BatchToProcessCase cs = new BatchToProcessCase(objName);
        Database.executeBatch(cs, 200);
    }
}