#!/bin/bash

if [[ ! $username ]]; then
  script_type=tls-verify
  exit 0
fi

ldap_host="ldap://ldap.example.org"
ldap_groups="ou=groups,dc=company"

ldapsearch -x \
  -H "${ldap_host}" \
  -b "${ldap_groups}" \
  -D "uid=${username},ou=people,dc=company" \
  -w "${password}" \
  "(&(objectClass=posixGroup)(cn=employee))" "memberUid" | grep -c "memberUid: ${username}$" > /dev/null 2>&1

R="$?"
exit $R
