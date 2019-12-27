@IsTest
public without sharing class Test_InsertRecord {
	//One would hope that setting this to 'without sharing' would transfer this sharing model into the other methods
	// but that is not the case
	
	@TestSetup
	static void testSetup() {
		Account acct = new Account(Name = 'TestSetup');
		insert acct;
	}
	
	@IsTest
	static void InsertRecord_When_StandardUser_Expect_Success() {
		Account acct = new Account(Name='Local');
		insert acct;
		InsertRecord.objectWithLookup(acct);
	}
	
	@IsTest
	static void InsertRecord_When_SiteGuestUser_Expect_Success() {
		System.runAs(getSiteGuestUser()) {
			// This works because the insert of the account is inside the 'runAs'
			// This is great until you try to use data from a test scaffold or test setup that was created by a different user.
			Account acct = new Account(Name = 'Local');
			insert acct;
			InsertRecord.objectWithLookup(acct);
		}
	}
	
	@IsTest
	static void InsertRecord_When_SiteGuestUser_Expect_Failure() {
		// This fails because the insert acct is outside the 'runAs'
		Account acct = new Account(Name = 'Local');
		insert acct;
		
		try {
			System.runAs(getSiteGuestUser()) {
				InsertRecord.objectWithLookup(acct);
			}
			System.assert(false, 'Expected failure but got success');
		}catch (System.DmlException dmlEx) {
			System.assert(dmlEx.getMessage().containsIgnoreCase('INSUFFICIENT_ACCESS_ON_CROSS_REFERENCE_ENTITY'));
		}
	}
	
	@IsTest
	static void InsertRecord_When_SiteGuestUserAndAccountRequeried_Expect_Failure() {
		// This fails because the insert acct is outside the 'runAs'
		Account acct = new Account(Name = 'Local');
		insert acct;
		
		System.runAs(getSiteGuestUser()) {
			try {
				//requerying in here won't work because the site guest user doesn't have access 'Secure guest user record access'
				//maybe use a Selector class with CRUD & FLS turned off??
				Account newAcct = [SELECT Id, Name FROM Account WHERE Name = 'Test'];
				InsertRecord.objectWithLookup(newAcct);
				System.assert(false, 'Expected failure but got success');
			}catch (System.QueryException qEx) {
				System.assert(qEx.getMessage().containsIgnoreCase('List has no rows'));
			}
		}
	}
	
	@IsTest
	static void InsertRecord_When_RunThroughPoxy_Expect_Success() {
		// Sending this through a proxy that has without sharing works
		Account acct = new Account(Name = 'Local');
		insert acct;
		
		System.runAs(getSiteGuestUser()) {
			WithOutSharingProxy.objectWithLookup(acct);
		}
	}
	
	@IsTest
	static void InsertRecord_When_UsingTestSetup_Expect_Failure() {
		// This fails because the query is outside the 'runAs'
		Account acct = [SELECT Id, Name FROM Account WHERE Name = 'TestSetup'];
		
		System.runAs(getSiteGuestUser()) {
			try {
				InsertRecord.objectWithLookup(acct);
				System.assert(false, 'Expected failure but got success');
			}catch (System.DmlException dmlEx) {
				System.assert(dmlEx.getMessage().containsIgnoreCase('INSUFFICIENT_ACCESS_ON_CROSS_REFERENCE_ENTITY'));
			}
		}
	}
	
	@IsTest
	static void InsertRecord_When_UsingTestSetupRunThroughPoxy_Expect_Success() {
		// Sending this through a proxy that has without sharing works
		Account acct = [SELECT Id, Name FROM Account WHERE Name = 'TestSetup'];
		
		System.runAs(getSiteGuestUser()) {
			WithOutSharingProxy.objectWithLookup(acct);
		}
	}
	
	@IsTest
	static void InsertObject_When_SiteGuestUser_Expect_Failure() {
		// This fails because the insert of this object is outside the 'runAs'
		aaTest__c aaTest = new aaTest__c(Name = 'aaTest Local');
		insert aaTest;
		
		try {
			System.runAs(getSiteGuestUser()) {
				InsertRecord.objectWithLookup(aaTest);
			}
			System.assert(false, 'Expected failure but got success');
		}catch (System.DmlException dmlEx) {
			System.assert(dmlEx.getMessage().containsIgnoreCase('INSUFFICIENT_ACCESS_ON_CROSS_REFERENCE_ENTITY'));
		}
	}
	
	@IsTest
	static void InsertObject_When_RunThroughPoxy_Expect_Success() {
		// Sending this through a proxy that has without sharing works
		aaTest__c aaTest = new aaTest__c(Name = 'aaTest Local');
		insert aaTest;
		
		System.runAs(getSiteGuestUser()) {
			WithOutSharingProxy.objectWithLookup(aaTest);
		}
	}
	
	public static User getSiteGuestUser(){
		Site theSite = [SELECT GuestUserId FROM Site WHERE Name='Sample' AND Status='Active' LIMIT 1];
		return [SELECT Id, TimeZoneSidKey FROM User WHERE Id = :theSite.GuestUserId];
	}
}