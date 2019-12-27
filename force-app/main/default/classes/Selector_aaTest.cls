public inherited sharing class Selector_aaTest extends SObjectSelector {
	
		// Core field list
		public static List<Schema.SObjectField> FIELD_LIST {
			get {
				if (FIELD_LIST == null) {
					FIELD_LIST = new List<Schema.SObjectField>{
							aaTest__c.Id,
							aaTest__c.Name,
							aaTest__c.TestField__c,
							aaTest__c.Text2__c,
							aaTest__c.Text3__c
					};
				}
				return FIELD_LIST;
			}
			private set;
		}
		
		public Selector_aaTest() {
			super();
		}
		
		public override Schema.SObjectType getSObjectType() {
			return aaTest__c.SObjectType;
		}
		
		public List<Schema.SObjectField> getSObjectFieldList() {
			return FIELD_LIST;
		}
		
		public override String getOrderBy() {
			if (String.isBlank(this.orderBy)) {
				this.orderBy = 'Name';
			}
			return this.orderBy;
		}
		
		public List<aaTest__c> selectById(Set<Id> idSet) {
			return (List<aaTest__c>) super.selectSObjectsById(idSet, null);
		}
	}