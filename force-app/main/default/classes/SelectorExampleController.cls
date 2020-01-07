public without sharing class SelectorExampleController {
	
	String objectId = 'a00S0000007lAaPIAU';
	
	public aaTest__c getViaSelector(){
		List<aaTest__c> aaList = new Selector_aaTest().selectById(new Set<Id>{objectId});
		if (aaList.size() == 0) {
			return null;
		}
		return aaList[0];
	}
	
	public aaTest__c getViaProxy(){
		List<aaTest__c> aaList = WithOutSharingProxy.aaTestSelectById(objectId);
		if (aaList.size() == 0) {
			return null;
		}
		return aaList[0];
	}
	
	public Contact getContactsWithSharing(){
		List<Contact> a = WithOutSharingProxy.getContactsWithSharing();
		if(a.isEmpty()){
			return new Contact(FirstName = 'NOT FOUND');
		}
		return a[0];
	}
	public Contact getContactsInheritedSharing(){
		List<Contact> a = WithOutSharingProxy.getContactsInheritedSharing();
		if(a.isEmpty()){
			return new Contact(FirstName = 'NOT FOUND');
		}
		return a[0];
	}
	public Contact getContactsDelegateSharing(){
		List<Contact> a = WithOutSharingProxy.getContactsDelegateSharing();
		if(a.isEmpty()){
			return new Contact(FirstName = 'NOT FOUND');
		}
		return a[0];
	}
	public Contact getContactsWithoutSharing(){
		List<Contact> a = WithOutSharingProxy.getContactsWithoutSharing();
		if(a.isEmpty()){
			return new Contact(FirstName = 'NOT FOUND');
		}
		return a[0];
	}

	public Contact getContactsAbstractly(){
		List<Contact> a = WithOutSharingProxy.getContactsAbstractly();
		if(a.isEmpty()){
			return new Contact(FirstName = 'NOT FOUND');
		}
		return a[0];
	}
	public Contact getContactsUsingAbstractImplementation(){
		List<Contact> a = WithOutSharingProxy.getContactsUsingAbstractImplementation();
		if(a.isEmpty()){
			return new Contact(FirstName = 'NOT FOUND');
		}
		return a[0];
	}

	public SelectorExampleController() {}
	
}