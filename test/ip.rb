# coding: utf-8


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
arry = hash.select do |k,v|
      !!v.index("江苏")
end
puts arry.class

