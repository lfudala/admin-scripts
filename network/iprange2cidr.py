from netaddr import *
ips = ['192.168.1.0', '192.168.1.255']
all_ips = list(iter_iprange(ips[0], ips[1]))
ip_address = cidr_merge(all_ips)
cidr = []
for ip in ip_address:
    cidr.append(str(ip.cidr))
print(cidr)