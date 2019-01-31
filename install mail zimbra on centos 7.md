# Install mail zimbra 8.8.10 on centos 7

1.Step 1: Install System Packages
1.1 Install System Packages and disable selinux 
```
yum install perl perl-core ntpl nmap sudo libidn gmp libaio libstdc++ unzip sysstat sqlite wget -y

sed -i 's/^SELINUX=.*/SELINUX=disabled/g' /etc/selinux/config

[root@localhost ~]# getenforce
Enforcing
[root@localhost ~]# setenforce 0
[root@localhost ~]# getenforce
Permissive

systemctl stop postfix
systemctl disable postfix
systemctl stop sendmail
systemctl disable sendmail
```
2. Step 2: Configure System Hostname
```
hostnamectl set-hostname tshirtsport.com

echo "192.168.12.132  mail.tshirtsport.com  mail " >> /etc/hosts

cat /etc/hosts
127.0.0.1       localhost.localdomain localhost
::1             localhost6.localdomain localhost6
192.168.12.132  tshirtsport.com  mail 
192.168.12.132  mail.tshirtsport.com 
```
3. Step 3: Install Zimbra Collaboration Suite Open Source Edition
```
mkdir -p /opt/zimbrasetup
cd /opt/zimbrasetup
wget https://files.zimbra.com/downloads/8.8.10_GA/zcs-8.8.10_GA_3039.RHEL7_64.20180928094617.tgz

tar zxvf zcs-*.tgz
cd zcs-*
ls

./install.sh
OR
./install.sh --platform-override   [On different platforms other than RHEL]
./install.sh --platform-override   [On different platforms other than RHEL]

Use Zimbra's package repository [Y] y

Importing Zimbra GPG key

Configuring package repository

Checking for installable packages

Found zimbra-core (local)
Found zimbra-ldap (local)
Found zimbra-logger (local)
Found zimbra-mta (local)
Found zimbra-dnscache (local)
Found zimbra-snmp (local)
Found zimbra-store (local)
Found zimbra-apache (local)
Found zimbra-spell (local)
Found zimbra-memcached (repo)
Found zimbra-proxy (local)
Found zimbra-drive (repo)
Found zimbra-imapd (local)
Found zimbra-patch (repo)


Select the packages to install

Install zimbra-ldap [Y] y

Install zimbra-logger [Y] y

Install zimbra-mta [Y] y

Install zimbra-dnscache [Y] y

Install zimbra-snmp [Y] y

Install zimbra-store [Y] y

Install zimbra-apache [Y] y

Install zimbra-spell [Y] y

Install zimbra-memcached [Y] y

Install zimbra-proxy [Y] y

Install zimbra-drive [Y] y

Install zimbra-imapd (BETA - for evaluation only) [N] 

Install zimbra-chat [Y] y
Checking required space for zimbra-core
Checking space for zimbra-store
Checking required packages for zimbra-store
zimbra-store package check complete.

Installing:
    zimbra-core
    zimbra-ldap
    zimbra-logger
    zimbra-mta
    zimbra-dnscache
    zimbra-snmp
    zimbra-store
    zimbra-apache
    zimbra-spell
    zimbra-memcached
    zimbra-proxy
    zimbra-drive
    zimbra-patch
    zimbra-chat

The system will be modified.  Continue? [N] 
Beginning Installation - see /tmp/install.log.OgWCDCDD for details...

                          zimbra-core-components will be downloaded and installed.
                            zimbra-timezone-data will be installed.
                          zimbra-common-core-jar will be installed.
                         zimbra-common-mbox-conf will be installed.
                   zimbra-common-mbox-conf-attrs will be installed.
                    zimbra-common-mbox-conf-msgs will be installed.
                  zimbra-common-mbox-conf-rights will be installed.
                           zimbra-common-mbox-db will be installed.
                         zimbra-common-mbox-docs will be installed.
                   zimbra-common-mbox-native-lib will be installed.
                         zimbra-common-core-libs will be installed.
                                     zimbra-core will be installed.
                          zimbra-ldap-components will be downloaded and installed.
                                     zimbra-ldap will be installed.
                                   zimbra-logger will be installed.
                           zimbra-mta-components will be downloaded and installed.
                                      zimbra-mta will be installed.
                      zimbra-dnscache-components will be downloaded and installed.
                                 zimbra-dnscache will be installed.
                          zimbra-snmp-components will be downloaded and installed.
                                     zimbra-snmp will be installed.
                         zimbra-store-components will be downloaded and installed.
                       zimbra-jetty-distribution will be downloaded and installed.
                                zimbra-mbox-conf will be installed.
                                 zimbra-mbox-war will be installed.
                             zimbra-mbox-service will be installed.
                       zimbra-mbox-webclient-war will be installed.
                   zimbra-mbox-admin-console-war will be installed.
                          zimbra-mbox-store-libs will be installed.
                                    zimbra-store will be installed.
                        zimbra-apache-components will be downloaded and installed.
                                   zimbra-apache will be installed.
                         zimbra-spell-components will be downloaded and installed.
                                    zimbra-spell will be installed.
                                zimbra-memcached will be downloaded and installed.
                         zimbra-proxy-components will be downloaded and installed.
                                    zimbra-proxy will be installed.
                                    zimbra-drive will be downloaded and installed (later).
                                    zimbra-patch will be downloaded and installed (later).
                                     zimbra-chat will be downloaded and installed (later).

Downloading packages (11):
   zimbra-core-components
   zimbra-ldap-components
   zimbra-mta-components
   zimbra-dnscache-components
   zimbra-snmp-components
   zimbra-store-components
   zimbra-jetty-distribution
   zimbra-apache-components
   zimbra-spell-components
   zimbra-memcached
   zimbra-proxy-components
      ...done

Removing /opt/zimbra
Removing zimbra crontab entry...done.
Cleaning up zimbra init scripts...done.
Cleaning up /etc/security/limits.conf...done.

Finished removing Zimbra Collaboration Server.


Installing repo packages (11):
   zimbra-core-components
   zimbra-ldap-components
   zimbra-mta-components
   zimbra-dnscache-components
   zimbra-snmp-components
   zimbra-store-components
   zimbra-jetty-distribution
   zimbra-apache-components
   zimbra-spell-components
   zimbra-memcached
   zimbra-proxy-components
      ...
done

Installing local packages (26):
   zimbra-timezone-data
   zimbra-common-core-jar
   zimbra-common-mbox-conf
   zimbra-common-mbox-conf-attrs
   zimbra-common-mbox-conf-msgs
   zimbra-common-mbox-conf-rights
   zimbra-common-mbox-db
   zimbra-common-mbox-docs
   zimbra-common-mbox-native-lib
   zimbra-common-core-libs
   zimbra-core
   zimbra-ldap
   zimbra-logger
   zimbra-mta
   zimbra-dnscache
   zimbra-snmp
   zimbra-mbox-conf
   zimbra-mbox-war
   zimbra-mbox-service
   zimbra-mbox-webclient-war
   zimbra-mbox-admin-console-war
   zimbra-mbox-store-libs
   zimbra-store
   zimbra-apache
   zimbra-spell
   zimbra-proxy
      ...done

Installing extra packages (3):
   zimbra-drive
   zimbra-patch
   zimbra-chat
      ...done

Running Post Installation Configuration:
Operations logged to /tmp/zmsetup.20181122-060410.log
Installing LDAP configuration database...done.
Setting defaults...sh: /sbin/ifconfig: No such file or directory
No results returned for A lookup of mail.tshirtsport.com
Checked nameservers:
        192.168.12.2
No results returned for AAAA lookup of mail.tshirtsport.com
Checked nameservers:
        192.168.12.2


DNS ERROR resolving mail.tshirtsport.com
It is suggested that the hostname be resolvable via DNS
Change hostname [Yes] Please enter the logical hostname for this host [mail.tshirtsport.com] tshirtsport.com


DNS ERROR resolving MX for tshirtsport.com
It is suggested that the domain name have an MX record configured in DNS
Change domain name? [Yes] yes
Create domain: [tshirtsport.com] 


DNS ERROR resolving MX for tshirtsport.com
It is suggested that the domain name have an MX record configured in DNS
Re-Enter domain name? [Yes] No    
done.
Checking for port conflicts
sh: netstat: command not found

Main menu

   1) Common Configuration:                                                  
   2) zimbra-ldap:                             Enabled                       
   3) zimbra-logger:                           Enabled                       
   4) zimbra-mta:                              Enabled                       
   5) zimbra-dnscache:                         Enabled                       
   6) zimbra-snmp:                             Enabled                       
   7) zimbra-store:                            Enabled                       
        +Create Admin User:                    yes                           
        +Admin user to create:                 admin@tshirtsport.com         
******* +Admin Password                        UNSET                         
        +Anti-virus quarantine user:           virus-quarantine.kqfa_xaani@tshirtsport.com
        +Enable automated spam training:       yes                           
        +Spam training user:                   spam.mj6twx5r@tshirtsport.com 
        +Non-spam(Ham) training user:          ham.awihm1jgmz@tshirtsport.com
        +SMTP host:                            tshirtsport.com               
        +Web server HTTP port:                 8080                          
        +Web server HTTPS port:                8443                          
        +Web server mode:                      https                         
        +IMAP server port:                     7143                          
        +IMAP server SSL port:                 7993                          
        +POP server port:                      7110                          
        +POP server SSL port:                  7995                          
        +Use spell check server:               yes                           
        +Spell server URL:                     http://tshirtsport.com:7780/aspell.php
        +Enable version update checks:         TRUE                          
        +Enable version update notifications:  TRUE                          
        +Version update notification email:    admin@mail.tshirtsport.com    
        +Version update source email:          admin@mail.tshirtsport.com    
        +Install mailstore (service webapp):   yes                           
        +Install UI (zimbra,zimbraAdmin webapps): yes                           

   8) zimbra-spell:                            Enabled                       
   9) zimbra-proxy:                            Enabled                       
  10) Default Class of Service Configuration:                                
   s) Save config to file                                                    
   x) Expand menu                                                            
   q) Quit                                    

Address unconfigured (**) items  (? - help) 7


Store configuration

   1) Status:                                  Enabled                       
   2) Create Admin User:                       yes                           
   3) Admin user to create:                    admin@tshirtsport.com         
** 4) Admin Password                           UNSET                         
   5) Anti-virus quarantine user:              virus-quarantine.kqfa_xaani@tshirtsport.com
   6) Enable automated spam training:          yes                           
   7) Spam training user:                      spam.mj6twx5r@tshirtsport.com 
   8) Non-spam(Ham) training user:             ham.awihm1jgmz@tshirtsport.com
   9) SMTP host:                               tshirtsport.com               
  10) Web server HTTP port:                    8080                          
  11) Web server HTTPS port:                   8443                          
  12) Web server mode:                         https                         
  13) IMAP server port:                        7143                          
  14) IMAP server SSL port:                    7993                          
  15) POP server port:                         7110                          
  16) POP server SSL port:                     7995                          
  17) Use spell check server:                  yes                           
  18) Spell server URL:                        http://tshirtsport.com:7780/aspell.php
  19) Enable version update checks:            TRUE                          
  20) Enable version update notifications:     TRUE                          
  21) Version update notification email:       admin@mail.tshirtsport.com    
  22) Version update source email:             admin@mail.tshirtsport.com    
  23) Install mailstore (service webapp):      yes                           
  24) Install UI (zimbra,zimbraAdmin webapps): yes                           

Select, or 'r' for previous menu [r] 4

Password for admin@tshirtsport.com (min 6 characters): [hysDXgYtsE] vivas@123

Store configuration

   1) Status:                                  Enabled                       
   2) Create Admin User:                       yes                           
   3) Admin user to create:                    admin@tshirtsport.com         
   4) Admin Password                           set                           
   5) Anti-virus quarantine user:              virus-quarantine.kqfa_xaani@tshirtsport.com
   6) Enable automated spam training:          yes                           
   7) Spam training user:                      spam.mj6twx5r@tshirtsport.com 
   8) Non-spam(Ham) training user:             ham.awihm1jgmz@tshirtsport.com
   9) SMTP host:                               tshirtsport.com               
  10) Web server HTTP port:                    8080                          
  11) Web server HTTPS port:                   8443                          
  12) Web server mode:                         https                         
  13) IMAP server port:                        7143                          
  14) IMAP server SSL port:                    7993                          
  15) POP server port:                         7110                          
  16) POP server SSL port:                     7995                          
  17) Use spell check server:                  yes                           
  18) Spell server URL:                        http://tshirtsport.com:7780/aspell.php
  19) Enable version update checks:            TRUE                          
  20) Enable version update notifications:     TRUE                          
  21) Version update notification email:       admin@mail.tshirtsport.com    
  22) Version update source email:             admin@mail.tshirtsport.com    
  23) Install mailstore (service webapp):      yes                           
  24) Install UI (zimbra,zimbraAdmin webapps): yes                           

Select, or 'r' for previous menu [r] a
Invalid selection! - press any key to continue 



Store configuration

   1) Status:                                  Enabled                       
   2) Create Admin User:                       yes                           
   3) Admin user to create:                    admin@tshirtsport.com         
   4) Admin Password                           set                           
   5) Anti-virus quarantine user:              virus-quarantine.kqfa_xaani@tshirtsport.com
   6) Enable automated spam training:          yes                           
   7) Spam training user:                      spam.mj6twx5r@tshirtsport.com 
   8) Non-spam(Ham) training user:             ham.awihm1jgmz@tshirtsport.com
   9) SMTP host:                               tshirtsport.com               
  10) Web server HTTP port:                    8080                          
  11) Web server HTTPS port:                   8443                          
  12) Web server mode:                         https                         
  13) IMAP server port:                        7143                          
  14) IMAP server SSL port:                    7993                          
  15) POP server port:                         7110                          
  16) POP server SSL port:                     7995                          
  17) Use spell check server:                  yes                           
  18) Spell server URL:                        http://tshirtsport.com:7780/aspell.php
  19) Enable version update checks:            TRUE                          
  20) Enable version update notifications:     TRUE                          
  21) Version update notification email:       admin@mail.tshirtsport.com    
  22) Version update source email:             admin@mail.tshirtsport.com    
  23) Install mailstore (service webapp):      yes                           
  24) Install UI (zimbra,zimbraAdmin webapps): yes                           

Select, or 'r' for previous menu [r] r

Main menu

   1) Common Configuration:                                                  
   2) zimbra-ldap:                             Enabled                       
   3) zimbra-logger:                           Enabled                       
   4) zimbra-mta:                              Enabled                       
   5) zimbra-dnscache:                         Enabled                       
   6) zimbra-snmp:                             Enabled                       
   7) zimbra-store:                            Enabled                       
   8) zimbra-spell:                            Enabled                       
   9) zimbra-proxy:                            Enabled                       
  10) Default Class of Service Configuration:                                
   s) Save config to file                                                    
   x) Expand menu                                                            
   q) Quit                                    

*** CONFIGURATION COMPLETE - press 'a' to apply
Select from menu, or press 'a' to apply config (? - help) a   
Save configuration data to a file? [Yes] Yes
Save config in file: [/opt/zimbra/config.8030] 
Saving config in /opt/zimbra/config.8030...done.
The system will be modified - continue? [No] Yes
Operations logged to /tmp/zmsetup.20181122-060410.log


If you failse re run 
perl /opt/zimbra/libexec/zmsetup.pl

Change password mail 
[root@mail ~]# su - zimbra
Last login: Thu Nov 22 08:57:21 EST 2018 on pts/2
[zimbra@tshirtsport ~]$ zmprov sp admin admin@123
``` 
Referrent: 
```
https://zimbra.github.io/adminguide/latest/
https://www.zimbra.com/docs/os/6.0.10/single_server_install/quick_start.1.09.html
```

