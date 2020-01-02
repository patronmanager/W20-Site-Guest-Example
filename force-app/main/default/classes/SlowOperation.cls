public with sharing class SlowOperation {

    public static void goSlow(){
        Contact c = [SELECT Id, FirstName, LastName, Email FROM Contact WHERE Email = 'bob@jones.com'];
        System.debug(c);

        Long now = DateTime.now().getTime();
        c.FirstName = 'SLOW ' + now;

        Long delay = 10 * 1000;
        while((now + delay) > (DateTime.now().getTime())){
            Schema.getGlobalDescribe();
        }

        update c;
        c = [SELECT Id, FirstName, LastName, Email FROM Contact WHERE Email = 'bob@jones.com'];
        System.debug(c);

    }

    public static void goFast(){
        Contact c = [SELECT Id, FirstName, LastName, Email FROM Contact WHERE Email = 'bob@jones.com'];
        System.debug(c);

        Long now = DateTime.now().getTime();
        c.LastName = 'FAST ' + now;

        update c;
        c = [SELECT Id, FirstName, LastName, Email FROM Contact WHERE Email = 'bob@jones.com'];
        System.debug(c);

    }

}