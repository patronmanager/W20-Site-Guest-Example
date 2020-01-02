public virtual with sharing class BaseClass {
	public List<Contact> getContactsWithSharing(){
		return [SELECT Id, FirstName, LastName, Email FROM Contact];
	}
	
	public virtual List<Contact> getContactsUnclearSharing(){
		return [SELECT Id, FirstName, LastName, Email FROM Contact];
	}

}