public inherited sharing class InsertRecord {
	
	public static void objectWithLookup(Account acct){
		ObjectWithLookup__c owl = new ObjectWithLookup__c();
		owl.Account__c = acct.Id;
		insert owl;
	}
	
}