public abstract with sharing class BaseClass {
	public List<Contact> getContactsWithSharing(){
		return [SELECT Id, FirstName, LastName, Email FROM Contact];
	}
	
	public virtual List<Contact> getContactsUnclearSharing(){
		return [SELECT Id, FirstName, LastName, Email FROM Contact];
	}

	public abstract List<Contact> getContactsAbstractly();

	public List<Contact> getContactsUsingAbstractImplementation(){
		return getContactsAbstractly();
	}

}