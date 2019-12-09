public with sharing class aaTestContoller {
	
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
	
	public aaTestContoller() {}
	
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