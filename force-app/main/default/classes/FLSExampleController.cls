public without sharing class FLSExampleController {
	public aaTest__c myRecord{get;set;}

	public List<DescribeRslt> getTestDescribeRslts(){
		List<DescribeRslt> drList = new List<DescribeRslt>();
		Schema.DescribeSObjectResult soResult = aaTest__c.SObjectType.getDescribe();
		Map<String, Schema.SObjectField> soFieldMap = soResult.fields.getMap();
		for (String fieldName : soFieldMap.keySet()) {
			Schema.DescribeFieldResult dfr = soFieldMap.get(fieldName).getDescribe();
			drList.add(new DescribeRslt(dfr));
		}
		return drList;
	}
	
	public Boolean getTestObjectIsReadable(){
		return aaTest__c.SObjectType.getDescribe().isAccessible();
	}
	
	public PageReference populateDatabase() {
		//Ensure a single record exists for demonstrating Edit behavior
		try {
			myRecord = [SELECT Id, TestField__c FROM aaTest__c LIMIT 1];
		}
		catch(QueryException qe){
			if(qe.getMessage().contains('List has no rows')){
				myRecord = new aaTest__c(TestField__c = 'Hello World');
				insert myRecord;
			}
			else{
				throw qe;
			}
		}
		return null;
	}

    public PageReference sendEmail(){
        EmailTemplate template = [SELECT Id FROM EmailTemplate WHERE DeveloperName = 'SiteSampleVFTemplate'];
        Contact c = [SELECT Id FROM Contact WHERE LastName = 'Doe'];
        Messaging.SingleEmailMessage email = new Messaging.SingleEmailMessage();
        email.setTemplateId(template.Id);
        email.setTargetObjectId(c.Id);
        Messaging.sendEmail(new Messaging.SingleEmailMessage[]{email});
        ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.INFO, 'Email sent!'));
        return null;
    }
	
	public class DescribeRslt {
		public String name {get; private set;}
		public Boolean isAccessible {get; private set;}
		public Boolean isUpdateable {get; private set;}
		public Boolean permissionable {get; private set;}
		
		DescribeRslt(Schema.DescribeFieldResult dfr) {
			System.debug(dfr);
			this.name= dfr.getLocalName();
			this.isAccessible = dfr.isAccessible();
			this.isUpdateable = dfr.isUpdateable();
			this.permissionable = dfr.permissionable;
		}
	}

}