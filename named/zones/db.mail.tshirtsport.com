$TTL    86400
@               IN SOA  mail.tshirtsport.com. root (
                                        42              ; serial (d. adams)
                                        3H              ; refresh
                                        15M             ; retry
                                        1W              ; expiry
                                        1D )            ; minimum
;
@     IN      NS      ns1.tshirtsport.com.
@     IN      A       192.168.12.132
@     IN      MX     10     tshirtsport.com.
tshirtsport.com     IN      A      192.168.12.132
ns1     IN      A      	192.168.12.132
mail     IN      A      192.168.12.132
pop3     IN      A      192.168.12.132
imap     IN      A      192.168.12.132
imap4     IN      A     192.168.12.132
smtp     IN      A      192.168.12.132

