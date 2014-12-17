# Chuilang C2 Detect
---------------

### Summary

Nmap NSE script to detect Chuilang command and control servers. This script is still very early in development and I'm still completely clueless at Lua.

### Usage

```
# nmap 162.212.34.12 -p36000 --script chuilang-c2-detect.nse -Pn -n

Starting Nmap 6.47 ( http://nmap.org ) at 2014-12-17 17:40 EST
Nmap scan report for 162.212.34.12
Host is up (0.10s latency).
PORT      STATE SERVICE
36000/tcp open  unknown
| chuilang-c2-detect: CHUILANG C2 DETECTED
|_Appears to be a Chuilang command and control server.

Nmap done: 1 IP address (1 host up) scanned in 5.28 seconds
```

