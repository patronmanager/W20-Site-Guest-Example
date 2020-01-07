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
	
	public static List<Contact> getContactsWithSharing(){
		return new OverrideClass().getContactsWithSharing();
	}
	public static List<Contact> getContactsInheritedSharing(){
		return new OverrideClass().getContactsInhertedSharing();
	}
	public static List<Contact> getContactsDelegateSharing(){
		return new OverrideClass().getContactsDelegateSharing();
	}
	public static List<Contact> getContactsUsingAbstractImplementation(){
		return new OverrideClass().getContactsUsingAbstractImplementation();
	}
	public static List<Contact> getContactsAbstractly(){
		return new OverrideClass().getContactsAbstractly();
	}
	public static List<Contact> getContactsWithoutSharing(){
		return [SELECT Id, FirstName, LastName, Email FROM Contact];
	}
	
}
