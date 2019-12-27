public inherited sharing class InsertRecord {
	
	public static void objectWithLookup(Account acct){
		ObjectWithLookup__c owl = new ObjectWithLookup__c();
		owl.Account__c = acct.Id;
		insert owl;
	}
	
	public static void objectWithLookup(aaTest__c aaTest){
		ObjectWithLookup__c owl = new ObjectWithLookup__c();
		owl.aaTest__c = aaTest.Id;
		insert owl;
	}
}