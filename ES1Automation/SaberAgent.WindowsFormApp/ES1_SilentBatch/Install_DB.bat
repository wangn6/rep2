::===========================================================================================
::
:: Copyright 2013 EMC Corporation.  All rights reserved.  This software 
:: (including documentation) is subject to the terms and conditions set forth 
:: in the end user license agreement or other applicable agreement, and you 
:: may use this software only if you accept all the terms and conditions of 
:: the license agreement.  This software comprises proprietary and confidential 
:: information of EMC.  Unauthorized use, disclosure, and distribution are 
:: strictly prohibited.  Use, duplication, or disclosure of the software and 
:: documentation by the U.S. Government are subject to restrictions set forth 
:: in subparagraph (c)(1)(ii) of the Rights in Technical Data and Computer 
:: Software clause at DFARS 252.227-7013 or subparagraphs (c)(1) and (2) of the 
:: Commercial Computer Software - Restricted Rights at 48 CFR 52.227-19, as 
:: applicable. Manufacturer is EMC Corporation, 176 South St., Hopkinton, MA  01748.
:: 
:: FILE
:: 	Install_DB.bat
::
:: CREATED
::   	06.01.2012
::
:: AUTHOR
::    	Simon Shi
::
:: DESCRIPTION
::   	Silently installs the Database.
::
:: LAST UPDATED 
::   	12.10.2012 Simon Shi
::
:: VERSION	
::	 7.0.0.1
::
:: USAGE
:: 	SILENT MODE : Command Prompt> Install_DB.bat
::	
::	Arguments can be specified via command line arguments or entered directly
::	within the batch script below.
::
:: ===========================================================================================
@ECHO OFF

::Define variables
SET BATCHLOG="%~1%"
SET INSTALLLOG="%~2%"
SET EX_DBSERVER="%~3%"
SET BATCH_LOC="%~4%"

CALL %~dp0\DefaultValues.bat

IF %BATCHLOG%=="" 	SET BATCHLOG=%DB_BATCHLOG%
IF %INSTALLLOG%==""   SET INSTALLLOG=%DB_INSTALLLOG%
IF %EX_DBSERVER%==""	SET EX_DBSERVER=%DEFAULT_EX_DBSERVER%

::Set default values
SET EX_DB_ACT_DEF=%DEFAULT_EX_JDFNAME%
SET EX_DB_SRCH_DEF=%DEFAULT_EX_SRCHNAME%
SET EX_DB_ARC_DEF=%DEFAULT_EX_PBANAME%

::Clear Log files
IF EXIST %BATCHLOG% DEL %BATCHLOG%
IF EXIST %INSTALLLOG% DEL %INSTALLLOG%

::Create batch log
ECHO SourceOne Database Install Log >>%BATCHLOG%
ECHO. >>%BATCHLOG%
ECHO INSTALLLOG= %INSTALLLOG% >>%BATCHLOG%
ECHO EX_DBSERVER= %EX_DBSERVER% >>%BATCHLOG%
ECHO BATCH_LOC= %BATCH_LOC% >>%BATCHLOG%
ECHO. >>%BATCHLOG%

::Install SourceOne Database
@ECHO Installing SourceOne Database.  Please wait...
ECHO SourceOne Database Installation >>%BATCHLOG%
ECHO   Started at %DATE% %TIME% >>%BATCHLOG%

ES1_DatabaseSetup.exe /s /v"/qn /L*v %INSTALLLOG% EX_DBSERVER=%EX_DBSERVER% EX_DB_ACT_DEF=%EX_DB_ACT_DEF% EX_DB_SRCH_DEF=%EX_DB_SRCH_DEF% EX_DB_ARC_DEF=%EX_DB_ARC_DEF% REBOOT=ReallySuppress "

sqlcmd -S %EX_DBSERVER% -i %BATCH_LOC%\GrantPermission.sql -b -v AdminGroup=%DEFAULT_DB_GRP_CON% SecurityGroup=%DEFAULT_DB_GRP_SEC%

::Log completion
ECHO   Finished at %DATE% %TIME% >>%BATCHLOG%
ECHO. >>%BATCHLOG%