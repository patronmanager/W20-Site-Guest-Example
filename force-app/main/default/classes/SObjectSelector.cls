public abstract inherited sharing class SObjectSelector extends fflib_SObjectSelector {
	
	// Returns a list of related fields, pre-fixed with the specified relationship name
	public static String[] getRelatedFieldList(String relationshipName, List<Schema.SObjectField> fieldList) {
		List<String> relatedFieldList = new List<String>();
		for (Schema.SObjectField field : fieldList) {
			relatedFieldList.add(relationshipName + '.' + field.getDescribe().getLocalName());
		}
		return relatedFieldList;
	}
	
	protected String orderBy;
	
	public SObjectSelector() {
		super();
	}
	
	public SObjectSelector(Boolean includeFieldSetFields) {
		super(includeFieldSetFields);
	}
	
	public SObjectSelector(Boolean includeFieldSetFields, Boolean enforceCRUD, Boolean enforceFLS) {
		super(includeFieldSetFields, enforceCRUD, enforceFLS);
	}
	
	public void setOrderBy(String orderBy) {
		this.orderBy = orderBy;
	}
	
	public override virtual String getOrderBy() {
		if (String.isBlank(this.orderBy)) {
			this.orderBy = 'CreatedDate';
		}
		return this.orderBy;
	}
	
	// This method returns a fflib_QueryFactory instance that doesn't sort the fields
	public fflib_QueryFactory newQueryFactoryUnsorted() {
		fflib_QueryFactory qf = newQueryFactory();
		qf.setSortSelectFields(false);
		return qf;
	}
	
	public fflib_QueryFactory newQueryFactoryWithRelatedFields(String[] relatedFields) {
		fflib_QueryFactory qf = newQueryFactoryUnsorted();
		if (relatedFields != null) {
			qf.selectFields(relatedFields);
		}
		return qf;
	}
	
	public abstract Schema.SObjectType getSObjectType();
	
	protected List<SObject> selectAllSObjectsWithLimit(Integer lim, String[] relatedFields) {
		fflib_QueryFactory qf = newQueryFactoryWithRelatedFields(relatedFields);
		qf.setLimit(lim);
		return Database.query(qf.toSOQL());
	}
	
	protected List<SObject> selectSObjectsById(Set<Id> idSet, String[] relatedFields) {
		fflib_QueryFactory qf = newQueryFactoryWithRelatedFields(relatedFields);
		return Database.query(qf.setCondition('Id IN :idSet').toSOQL());
	}
	
	protected List<SObject> selectSObjectsWhere(String whereClause, String[] relatedFields) {
		fflib_QueryFactory qf = newQueryFactoryWithRelatedFields(relatedFields);
		return Database.query(qf.setCondition(whereClause).toSOQL());
	}
}
