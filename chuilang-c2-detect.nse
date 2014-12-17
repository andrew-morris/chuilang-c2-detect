local shortport = require "shortport"
local comm = require "comm"
local string = require "string"

description = [[Identifies Chuilang command and control server]]
author = "Andrew Morris <andrew[at]morris.guru>"
license = "Same as Nmap--See http://nmap.org/book/man-legal.html"
categories = {"discovery", "version"}

-- This code is half baked and was written in a hurry. And I suck at Lua.

portrule = shortport.port_or_service(36000, 'telnet', 'tcp') -- look into this later

action = function(host, port)

  local try = nmap.new_try()
  local hello = "\x01\x00\x00\x00\x6b\x00\x00\x00\x00\xf4\x01\x00\x00\x32\x00\x00\x00\xe8\x03\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x01\x01\x00\x00\x00\x00\x01\x00\x00\x00\xac\x10\xa1\x82\xac\x10\xa1\x82\xac\x10\xa1\x82\xac\x10\xa1\x82\xac\x10\xa1\x82\xff\xff\x01\x00\x00\x00\x00\x00\x63\x68\x75\x6c\x69\x61\x6e\x67\x32\x30\x31\x34\x3a\x00\x01\x00\x00\x00\xaf\x0b\x00\x00\xff\x03\x00\x00\x57\x69\x6e\x64\x6f\x77\x73\x20\x58\x50\x00\x47\x32\x2e\x32\x35\x00"
  local response = try(comm.exchange(host,port, hello, {lines = 100, proto = port.protocol,timeout=5000}))
  local chuilang_response = "\x08\x00\x00\x00\x0c\x00\x00\x00"
  local unpatched = string.find(response,chuilang_response)

  if (unpatched) then
    return ("CHUILANG C2 DETECTED\r\nAppears to be a Chuilang command and control server.")
  end
end


