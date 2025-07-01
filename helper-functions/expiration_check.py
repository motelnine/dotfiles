#!/usr/bin/env python3

#note on arch linux use python-python-whois (in blackarch repo)

import sys
import ssl
import socket
import whois
from datetime import datetime, timezone

def days_from_now(target_date):
    now = datetime.now(timezone.utc)
    delta = target_date - now
    return int(delta.total_seconds() // 86400)

def get_domain_expiry(domain):
    try:
        w = whois.whois(domain)
        expiry_date = w.expiration_date
        if isinstance(expiry_date, list):
            expiry_date = expiry_date[0]  # some TLDs return a list
        if expiry_date is None:
            return None
        if expiry_date.tzinfo is None:
            expiry_date = expiry_date.replace(tzinfo=timezone.utc)
        return days_from_now(expiry_date)
    except Exception as e:
        print(e)
        return None

def get_ssl_expiry(domain):
    try:
        ctx = ssl.create_default_context()
        with ctx.wrap_socket(socket.socket(), server_hostname=domain) as s:
            s.settimeout(5)
            s.connect((domain, 443))
            cert = s.getpeercert()
            expires = datetime.strptime(cert['notAfter'], "%b %d %H:%M:%S %Y %Z")
            expires = expires.replace(tzinfo=timezone.utc)
            return days_from_now(expires)
    except Exception as e:
        print(e)
        return None

if __name__ == "__main__":
    if len(sys.argv) != 2:
        print("Usage: expiration_check domain.com")
        sys.exit(1)

    domain = sys.argv[1]

    domain_expiry = get_domain_expiry(domain)
    ssl_expiry = get_ssl_expiry(domain)

    print(f"domain_name:{domain_expiry if domain_expiry is not None else 'error'} "
          f"ssl_certificate:{ssl_expiry if ssl_expiry is not None else 'error'}")
