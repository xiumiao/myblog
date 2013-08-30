# coding: utf-8

require 'net/http'
require 'uri'
require 'json'


hash = Hash.new

SHENZHEN = "深圳"
GUANGZHOU = "广州"
XIAMEN = "厦门"
NINGBO = "宁波"
SHANGHAI = "上海"
QINGDAO = "青岛"
DALIAN =  "大连"
TIANJIN = "天津"

hash[SHENZHEN] = "深圳, 海南"
hash[GUANGZHOU] = "广东, 广西, 贵州, 云南"
hash[XIAMEN] = "福建, 江西"
hash[NINGBO] = "浙江"
hash[SHANGHAI] = "江苏, 安徽, 重庆, 湖南, 四川, 上海"
hash[QINGDAO] = "连云港, 山东"
hash[DALIAN] = "吉林, 辽宁, 黑龙江"
hash[TIANJIN] = "北京, 河北, 河南, 天津, 甘肃, 内蒙古, 宁夏, 青海, 山西, 西藏, 新疆"

ip = "202.195.16.1"
uri = URI.parse "http://api.map.baidu.com/location/ip?ak=951543ac17a3be0cff0983f3489fe470&ip=202.195.16.1"
proxy_host = '192.168.16.189'
proxy_port = 8080
proxy_user = 'lixiumiao'
proxy_pass = '13305151138'

proxy = Net::HTTP::Proxy(proxy_host,proxy_port,proxy_user,proxy_pass)

address = JSON.parse( proxy.get_response(uri).body, :symbolize_names=>true)
puts address[:address].split("|")[1]
 
array = hash.select do |k,v|
	
	!! v.index(address[:address].split("|")[1]) #if %w[连云港市 深圳市].include? address[:city]
end

puts array
