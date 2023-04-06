# openvpn-ldap
OpenVPN verify script which authenticates via certificate or LDAP.

## Usage

Make the following additions to the server.conf file on the OpenVPN server.

```
verify-client-cert optional
auth-user-pass-optional
auth-user-pass-verify auth-user.sh via-env
script-security 3
```

After this addition, LDAP authentication can be used by adding the following line to the ovpn file on the client.

```
auth-user-pass
```
