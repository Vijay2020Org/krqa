public class AppsCommunityUserNameController {

   
    public String UserOracleAccountNumber { get; set; }
 
    public String UserEmailAddress1{get;set;}            
    
    public PageReference ClickHereToSUbmit() {
    
        List<User> userwithEmail = [select id,Email, Name,userName,isactive  from User where Email =:UserEmailAddress1 AND Contact.Account.Oracle_Account_Number__c =:UserOracleAccountNumber limit 1];
        //List<User> userwithEmail = [select id,Email,Name, userName,isactive,ForgotUserName__c  from User where Email =:UserEmailAddress1 AND Contact.Account.Solution_id__c =:UserOracleAccountNumber limit 1];
        system.debug('++++++++++'+userwithEmail);
        if(userwithEmail.size()>0){
        
        user UserToIntimate = new User();
        UserToIntimate = userwithEmail.get(0);
        Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
        String[] toAddresses = new String[] {UserToIntimate.Email}; 
        system.debug('+++'+toAddresses);
        mail.setToAddresses(toAddresses);
        mail.setSenderDisplayName('Kronos Support');
        mail.setSubject('Notifying regarding UserName');
        mail.setHtmlBody('Hi '+UserToIntimate.name+',<br/><br/>Please find your registered UserName for Kronos Community Portal below. <br/><br/>UserName:  '+ UserToIntimate.username);
        Messaging.SendEmailResult[] sendresult=Messaging.sendEmail(new Messaging.SingleEmailMessage[] { mail });
        
        
            
            pagereference pgAfterMail = new pagereference('/apex/AppsCommunityUserNameIntimation');
            return pgAfterMail;
        }
        else{
          ApexPages.Message message = new ApexPages.message(ApexPages.severity.FATAL,'Please enter valid email address and solution id that you registered with. For further assistance please reach out support@kronoscommunity.com');
        ApexPages.addMessage(message);
        return null;
        }
        
    }   
    
        public PageReference Cancel() 
    {
        
       pagereference pg = new pageReference('/apex/AppsCommunityLoginpage');
       return pg;
    }
 

}