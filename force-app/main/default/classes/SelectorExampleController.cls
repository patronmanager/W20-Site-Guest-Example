public with sharing class SelectorExampleController {
	
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
	
	public SelectorExampleController() {}
	
}