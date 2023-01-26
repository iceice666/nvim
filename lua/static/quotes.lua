-- Refs:
-- https://www.zhihu.com/question/19909094/answer/288419603
-- https://www.zhihu.com/question/36343429
-- http://www.luxunmuseum.com.cn/cx/works.php
-- https://gist.github.com/edokeh/7580064


local quotes = {
  [[
  程序猿：                                  
  世上本無BUG 代碼寫多了 便有了BUG          
                 —— 魯迅                  
  └─周樹人 Replied:                           
    我實在沒有說過這樣一句話。              
                 —— 周樹人 《19321213致臺靜農》
  ]],
  [[「佛祖保佑  永無BUG」]],
  [[「代碼不是無蟲 只是讓子彈再飛一會兒」]],
  [[
  程序出Bug了？        算了反正不是我寫的
        ∩∩                              
     （´･ω･）?                          
    ＿|　⊃／(＿＿_       　 ⊂⌒／ヽ-、＿＿
 　／ └-(＿＿＿／      　／⊂_/＿＿＿＿／
 　￣￣￣￣￣￣￣      　￣￣￣￣￣￣￣
  萬一是我寫的呢   算了反正改了一個又出三個
        ∩∩                               
 　　（´･ω･）!                     zZZ...
    ＿|　⊃／(＿＿_  　  　 ⊂⌒／ヽ-、＿＿
 　／ └-(＿＿＿／     　／⊂_/＿＿＿＿ ／
 　￣￣￣￣￣￣￣       ￣￣￣￣￣￣￣
  ]],
  [[
  菩提本無樹   明鏡亦非台
  代碼本無蟲   何必常修改
  ]],

  [[
  佛曰:                            

  寫字樓裡寫字間，寫字間里程序員；
  程序人員寫程序，又拿程序換酒錢。
  酒醒只在網上坐，酒醉還來網下眠；
  酒醉酒醒日復日，網上網下年復年。
  但願老死電腦間，不願鞠躬老闆前；
  奔馳寶馬貴者趣，公交自行程序員。
  別人笑我忒瘋癲，我笑自己命太賤；
  不見滿街漂亮妹，哪個歸得程序員？
  ]],
  [[
        江城子 · 程序員之歌     
 
  十年生死兩茫茫，寫程序，到天亮。
      千行代碼，Bug何處藏。     
  縱使上線又怎樣，朝令改，夕斷腸。
 
  領導每天新想法，天天改，日日忙。
      相顧無言，惟有淚千行。    
  每晚燈火闌珊處，夜難寐，加班狂。
  ]],
  [[
 ╔════════════════════════════════════════════╗
 ║ root# pwd                                  ║
 ║ /                                          ║
 ║ root# cd /tnp/test; rm -rf *               ║
 ║ cd: /tnp/test: No such file or directory   ║
 ║ ...                                        ║
 ║ ... and after a while ...                  ║
 ║ ...                                        ║
 ║ ^C                                         ║
 ╚════════════════════════════════════════════╝
 "MD..."
  ]],
  [[
⠀⠀⠀⠀⠀⣠⣤⣤⣤⣤⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣿                        ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣠⡖⠛⠛⠛⢶⣄⠀⠀⠀⠀⠀⠀⠀⠀⣿                        
⠀⠀⠀⣰⡾⠛⠀⣄⠀⠈⠹⣧⣄⣤⣴⣶⣶⣶⣶⣤⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣿                        ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣼⣯⣶⣶⣤⣤⣤⣿⣧⠀⠀⠀⠀⠀⠀⠀⣿                        
⠀⢀⣾⣿⣏⣀⠀⠁⠀⢺⡄⠈⢻⣿⣿⣿⣿⣿⣿⣿⣿⠟⢶⣄⠀⠀⠀⠀⠀⠀⠀⠀⣿                        ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡿⢻⣿⣇⣌⣿⢿⣿⣹⠀⠀⠀⠀⠀⠀⠀⣿                        
⠀⢸⣿⣿⠿⠋⠀⠀⠀⠀⢼⣿⣾⡿⠿⣌⣿⣿⣿⢷⣿⣀⠀⠹⡆⠀⠀⠀⠀⠀⠀⠀⣿                        ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢺⣷⣿⡿⣿⣿⣿⣷⡀⣿⡄⠀⠀⠀⠀⠀⠀⣿                        
⠀⠈⢻⡅⠀⣀⣀⣀⣀⡀⠀⣿⣿⣷⠀⣽⣿⣿⣿⣿⣯⣿⣦⣰⡇⠀⠀⠀⠀⠀⠀⠀⣿                        ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣠⣶⣿⣿⣿⣶⣿⣿⣿⣿⣿⣿⣧⣄⡀⠀⠀⠀⠀⣿                        
⠀⠀⠀⢻⣿⣿⣿⡿⠟⠁⣠⣾⣿⡏⠀⠻⠛⣿⣯⣸⣿⣿⣿⠛⢤⣀⠀⠀⠀⠀⠀⠀⣿                        ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣼⡿⣻⣿⡿⣿⣿⣿⣿⣿⡿⣿⣿⣿⣿⣿⣷⣄⠀⠀⣿                        
⠀⠀⠀⢈⣿⣿⣿⣷⣄⣴⣿⣿⣿⣿⡆⠀⠀⠘⠿⢿⣿⣿⣫⠀⠀⠈⠙⢦⣄⠀⠀⠀⣿   for (i = 1; i<=n; i++)⠀⠀⠀⠀⠀⠀⠀⠀⢀⣴⣿⣯⣾⣿⣿⡇⠈⠛⠻⢿⣿⣷⣿⡏⢻⣿⣿⣿⣿⠀⠀⣿  for (i = 0; i<n; i++) 
⠀⠀⠀⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣟⣧⠀⢀⣀⣾⣿⣿⣽⣷⣾⡀⠀⠀⠙⠳⣄⡀⣿                        ⠀⠀⠀⠀⠀⠀⠀⣤⣶⠟⣩⣿⣿⣿⣿⣿⣧⠀⠀⠀⢸⣿⣿⣏⢀⣍⠹⣿⣿⣿⠀⠀⣿                        
⠀⠀⠀⠀⢻⣿⢿⣿⣿⣿⣿⣿⣿⣿⣿⣸⡆⣸⣿⣿⣿⣿⣿⣿⣿⠁⠀⠐⢶⣤⠈⠻⣿                        ⠀⠀⠀⠀⠀⣠⡾⢟⣴⢿⣿⣿⣿⣿⡟⠛⠿⢶⣾⣿⡿⢿⣿⣿⣿⣿⣧⢨⣿⣏⠀⠀⣿                        
⠀⠀⠀⠀⠀⢿⣦⣹⣿⣿⠿⠛⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⣦⣴⣾⠿⠀⢠⣿                        ⠀⠀⠀⠀⣴⠏⣤⣾⠛⣿⡿⠿⣿⣿⠃⠀⠀⠀⠀⠀⠀⣿⣿⣿⣿⣿⣿⣿⣿⡏⢻⣦⣿                        
⠀⠀⢠⡆⣠⣼⣿⠿⠋⢤⢠⣶⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣥⣤⣶⣿⣿                        ⠀⠀⢀⣾⠃⣠⣿⢃⣄⣋⠀⠀⣿⣿⡄⠀⠀⠀⠀⠀⣸⣿⣿⣿⡿⣛⣡⣿⣿⣿⣿⣿⣿                        
⠀⣴⣿⠟⠋⠉⢀⣾⣿⣷⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿                        ⠀⢀⡾⠁⠀⣿⣿⠸⢻⣿⢤⡦⡟⣿⡇⠀⢀⡶⠀⠀⣽⢉⣟⣩⡴⠻⣿⠛⠋⣿⣿⣾⣿                        
⢸⣿⡿⢀⣀⢀⣼⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿                        ⠀⠘⠁⠀⠀⢸⣿⡇⢸⡏⠘⠷⠶⣿⣇⢰⣿⣇⠀⢸⣿⣄⢉⡈⢡⣀⢻⣷⣼⣿⠻⢿⣿                        
⠀⢻⣧⢸⡇⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿                        ⠀⠀⣰⢀⣦⣿⣿⡇⣾⠇⠀⠀⢠⣿⣟⠉⠀⠙⠷⢸⡟⠻⣿⡷⠄⡁⣴⣿⢿⣿⣌⣹⣿                        
⠀⠀⠙⢿⣿⣽⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿                        ⠘⢶⣼⣿⣿⣿⣿⠁⠋⠀⠀⢰⣿⣿⡻⣆⠀⠀⠀⢸⣿⣾⣿⣿⣶⣿⣿⣿⡇⠸⣿⣿⣿                        
⠀⠀⠀⠀⠙⠛⠻⠟⠋⠈⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿                        ⠘⢿⣿⣿⣿⣿⠏⠀⠷⠖⠀⠘⣿⣿⣷⠙⠂⠀⠀⢸⣿⣿⣿⣿⣿⣿⣿⣿⡁⢀⣿⢙⣿                        
  ]],
  [[
Debug

网络上程序媛发的一条微博：                                                                 
“昨晚梦见男朋友和别的女人在逛街，梦里我的第一反应就是查源代码，                              
结果调试半天查不出来为什么显示的那个女人不是我，                                             
最后含泪把那个女人注释掉了，再一运行就是我男朋友自己逛街了。”                                
网友评论：                                                                                   
1.把那个女人的指针指向你即可；                  12.还可以有个多线程的算法，                  
2.谁让你把男朋友设成public的？；                   把你的优先级设成99，                      
3.加个断点看看那女人是谁；                         一个idle线程的优先级设成50                
4.心真软，就应该把他的接口屏蔽掉；                 把那个女人的优先级设成49。                
5.Protected逛街(youOnly)；                         酱紫就永远都调度不到啦                    
6.设计问题，应该采用单例模式；                  13.那也没关系，那就老调用那个女人。。。      
7.没做回归测试；                                   你BF放在那里不动。。。养着                
8.标准做法是做个断言；                          14.上绝招，用goto，做个死循环，让他们逛死    
9.注释掉了，逛街的参数不用改吗？；              15.善心点，别goto了，调用exit函数结束进程吧，
10.注释掉那女的，你男朋友竟然没出错。              冤冤相报何时了啊                          
   可以放心啦，说明你男朋友和那女的不存在依赖关系                                            
11.最后含泪把那个女人给注释掉了，                                                            
   再一运行就是我男朋友自己逛街了                                                            
   ==>很明显是变量名作用域的问题，改个名就行了                16.查一下Log，仅仅只有逛街吗？ 
]] ,
  [[
  爱情

  爱情就是死循环，一旦执行就陷进去了；
  爱上一个人，就是内存泄漏–你永远释放不了；
  真正爱上一个人的时候，那就是常量限定，永远不会改变；
  女朋友就是私有变量，只有我这个类才能调用；
  情人就是指针，用的时候一定要注意，要不然就带来巨大的灾难。
  ]],
  [[
  猫

  我们工作室买了几只猫，都很可爱，他们的名字都很有特点                          
  第零只猫叫二百，这只猫很正常，在屋子里面跑来跑去很开心                        
  第一只猫叫四零一，它似乎从来没觉得我们是它的主人                              
  第二只猫叫四零四，这只猫买完之后，商家说没有这只猫啊                          
  第三只猫叫四零三，这只猫挺可爱的，就是不让撸                                  
  第四只猫叫五零四，这只猫从买了之后就一直没有送到                              
  第五只猫叫四一七，它要求我们找一个代理人来撸它                                
  第六只猫叫四一八，它似乎觉得自己是一只咖啡壶                                  
  第七只猫叫四零二，每次撸它之前都要给猫交钱                                    
  第八只猫叫五零三，撸它的人特别多，所以每次撸它之前要和前一个人约定好交换的时间
  第九只猫叫四一三，它特别特别特别的长                                          
  第十只猫叫二零四，它可以被撸，但是不会喵喵叫                                  

  ]],
  [[
  Address

  "What's ur address?"
  '192.168.1.107'
  "No, ur local address"
  '127.0.0.1'
  "I mean ur physical address"
  '02:42:ef:c1:33:99'
  "......"
  ]],
  [[
  dEc0d3

  手持两把锟斤拷，口中疾呼烫烫烫
  脚踏千朵屯屯屯，笑看万物锘锘锘
  ]],
  [[
三次握手

"我想听一个 TCP 的笑话。"
'你好，你想听 TCP 的笑话么？'
"嗯，我想听一个 TCP 的笑话。"
'好的，我会给你讲一个TCP 的笑话。'
"好的，我会听一个TCP 的笑话。"
'你准备好听一个TCP 的笑话么？'
"嗯，我准备好听一个TCP 的笑话"
'Ok，那我要发 TCP 笑话了。大概有 10 秒，20 个字。'
"嗯，我准备收你那个 10 秒时长，20 个字的笑话了。"
'抱歉，你的连接超时了。''你好，你想听 TCP 的笑话么 。'

  ]],
  [[
Http Method

“我GET不到你的笑点。”
“你用Post试试...”
  ]],
  [[「莫愁前路无知己，总有bug跟着你。」]],
  [[
你TM就是一个没有对象的野指针!                
你TM就是一个没有对象的野指针!                
你TM就是一个没有对象的野指针!                
哈哈哈哈哈哈哈哈哈，哈哈，哈。。嗚嗚嗚嗚。。。
  ]],
  [[
Comment

A：嘿 //是什么意思啊？
B：嘿.
A：呃 我问你//是什么意思？
B：问吧.
A：我刚才不是问了么？
B：啊？
A：你再看看记录...
B：看完了.
A：......所以//是啥？
B：所以什么？
A：你存心耍我呢吧？
B：没有啊 你想问什么？
……不断循环之后，A一气之下和B绝交，自己苦学程序。
N年之后，A终于修成正果，回想起B，又把聊天记录翻出来看，
这时，他突然发现B没有耍他……而他自己也不知道当年他问B的究竟是什么问题……

  ]],
  [[
          _————             +--------------------------------------+
         //¯¯\\\\           |    _  _     _    _ _                 |
        // _  _\\           |   | \| |_ _(_)__| (_)__ _            |
        \|(0)(0)\           |   | .` \ V / / _` | / _` |_          |
        d  n ¨  b           |   |_|\_|\_/|_\__,_|_\__,_( )         |
         \_U_^  /           |                          |/          |
         /   \_/|_____      |       Nvidia,                        |
      ___\   |__/\    \_    |          Fuck you!                   |
     /   |   / |:|      \   |   ___        _                   _   |
    /    /  /\ |:|     | \  |  | __|  _ __| |__  _  _ ___ _  _| |  |
   |    /\__/ \|:\     |  \ |  | _| || / _| / / | || / _ \ || |_|  |
    \  /\   / ||: \    \  | |  |_| \_,_\__|_\_\  \_, \___/\_,_(_)  |
     \/  \_/  ||: |     |  \|                    |__/              |
     /     /  //; \     |  |+--------------------------------------+
     \    /  /|;   \    |  \                                        
  ]]

}
math.randomseed(os.time())
return { quote = vim.split(quotes[math.random(#quotes)], "\n", { trimempty = true }) }
-- return { quote = vim.split(quotes[#quotes], "\n", { trimempty = true }) }
