public inherited sharing class OverrideClass extends BaseClass{
	public List<Contact> getContactsInhertedSharing(){
		return [SELECT Id, FirstName, LastName, Email FROM Contact];
	}
	
	public List<Contact> getContactsDelegateSharing(){
		return super.getContactsUnclearSharing();
	}
	
}