4. Open port if you enable firewalld on centos 7
```
[root@mail ~]# firewall-cmd --permanent --add-port=161/udp
[root@mail ~]# firewall-cmd --permanent --add-port=25/tcp
[root@mail ~]# firewall-cmd --permanent --add-port=2220/tcp
[root@mail ~]# firewall-cmd --permanent --add-port=80/tcp
[root@mail ~]# firewall-cmd --permanent --add-port=110/tcp
[root@mail ~]# firewall-cmd --permanent --add-port=143/tcp
[root@mail ~]# firewall-cmd --permanent --add-port=389/tcp
[root@mail ~]# firewall-cmd --permanent --add-port=443/tcp
[root@mail ~]# firewall-cmd --permanent --add-port=587/tcp
[root@mail ~]# firewall-cmd --permanent --add-port=465/tcp
[root@mail ~]# firewall-cmd --permanent --add-port=993/tcp
[root@mail ~]# firewall-cmd --permanent --add-port=995/tcp
[root@mail ~]# firewall-cmd --permanent --add-port=7071/tcp
[root@mail ~]# firewall-cmd --permanent --add-port=7780/tcp

[root@mail ~]# firewall-cmd --reload
```
5. Check service zimbra 
```
[root@mail ~]# zmcontrol status
```
6. Install DNS server
```
yum install bind bind-utils -y
Config file name.conf
Mail server Ip 192.168.12.132
Static hostname: tshirtsport.com
Referrent: https://wiki.zimbra.com/wiki/Install_Zimbra_Collaboration_and_a_DNS_Server_with_Script
Zimbra Collaboration 8.5 or above
ZCS 8.5 or above onwards this attribute is now in ldap - zimbraMtaLmtpHostLookup

 zmprov ms mtaserver.com zimbraMtaLmtpHostLookup native
In case that you are using Single Server, be aware always of the Global Config as well:

 zmprov mcf zimbraMtaLmtpHostLookup native
Once this is done, you'll need to restart the mta:

 zmmtactl restart
From: https://wiki.zimbra.com/wiki/Incoming_Mail_Problems

```

