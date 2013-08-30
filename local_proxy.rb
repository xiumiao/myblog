# coding: utf-8
#
require 'webrick'
require 'webrick/httpproxy'

s = WEBrick::HTTPProxyServer.new(:Port => 8080,
    :RequestCallback => Proc.new{|req,res| puts req.request_line, req.raw_header},
		:ProxyVia => false,
    :ProxyURI => URI.parse('http://lixiumiao:13305151138@192.168.16.189:8080')
		)

# Shutdown functionality
trap("INT"){s.shutdown}

# run the beast
s.start
