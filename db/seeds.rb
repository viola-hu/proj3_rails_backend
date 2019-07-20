# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)



#### CATEGORY ####
Category.destroy_all

cg1 = Category.create name:"Age 0-2"
cg2 = Category.create name:"Age 2-5"
cg3 = Category.create name:"Age 5-8"
cg4 = Category.create name:"Age over 8"

puts "Created #{Category.all.length} categories."



#### PRODUCT ####
Product.destroy_all

p1 = Product.create name:"BoLangGu", price:10, description:"Lorem ipsum dolor sit amet, consectetur adipisicing elit", stock:50, image:"c101.jpg", category:cg1
p2 = Product.create name:"JiaoYinNi", price:20, description:"Lorem ipsum dolor sit amet, consectetur adipisicing elit", stock:50, image:"c102.jpg", category:cg1
p3 = Product.create name:"WanJuZhu", price:5, description:"Lorem ipsum dolor sit amet, consectetur adipisicing elit", stock:50, image:"c103.jpg", category:cg1
p4 = Product.create name:"WanJuShi", price:5, description:"Lorem ipsum dolor sit amet, consectetur adipisicing elit", stock:50, image:"c104.jpg", category:cg1
p5 = Product.create name:"MuMa", price:50, description:"Lorem ipsum dolor sit amet, consectetur adipisicing elit", stock:50, image:"c105.jpg", category:cg1
p6 = Product.create name:"DiaoZhui", price:20, description:"Lorem ipsum dolor sit amet, consectetur adipisicing elit", stock:50, image:"c106.jpg", category:cg1
p7 = Product.create name:"WanJuGou", price:5, description:"Lorem ipsum dolor sit amet, consectetur adipisicing elit", stock:50, image:"c107.jpg", category:cg1
p8 = Product.create name:"HelloKitty", price:15, description:"Lorem ipsum dolor sit amet, consectetur adipisicing elit", stock:50, image:"c108.jpg", category:cg1
p9 = Product.create name:"WanJuTu", price:5, description:"Lorem ipsum dolor sit amet, consectetur adipisicing elit", stock:50, image:"c109.jpg", category:cg1

p10 = Product.create name:"JiMuMoXing", price:10, description:"Lorem ipsum dolor sit amet, consectetur adipisicing elit", stock:50, image:"c201.jpg", category:cg2
p11 = Product.create name:"ShuZiJiMu", price:15, description:"Lorem ipsum dolor sit amet, consectetur adipisicing elit", stock:50, image:"c202.jpg", category:cg2
p12 = Product.create name:"ShaTanWanJu(set)", price:20, description:"Lorem ipsum dolor sit amet, consectetur adipisicing elit", stock:50, image:"c203.gif", category:cg2
p13 = Product.create name:"PinBan", price:12, description:"Lorem ipsum dolor sit amet, consectetur adipisicing elit", stock:50, image:"c204.jpg", category:cg2
p14 = Product.create name:"MuQin", price:15, description:"Lorem ipsum dolor sit amet, consectetur adipisicing elit", stock:50, image:"c205.jpg", category:cg2
p15 = Product.create name:"BaoLing", price:18, description:"Lorem ipsum dolor sit amet, consectetur adipisicing elit", stock:50, image:"c206.jpg", category:cg2
p16 = Product.create name:"SaiChe", price:16, description:"Lorem ipsum dolor sit amet, consectetur adipisicing elit", stock:50, image:"c207.jpg", category:cg2
p17 = Product.create name:"JiMuLianXian", price:20, description:"Lorem ipsum dolor sit amet, consectetur adipisicing elit", stock:50, image:"c208.jpg", category:cg2
p18 = Product.create name:"HuaHuaTi", price:40, description:"Lorem ipsum dolor sit amet, consectetur adipisicing elit", stock:50, image:"c209.jpg", category:cg2

