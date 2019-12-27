public without sharing class WithOutSharingProxy {
	
	public static void objectWithLookup(Account acct){
		InsertRecord.objectWithLookup(acct);
	}
	
	public static void objectWithLookup(aaTest__c aaTest){
		InsertRecord.objectWithLookup(aaTest);
	}
	
	public static List<aaTest__c> aaTestSelectById(String aaTestId){
		return new Selector_aaTest().selectById(new Set<Id>{aaTestId});
	}
	
}
