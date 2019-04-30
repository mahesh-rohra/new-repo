<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import = "helpers.migrationtool.ProcessLauncher" %>
<%@ page import = "java.util.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Testing</title>
</head>
<body>
     <% 
        String sqlDirPath = null;
		String connectStr = null;
		StringBuffer processOutputtt = null;
       try
       {
     	    System.out.println("Inside Main ");
		 	connectStr = "edapter/edapter@(DESCRIPTION=(ADDRESS=(PROTOCOL=TCP)(HOST=hlr12test.global.triniti.com)(PORT=1522))(CONNECT_DATA=(SERVICE_NAME= HLR12TST)))";
			sqlDirPath = "/home/pdinstaller/TrinitiApps/Tri2/perlscripts/";  
			
			String[] processToolArgs = {"sqlplus", connectStr, "@" + sqlDirPath + "execute.sql"} ;		
					
         //process = Runtime.getRuntime().exec(processToolArgs, null);
         
         /* ProcessLauncherTest plt = new ProcessLauncherTest();
         System.out.println(" Calling executeCommand(-) ");
         processOutputtt =  plt.executeCommand(processToolArgs); */
         ProcessLauncher processLauncher = ProcessLauncher.getInstance();
           StringBuffer processOuput = null;
	        boolean wait4Minutes = true; //changed
	        
	        /*if(this instanceof DBMigrator)
	        {
	            wait4Minutes = true;
	        }*/
	        
	        LinkedHashMap OuputMap = (LinkedHashMap) processLauncher.execute(commandArray, wait4Minutes);
	        if(OuputMap != null && OuputMap.size() >0)
	        {
	        	System.out.println("Inside If Block");
	            processOuput = (StringBuffer) OuputMap.get("statusMessage");
	        }
	        System.out.println("******START Log: executeCommand***********" + this.getClass().getName() + "********************");
	        System.out.println(processOuput.toString());
	        System.out.println("******END Log: executeCommand***********" + this.getClass().getName() + "********************");
	       
         
         
         System.out.println("Process Output :::::" + processOutputtt);
       
       } 
       catch(Exception e)
      {
         e.printStackTrace();
      }
     %>
     <%--  <%
        protected StringBuffer executeCommand(String[] commandArray) throws IOException, ProcessLauncherException
	    {
	    	System.out.println("Inside ExecuteCommand(-) method ");
	        ProcessLauncher processLauncher = ProcessLauncher.getInstance();
	        StringBuffer processOuput = null;
	        boolean wait4Minutes = true; //changed
	        
	        /*if(this instanceof DBMigrator)
	        {
	            wait4Minutes = true;
	        }*/
	        
	        LinkedHashMap OuputMap = (LinkedHashMap) processLauncher.execute(commandArray, wait4Minutes);
	        if(OuputMap != null && OuputMap.size() >0)
	        {
	        	System.out.println("Inside If Block");
	            processOuput = (StringBuffer) OuputMap.get("statusMessage");
	        }
	        System.out.println("******START Log: executeCommand***********" + this.getClass().getName() + "********************");
	        System.out.println(processOuput.toString());
	        System.out.println("******END Log: executeCommand***********" + this.getClass().getName() + "********************");
	        
	        return processOuput;
	    }

     %>
 --%></body>
</html>