p19 = Product.create name:"PinTuXiao", price:12, description:"Lorem ipsum dolor sit amet, consectetur adipisicing elit", stock:50, image:"c301.jpg", category:cg3
p20 = Product.create name:"ZhuSuan", price:18, description:"Lorem ipsum dolor sit amet, consectetur adipisicing elit", stock:50, image:"c302.jpg", category:cg3
p21 = Product.create name:"DiaoYu", price:25, description:"Lorem ipsum dolor sit amet, consectetur adipisicing elit", stock:50, image:"c303.jpg", category:cg3
p22 = Product.create name:"JiMuLeiGao", price:10, description:"Lorem ipsum dolor sit amet, consectetur adipisicing elit", stock:50, image:"c304.jpeg", category:cg3
p23 = Product.create name:"NianTieHua", price:22, description:"Lorem ipsum dolor sit amet, consectetur adipisicing elit", stock:50, image:"c305.jpg", category:cg3
p24 = Product.create name:"GunZhu", price:12, description:"Lorem ipsum dolor sit amet, consectetur adipisicing elit", stock:50, image:"c306.jpeg", category:cg3
p25 = Product.create name:"MoLiZhu", price:9, description:"Lorem ipsum dolor sit amet, consectetur adipisicing elit", stock:50, image:"c307.jpg", category:cg3
p26 = Product.create name:"ZhuoYou", price:25, description:"Lorem ipsum dolor sit amet, consectetur adipisicing elit", stock:50, image:"c308.jpg", category:cg3
p27 = Product.create name:"ZhangPeng", price:50, description:"Lorem ipsum dolor sit amet, consectetur adipisicing elit", stock:50, image:"c309.jpg", category:cg3

p28 = Product.create name:"MoFang", price:15, description:"Lorem ipsum dolor sit amet, consectetur adipisicing elit", stock:50, image:"c401.jpg", category:cg4
p29 = Product.create name:"JiMuRen", price:12, description:"Lorem ipsum dolor sit amet, consectetur adipisicing elit", stock:50, image:"c402.jpg", category:cg4
p30 = Product.create name:"HuaRongDao", price:15, description:"Lorem ipsum dolor sit amet, consectetur adipisicing elit", stock:50, image:"c403.jpg", category:cg4
p31 = Product.create name:"JiQiRen", price:35, description:"Lorem ipsum dolor sit amet, consectetur adipisicing elit", stock:50, image:"c404.jpg", category:cg4
p32 = Product.create name:"DuoMiNuo(500pcs)", price:40, description:"Lorem ipsum dolor sit amet, consectetur adipisicing elit", stock:50, image:"c405.jpg", category:cg4
p33 = Product.create name:"ReQiQiuMoXing", price:35, description:"Lorem ipsum dolor sit amet, consectetur adipisicing elit", stock:50, image:"c406.jpg", category:cg4
p34 = Product.create name:"ZuQiuTai", price:55, description:"Lorem ipsum dolor sit amet, consectetur adipisicing elit", stock:50, image:"c407.jpg", category:cg4
p35 = Product.create name:"HaiZeiWangPinTu(150pcs)", price:30, description:"Lorem ipsum dolor sit amet, consectetur adipisicing elit", stock:50, image:"c408.jpg", category:cg4
p36 = Product.create name:"TaoHuan(12pcs)", price:40, description:"Lorem ipsum dolor sit amet, consectetur adipisicing elit", stock:50, image:"c409.jpg", category:cg4

puts "Created #{Product.all.length} products."



# cg1.products << p1 << p2 << p3 << p4 << p5 << p6 << p7 << p8 << p9
# cg2.products << p10 << p11 << p12 << p13 << p14 << p15 << p16 << p17 << p18
# cg3.products << p19 << p20 << p21 << p22 << p23 << p24 << p25 << p26 << p27
# cg4.products << p28 << p29 << p30 << p31 << p32 << p33 << p34 << p35 << p36



#### USER ####
User.destroy_all

u1 = User.create name:"Viola", email:"viola@viola.com", password:"chicken", admin:true
u2 = User.create name:"Lily", email:"lily@lily.com", password:"chicken", admin:false
u3 = User.create name:"Jay", email:"jay@jay.com", password:"chicken", admin:false

puts "Create #{User.all.length} users."



#### CART ####
Cart.destroy_all

ct1 = Cart.create user:u2
ct2 = Cart.create user:u3

puts "Created #{Cart.all.length} carts."



#### ORDER ####
Order.destroy_all

o1 = Order.create user:u2
o2 = Order.create user:u2
o3 = Order.create user:u3
o4 = Order.create user:u3

puts "Created #{Order.all.length} orders."


#### LINEITEM ####
LineItem.destroy_all

li1 = LineItem.create product:p1, cart:ct1, quantity:2
li2 = LineItem.create product:p5, cart:ct1, quantity:1
li3 = LineItem.create product:p12, order:o1, quantity:1
li4 = LineItem.create product:p21, order:o2, quantity:2
li5 = LineItem.create product:p30, cart:ct2, quantity:3
li6 = LineItem.create product:p26, cart:ct2, quantity:1
li7 = LineItem.create product:p18, order:o3, quantity:1
li8 = LineItem.create product:p26, order:o4, quantity:1
li9 = LineItem.create product:p35, order:o4, quantity:2

puts "Create #{LineItem.all.length} line items."
