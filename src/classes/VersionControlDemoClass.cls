public with sharing class VersionControlDemoClass {
	public VersionControlDemoClass() {
		
		//Line#1 added by : 
		//Line#2
		//Line#3
		//Line#4
		//Line#5
		//line#6
		
		String UserOracleAccountNumber = '41569887';
		String UserEmailAddress1 = 'astroid@moonspace.com';
		
		List<User> userwithEmail = [select id,Email, Name,userName,isactive  from User where Email =:UserEmailAddress1 AND Contact.Account.Oracle_Account_Number__c =:UserOracleAccountNumber limit 1];
		
		system.debug('++++++++++'+userwithEmail);
        if(userwithEmail.size()>0){
			integer i = 0;
			i++;
		}

		system.debug('++++++++++End');


	}
}