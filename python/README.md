<div id="cnblogs_post_body">
<p>　　</p>
<p><strong>一、简单工厂模式</strong></p>
<p><img alt="" height="240" src="http://images.cnblogs.com/cnblogs_com/wuyuegb2312/468244/o_ch1.%e7%ae%80%e5%8d%95%e5%b7%a5%e5%8e%82.png" style="display: block; margin-left: auto; margin-right: auto;" width="514"/></p>
<p>模式特点：工厂根据条件产生不同功能的类。</p>
<p>程序实例：四则运算计算器，根据用户的输入产生相应的运算类，用这个运算类处理具体的运算。</p>
<p>代码特点：C/C++中的switch...case...分支使用字典的方式代替。</p>
<p>　　　　　使用异常机制对除数为0的情况进行处理。</p>
<div class="cnblogs_code" onclick="cnblogs_code_show('7e6c737d-2062-4abb-967d-2ff3479efb1f')"><img alt="" class="code_img_closed" id="code_img_closed_7e6c737d-2062-4abb-967d-2ff3479efb1f" src="http://images.cnblogs.com/OutliningIndicators/ContractedBlock.gif"/><img alt="" class="code_img_opened" id="code_img_opened_7e6c737d-2062-4abb-967d-2ff3479efb1f" onclick="cnblogs_code_hide('7e6c737d-2062-4abb-967d-2ff3479efb1f',event)" src="http://images.cnblogs.com/OutliningIndicators/ExpandedBlockStart.gif" style="display: none;"/><span class="cnblogs_code_collapse">简单工厂模式</span>
<div class="cnblogs_code_hide" id="cnblogs_code_open_7e6c737d-2062-4abb-967d-2ff3479efb1f">
<pre><span style="color: #0000ff;">class</span><span style="color: #000000;"> Operation:
    </span><span style="color: #0000ff;">def</span><span style="color: #000000;"> GetResult(self):
        </span><span style="color: #0000ff;">pass</span>

<span style="color: #0000ff;">class</span><span style="color: #000000;"> OperationAdd(Operation):
    </span><span style="color: #0000ff;">def</span><span style="color: #000000;"> GetResult(self):
        </span><span style="color: #0000ff;">return</span> self.op1+<span style="color: #000000;">self.op2


</span><span style="color: #0000ff;">class</span><span style="color: #000000;"> OperationSub(Operation):
    </span><span style="color: #0000ff;">def</span><span style="color: #000000;"> GetResult(self):
        </span><span style="color: #0000ff;">return</span> self.op1-<span style="color: #000000;">self.op2


</span><span style="color: #0000ff;">class</span><span style="color: #000000;"> OperationMul(Operation):
    </span><span style="color: #0000ff;">def</span><span style="color: #000000;"> GetResult(self):
        </span><span style="color: #0000ff;">return</span> self.op1*<span style="color: #000000;">self.op2


</span><span style="color: #0000ff;">class</span><span style="color: #000000;"> OperationDiv(Operation):
    </span><span style="color: #0000ff;">def</span><span style="color: #000000;"> GetResult(self):
        </span><span style="color: #0000ff;">try</span><span style="color: #000000;">:
            result </span>= self.op1/<span style="color: #000000;">self.op2
            </span><span style="color: #0000ff;">return</span><span style="color: #000000;"> result
        </span><span style="color: #0000ff;">except</span><span style="color: #000000;">:
            </span><span style="color: #0000ff;">print</span> <span style="color: #800000;">"</span><span style="color: #800000;">error:divided by zero.</span><span style="color: #800000;">"</span>
            <span style="color: #0000ff;">return</span><span style="color: #000000;"> 0

</span><span style="color: #0000ff;">class</span><span style="color: #000000;"> OperationUndef(Operation):
    </span><span style="color: #0000ff;">def</span><span style="color: #000000;"> GetResult(self):
        </span><span style="color: #0000ff;">print</span> <span style="color: #800000;">"</span><span style="color: #800000;">Undefine operation.</span><span style="color: #800000;">"</span>
        <span style="color: #0000ff;">return</span><span style="color: #000000;"> 0

</span><span style="color: #0000ff;">class</span><span style="color: #000000;"> OperationFactory:
    operation </span>=<span style="color: #000000;"> {}
    operation[</span><span style="color: #800000;">"</span><span style="color: #800000;">+</span><span style="color: #800000;">"</span>] =<span style="color: #000000;"> OperationAdd();
    operation[</span><span style="color: #800000;">"</span><span style="color: #800000;">-</span><span style="color: #800000;">"</span>] =<span style="color: #000000;"> OperationSub();
    operation[</span><span style="color: #800000;">"</span><span style="color: #800000;">*</span><span style="color: #800000;">"</span>] =<span style="color: #000000;"> OperationMul();
    operation[</span><span style="color: #800000;">"</span><span style="color: #800000;">/</span><span style="color: #800000;">"</span>] =<span style="color: #000000;"> OperationDiv();
    </span><span style="color: #0000ff;">def</span><span style="color: #000000;"> createOperation(self,ch):        
        </span><span style="color: #0000ff;">if</span> ch <span style="color: #0000ff;">in</span><span style="color: #000000;"> self.operation:
            op </span>=<span style="color: #000000;"> self.operation[ch]
        </span><span style="color: #0000ff;">else</span><span style="color: #000000;">:
            op </span>=<span style="color: #000000;"> OperationUndef()
        </span><span style="color: #0000ff;">return</span><span style="color: #000000;"> op

</span><span style="color: #0000ff;">if</span> <span style="color: #800080;">__name__</span> == <span style="color: #800000;">"</span><span style="color: #800000;">__main__</span><span style="color: #800000;">"</span><span style="color: #000000;">:
    op </span>= raw_input(<span style="color: #800000;">"</span><span style="color: #800000;">operator: </span><span style="color: #800000;">"</span><span style="color: #000000;">)
    opa </span>= input(<span style="color: #800000;">"</span><span style="color: #800000;">a: </span><span style="color: #800000;">"</span><span style="color: #000000;">)
    opb </span>= input(<span style="color: #800000;">"</span><span style="color: #800000;">b: </span><span style="color: #800000;">"</span><span style="color: #000000;">)
    factory </span>=<span style="color: #000000;"> OperationFactory()
    cal </span>=<span style="color: #000000;"> factory.createOperation(op)
    cal.op1 </span>=<span style="color: #000000;"> opa
    cal.op2 </span>=<span style="color: #000000;"> opb
    </span><span style="color: #0000ff;">print</span> cal.GetResult()</pre>
</div>
</div>
<p> </p>
<p><strong>二、策略模式</strong></p>
<p><img alt="" height="225" src="http://images.cnblogs.com/cnblogs_com/wuyuegb2312/468244/o_ch2.%e7%ad%96%e7%95%a5%e6%a8%a1%e5%bc%8f.png" style="display: block; margin-left: auto; margin-right: auto;" width="478"/></p>
<p>模式特点：定义算法家族并且分别封装，它们之间可以相互替换而不影响客户端。</p>
<p>程序实例：商场收银软件，需要根据不同的销售策略方式进行收费</p>
<p>代码特点：不同于同例1，这里使用字典是为了避免关键字不在字典导致bug的陷阱。</p>
<div class="cnblogs_code" onclick="cnblogs_code_show('068e7718-c755-42f2-b5e6-4c85ad8c635f')"><img alt="" class="code_img_closed" id="code_img_closed_068e7718-c755-42f2-b5e6-4c85ad8c635f" src="http://images.cnblogs.com/OutliningIndicators/ContractedBlock.gif"/><img alt="" class="code_img_opened" id="code_img_opened_068e7718-c755-42f2-b5e6-4c85ad8c635f" onclick="cnblogs_code_hide('068e7718-c755-42f2-b5e6-4c85ad8c635f',event)" src="http://images.cnblogs.com/OutliningIndicators/ExpandedBlockStart.gif" style="display: none;"/><span class="cnblogs_code_collapse">策略模式</span>
<div class="cnblogs_code_hide" id="cnblogs_code_open_068e7718-c755-42f2-b5e6-4c85ad8c635f">
<pre><span style="color: #0000ff;">class</span><span style="color: #000000;"> CashSuper:
    </span><span style="color: #0000ff;">def</span><span style="color: #000000;"> AcceptCash(self,money):
        </span><span style="color: #0000ff;">return</span><span style="color: #000000;"> 0

</span><span style="color: #0000ff;">class</span><span style="color: #000000;"> CashNormal(CashSuper):
    </span><span style="color: #0000ff;">def</span><span style="color: #000000;"> AcceptCash(self,money):
        </span><span style="color: #0000ff;">return</span><span style="color: #000000;"> money

</span><span style="color: #0000ff;">class</span><span style="color: #000000;"> CashRebate(CashSuper):
    discount </span>=<span style="color: #000000;"> 0
    </span><span style="color: #0000ff;">def</span> <span style="color: #800080;">__init__</span><span style="color: #000000;">(self,ds):
        self.discount </span>=<span style="color: #000000;"> ds
    </span><span style="color: #0000ff;">def</span><span style="color: #000000;"> AcceptCash(self,money):
        </span><span style="color: #0000ff;">return</span> money *<span style="color: #000000;"> self.discount

</span><span style="color: #0000ff;">class</span><span style="color: #000000;"> CashReturn(CashSuper):
    total </span>=<span style="color: #000000;"> 0;
    ret </span>=<span style="color: #000000;"> 0;
    </span><span style="color: #0000ff;">def</span> <span style="color: #800080;">__init__</span><span style="color: #000000;">(self,t,r):
        self.total </span>=<span style="color: #000000;"> t
        self.ret </span>=<span style="color: #000000;"> r
    </span><span style="color: #0000ff;">def</span><span style="color: #000000;"> AcceptCash(self,money):
        </span><span style="color: #0000ff;">if</span> (money&gt;=<span style="color: #000000;">self.total):
            </span><span style="color: #0000ff;">return</span> money -<span style="color: #000000;"> self.ret
        </span><span style="color: #0000ff;">else</span><span style="color: #000000;">:
            </span><span style="color: #0000ff;">return</span><span style="color: #000000;"> money

</span><span style="color: #0000ff;">class</span><span style="color: #000000;"> CashContext:
    </span><span style="color: #0000ff;">def</span> <span style="color: #800080;">__init__</span><span style="color: #000000;">(self,csuper):
        self.cs </span>=<span style="color: #000000;"> csuper
    </span><span style="color: #0000ff;">def</span><span style="color: #000000;"> GetResult(self,money):
        </span><span style="color: #0000ff;">return</span><span style="color: #000000;"> self.cs.AcceptCash(money)

</span><span style="color: #0000ff;">if</span> <span style="color: #800080;">__name__</span> == <span style="color: #800000;">"</span><span style="color: #800000;">__main__</span><span style="color: #800000;">"</span><span style="color: #000000;">:
    money </span>= input(<span style="color: #800000;">"</span><span style="color: #800000;">money:</span><span style="color: #800000;">"</span><span style="color: #000000;">)
    strategy </span>=<span style="color: #000000;"> {}
    strategy[</span>1] =<span style="color: #000000;"> CashContext(CashNormal())
    strategy[</span>2] = CashContext(CashRebate(0.8<span style="color: #000000;">))
    strategy[</span>3] = CashContext(CashReturn(300,100<span style="color: #000000;">))
    ctype </span>= input(<span style="color: #800000;">"</span><span style="color: #800000;">type:[1]for normal,[2]for 80% discount [3]for 300 -100.</span><span style="color: #800000;">"</span><span style="color: #000000;">)
    </span><span style="color: #0000ff;">if</span> ctype <span style="color: #0000ff;">in</span><span style="color: #000000;"> strategy:
        cc </span>=<span style="color: #000000;"> strategy[ctype]
    </span><span style="color: #0000ff;">else</span><span style="color: #000000;">:
        </span><span style="color: #0000ff;">print</span> <span style="color: #800000;">"</span><span style="color: #800000;">Undefine type.Use normal mode.</span><span style="color: #800000;">"</span><span style="color: #000000;">
        cc </span>= strategy[1<span style="color: #000000;">]
    </span><span style="color: #0000ff;">print</span> <span style="color: #800000;">"</span><span style="color: #800000;">you will pay:%d</span><span style="color: #800000;">"</span> %(cc.GetResult(money))</pre>
</div>
</div>
<p><strong>三、装饰模式</strong></p>
<p><img alt="" height="385" src="http://images.cnblogs.com/cnblogs_com/wuyuegb2312/468244/o_ch3.%e8%a3%85%e9%a5%b0%e6%a8%a1%e5%bc%8f.png" style="display: block; margin-left: auto; margin-right: auto;" width="554"/></p>
<p>模式特点：动态地为对象增加额外的职责</p>
<p>程序实例：展示一个人一件一件穿衣服的过程。</p>
<p>代码特点：无</p>
<div class="cnblogs_code" onclick="cnblogs_code_show('b34bb03a-4ee7-49e7-bddb-1d6ae18d8d2c')"><img alt="" class="code_img_closed" id="code_img_closed_b34bb03a-4ee7-49e7-bddb-1d6ae18d8d2c" src="http://images.cnblogs.com/OutliningIndicators/ContractedBlock.gif"/><img alt="" class="code_img_opened" id="code_img_opened_b34bb03a-4ee7-49e7-bddb-1d6ae18d8d2c" onclick="cnblogs_code_hide('b34bb03a-4ee7-49e7-bddb-1d6ae18d8d2c',event)" src="http://images.cnblogs.com/OutliningIndicators/ExpandedBlockStart.gif" style="display: none;"/><span class="cnblogs_code_collapse">装饰模式</span>
<div class="cnblogs_code_hide" id="cnblogs_code_open_b34bb03a-4ee7-49e7-bddb-1d6ae18d8d2c">
<pre><span style="color: #0000ff;">class</span><span style="color: #000000;"> Person:
    </span><span style="color: #0000ff;">def</span> <span style="color: #800080;">__init__</span><span style="color: #000000;">(self,tname):
        self.name </span>=<span style="color: #000000;"> tname
    </span><span style="color: #0000ff;">def</span><span style="color: #000000;"> Show(self):
       </span><span style="color: #0000ff;">print</span> <span style="color: #800000;">"</span><span style="color: #800000;">dressed %s</span><span style="color: #800000;">"</span> %<span style="color: #000000;">(self.name)

</span><span style="color: #0000ff;">class</span><span style="color: #000000;"> Finery(Person):
    componet </span>=<span style="color: #000000;"> None
    </span><span style="color: #0000ff;">def</span> <span style="color: #800080;">__init__</span><span style="color: #000000;">(self):
        </span><span style="color: #0000ff;">pass</span>
    <span style="color: #0000ff;">def</span><span style="color: #000000;"> Decorate(self,ct):
        self.componet </span>=<span style="color: #000000;"> ct
    </span><span style="color: #0000ff;">def</span><span style="color: #000000;"> Show(self):
    </span><span style="color: #0000ff;">if</span>(self.componet!=<span style="color: #000000;">None):
        self.componet.Show()

</span><span style="color: #0000ff;">class</span><span style="color: #000000;"> TShirts(Finery):
    </span><span style="color: #0000ff;">def</span> <span style="color: #800080;">__init__</span><span style="color: #000000;">(self):
        </span><span style="color: #0000ff;">pass</span>
    <span style="color: #0000ff;">def</span><span style="color: #000000;"> Show(self):
        </span><span style="color: #0000ff;">print</span> <span style="color: #800000;">"</span><span style="color: #800000;">Big T-shirt </span><span style="color: #800000;">"</span><span style="color: #000000;">
        self.componet.Show()

</span><span style="color: #0000ff;">class</span><span style="color: #000000;"> BigTrouser(Finery):
    </span><span style="color: #0000ff;">def</span> <span style="color: #800080;">__init__</span><span style="color: #000000;">(self):
        </span><span style="color: #0000ff;">pass</span>
    <span style="color: #0000ff;">def</span><span style="color: #000000;"> Show(self):
        </span><span style="color: #0000ff;">print</span> <span style="color: #800000;">"</span><span style="color: #800000;">Big Trouser </span><span style="color: #800000;">"</span><span style="color: #000000;">
        self.componet.Show()

</span><span style="color: #0000ff;">if</span> <span style="color: #800080;">__name__</span> == <span style="color: #800000;">"</span><span style="color: #800000;">__main__</span><span style="color: #800000;">"</span><span style="color: #000000;">:
    p </span>= Person(<span style="color: #800000;">"</span><span style="color: #800000;">somebody</span><span style="color: #800000;">"</span><span style="color: #000000;">)
    bt </span>=<span style="color: #000000;"> BigTrouser()
    ts </span>=<span style="color: #000000;"> TShirts()
    bt.Decorate(p)
    ts.Decorate(bt)
    ts.Show()</span></pre>
</div>
</div>
<p><strong>四、代理模式</strong></p>
<p><img alt="" height="286" src="http://images.cnblogs.com/cnblogs_com/wuyuegb2312/468244/o_ch.4%e4%bb%a3%e7%90%86%e6%a8%a1%e5%bc%8f.png" style="display: block; margin-left: auto; margin-right: auto;" width="543"/></p>
<p>模式特点：为其他对象提供一种代理以控制对这个对象的访问。</p>
<p>程序实例：同模式特点描述。</p>
<p>代码特点：无</p>
<div class="cnblogs_code" onclick="cnblogs_code_show('1535d2b3-2e62-4ad9-a910-eb9991003b92')"><img alt="" class="code_img_closed" id="code_img_closed_1535d2b3-2e62-4ad9-a910-eb9991003b92" src="http://images.cnblogs.com/OutliningIndicators/ContractedBlock.gif"/><img alt="" class="code_img_opened" id="code_img_opened_1535d2b3-2e62-4ad9-a910-eb9991003b92" onclick="cnblogs_code_hide('1535d2b3-2e62-4ad9-a910-eb9991003b92',event)" src="http://images.cnblogs.com/OutliningIndicators/ExpandedBlockStart.gif" style="display: none;"/><span class="cnblogs_code_collapse">代理模式</span>
<div class="cnblogs_code_hide" id="cnblogs_code_open_1535d2b3-2e62-4ad9-a910-eb9991003b92">
<pre><span style="color: #0000ff;">class</span><span style="color: #000000;"> Interface :
    </span><span style="color: #0000ff;">def</span><span style="color: #000000;"> Request(self):
    </span><span style="color: #0000ff;">return</span><span style="color: #000000;"> 0

</span><span style="color: #0000ff;">class</span><span style="color: #000000;"> RealSubject(Interface): 
    </span><span style="color: #0000ff;">def</span><span style="color: #000000;"> Request(self):
        </span><span style="color: #0000ff;">print</span> <span style="color: #800000;">"</span><span style="color: #800000;">Real request.</span><span style="color: #800000;">"</span>

<span style="color: #0000ff;">class</span><span style="color: #000000;"> Proxy(Interface):
    </span><span style="color: #0000ff;">def</span><span style="color: #000000;"> Request(self):
        self.real </span>=<span style="color: #000000;"> RealSubject()
        self.real.Request()

</span><span style="color: #0000ff;">if</span> <span style="color: #800080;">__name__</span> == <span style="color: #800000;">"</span><span style="color: #800000;">__main__</span><span style="color: #800000;">"</span><span style="color: #000000;">:
    p </span>=<span style="color: #000000;"> Proxy()
    p.Request()</span></pre>
</div>
</div>
<p><strong>五、工厂方法模式</strong></p>
<p><img alt="" height="289" src="http://images.cnblogs.com/cnblogs_com/wuyuegb2312/468244/o_ch5.%e5%b7%a5%e5%8e%82%e6%a8%a1%e5%bc%8f.png" style="display: block; margin-left: auto; margin-right: auto;" width="492"/></p>
<p>模式特点：定义一个用于创建对象的接口，让子类决定实例化哪一个类。这使得一个类的实例化延迟到其子类。</p>
<p>程序实例：基类雷锋类，派生出学生类和志愿者类，由这两种子类完成“学雷锋”工作。子类的创建由雷锋工厂的对应的子类完成。</p>
<p>代码特点：无</p>
<div class="cnblogs_code" onclick="cnblogs_code_show('a00d3914-e3e7-4659-a454-723fdc5a1a5c')"><img alt="" class="code_img_closed" id="code_img_closed_a00d3914-e3e7-4659-a454-723fdc5a1a5c" src="http://images.cnblogs.com/OutliningIndicators/ContractedBlock.gif"/><img alt="" class="code_img_opened" id="code_img_opened_a00d3914-e3e7-4659-a454-723fdc5a1a5c" onclick="cnblogs_code_hide('a00d3914-e3e7-4659-a454-723fdc5a1a5c',event)" src="http://images.cnblogs.com/OutliningIndicators/ExpandedBlockStart.gif" style="display: none;"/><span class="cnblogs_code_collapse">工厂方法模式</span>
<div class="cnblogs_code_hide" id="cnblogs_code_open_a00d3914-e3e7-4659-a454-723fdc5a1a5c">
<pre><span style="color: #0000ff;">class</span><span style="color: #000000;"> LeiFeng:
    </span><span style="color: #0000ff;">def</span><span style="color: #000000;"> Sweep(self):
        </span><span style="color: #0000ff;">print</span> <span style="color: #800000;">"</span><span style="color: #800000;">LeiFeng sweep</span><span style="color: #800000;">"</span>

<span style="color: #0000ff;">class</span><span style="color: #000000;"> Student(LeiFeng):
    </span><span style="color: #0000ff;">def</span><span style="color: #000000;"> Sweep(self):
        </span><span style="color: #0000ff;">print</span> <span style="color: #800000;">"</span><span style="color: #800000;">Student sweep</span><span style="color: #800000;">"</span>

<span style="color: #0000ff;">class</span><span style="color: #000000;"> Volenter(LeiFeng):
    </span><span style="color: #0000ff;">def</span><span style="color: #000000;"> Sweep(self):
        </span><span style="color: #0000ff;">print</span> <span style="color: #800000;">"</span><span style="color: #800000;">Volenter sweep</span><span style="color: #800000;">"</span>

<span style="color: #0000ff;">class</span><span style="color: #000000;"> LeiFengFactory:
    </span><span style="color: #0000ff;">def</span><span style="color: #000000;"> CreateLeiFeng(self):
        temp </span>=<span style="color: #000000;"> LeiFeng()
        </span><span style="color: #0000ff;">return</span><span style="color: #000000;"> temp

</span><span style="color: #0000ff;">class</span><span style="color: #000000;"> StudentFactory(LeiFengFactory):
    </span><span style="color: #0000ff;">def</span><span style="color: #000000;"> CreateLeiFeng(self):
        temp </span>=<span style="color: #000000;"> Student()
        </span><span style="color: #0000ff;">return</span><span style="color: #000000;"> temp

</span><span style="color: #0000ff;">class</span><span style="color: #000000;"> VolenterFactory(LeiFengFactory):
    </span><span style="color: #0000ff;">def</span><span style="color: #000000;"> CreateLeiFeng(self):
        temp </span>=<span style="color: #000000;"> Volenter()
        </span><span style="color: #0000ff;">return</span><span style="color: #000000;"> temp

</span><span style="color: #0000ff;">if</span> <span style="color: #800080;">__name__</span> == <span style="color: #800000;">"</span><span style="color: #800000;">__main__</span><span style="color: #800000;">"</span><span style="color: #000000;">:
    sf </span>=<span style="color: #000000;"> StudentFactory()
    s</span>=<span style="color: #000000;">sf.CreateLeiFeng()
    s.Sweep()
    sdf </span>=<span style="color: #000000;"> VolenterFactory()
    sd</span>=<span style="color: #000000;">sdf.CreateLeiFeng()
    sd.Sweep()</span></pre>
</div>
</div>
<p> </p>
<p> <strong>六、原型模式</strong></p>
<p><img alt="" height="232" src="http://images.cnblogs.com/cnblogs_com/wuyuegb2312/468244/o_ch6.%e5%8e%9f%e5%9e%8b%e6%a8%a1%e5%bc%8f.png" style="display: block; margin-left: auto; margin-right: auto;" width="430"/></p>
<p>模式特点：用原型实例指定创建对象的种类，并且通过拷贝这些原型创建新的对象。</p>
<p>程序实例：从简历原型，生成新的简历</p>
<p>代码特点：简历类Resume提供的Clone()方法其实并不是真正的Clone，只是为已存在对象增加了一次引用。</p>
<p>　　　　　Python为对象提供的copy模块中的copy方法和deepcopy方法已经实现了原型模式，但由于例子的层次较浅，二者看不出区别。</p>
<p>　　　　</p>
<div class="cnblogs_code" onclick="cnblogs_code_show('c8843274-6827-44bc-a943-98b15dc8e9fa')"><img alt="" class="code_img_closed" id="code_img_closed_c8843274-6827-44bc-a943-98b15dc8e9fa" src="http://images.cnblogs.com/OutliningIndicators/ContractedBlock.gif"/><img alt="" class="code_img_opened" id="code_img_opened_c8843274-6827-44bc-a943-98b15dc8e9fa" onclick="cnblogs_code_hide('c8843274-6827-44bc-a943-98b15dc8e9fa',event)" src="http://images.cnblogs.com/OutliningIndicators/ExpandedBlockStart.gif" style="display: none;"/><span class="cnblogs_code_collapse">原型模式</span>
<div class="cnblogs_code_hide" id="cnblogs_code_open_c8843274-6827-44bc-a943-98b15dc8e9fa">
<pre><span style="color: #0000ff;">import</span><span style="color: #000000;"> copy
</span><span style="color: #0000ff;">class</span><span style="color: #000000;"> WorkExp:
    place</span>=<span style="color: #800000;">""</span><span style="color: #000000;">
    year</span>=<span style="color: #000000;">0

</span><span style="color: #0000ff;">class</span><span style="color: #000000;"> Resume:
    name </span>= <span style="color: #800000;">''</span><span style="color: #000000;">
    age </span>=<span style="color: #000000;"> 0
    </span><span style="color: #0000ff;">def</span> <span style="color: #800080;">__init__</span><span style="color: #000000;">(self,n):
        self.name </span>=<span style="color: #000000;"> n
    </span><span style="color: #0000ff;">def</span><span style="color: #000000;"> SetAge(self,a):
        self.age </span>=<span style="color: #000000;"> a
    </span><span style="color: #0000ff;">def</span><span style="color: #000000;"> SetWorkExp(self,p,y):
        self.place </span>=<span style="color: #000000;"> p
        self.year </span>=<span style="color: #000000;"> y
    </span><span style="color: #0000ff;">def</span><span style="color: #000000;"> Display(self):
        </span><span style="color: #0000ff;">print</span><span style="color: #000000;"> self.age
        </span><span style="color: #0000ff;">print</span><span style="color: #000000;"> self.place
        </span><span style="color: #0000ff;">print</span><span style="color: #000000;"> self.year
    </span><span style="color: #0000ff;">def</span><span style="color: #000000;"> Clone(self):
    </span><span style="color: #008000;">#</span><span style="color: #008000;">实际不是“克隆”，只是返回了自身</span>
        <span style="color: #0000ff;">return</span><span style="color: #000000;"> self

</span><span style="color: #0000ff;">if</span> <span style="color: #800080;">__name__</span> == <span style="color: #800000;">"</span><span style="color: #800000;">__main__</span><span style="color: #800000;">"</span><span style="color: #000000;">:
    a </span>= Resume(<span style="color: #800000;">"</span><span style="color: #800000;">a</span><span style="color: #800000;">"</span><span style="color: #000000;">)
    b </span>=<span style="color: #000000;"> a.Clone()
    c </span>=<span style="color: #000000;"> copy.copy(a)
    d </span>=<span style="color: #000000;"> copy.deepcopy(a)
    a.SetAge(</span>7<span style="color: #000000;">)
    b.SetAge(</span>12<span style="color: #000000;">)
    c.SetAge(</span>15<span style="color: #000000;">)
    d.SetAge(</span>18<span style="color: #000000;">)
    a.SetWorkExp(</span><span style="color: #800000;">"</span><span style="color: #800000;">PrimarySchool</span><span style="color: #800000;">"</span>,1996<span style="color: #000000;">)
    b.SetWorkExp(</span><span style="color: #800000;">"</span><span style="color: #800000;">MidSchool</span><span style="color: #800000;">"</span>,2001<span style="color: #000000;">)
    c.SetWorkExp(</span><span style="color: #800000;">"</span><span style="color: #800000;">HighSchool</span><span style="color: #800000;">"</span>,2004<span style="color: #000000;">)
    d.SetWorkExp(</span><span style="color: #800000;">"</span><span style="color: #800000;">University</span><span style="color: #800000;">"</span>,2007<span style="color: #000000;">)
    a.Display()
    b.Display()
    c.Display()
    d.Display()</span></pre>
</div>
</div>
<p><strong>七、模板方法模式</strong></p>
<p> <img alt="" height="170" src="http://images.cnblogs.com/cnblogs_com/wuyuegb2312/468244/o_ch7.%e6%a8%a1%e6%9d%bf%e6%96%b9%e6%b3%95%e6%a8%a1%e5%bc%8f.png" style="display: block; margin-left: auto; margin-right: auto;" width="387"/></p>
<p>模式特点：定义一个操作中的算法骨架，将一些步骤延迟至子类中。</p>
<p>程序实例：考试时使用同一种考卷（父类），不同学生上交自己填写的试卷（子类方法的实现）</p>
<p>代码特点：无</p>
<div class="cnblogs_code" onclick="cnblogs_code_show('7f7b3d2c-c8e3-4e1a-86f8-3b943571fc8e')"><img alt="" class="code_img_closed" id="code_img_closed_7f7b3d2c-c8e3-4e1a-86f8-3b943571fc8e" src="http://images.cnblogs.com/OutliningIndicators/ContractedBlock.gif"/><img alt="" class="code_img_opened" id="code_img_opened_7f7b3d2c-c8e3-4e1a-86f8-3b943571fc8e" onclick="cnblogs_code_hide('7f7b3d2c-c8e3-4e1a-86f8-3b943571fc8e',event)" src="http://images.cnblogs.com/OutliningIndicators/ExpandedBlockStart.gif" style="display: none;"/><span class="cnblogs_code_collapse">模板方法模式</span>
<div class="cnblogs_code_hide" id="cnblogs_code_open_7f7b3d2c-c8e3-4e1a-86f8-3b943571fc8e">
<pre><span style="color: #0000ff;">class</span><span style="color: #000000;"> TestPaper:
    </span><span style="color: #0000ff;">def</span><span style="color: #000000;"> TestQuestion1(self):
        </span><span style="color: #0000ff;">print</span> <span style="color: #800000;">"</span><span style="color: #800000;">Test1:A. B. C. D.</span><span style="color: #800000;">"</span>
        <span style="color: #0000ff;">print</span> <span style="color: #800000;">"</span><span style="color: #800000;">(%s)</span><span style="color: #800000;">"</span> %<span style="color: #000000;">self.Answer1()

    </span><span style="color: #0000ff;">def</span><span style="color: #000000;"> TestQuestion2(self):
        </span><span style="color: #0000ff;">print</span> <span style="color: #800000;">"</span><span style="color: #800000;">Test1:A. B. C. D.</span><span style="color: #800000;">"</span>
        <span style="color: #0000ff;">print</span> <span style="color: #800000;">"</span><span style="color: #800000;">(%s)</span><span style="color: #800000;">"</span> %<span style="color: #000000;">self.Answer2()
    </span><span style="color: #0000ff;">def</span><span style="color: #000000;"> Answer1(self):
        </span><span style="color: #0000ff;">return</span> <span style="color: #800000;">""</span>
    <span style="color: #0000ff;">def</span><span style="color: #000000;"> Answer2(self):
        </span><span style="color: #0000ff;">return</span> <span style="color: #800000;">""</span>

<span style="color: #0000ff;">class</span><span style="color: #000000;"> TestPaperA(TestPaper):
    </span><span style="color: #0000ff;">def</span><span style="color: #000000;"> Answer1(self):
        </span><span style="color: #0000ff;">return</span> <span style="color: #800000;">"</span><span style="color: #800000;">B</span><span style="color: #800000;">"</span>
    <span style="color: #0000ff;">def</span><span style="color: #000000;"> Answer2(self):
        </span><span style="color: #0000ff;">return</span> <span style="color: #800000;">"</span><span style="color: #800000;">C</span><span style="color: #800000;">"</span><span style="color: #000000;">;

</span><span style="color: #0000ff;">class</span><span style="color: #000000;"> TestPaperB(TestPaper):
    </span><span style="color: #0000ff;">def</span><span style="color: #000000;"> Answer1(self):
        </span><span style="color: #0000ff;">return</span> <span style="color: #800000;">"</span><span style="color: #800000;">D</span><span style="color: #800000;">"</span>
    <span style="color: #0000ff;">def</span><span style="color: #000000;"> Answer2(self):
        </span><span style="color: #0000ff;">return</span> <span style="color: #800000;">"</span><span style="color: #800000;">D</span><span style="color: #800000;">"</span><span style="color: #000000;">;

</span><span style="color: #0000ff;">if</span> <span style="color: #800080;">__name__</span> == <span style="color: #800000;">"</span><span style="color: #800000;">__main__</span><span style="color: #800000;">"</span><span style="color: #000000;">:
    s1 </span>=<span style="color: #000000;"> TestPaperA()
    s2 </span>=<span style="color: #000000;"> TestPaperB()
    </span><span style="color: #0000ff;">print</span> <span style="color: #800000;">"</span><span style="color: #800000;">student 1</span><span style="color: #800000;">"</span><span style="color: #000000;">
    s1.TestQuestion1()
    s1.TestQuestion2()
    </span><span style="color: #0000ff;">print</span> <span style="color: #800000;">"</span><span style="color: #800000;">student 2</span><span style="color: #800000;">"</span><span style="color: #000000;">
    s2.TestQuestion1()
    s2.TestQuestion2()</span></pre>
</div>
</div>
<p> </p>
<p> <strong>八、外观模式</strong></p>
<p><img alt="" height="313" src="http://images.cnblogs.com/cnblogs_com/wuyuegb2312/468244/o_ch8.%e5%a4%96%e8%a7%82%e6%a8%a1%e5%bc%8f.png" style="display: block; margin-left: auto; margin-right: auto;" width="512"/></p>
<p>模式特点：为一组调用提供一致的接口。</p>
<p>程序实例：接口将几种调用分别组合成为两组，用户通过接口调用其中的一组。</p>
<p>代码特点：无</p>
<div class="cnblogs_code" onclick="cnblogs_code_show('117956cc-5a98-40c6-9aa6-654a4e7bfc11')"><img alt="" class="code_img_closed" id="code_img_closed_117956cc-5a98-40c6-9aa6-654a4e7bfc11" src="http://images.cnblogs.com/OutliningIndicators/ContractedBlock.gif"/><img alt="" class="code_img_opened" id="code_img_opened_117956cc-5a98-40c6-9aa6-654a4e7bfc11" onclick="cnblogs_code_hide('117956cc-5a98-40c6-9aa6-654a4e7bfc11',event)" src="http://images.cnblogs.com/OutliningIndicators/ExpandedBlockStart.gif" style="display: none;"/><span class="cnblogs_code_collapse">外观模式</span>
<div class="cnblogs_code_hide" id="cnblogs_code_open_117956cc-5a98-40c6-9aa6-654a4e7bfc11">
<pre><span style="color: #0000ff;">class</span><span style="color: #000000;"> SubSystemOne:
    </span><span style="color: #0000ff;">def</span><span style="color: #000000;"> MethodOne(self):
        </span><span style="color: #0000ff;">print</span> <span style="color: #800000;">"</span><span style="color: #800000;">SubSysOne</span><span style="color: #800000;">"</span>

<span style="color: #0000ff;">class</span><span style="color: #000000;"> SubSystemTwo:
    </span><span style="color: #0000ff;">def</span><span style="color: #000000;"> MethodTwo(self):
        </span><span style="color: #0000ff;">print</span> <span style="color: #800000;">"</span><span style="color: #800000;">SubSysTwo</span><span style="color: #800000;">"</span>

<span style="color: #0000ff;">class</span><span style="color: #000000;"> SubSystemThree:
    </span><span style="color: #0000ff;">def</span><span style="color: #000000;"> MethodThree(self):
        </span><span style="color: #0000ff;">print</span> <span style="color: #800000;">"</span><span style="color: #800000;">SubSysThree</span><span style="color: #800000;">"</span>

<span style="color: #0000ff;">class</span><span style="color: #000000;"> SubSystemFour:
    </span><span style="color: #0000ff;">def</span><span style="color: #000000;"> MethodFour(self):
        </span><span style="color: #0000ff;">print</span> <span style="color: #800000;">"</span><span style="color: #800000;">SubSysFour</span><span style="color: #800000;">"</span>


<span style="color: #0000ff;">class</span><span style="color: #000000;"> Facade:
    </span><span style="color: #0000ff;">def</span> <span style="color: #800080;">__init__</span><span style="color: #000000;">(self):
        self.one </span>=<span style="color: #000000;"> SubSystemOne()
        self.two </span>=<span style="color: #000000;"> SubSystemTwo()
        self.three </span>=<span style="color: #000000;"> SubSystemThree()
        self.four </span>=<span style="color: #000000;"> SubSystemFour()
    </span><span style="color: #0000ff;">def</span><span style="color: #000000;"> MethodA(self):
        </span><span style="color: #0000ff;">print</span> <span style="color: #800000;">"</span><span style="color: #800000;">MethodA</span><span style="color: #800000;">"</span><span style="color: #000000;">
        self.one.MethodOne()
        self.two.MethodTwo()
        self.four.MethodFour()
    </span><span style="color: #0000ff;">def</span><span style="color: #000000;"> MethodB(self):
        </span><span style="color: #0000ff;">print</span> <span style="color: #800000;">"</span><span style="color: #800000;">MethodB</span><span style="color: #800000;">"</span><span style="color: #000000;">
        self.two.MethodTwo()
        self.three.MethodThree()

</span><span style="color: #0000ff;">if</span> <span style="color: #800080;">__name__</span> == <span style="color: #800000;">"</span><span style="color: #800000;">__main__</span><span style="color: #800000;">"</span><span style="color: #000000;">:
    facade </span>=<span style="color: #000000;"> Facade()
    facade.MethodA()
    facade.MethodB()</span></pre>
</div>
</div>
<p> </p>
<p><strong>九、建造者模式</strong></p>
<p> <img alt="" height="280" src="http://images.cnblogs.com/cnblogs_com/wuyuegb2312/468244/o_ch9.%e5%bb%ba%e9%80%a0%e8%80%85%e6%a8%a1%e5%bc%8f.png" style="display: block; margin-left: auto; margin-right: auto;" width="392"/></p>
<p>模式特点：将一个复杂对象的构建(Director)与它的表示(Builder)分离，使得同样的构建过程可以创建不同的表示(ConcreteBuilder)。</p>
<p>程序实例：“画”出一个四肢健全（头身手腿）的小人</p>
<p>代码特点：无</p>
<div class="cnblogs_code" onclick="cnblogs_code_show('1f55bf0b-5e25-46e9-8563-b4325b373288')"><img alt="" class="code_img_closed" id="code_img_closed_1f55bf0b-5e25-46e9-8563-b4325b373288" src="http://images.cnblogs.com/OutliningIndicators/ContractedBlock.gif"/><img alt="" class="code_img_opened" id="code_img_opened_1f55bf0b-5e25-46e9-8563-b4325b373288" onclick="cnblogs_code_hide('1f55bf0b-5e25-46e9-8563-b4325b373288',event)" src="http://images.cnblogs.com/OutliningIndicators/ExpandedBlockStart.gif" style="display: none;"/><span class="cnblogs_code_collapse">建造者模式</span>
<div class="cnblogs_code_hide" id="cnblogs_code_open_1f55bf0b-5e25-46e9-8563-b4325b373288">
<pre><span style="color: #0000ff;">class</span><span style="color: #000000;"> Person:
    </span><span style="color: #0000ff;">def</span><span style="color: #000000;"> CreateHead(self):
        </span><span style="color: #0000ff;">pass</span>
    <span style="color: #0000ff;">def</span><span style="color: #000000;"> CreateHand(self):
        </span><span style="color: #0000ff;">pass</span>
    <span style="color: #0000ff;">def</span><span style="color: #000000;"> CreateBody(self):
        </span><span style="color: #0000ff;">pass</span>
    <span style="color: #0000ff;">def</span><span style="color: #000000;"> CreateFoot(self):
        </span><span style="color: #0000ff;">pass</span>

<span style="color: #0000ff;">class</span><span style="color: #000000;"> ThinPerson(Person):
    </span><span style="color: #0000ff;">def</span><span style="color: #000000;"> CreateHead(self):
        </span><span style="color: #0000ff;">print</span> <span style="color: #800000;">"</span><span style="color: #800000;">thin head</span><span style="color: #800000;">"</span>
    <span style="color: #0000ff;">def</span><span style="color: #000000;"> CreateHand(self):
        </span><span style="color: #0000ff;">print</span> <span style="color: #800000;">"</span><span style="color: #800000;">thin hand</span><span style="color: #800000;">"</span>
    <span style="color: #0000ff;">def</span><span style="color: #000000;"> CreateBody(self):
        </span><span style="color: #0000ff;">print</span> <span style="color: #800000;">"</span><span style="color: #800000;">thin body</span><span style="color: #800000;">"</span>
    <span style="color: #0000ff;">def</span><span style="color: #000000;"> CreateFoot(self):
        </span><span style="color: #0000ff;">print</span> <span style="color: #800000;">"</span><span style="color: #800000;">thin foot</span><span style="color: #800000;">"</span>

<span style="color: #0000ff;">class</span><span style="color: #000000;"> ThickPerson(Person):
    </span><span style="color: #0000ff;">def</span><span style="color: #000000;"> CreateHead(self):
        </span><span style="color: #0000ff;">print</span> <span style="color: #800000;">"</span><span style="color: #800000;">thick head</span><span style="color: #800000;">"</span>
    <span style="color: #0000ff;">def</span><span style="color: #000000;"> CreateHand(self):
        </span><span style="color: #0000ff;">print</span> <span style="color: #800000;">"</span><span style="color: #800000;">thick hand</span><span style="color: #800000;">"</span>
    <span style="color: #0000ff;">def</span><span style="color: #000000;"> CreateBody(self):
        </span><span style="color: #0000ff;">print</span> <span style="color: #800000;">"</span><span style="color: #800000;">thick body</span><span style="color: #800000;">"</span>
    <span style="color: #0000ff;">def</span><span style="color: #000000;"> CreateFoot(self):
        </span><span style="color: #0000ff;">print</span> <span style="color: #800000;">"</span><span style="color: #800000;">thick foot</span><span style="color: #800000;">"</span>

<span style="color: #0000ff;">class</span><span style="color: #000000;"> Director:
    </span><span style="color: #0000ff;">def</span> <span style="color: #800080;">__init__</span><span style="color: #000000;">(self,temp):
        self.p </span>=<span style="color: #000000;"> temp
    </span><span style="color: #0000ff;">def</span><span style="color: #000000;"> Create(self):
        self.p.CreateHead()
        self.p.CreateBody()
        self.p.CreateHand()
        self.p.CreateFoot()

</span><span style="color: #0000ff;">if</span> <span style="color: #800080;">__name__</span> == <span style="color: #800000;">"</span><span style="color: #800000;">__main__</span><span style="color: #800000;">"</span><span style="color: #000000;">:
    p </span>=<span style="color: #000000;"> ThickPerson()
    d </span>=<span style="color: #000000;"> Director(p)
    d.Create()</span></pre>
</div>
</div>
<p> </p>
<p><strong>十、观察者模式</strong></p>
<p><img alt="" height="344" src="http://images.cnblogs.com/cnblogs_com/wuyuegb2312/468244/o_ch10.%e8%a7%82%e5%af%9f%e8%80%85%e6%a8%a1%e5%bc%8f.png" style="display: block; margin-left: auto; margin-right: auto;" width="510"/></p>
<p>模式特点：定义了一种一对多的关系，让多个观察对象同时监听一个主题对象，当主题对象状态发生变化时会通知所有观察者。</p>
<p>程序实例：公司里有两种上班时趁老板不在时偷懒的员工：看NBA的和看股票行情的，并且事先让老板秘书当老板出现时通知他们继续做手头上的工作。</p>
<p>程序特点：无</p>
<div class="cnblogs_code" onclick="cnblogs_code_show('3f4f6c9a-211d-487d-8e98-f50fd3b8de53')"><img alt="" class="code_img_closed" id="code_img_closed_3f4f6c9a-211d-487d-8e98-f50fd3b8de53" src="http://images.cnblogs.com/OutliningIndicators/ContractedBlock.gif"/><img alt="" class="code_img_opened" id="code_img_opened_3f4f6c9a-211d-487d-8e98-f50fd3b8de53" onclick="cnblogs_code_hide('3f4f6c9a-211d-487d-8e98-f50fd3b8de53',event)" src="http://images.cnblogs.com/OutliningIndicators/ExpandedBlockStart.gif" style="display: none;"/><span class="cnblogs_code_collapse">观察者模式</span>
<div class="cnblogs_code_hide" id="cnblogs_code_open_3f4f6c9a-211d-487d-8e98-f50fd3b8de53">
<pre><span style="color: #0000ff;">class</span><span style="color: #000000;"> Observer:
    </span><span style="color: #0000ff;">def</span> <span style="color: #800080;">__init__</span><span style="color: #000000;">(self,strname,strsub):
        self.name </span>=<span style="color: #000000;"> strname
        self.sub </span>=<span style="color: #000000;"> strsub
    </span><span style="color: #0000ff;">def</span><span style="color: #000000;"> Update(self):
        </span><span style="color: #0000ff;">pass</span>

<span style="color: #0000ff;">class</span><span style="color: #000000;"> StockObserver(Observer):
    </span><span style="color: #008000;">#</span><span style="color: #008000;">no need to rewrite __init__()</span>
    <span style="color: #0000ff;">def</span><span style="color: #000000;"> Update(self):
        </span><span style="color: #0000ff;">print</span> <span style="color: #800000;">"</span><span style="color: #800000;">%s:%s,stop watching Stock and go on work!</span><span style="color: #800000;">"</span> %<span style="color: #000000;">(self.name,self.sub.action)

</span><span style="color: #0000ff;">class</span><span style="color: #000000;"> NBAObserver(Observer):
    </span><span style="color: #0000ff;">def</span><span style="color: #000000;"> Update(self):
        </span><span style="color: #0000ff;">print</span> <span style="color: #800000;">"</span><span style="color: #800000;">%s:%s,stop watching NBA and go on work!</span><span style="color: #800000;">"</span> %<span style="color: #000000;">(self.name,self.sub.action)

</span><span style="color: #0000ff;">class</span><span style="color: #000000;"> SecretaryBase:
    </span><span style="color: #0000ff;">def</span> <span style="color: #800080;">__init__</span><span style="color: #000000;">(self):
        self.observers </span>=<span style="color: #000000;"> []
    </span><span style="color: #0000ff;">def</span><span style="color: #000000;"> Attach(self,new_observer):
        </span><span style="color: #0000ff;">pass</span> 
    <span style="color: #0000ff;">def</span><span style="color: #000000;"> Notify(self):
        </span><span style="color: #0000ff;">pass</span>

<span style="color: #0000ff;">class</span><span style="color: #000000;"> Secretary(SecretaryBase):
    </span><span style="color: #0000ff;">def</span><span style="color: #000000;"> Attach(self,new_observer):
        self.observers.append(new_observer)
    </span><span style="color: #0000ff;">def</span><span style="color: #000000;"> Notify(self):
        </span><span style="color: #0000ff;">for</span> p <span style="color: #0000ff;">in</span><span style="color: #000000;"> self.observers:
            p.Update()

</span><span style="color: #0000ff;">if</span> <span style="color: #800080;">__name__</span> == <span style="color: #800000;">"</span><span style="color: #800000;">__main__</span><span style="color: #800000;">"</span><span style="color: #000000;">:
    p </span>=<span style="color: #000000;"> Secretary()
    s1 </span>= StockObserver(<span style="color: #800000;">"</span><span style="color: #800000;">xh</span><span style="color: #800000;">"</span><span style="color: #000000;">,p)
    s2 </span>= NBAObserver(<span style="color: #800000;">"</span><span style="color: #800000;">wyt</span><span style="color: #800000;">"</span><span style="color: #000000;">,p)
    p.Attach(s1);
    p.Attach(s2);
    p.action </span>= <span style="color: #800000;">"</span><span style="color: #800000;">WARNING:BOSS </span><span style="color: #800000;">"</span><span style="color: #000000;">;
    p.Notify()</span></pre>
</div>
</div>
<p><strong>十一、抽象工厂模式</strong></p>
<p><img alt="" height="381" src="http://images.cnblogs.com/cnblogs_com/wuyuegb2312/468244/o_ch11.%e6%8a%bd%e8%b1%a1%e5%b7%a5%e5%8e%82%e6%a8%a1%e5%bc%8f.png" style="display: block; margin-left: auto; margin-right: auto;" width="475"/></p>
<p>模式特点：提供一个创建一系列相关或相互依赖对象的接口，而无需指定它们的类。</p>
<p>程序实例：提供对不同的数据库访问的支持。</p>
<p>　　　　　IUser和IDepartment是两种不同的抽象产品，它们都有Access和SQL Server这两种不同的实现；IFactory是产生IUser和IDepartment的抽象工厂，根据具体实现（AccessFactory和SqlFactory）产生对应的具体的对象（CAccessUser与CAccessDepartment，或者CSqlUser与CSqlDepartment）。</p>
<p>代码特点：无</p>
<div class="cnblogs_code" onclick="cnblogs_code_show('5a72dea8-8d5d-428f-af3d-6c311ca557dd')"><img alt="" class="code_img_closed" id="code_img_closed_5a72dea8-8d5d-428f-af3d-6c311ca557dd" src="http://images.cnblogs.com/OutliningIndicators/ContractedBlock.gif"/><img alt="" class="code_img_opened" id="code_img_opened_5a72dea8-8d5d-428f-af3d-6c311ca557dd" onclick="cnblogs_code_hide('5a72dea8-8d5d-428f-af3d-6c311ca557dd',event)" src="http://images.cnblogs.com/OutliningIndicators/ExpandedBlockStart.gif" style="display: none;"/><span class="cnblogs_code_collapse">抽象工厂模式</span>
<div class="cnblogs_code_hide" id="cnblogs_code_open_5a72dea8-8d5d-428f-af3d-6c311ca557dd">
<pre><span style="color: #0000ff;">class</span><span style="color: #000000;"> IUser:
    </span><span style="color: #0000ff;">def</span><span style="color: #000000;"> GetUser(self):
        </span><span style="color: #0000ff;">pass</span>
    <span style="color: #0000ff;">def</span><span style="color: #000000;"> InsertUser(self):
        </span><span style="color: #0000ff;">pass</span>

<span style="color: #0000ff;">class</span><span style="color: #000000;"> IDepartment:
    </span><span style="color: #0000ff;">def</span><span style="color: #000000;"> GetDepartment(self):
        </span><span style="color: #0000ff;">pass</span>
    <span style="color: #0000ff;">def</span><span style="color: #000000;"> InsertDepartment(self):
        </span><span style="color: #0000ff;">pass</span>

<span style="color: #0000ff;">class</span><span style="color: #000000;"> CAccessUser(IUser):
    </span><span style="color: #0000ff;">def</span><span style="color: #000000;"> GetUser(self):
        </span><span style="color: #0000ff;">print</span> <span style="color: #800000;">"</span><span style="color: #800000;">Access GetUser</span><span style="color: #800000;">"</span>
    <span style="color: #0000ff;">def</span><span style="color: #000000;"> InsertUser(self):
        </span><span style="color: #0000ff;">print</span> <span style="color: #800000;">"</span><span style="color: #800000;">Access InsertUser</span><span style="color: #800000;">"</span>


<span style="color: #0000ff;">class</span><span style="color: #000000;"> CAccessDepartment(IDepartment):
    </span><span style="color: #0000ff;">def</span><span style="color: #000000;"> GetDepartment(self):
        </span><span style="color: #0000ff;">print</span> <span style="color: #800000;">"</span><span style="color: #800000;">Access GetDepartment</span><span style="color: #800000;">"</span>
    <span style="color: #0000ff;">def</span><span style="color: #000000;"> InsertDepartment(self):
        </span><span style="color: #0000ff;">print</span> <span style="color: #800000;">"</span><span style="color: #800000;">Access InsertDepartment</span><span style="color: #800000;">"</span>

<span style="color: #0000ff;">class</span><span style="color: #000000;"> CSqlUser(IUser):
    </span><span style="color: #0000ff;">def</span><span style="color: #000000;"> GetUser(self):
        </span><span style="color: #0000ff;">print</span> <span style="color: #800000;">"</span><span style="color: #800000;">Sql GetUser</span><span style="color: #800000;">"</span>
    <span style="color: #0000ff;">def</span><span style="color: #000000;"> InsertUser(self):
        </span><span style="color: #0000ff;">print</span> <span style="color: #800000;">"</span><span style="color: #800000;">Sql InsertUser</span><span style="color: #800000;">"</span>


<span style="color: #0000ff;">class</span><span style="color: #000000;"> CSqlDepartment(IDepartment):
    </span><span style="color: #0000ff;">def</span><span style="color: #000000;"> GetDepartment(self):
        </span><span style="color: #0000ff;">print</span> <span style="color: #800000;">"</span><span style="color: #800000;">Sql GetDepartment</span><span style="color: #800000;">"</span>
    <span style="color: #0000ff;">def</span><span style="color: #000000;"> InsertDepartment(self):
        </span><span style="color: #0000ff;">print</span> <span style="color: #800000;">"</span><span style="color: #800000;">Sql InsertDepartment</span><span style="color: #800000;">"</span>

<span style="color: #0000ff;">class</span><span style="color: #000000;"> IFactory:
    </span><span style="color: #0000ff;">def</span><span style="color: #000000;"> CreateUser(self):
        </span><span style="color: #0000ff;">pass</span>
    <span style="color: #0000ff;">def</span><span style="color: #000000;"> CreateDepartment(self):
        </span><span style="color: #0000ff;">pass</span>

<span style="color: #0000ff;">class</span><span style="color: #000000;"> AccessFactory(IFactory):
    </span><span style="color: #0000ff;">def</span><span style="color: #000000;"> CreateUser(self):
        temp</span>=<span style="color: #000000;">CAccessUser()
        </span><span style="color: #0000ff;">return</span><span style="color: #000000;"> temp
    </span><span style="color: #0000ff;">def</span><span style="color: #000000;"> CreateDepartment(self):
        temp </span>=<span style="color: #000000;"> CAccessDepartment()
        </span><span style="color: #0000ff;">return</span><span style="color: #000000;"> temp

</span><span style="color: #0000ff;">class</span><span style="color: #000000;"> SqlFactory(IFactory):
    </span><span style="color: #0000ff;">def</span><span style="color: #000000;"> CreateUser(self):
        temp </span>=<span style="color: #000000;"> CSqlUser()
        </span><span style="color: #0000ff;">return</span><span style="color: #000000;"> temp
    </span><span style="color: #0000ff;">def</span><span style="color: #000000;"> CreateDepartment(self):
        temp </span>=<span style="color: #000000;"> CSqlDepartment()
        </span><span style="color: #0000ff;">return</span><span style="color: #000000;"> temp

</span><span style="color: #0000ff;">if</span> <span style="color: #800080;">__name__</span> == <span style="color: #800000;">"</span><span style="color: #800000;">__main__</span><span style="color: #800000;">"</span><span style="color: #000000;">:
    factory </span>=<span style="color: #000000;"> SqlFactory()
    user</span>=<span style="color: #000000;">factory.CreateUser()
    depart</span>=<span style="color: #000000;">factory.CreateDepartment()
    user.GetUser()
    depart.GetDepartment()</span></pre>
</div>
</div>
<p><strong>十二、状态模式</strong></p>
<p><strong><img alt="" height="306" src="http://images.cnblogs.com/cnblogs_com/wuyuegb2312/468244/o_ch12.%e7%8a%b6%e6%80%81%e6%a8%a1%e5%bc%8f.png" style="display: block; margin-left: auto; margin-right: auto;" width="461"/></strong></p>
<p> </p>
<p>模式特点：当一个对象的内在状态改变时允许改变其行为，这个对象看起来像是改变了其类。</p>
<p>程序实例：描述一个程序员的工作状态，当需要改变状态时发生改变，不同状态下的方法实现不同</p>
<p>代码特点：无</p>
<div class="cnblogs_code" onclick="cnblogs_code_show('0d6bd26b-97a7-4165-8b0b-663bca3a938a')"><img alt="" class="code_img_closed" id="code_img_closed_0d6bd26b-97a7-4165-8b0b-663bca3a938a" src="http://images.cnblogs.com/OutliningIndicators/ContractedBlock.gif"/><img alt="" class="code_img_opened" id="code_img_opened_0d6bd26b-97a7-4165-8b0b-663bca3a938a" onclick="cnblogs_code_hide('0d6bd26b-97a7-4165-8b0b-663bca3a938a',event)" src="http://images.cnblogs.com/OutliningIndicators/ExpandedBlockStart.gif" style="display: none;"/><span class="cnblogs_code_collapse">状态模式</span>
<div class="cnblogs_code_hide" id="cnblogs_code_open_0d6bd26b-97a7-4165-8b0b-663bca3a938a">
<pre><span style="color: #0000ff;">class</span><span style="color: #000000;"> State:
    </span><span style="color: #0000ff;">def</span><span style="color: #000000;"> WirteProgram(self):
        </span><span style="color: #0000ff;">pass</span>

<span style="color: #0000ff;">class</span><span style="color: #000000;"> Work:
    </span><span style="color: #0000ff;">def</span> <span style="color: #800080;">__init__</span><span style="color: #000000;">(self):
        self.hour </span>= 9<span style="color: #000000;">
        self.current </span>=<span style="color: #000000;"> ForenoonState()
    </span><span style="color: #0000ff;">def</span><span style="color: #000000;"> SetState(self,temp):
        self.current </span>=<span style="color: #000000;"> temp
    </span><span style="color: #0000ff;">def</span><span style="color: #000000;"> WriteProgram(self):
        self.current.WriteProgram(self)

</span><span style="color: #0000ff;">class</span><span style="color: #000000;"> NoonState(State):
    </span><span style="color: #0000ff;">def</span><span style="color: #000000;"> WriteProgram(self,w):
        </span><span style="color: #0000ff;">print</span> <span style="color: #800000;">"</span><span style="color: #800000;">noon working</span><span style="color: #800000;">"</span>
        <span style="color: #0000ff;">if</span> (w.hour&lt;13<span style="color: #000000;">):
            </span><span style="color: #0000ff;">print</span> <span style="color: #800000;">"</span><span style="color: #800000;">fun.</span><span style="color: #800000;">"</span>
        <span style="color: #0000ff;">else</span><span style="color: #000000;">:
            </span><span style="color: #0000ff;">print</span> <span style="color: #800000;">"</span><span style="color: #800000;">need to rest.</span><span style="color: #800000;">"</span>

<span style="color: #0000ff;">class</span><span style="color: #000000;"> ForenoonState(State):
    </span><span style="color: #0000ff;">def</span><span style="color: #000000;"> WriteProgram(self,w):
        </span><span style="color: #0000ff;">if</span> (w.hour&lt;12<span style="color: #000000;">):
            </span><span style="color: #0000ff;">print</span> <span style="color: #800000;">"</span><span style="color: #800000;">morning working</span><span style="color: #800000;">"</span>
            <span style="color: #0000ff;">print</span> <span style="color: #800000;">"</span><span style="color: #800000;">energetic</span><span style="color: #800000;">"</span>
        <span style="color: #0000ff;">else</span><span style="color: #000000;">:
            w.SetState(NoonState())        
            w.WriteProgram()

</span><span style="color: #0000ff;">if</span> <span style="color: #800080;">__name__</span> == <span style="color: #800000;">"</span><span style="color: #800000;">__main__</span><span style="color: #800000;">"</span><span style="color: #000000;">:
    mywork </span>=<span style="color: #000000;"> Work()
    mywork.hour </span>= 9<span style="color: #000000;">
    mywork.WriteProgram()
    mywork.hour </span>=14<span style="color: #000000;">
    mywork.WriteProgram()</span></pre>
</div>
</div>
<p><strong>十三、适配器模式</strong></p>
<p> <img alt="" height="255" src="http://images.cnblogs.com/cnblogs_com/wuyuegb2312/468244/o_ch13.%e9%80%82%e9%85%8d%e5%99%a8%e6%a8%a1%e5%bc%8f.png" style="display: block; margin-left: auto; margin-right: auto;" width="576"/></p>
<p>模式特点：将一个类的接口转换成为客户希望的另外一个接口。</p>
<p>程序实例：用户通过适配器使用一个类的方法。</p>
<p>代码特点：无</p>
<div class="cnblogs_code" onclick="cnblogs_code_show('a4ad00df-9be7-44ae-88f8-c6df6d40fc2f')"><img alt="" class="code_img_closed" id="code_img_closed_a4ad00df-9be7-44ae-88f8-c6df6d40fc2f" src="http://images.cnblogs.com/OutliningIndicators/ContractedBlock.gif"/><img alt="" class="code_img_opened" id="code_img_opened_a4ad00df-9be7-44ae-88f8-c6df6d40fc2f" onclick="cnblogs_code_hide('a4ad00df-9be7-44ae-88f8-c6df6d40fc2f',event)" src="http://images.cnblogs.com/OutliningIndicators/ExpandedBlockStart.gif" style="display: none;"/><span class="cnblogs_code_collapse">适配器模式</span>
<div class="cnblogs_code_hide" id="cnblogs_code_open_a4ad00df-9be7-44ae-88f8-c6df6d40fc2f">
<pre><span style="color: #0000ff;">class</span><span style="color: #000000;"> Target:
    </span><span style="color: #0000ff;">def</span><span style="color: #000000;"> Request():
        </span><span style="color: #0000ff;">print</span> <span style="color: #800000;">"</span><span style="color: #800000;">common request.</span><span style="color: #800000;">"</span>

<span style="color: #0000ff;">class</span><span style="color: #000000;"> Adaptee(Target):
    </span><span style="color: #0000ff;">def</span><span style="color: #000000;"> SpecificRequest(self):
        </span><span style="color: #0000ff;">print</span> <span style="color: #800000;">"</span><span style="color: #800000;">specific request.</span><span style="color: #800000;">"</span>

<span style="color: #0000ff;">class</span><span style="color: #000000;"> Adapter(Target):
    </span><span style="color: #0000ff;">def</span> <span style="color: #800080;">__init__</span><span style="color: #000000;">(self,ada):
        self.adaptee </span>=<span style="color: #000000;"> ada
    </span><span style="color: #0000ff;">def</span><span style="color: #000000;"> Request(self):
        self.adaptee.SpecificRequest()

</span><span style="color: #0000ff;">if</span> <span style="color: #800080;">__name__</span> == <span style="color: #800000;">"</span><span style="color: #800000;">__main__</span><span style="color: #800000;">"</span><span style="color: #000000;">:
    adaptee </span>=<span style="color: #000000;"> Adaptee()
    adapter </span>=<span style="color: #000000;"> Adapter(adaptee)
    adapter.Request()</span></pre>
</div>
</div>
<p><strong>十四、备忘录模式</strong></p>
<p><img alt="" height="227" src="http://images.cnblogs.com/cnblogs_com/wuyuegb2312/468244/o_ch14.%e5%a4%87%e5%bf%98%e5%bd%95%e6%a8%a1%e5%bc%8f.png" style="display: block; margin-left: auto; margin-right: auto;" width="523"/></p>
<p>模式特点：在不破坏封装性的前提下捕获一个对象的内部状态，并在该对象之外保存这个状态，以后可以将对象恢复到这个状态。</p>
<p>程序实例：将Originator对象的状态封装成Memo对象保存在Caretaker内</p>
<p>代码特点：无</p>
<div class="cnblogs_code" onclick="cnblogs_code_show('67bb0a6f-0504-4abe-b506-14dcbea4770d')"><img alt="" class="code_img_closed" id="code_img_closed_67bb0a6f-0504-4abe-b506-14dcbea4770d" src="http://images.cnblogs.com/OutliningIndicators/ContractedBlock.gif"/><img alt="" class="code_img_opened" id="code_img_opened_67bb0a6f-0504-4abe-b506-14dcbea4770d" onclick="cnblogs_code_hide('67bb0a6f-0504-4abe-b506-14dcbea4770d',event)" src="http://images.cnblogs.com/OutliningIndicators/ExpandedBlockStart.gif" style="display: none;"/><span class="cnblogs_code_collapse">备忘录模式</span>
<div class="cnblogs_code_hide" id="cnblogs_code_open_67bb0a6f-0504-4abe-b506-14dcbea4770d">
<pre><span style="color: #0000ff;">class</span><span style="color: #000000;"> Originator:
    </span><span style="color: #0000ff;">def</span> <span style="color: #800080;">__init__</span><span style="color: #000000;">(self):
        self.state </span>= <span style="color: #800000;">""</span>
    <span style="color: #0000ff;">def</span><span style="color: #000000;"> Show(self):
        </span><span style="color: #0000ff;">print</span><span style="color: #000000;"> self.state
    </span><span style="color: #0000ff;">def</span><span style="color: #000000;"> CreateMemo(self):
        </span><span style="color: #0000ff;">return</span><span style="color: #000000;"> Memo(self.state)
    </span><span style="color: #0000ff;">def</span><span style="color: #000000;"> SetMemo(self,memo):
        self.state </span>=<span style="color: #000000;"> memo.state

</span><span style="color: #0000ff;">class</span><span style="color: #000000;"> Memo:
    state</span>= <span style="color: #800000;">""</span>
    <span style="color: #0000ff;">def</span> <span style="color: #800080;">__init__</span><span style="color: #000000;">(self,ts):
        self.state </span>=<span style="color: #000000;"> ts

</span><span style="color: #0000ff;">class</span><span style="color: #000000;"> Caretaker:
    memo </span>= <span style="color: #800000;">""</span>

<span style="color: #0000ff;">if</span> <span style="color: #800080;">__name__</span> == <span style="color: #800000;">"</span><span style="color: #800000;">__main__</span><span style="color: #800000;">"</span><span style="color: #000000;">:
    on </span>=<span style="color: #000000;"> Originator()
    on.state </span>= <span style="color: #800000;">"</span><span style="color: #800000;">on</span><span style="color: #800000;">"</span><span style="color: #000000;">
    on.Show()
    c </span>=<span style="color: #000000;"> Caretaker()
    c.memo</span>=<span style="color: #000000;">on.CreateMemo()
    on.state</span>=<span style="color: #800000;">"</span><span style="color: #800000;">off</span><span style="color: #800000;">"</span><span style="color: #000000;">
    on.Show()
    on.SetMemo(c.memo)
    on.Show()</span></pre>
</div>
</div>
<p><strong>十五、组合模式</strong></p>
<p><strong><img alt="" height="310" src="http://images.cnblogs.com/cnblogs_com/wuyuegb2312/468244/o_ch15.%e7%bb%84%e5%90%88%e6%a8%a1%e5%bc%8f.png" style="display: block; margin-left: auto; margin-right: auto;" width="414"/></strong></p>
<p> </p>
<p>模式特点：将对象组合成成树形结构以表示“部分-整体”的层次结构</p>
<p>程序实例：公司人员的组织结构</p>
<p>代码特点：无</p>
<div class="cnblogs_code" onclick="cnblogs_code_show('f1c6bc82-1760-4214-b35c-902940ddfa95')"><img alt="" class="code_img_closed" id="code_img_closed_f1c6bc82-1760-4214-b35c-902940ddfa95" src="http://images.cnblogs.com/OutliningIndicators/ContractedBlock.gif"/><img alt="" class="code_img_opened" id="code_img_opened_f1c6bc82-1760-4214-b35c-902940ddfa95" onclick="cnblogs_code_hide('f1c6bc82-1760-4214-b35c-902940ddfa95',event)" src="http://images.cnblogs.com/OutliningIndicators/ExpandedBlockStart.gif" style="display: none;"/><span class="cnblogs_code_collapse">组合模式</span>
<div class="cnblogs_code_hide" id="cnblogs_code_open_f1c6bc82-1760-4214-b35c-902940ddfa95">
<pre><span style="color: #0000ff;">class</span><span style="color: #000000;"> Component:
    </span><span style="color: #0000ff;">def</span> <span style="color: #800080;">__init__</span><span style="color: #000000;">(self,strName):
        self.m_strName </span>=<span style="color: #000000;"> strName
    </span><span style="color: #0000ff;">def</span><span style="color: #000000;"> Add(self,com):
        </span><span style="color: #0000ff;">pass</span>
    <span style="color: #0000ff;">def</span><span style="color: #000000;"> Display(self,nDepth):
        </span><span style="color: #0000ff;">pass</span>

<span style="color: #0000ff;">class</span><span style="color: #000000;"> Leaf(Component):
    </span><span style="color: #0000ff;">def</span><span style="color: #000000;"> Add(self,com):
        </span><span style="color: #0000ff;">print</span> <span style="color: #800000;">"</span><span style="color: #800000;">leaf can't add</span><span style="color: #800000;">"</span>
    <span style="color: #0000ff;">def</span><span style="color: #000000;"> Display(self,nDepth):
        strtemp </span>= <span style="color: #800000;">""</span>
        <span style="color: #0000ff;">for</span> i <span style="color: #0000ff;">in</span><span style="color: #000000;"> range(nDepth):
            strtemp</span>=strtemp+<span style="color: #800000;">"</span><span style="color: #800000;">-</span><span style="color: #800000;">"</span><span style="color: #000000;">
        strtemp</span>=strtemp+<span style="color: #000000;">self.m_strName
        </span><span style="color: #0000ff;">print</span><span style="color: #000000;"> strtemp

</span><span style="color: #0000ff;">class</span><span style="color: #000000;"> Composite(Component):
    </span><span style="color: #0000ff;">def</span> <span style="color: #800080;">__init__</span><span style="color: #000000;">(self,strName):
        self.m_strName </span>=<span style="color: #000000;"> strName
        self.c </span>=<span style="color: #000000;"> []
    </span><span style="color: #0000ff;">def</span><span style="color: #000000;"> Add(self,com):
        self.c.append(com)
    </span><span style="color: #0000ff;">def</span><span style="color: #000000;"> Display(self,nDepth):
        strtemp</span>=<span style="color: #800000;">""</span>
        <span style="color: #0000ff;">for</span> i <span style="color: #0000ff;">in</span><span style="color: #000000;"> range(nDepth):
            strtemp</span>=strtemp+<span style="color: #800000;">"</span><span style="color: #800000;">-</span><span style="color: #800000;">"</span><span style="color: #000000;">
        strtemp</span>=strtemp+<span style="color: #000000;">self.m_strName
        </span><span style="color: #0000ff;">print</span><span style="color: #000000;"> strtemp
        </span><span style="color: #0000ff;">for</span> com <span style="color: #0000ff;">in</span><span style="color: #000000;"> self.c:
            com.Display(nDepth</span>+2<span style="color: #000000;">)

</span><span style="color: #0000ff;">if</span> <span style="color: #800080;">__name__</span> == <span style="color: #800000;">"</span><span style="color: #800000;">__main__</span><span style="color: #800000;">"</span><span style="color: #000000;">:
    p </span>= Composite(<span style="color: #800000;">"</span><span style="color: #800000;">Wong</span><span style="color: #800000;">"</span><span style="color: #000000;">)
    p.Add(Leaf(</span><span style="color: #800000;">"</span><span style="color: #800000;">Lee</span><span style="color: #800000;">"</span><span style="color: #000000;">))
    p.Add(Leaf(</span><span style="color: #800000;">"</span><span style="color: #800000;">Zhao</span><span style="color: #800000;">"</span><span style="color: #000000;">))
    p1 </span>= Composite(<span style="color: #800000;">"</span><span style="color: #800000;">Wu</span><span style="color: #800000;">"</span><span style="color: #000000;">)
    p1.Add(Leaf(</span><span style="color: #800000;">"</span><span style="color: #800000;">San</span><span style="color: #800000;">"</span><span style="color: #000000;">))
    p.Add(p1)
    p.Display(</span>1);</pre>
</div>
</div>
<p> </p>
<p><strong>十六、迭代器模式</strong></p>
<p><strong><img alt="" height="233" src="http://images.cnblogs.com/cnblogs_com/wuyuegb2312/468244/o_ch16.%e8%bf%ad%e4%bb%a3%e5%99%a8%e6%a8%a1%e5%bc%8f.png" style="display: block; margin-left: auto; margin-right: auto;" width="372"/></strong></p>
<p>模式特点：提供方法顺序访问一个聚合对象中各元素，而又不暴露该对象的内部表示</p>
<p>说明：这个模式没有写代码实现，原因是使用Python的列表和for ... in list就能够完成不同类型对象聚合的迭代功能了。</p>
<p> </p>
<p><strong>十七、单例模式</strong></p>
<p><strong><img alt="" height="86" src="http://images.cnblogs.com/cnblogs_com/wuyuegb2312/468244/o_ch17.%e5%8d%95%e4%be%8b%e6%a8%a1%e5%bc%8f.png" style="display: block; margin-left: auto; margin-right: auto;" width="512"/></strong></p>
<p> </p>
<p>模式特点：保证类仅有一个实例，并提供一个访问它的全局访问点。</p>
<p>说明：     为了实现单例模式费了不少工夫，后来查到一篇博文对此有很详细的介绍，而且实现方式也很丰富，通过对代码的学习可以了解更多Python的用法。以下的代码出自<span style="font-size: 15px;"><span style="color: #0000ff;"><a href="http://blog.csdn.net/GhostFromHeaven"><span style="color: #0000ff;">GhostFromHeaven的专栏</span></a></span>，地址：<span><span style="color: #0000ff;"><a href="http://blog.csdn.net/ghostfromheaven/article/details/7671853" target="_blank"><span style="color: #0000ff;">http://blog.csdn.net/ghostfromheaven/article/details/7671853</span></a></span>。不过正如其作者在</span></span><span class="link_title" style="font-size: 14px;"><span style="font-size: 15px; color: #0000ff;"><a href="http://blog.csdn.net/ghostfromheaven/article/details/7671914"><span style="color: #0000ff;">Python单例模式终极版</span></a></span>所说：</span></p>
<blockquote>
<p><span>我要问的是，Python真的需要单例模式吗？我指像其他编程语言中的单例模式。</span></p>
<p><span>答案是：<span><strong>不需要！</strong></span></span></p>
<p><span>因为，Python有模块（module），最pythonic的单例典范。</span></p>
<p><span>模块在在一个应用程序中只有一份，它本身就是单例的，将你所需要的属性和方法，直接暴露在模块中变成模块的全局变量和方法即可！</span></p>
</blockquote>
<p> </p>
<div class="cnblogs_code" onclick="cnblogs_code_show('a804ccfd-86bb-422d-b16c-613549f0da35')"><img alt="" class="code_img_closed" id="code_img_closed_a804ccfd-86bb-422d-b16c-613549f0da35" src="http://images.cnblogs.com/OutliningIndicators/ContractedBlock.gif"/><img alt="" class="code_img_opened" id="code_img_opened_a804ccfd-86bb-422d-b16c-613549f0da35" onclick="cnblogs_code_hide('a804ccfd-86bb-422d-b16c-613549f0da35',event)" src="http://images.cnblogs.com/OutliningIndicators/ExpandedBlockStart.gif" style="display: none;"/><span class="cnblogs_code_collapse">单例模式（四种方法）</span>
<div class="cnblogs_code_hide" id="cnblogs_code_open_a804ccfd-86bb-422d-b16c-613549f0da35">
<pre><span style="color: #008000;">#</span><span style="color: #008000;">-*- encoding=utf-8 -*-</span>
<span style="color: #0000ff;">print</span> <span style="color: #800000;">'</span><span style="color: #800000;">----------------------方法1--------------------------</span><span style="color: #800000;">'</span>
<span style="color: #008000;">#</span><span style="color: #008000;">方法1,实现__new__方法</span><span style="color: #008000;">
#</span><span style="color: #008000;">并在将一个类的实例绑定到类变量_instance上,</span><span style="color: #008000;">
#</span><span style="color: #008000;">如果cls._instance为None说明该类还没有实例化过,实例化该类,并返回</span><span style="color: #008000;">
#</span><span style="color: #008000;">如果cls._instance不为None,直接返回cls._instance</span>
<span style="color: #0000ff;">class</span><span style="color: #000000;"> Singleton(object):
    </span><span style="color: #0000ff;">def</span> <span style="color: #800080;">__new__</span>(cls, *args, **<span style="color: #000000;">kw):
        </span><span style="color: #0000ff;">if</span> <span style="color: #0000ff;">not</span> hasattr(cls, <span style="color: #800000;">'</span><span style="color: #800000;">_instance</span><span style="color: #800000;">'</span><span style="color: #000000;">):
            orig </span>=<span style="color: #000000;"> super(Singleton, cls)
            cls._instance </span>= orig.<span style="color: #800080;">__new__</span>(cls, *args, **<span style="color: #000000;">kw)
        </span><span style="color: #0000ff;">return</span><span style="color: #000000;"> cls._instance

</span><span style="color: #0000ff;">class</span><span style="color: #000000;"> MyClass(Singleton):
    a </span>= 1<span style="color: #000000;">

one </span>=<span style="color: #000000;"> MyClass()
two </span>=<span style="color: #000000;"> MyClass()

two.a </span>= 3
<span style="color: #0000ff;">print</span><span style="color: #000000;"> one.a
</span><span style="color: #008000;">#</span><span style="color: #008000;">3</span><span style="color: #008000;">
#</span><span style="color: #008000;">one和two完全相同,可以用id(), ==, is检测</span>
<span style="color: #0000ff;">print</span><span style="color: #000000;"> id(one)
</span><span style="color: #008000;">#</span><span style="color: #008000;">29097904</span>
<span style="color: #0000ff;">print</span><span style="color: #000000;"> id(two)
</span><span style="color: #008000;">#</span><span style="color: #008000;">29097904</span>
<span style="color: #0000ff;">print</span> one ==<span style="color: #000000;"> two
</span><span style="color: #008000;">#</span><span style="color: #008000;">True</span>
<span style="color: #0000ff;">print</span> one <span style="color: #0000ff;">is</span><span style="color: #000000;"> two
</span><span style="color: #008000;">#</span><span style="color: #008000;">True</span>

<span style="color: #0000ff;">print</span> <span style="color: #800000;">'</span><span style="color: #800000;">----------------------方法2--------------------------</span><span style="color: #800000;">'</span>
<span style="color: #008000;">#</span><span style="color: #008000;">方法2,共享属性;所谓单例就是所有引用(实例、对象)拥有相同的状态(属性)和行为(方法)</span><span style="color: #008000;">
#</span><span style="color: #008000;">同一个类的所有实例天然拥有相同的行为(方法),</span><span style="color: #008000;">
#</span><span style="color: #008000;">只需要保证同一个类的所有实例具有相同的状态(属性)即可</span><span style="color: #008000;">
#</span><span style="color: #008000;">所有实例共享属性的最简单最直接的方法就是__dict__属性指向(引用)同一个字典(dict)</span><span style="color: #008000;">
#</span><span style="color: #008000;">可参看:http://code.activestate.com/recipes/66531/</span>
<span style="color: #0000ff;">class</span><span style="color: #000000;"> Borg(object):
    _state </span>=<span style="color: #000000;"> {}
    </span><span style="color: #0000ff;">def</span> <span style="color: #800080;">__new__</span>(cls, *args, **<span style="color: #000000;">kw):
        ob </span>= super(Borg, cls).<span style="color: #800080;">__new__</span>(cls, *args, **<span style="color: #000000;">kw)
        ob.</span><span style="color: #800080;">__dict__</span> =<span style="color: #000000;"> cls._state
        </span><span style="color: #0000ff;">return</span><span style="color: #000000;"> ob

</span><span style="color: #0000ff;">class</span><span style="color: #000000;"> MyClass2(Borg):
    a </span>= 1<span style="color: #000000;">

one </span>=<span style="color: #000000;"> MyClass2()
two </span>=<span style="color: #000000;"> MyClass2()

</span><span style="color: #008000;">#</span><span style="color: #008000;">one和two是两个不同的对象,id, ==, is对比结果可看出</span>
two.a = 3
<span style="color: #0000ff;">print</span><span style="color: #000000;"> one.a
</span><span style="color: #008000;">#</span><span style="color: #008000;">3</span>
<span style="color: #0000ff;">print</span><span style="color: #000000;"> id(one)
</span><span style="color: #008000;">#</span><span style="color: #008000;">28873680</span>
<span style="color: #0000ff;">print</span><span style="color: #000000;"> id(two)
</span><span style="color: #008000;">#</span><span style="color: #008000;">28873712</span>
<span style="color: #0000ff;">print</span> one ==<span style="color: #000000;"> two
</span><span style="color: #008000;">#</span><span style="color: #008000;">False</span>
<span style="color: #0000ff;">print</span> one <span style="color: #0000ff;">is</span><span style="color: #000000;"> two
</span><span style="color: #008000;">#</span><span style="color: #008000;">False</span><span style="color: #008000;">
#</span><span style="color: #008000;">但是one和two具有相同的（同一个__dict__属性）,见:</span>
<span style="color: #0000ff;">print</span> id(one.<span style="color: #800080;">__dict__</span><span style="color: #000000;">)
</span><span style="color: #008000;">#</span><span style="color: #008000;">30104000</span>
<span style="color: #0000ff;">print</span> id(two.<span style="color: #800080;">__dict__</span><span style="color: #000000;">)
</span><span style="color: #008000;">#</span><span style="color: #008000;">30104000</span>

<span style="color: #0000ff;">print</span> <span style="color: #800000;">'</span><span style="color: #800000;">----------------------方法3--------------------------</span><span style="color: #800000;">'</span>
<span style="color: #008000;">#</span><span style="color: #008000;">方法3:本质上是方法1的升级（或者说高级）版</span><span style="color: #008000;">
#</span><span style="color: #008000;">使用__metaclass__（元类）的高级python用法</span>
<span style="color: #0000ff;">class</span><span style="color: #000000;"> Singleton2(type):
    </span><span style="color: #0000ff;">def</span> <span style="color: #800080;">__init__</span><span style="color: #000000;">(cls, name, bases, dict):
        super(Singleton2, cls).</span><span style="color: #800080;">__init__</span><span style="color: #000000;">(name, bases, dict)
        cls._instance </span>=<span style="color: #000000;"> None
    </span><span style="color: #0000ff;">def</span> <span style="color: #800080;">__call__</span>(cls, *args, **<span style="color: #000000;">kw):
        </span><span style="color: #0000ff;">if</span> cls._instance <span style="color: #0000ff;">is</span><span style="color: #000000;"> None:
            cls._instance </span>= super(Singleton2, cls).<span style="color: #800080;">__call__</span>(*args, **<span style="color: #000000;">kw)
        </span><span style="color: #0000ff;">return</span><span style="color: #000000;"> cls._instance

</span><span style="color: #0000ff;">class</span><span style="color: #000000;"> MyClass3(object):
    </span><span style="color: #800080;">__metaclass__</span> =<span style="color: #000000;"> Singleton2

one </span>=<span style="color: #000000;"> MyClass3()
two </span>=<span style="color: #000000;"> MyClass3()

two.a </span>= 3
<span style="color: #0000ff;">print</span><span style="color: #000000;"> one.a
</span><span style="color: #008000;">#</span><span style="color: #008000;">3</span>
<span style="color: #0000ff;">print</span><span style="color: #000000;"> id(one)
</span><span style="color: #008000;">#</span><span style="color: #008000;">31495472</span>
<span style="color: #0000ff;">print</span><span style="color: #000000;"> id(two)
</span><span style="color: #008000;">#</span><span style="color: #008000;">31495472</span>
<span style="color: #0000ff;">print</span> one ==<span style="color: #000000;"> two
</span><span style="color: #008000;">#</span><span style="color: #008000;">True</span>
<span style="color: #0000ff;">print</span> one <span style="color: #0000ff;">is</span><span style="color: #000000;"> two
</span><span style="color: #008000;">#</span><span style="color: #008000;">True</span>

<span style="color: #0000ff;">print</span> <span style="color: #800000;">'</span><span style="color: #800000;">----------------------方法4--------------------------</span><span style="color: #800000;">'</span>
<span style="color: #008000;">#</span><span style="color: #008000;">方法4:也是方法1的升级（高级）版本,</span><span style="color: #008000;">
#</span><span style="color: #008000;">使用装饰器(decorator),</span><span style="color: #008000;">
#</span><span style="color: #008000;">这是一种更pythonic,更elegant的方法,</span><span style="color: #008000;">
#</span><span style="color: #008000;">单例类本身根本不知道自己是单例的,因为他本身(自己的代码)并不是单例的</span>
<span style="color: #0000ff;">def</span> singleton(cls, *args, **<span style="color: #000000;">kw):
    instances </span>=<span style="color: #000000;"> {}
    </span><span style="color: #0000ff;">def</span><span style="color: #000000;"> _singleton():
        </span><span style="color: #0000ff;">if</span> cls <span style="color: #0000ff;">not</span> <span style="color: #0000ff;">in</span><span style="color: #000000;"> instances:
            instances[cls] </span>= cls(*args, **<span style="color: #000000;">kw)
        </span><span style="color: #0000ff;">return</span><span style="color: #000000;"> instances[cls]
    </span><span style="color: #0000ff;">return</span><span style="color: #000000;"> _singleton

@singleton
</span><span style="color: #0000ff;">class</span><span style="color: #000000;"> MyClass4(object):
    a </span>= 1
    <span style="color: #0000ff;">def</span> <span style="color: #800080;">__init__</span>(self, x=<span style="color: #000000;">0):
        self.x </span>=<span style="color: #000000;"> x

one </span>=<span style="color: #000000;"> MyClass4()
two </span>=<span style="color: #000000;"> MyClass4()

two.a </span>= 3
<span style="color: #0000ff;">print</span><span style="color: #000000;"> one.a
</span><span style="color: #008000;">#</span><span style="color: #008000;">3</span>
<span style="color: #0000ff;">print</span><span style="color: #000000;"> id(one)
</span><span style="color: #008000;">#</span><span style="color: #008000;">29660784</span>
<span style="color: #0000ff;">print</span><span style="color: #000000;"> id(two)
</span><span style="color: #008000;">#</span><span style="color: #008000;">29660784</span>
<span style="color: #0000ff;">print</span> one ==<span style="color: #000000;"> two
</span><span style="color: #008000;">#</span><span style="color: #008000;">True</span>
<span style="color: #0000ff;">print</span> one <span style="color: #0000ff;">is</span><span style="color: #000000;"> two
</span><span style="color: #008000;">#</span><span style="color: #008000;">True</span>
one.x = 1
<span style="color: #0000ff;">print</span><span style="color: #000000;"> one.x
</span><span style="color: #008000;">#</span><span style="color: #008000;">1</span>
<span style="color: #0000ff;">print</span><span style="color: #000000;"> two.x
</span><span style="color: #008000;">#</span><span style="color: #008000;">1</span></pre>
</div>
</div>
<p> </p>
<p><span style="color: #000000;"><strong>十八、桥接模式</strong></span></p>
<p><span style="color: #000000;"><strong><img alt="" height="229" src="http://images.cnblogs.com/cnblogs_com/wuyuegb2312/468244/o_ch18.%e6%a1%a5%e6%8e%a5%e6%a8%a1%e5%bc%8f.png" style="display: block; margin-left: auto; margin-right: auto;" width="489"/></strong></span></p>
<p> </p>
<p>模式特点：将抽象部分与它的实现部分分离，使它们都可以独立地变化。</p>
<p>程序实例：两种品牌的手机，要求它们都可以运行游戏和通讯录两个软件，而不是为每个品牌的手机都独立编写不同的软件。</p>
<p>代码特点：虽然使用了object的新型类，不过在这里不是必须的，是对在Python2.2之后“尽量使用新型类”的建议的遵从示范。</p>
<div class="cnblogs_code" onclick="cnblogs_code_show('bb38a7a1-27ae-4f62-b7a3-7dd087cd393e')"><img alt="" class="code_img_closed" id="code_img_closed_bb38a7a1-27ae-4f62-b7a3-7dd087cd393e" src="http://images.cnblogs.com/OutliningIndicators/ContractedBlock.gif"/><img alt="" class="code_img_opened" id="code_img_opened_bb38a7a1-27ae-4f62-b7a3-7dd087cd393e" onclick="cnblogs_code_hide('bb38a7a1-27ae-4f62-b7a3-7dd087cd393e',event)" src="http://images.cnblogs.com/OutliningIndicators/ExpandedBlockStart.gif" style="display: none;"/><span class="cnblogs_code_collapse">桥接模式</span>
<div class="cnblogs_code_hide" id="cnblogs_code_open_bb38a7a1-27ae-4f62-b7a3-7dd087cd393e">
<pre><span style="color: #0000ff;">class</span><span style="color: #000000;"> HandsetSoft(object):
    </span><span style="color: #0000ff;">def</span><span style="color: #000000;"> Run(self):
        </span><span style="color: #0000ff;">pass</span>

<span style="color: #0000ff;">class</span><span style="color: #000000;"> HandsetGame(HandsetSoft):
    </span><span style="color: #0000ff;">def</span><span style="color: #000000;"> Run(self):
        </span><span style="color: #0000ff;">print</span> <span style="color: #800000;">"</span><span style="color: #800000;">Game</span><span style="color: #800000;">"</span>

<span style="color: #0000ff;">class</span><span style="color: #000000;"> HandsetAddressList(HandsetSoft):
    </span><span style="color: #0000ff;">def</span><span style="color: #000000;"> Run(self):
        </span><span style="color: #0000ff;">print</span> <span style="color: #800000;">"</span><span style="color: #800000;">Address List</span><span style="color: #800000;">"</span>

<span style="color: #0000ff;">class</span><span style="color: #000000;"> HandsetBrand(object):
    </span><span style="color: #0000ff;">def</span> <span style="color: #800080;">__init__</span><span style="color: #000000;">(self):
        self.m_soft </span>=<span style="color: #000000;"> None
    </span><span style="color: #0000ff;">def</span><span style="color: #000000;"> SetHandsetSoft(self,temp):
        self.m_soft</span>=<span style="color: #000000;"> temp
    </span><span style="color: #0000ff;">def</span><span style="color: #000000;"> Run(self):
        </span><span style="color: #0000ff;">pass</span>

<span style="color: #0000ff;">class</span><span style="color: #000000;"> HandsetBrandM(HandsetBrand):
    </span><span style="color: #0000ff;">def</span><span style="color: #000000;"> Run(self):
        </span><span style="color: #0000ff;">if</span> <span style="color: #0000ff;">not</span> (self.m_soft ==<span style="color: #000000;"> None):
            </span><span style="color: #0000ff;">print</span> <span style="color: #800000;">"</span><span style="color: #800000;">BrandM</span><span style="color: #800000;">"</span><span style="color: #000000;">
            self.m_soft.Run()

</span><span style="color: #0000ff;">class</span><span style="color: #000000;"> HandsetBrandN(HandsetBrand):
    </span><span style="color: #0000ff;">def</span><span style="color: #000000;"> Run(self):
        </span><span style="color: #0000ff;">if</span> <span style="color: #0000ff;">not</span> (self.m_soft ==<span style="color: #000000;"> None):
            </span><span style="color: #0000ff;">print</span> <span style="color: #800000;">"</span><span style="color: #800000;">BrandN</span><span style="color: #800000;">"</span><span style="color: #000000;">
            self.m_soft.Run()

</span><span style="color: #0000ff;">if</span> <span style="color: #800080;">__name__</span> == <span style="color: #800000;">"</span><span style="color: #800000;">__main__</span><span style="color: #800000;">"</span><span style="color: #000000;">:
    brand </span>=<span style="color: #000000;"> HandsetBrandM()
    brand.SetHandsetSoft(HandsetGame())
    brand.Run()
    brand.SetHandsetSoft(HandsetAddressList())
    brand.Run()    </span></pre>
</div>
</div>
<p> </p>
<p><strong>十九、命令模式</strong></p>
<p><img alt="" height="258" src="http://images.cnblogs.com/cnblogs_com/wuyuegb2312/468244/o_ch19.%e5%91%bd%e4%bb%a4%e6%a8%a1%e5%bc%8f.png" style="display: block; margin-left: auto; margin-right: auto;" width="404"/></p>
<p>模式特点：将请求封装成对象，从而使可用不同的请求对客户进行参数化；对请求排队或记录请求日志，以及支持可撤消的操作。</p>
<p>程序实例：烧烤店有两种食物，羊肉串和鸡翅。客户向服务员点单，服务员将点好的单告诉大厨，由大厨进行烹饪。</p>
<p>代码特点：注意在遍历列表时不要用注释的方式删除，否则会出现bug。bug示例程序附在后面，我认为这是因为remove打乱了for迭代查询列表的顺序导致的。</p>
<div class="cnblogs_code" onclick="cnblogs_code_show('fb45739c-ad58-4b9c-93ec-cfbf5999af66')"><img alt="" class="code_img_closed" id="code_img_closed_fb45739c-ad58-4b9c-93ec-cfbf5999af66" src="http://images.cnblogs.com/OutliningIndicators/ContractedBlock.gif"/><img alt="" class="code_img_opened" id="code_img_opened_fb45739c-ad58-4b9c-93ec-cfbf5999af66" onclick="cnblogs_code_hide('fb45739c-ad58-4b9c-93ec-cfbf5999af66',event)" src="http://images.cnblogs.com/OutliningIndicators/ExpandedBlockStart.gif" style="display: none;"/><span class="cnblogs_code_collapse">命令模式</span>
<div class="cnblogs_code_hide" id="cnblogs_code_open_fb45739c-ad58-4b9c-93ec-cfbf5999af66">
<pre><span style="color: #0000ff;">class</span><span style="color: #000000;"> Barbucer:
    </span><span style="color: #0000ff;">def</span><span style="color: #000000;"> MakeMutton(self):
        </span><span style="color: #0000ff;">print</span> <span style="color: #800000;">"</span><span style="color: #800000;">Mutton</span><span style="color: #800000;">"</span>
    <span style="color: #0000ff;">def</span><span style="color: #000000;"> MakeChickenWing(self):
        </span><span style="color: #0000ff;">print</span> <span style="color: #800000;">"</span><span style="color: #800000;">Chicken Wing</span><span style="color: #800000;">"</span>

<span style="color: #0000ff;">class</span><span style="color: #000000;"> Command:
    </span><span style="color: #0000ff;">def</span> <span style="color: #800080;">__init__</span><span style="color: #000000;">(self,temp):
        self.receiver</span>=<span style="color: #000000;">temp
    </span><span style="color: #0000ff;">def</span><span style="color: #000000;"> ExecuteCmd(self):
        </span><span style="color: #0000ff;">pass</span>

<span style="color: #0000ff;">class</span><span style="color: #000000;"> BakeMuttonCmd(Command):
    </span><span style="color: #0000ff;">def</span><span style="color: #000000;"> ExecuteCmd(self):
        self.receiver.MakeMutton()

</span><span style="color: #0000ff;">class</span><span style="color: #000000;"> ChickenWingCmd(Command):
    </span><span style="color: #0000ff;">def</span><span style="color: #000000;"> ExecuteCmd(self):
        self.receiver.MakeChickenWing()

</span><span style="color: #0000ff;">class</span><span style="color: #000000;"> Waiter:
    </span><span style="color: #0000ff;">def</span> <span style="color: #800080;">__init__</span><span style="color: #000000;">(self):
        self.order </span>=<span style="color: #000000;">[]
    </span><span style="color: #0000ff;">def</span><span style="color: #000000;"> SetCmd(self,command):
        self.order.append(command)
        </span><span style="color: #0000ff;">print</span> <span style="color: #800000;">"</span><span style="color: #800000;">Add Order</span><span style="color: #800000;">"</span>
    <span style="color: #0000ff;">def</span><span style="color: #000000;"> Notify(self):
        </span><span style="color: #0000ff;">for</span> cmd <span style="color: #0000ff;">in</span><span style="color: #000000;"> self.order:
            </span><span style="color: #008000;">#</span><span style="color: #008000;">self.order.remove(cmd)</span>
            <span style="color: #008000;">#</span><span style="color: #008000;">lead to a bug</span>
<span style="color: #000000;">            cmd.ExecuteCmd()
            

</span><span style="color: #0000ff;">if</span> <span style="color: #800080;">__name__</span> == <span style="color: #800000;">"</span><span style="color: #800000;">__main__</span><span style="color: #800000;">"</span><span style="color: #000000;">:
    barbucer</span>=<span style="color: #000000;">Barbucer()
    cmd</span>=<span style="color: #000000;">BakeMuttonCmd(barbucer)
    cmd2</span>=<span style="color: #000000;">ChickenWingCmd(barbucer)
    girl</span>=<span style="color: #000000;">Waiter()
    girl.SetCmd(cmd)
    girl.SetCmd(cmd2)
    girl.Notify()</span></pre>
</div>
</div>
<p>在for中remove会导致bug的展示代码：</p>
<div class="cnblogs_code" onclick="cnblogs_code_show('435dec72-d26a-40b8-ad22-616d75fe6be3')"><img alt="" class="code_img_closed" id="code_img_closed_435dec72-d26a-40b8-ad22-616d75fe6be3" src="http://images.cnblogs.com/OutliningIndicators/ContractedBlock.gif"/><img alt="" class="code_img_opened" id="code_img_opened_435dec72-d26a-40b8-ad22-616d75fe6be3" onclick="cnblogs_code_hide('435dec72-d26a-40b8-ad22-616d75fe6be3',event)" src="http://images.cnblogs.com/OutliningIndicators/ExpandedBlockStart.gif" style="display: none;"/><span class="cnblogs_code_collapse">bug</span>
<div class="cnblogs_code_hide" id="cnblogs_code_open_435dec72-d26a-40b8-ad22-616d75fe6be3">
<pre>c=[0,1,2,3<span style="color: #000000;">]
</span><span style="color: #0000ff;">for</span> i <span style="color: #0000ff;">in</span><span style="color: #000000;"> c:
    </span><span style="color: #0000ff;">print</span><span style="color: #000000;"> i
    c.remove(i)

</span><span style="color: #008000;">#</span><span style="color: #008000;">output:</span><span style="color: #008000;">
#</span><span style="color: #008000;">0</span><span style="color: #008000;">
#</span><span style="color: #008000;">2</span></pre>
</div>
</div>
<p> </p>
<p><strong>二十、职责链模式</strong></p>
<p><strong><img alt="" height="288" src="http://images.cnblogs.com/cnblogs_com/wuyuegb2312/468244/o_ch20.%e8%81%8c%e8%b4%a3%e9%93%be%e6%a8%a1%e5%bc%8f.png" style="display: block; margin-left: auto; margin-right: auto;" width="443"/></strong></p>
<p>模式特点：使多个对象都有机会处理请求，从而避免发送者和接收者的耦合关系。将对象连成链并沿着这条链传递请求直到被处理。</p>
<p>程序实例：请假和加薪等请求发给上级，如果上级无权决定，那么递交给上级的上级。</p>
<p>代码特点：无</p>
<div class="cnblogs_code" onclick="cnblogs_code_show('14f60f42-5dcd-4231-a077-afb6b858dac4')"><img alt="" class="code_img_closed" id="code_img_closed_14f60f42-5dcd-4231-a077-afb6b858dac4" src="http://images.cnblogs.com/OutliningIndicators/ContractedBlock.gif"/><img alt="" class="code_img_opened" id="code_img_opened_14f60f42-5dcd-4231-a077-afb6b858dac4" onclick="cnblogs_code_hide('14f60f42-5dcd-4231-a077-afb6b858dac4',event)" src="http://images.cnblogs.com/OutliningIndicators/ExpandedBlockStart.gif" style="display: none;"/><span class="cnblogs_code_collapse">职责链模式</span>
<div class="cnblogs_code_hide" id="cnblogs_code_open_14f60f42-5dcd-4231-a077-afb6b858dac4">
<pre><span style="color: #0000ff;">class</span><span style="color: #000000;"> Request:
    </span><span style="color: #0000ff;">def</span> <span style="color: #800080;">__init__</span><span style="color: #000000;">(self,tcontent,tnum):
        self.content </span>=<span style="color: #000000;"> tcontent
        self.num </span>=<span style="color: #000000;"> tnum

</span><span style="color: #0000ff;">class</span><span style="color: #000000;"> Manager:
    </span><span style="color: #0000ff;">def</span> <span style="color: #800080;">__init__</span><span style="color: #000000;">(self,temp):
        self.name </span>=<span style="color: #000000;"> temp
    </span><span style="color: #0000ff;">def</span><span style="color: #000000;"> SetSuccessor(self,temp):
        self.manager </span>=<span style="color: #000000;"> temp
    </span><span style="color: #0000ff;">def</span><span style="color: #000000;"> GetRequest(self,req):
        </span><span style="color: #0000ff;">pass</span>

<span style="color: #0000ff;">class</span><span style="color: #000000;"> CommonManager(Manager):
    </span><span style="color: #0000ff;">def</span><span style="color: #000000;"> GetRequest(self,req):
        </span><span style="color: #0000ff;">if</span>(req.num&gt;=0 <span style="color: #0000ff;">and</span> req.num&lt;10<span style="color: #000000;">):
            </span><span style="color: #0000ff;">print</span> <span style="color: #800000;">"</span><span style="color: #800000;">%s handled %d request.</span><span style="color: #800000;">"</span> %<span style="color: #000000;">(self.name,req.num)
        </span><span style="color: #0000ff;">else</span><span style="color: #000000;">:
            self.manager.GetRequest(req)

</span><span style="color: #0000ff;">class</span><span style="color: #000000;"> MajorDomo(Manager):
    </span><span style="color: #0000ff;">def</span><span style="color: #000000;"> GetRequest(self,req):
        </span><span style="color: #0000ff;">if</span>(req.num&gt;=10<span style="color: #000000;">):
            </span><span style="color: #0000ff;">print</span> <span style="color: #800000;">"</span><span style="color: #800000;">%s handled %d request.</span><span style="color: #800000;">"</span> %<span style="color: #000000;">(self.name,req.num)

</span><span style="color: #0000ff;">if</span> <span style="color: #800080;">__name__</span> == <span style="color: #800000;">"</span><span style="color: #800000;">__main__</span><span style="color: #800000;">"</span><span style="color: #000000;">:
    common </span>= CommonManager(<span style="color: #800000;">"</span><span style="color: #800000;">Zhang</span><span style="color: #800000;">"</span><span style="color: #000000;">)
    major </span>= MajorDomo(<span style="color: #800000;">"</span><span style="color: #800000;">Lee</span><span style="color: #800000;">"</span><span style="color: #000000;">)
    common.SetSuccessor(major)
    req </span>= Request(<span style="color: #800000;">"</span><span style="color: #800000;">rest</span><span style="color: #800000;">"</span>,33<span style="color: #000000;">)
    common.GetRequest(req)
    req2 </span>= Request(<span style="color: #800000;">"</span><span style="color: #800000;">salary</span><span style="color: #800000;">"</span>,3<span style="color: #000000;">)
    common.GetRequest(req2)</span></pre>
</div>
</div>
<p> </p>
<p><strong>二十一、中介者模式</strong></p>
<p><strong><img alt="" height="249" src="http://images.cnblogs.com/cnblogs_com/wuyuegb2312/468244/o_ch22.%e4%ba%ab%e5%85%83%e6%a8%a1%e5%bc%8f.png" style="display: block; margin-left: auto; margin-right: auto;" width="482"/></strong>模式特点：用一个对象来封装一系列的对象交互，中介者使各对象不需要显示地相互引用，从而使耦合松散，而且可以独立地改变它们之间的交互。</p>
<p>程序实例：两个对象通过中介者相互通信</p>
<p>代码特点：无</p>
<div class="cnblogs_code" onclick="cnblogs_code_show('a7129b7a-4a08-4f39-924d-01412676f9cf')"><img alt="" class="code_img_closed" id="code_img_closed_a7129b7a-4a08-4f39-924d-01412676f9cf" src="http://images.cnblogs.com/OutliningIndicators/ContractedBlock.gif"/><img alt="" class="code_img_opened" id="code_img_opened_a7129b7a-4a08-4f39-924d-01412676f9cf" onclick="cnblogs_code_hide('a7129b7a-4a08-4f39-924d-01412676f9cf',event)" src="http://images.cnblogs.com/OutliningIndicators/ExpandedBlockStart.gif" style="display: none;"/><span class="cnblogs_code_collapse">中介者模式</span>
<div class="cnblogs_code_hide" id="cnblogs_code_open_a7129b7a-4a08-4f39-924d-01412676f9cf">
<pre><span style="color: #0000ff;">class</span><span style="color: #000000;"> Mediator:
    </span><span style="color: #0000ff;">def</span><span style="color: #000000;"> Send(self,message,col):
        </span><span style="color: #0000ff;">pass</span>

<span style="color: #0000ff;">class</span><span style="color: #000000;"> Colleague:
    </span><span style="color: #0000ff;">def</span> <span style="color: #800080;">__init__</span><span style="color: #000000;">(self,temp):
        self.mediator </span>=<span style="color: #000000;"> temp

</span><span style="color: #0000ff;">class</span><span style="color: #000000;"> Colleague1(Colleague):
    </span><span style="color: #0000ff;">def</span><span style="color: #000000;"> Send(self,message):
        self.mediator.Send(message,self)
    </span><span style="color: #0000ff;">def</span><span style="color: #000000;"> Notify(self,message):
        </span><span style="color: #0000ff;">print</span> <span style="color: #800000;">"</span><span style="color: #800000;">Colleague1 get a message:%s</span><span style="color: #800000;">"</span> %<span style="color: #000000;">message

</span><span style="color: #0000ff;">class</span><span style="color: #000000;"> Colleague2(Colleague):
    </span><span style="color: #0000ff;">def</span><span style="color: #000000;"> Send(self,message):
        self.mediator.Send(message,self)
    </span><span style="color: #0000ff;">def</span><span style="color: #000000;"> Notify(self,message):
        </span><span style="color: #0000ff;">print</span> <span style="color: #800000;">"</span><span style="color: #800000;">Colleague2 get a message:%s</span><span style="color: #800000;">"</span> %<span style="color: #000000;">message

</span><span style="color: #0000ff;">class</span><span style="color: #000000;"> ConcreteMediator(Mediator):
    </span><span style="color: #0000ff;">def</span><span style="color: #000000;"> Send(self,message,col):
        </span><span style="color: #0000ff;">if</span>(col==<span style="color: #000000;">col1):
            col2.Notify(message)
        </span><span style="color: #0000ff;">else</span><span style="color: #000000;">:
            col1.Notify(message)

</span><span style="color: #0000ff;">if</span> <span style="color: #800080;">__name__</span> == <span style="color: #800000;">"</span><span style="color: #800000;">__main__</span><span style="color: #800000;">"</span><span style="color: #000000;">:
    m </span>=<span style="color: #000000;">ConcreteMediator()
    col1 </span>=<span style="color: #000000;"> Colleague1(m)
    col2 </span>=<span style="color: #000000;"> Colleague1(m)
    m.col1</span>=<span style="color: #000000;">col1
    m.col2</span>=<span style="color: #000000;">col2
    col1.Send(</span><span style="color: #800000;">"</span><span style="color: #800000;">How are you?</span><span style="color: #800000;">"</span><span style="color: #000000;">);
    col2.Send(</span><span style="color: #800000;">"</span><span style="color: #800000;">Fine.</span><span style="color: #800000;">"</span>);</pre>
</div>
</div>
<p> </p>
<p><strong>二十二、享元模式</strong></p>
<p> <img alt="" height="265" src="http://images.cnblogs.com/cnblogs_com/wuyuegb2312/468244/o_ch22.%e4%ba%ab%e5%85%83%e6%a8%a1%e5%bc%8f.png" style="display: block; margin-left: auto; margin-right: auto;" width="513"/></p>
<p>模式特点：运用共享技术有效地支持大量细粒度的对象。</p>
<p>程序实例：一个网站工厂，根据用户请求的类别返回相应类别的网站。如果这种类别的网站已经在服务器上，那么返回这种网站并加上不同用户的独特的数据；如果没有，那么生成一个。</p>
<p>代码特点：为了展示每种网站的由用户请求的次数，这里为它们建立了一个引用次数的字典。</p>
<p>　　　　　　之所以不用Python的sys<span>模块中的sys.getrefcount()方法统计引用计数是因为有的对象可能在别处被隐式的引用，从而增加了引用计数。</span><span style="line-height: 1.5;"> </span></p>
<div class="cnblogs_code" onclick="cnblogs_code_show('d7d50499-f84f-4908-ac78-5b5ab1f08085')"><img alt="" class="code_img_closed" id="code_img_closed_d7d50499-f84f-4908-ac78-5b5ab1f08085" src="http://images.cnblogs.com/OutliningIndicators/ContractedBlock.gif"/><img alt="" class="code_img_opened" id="code_img_opened_d7d50499-f84f-4908-ac78-5b5ab1f08085" onclick="cnblogs_code_hide('d7d50499-f84f-4908-ac78-5b5ab1f08085',event)" src="http://images.cnblogs.com/OutliningIndicators/ExpandedBlockStart.gif" style="display: none;"/><span class="cnblogs_code_collapse">享元模式</span>
<div class="cnblogs_code_hide" id="cnblogs_code_open_d7d50499-f84f-4908-ac78-5b5ab1f08085">
<pre><span style="color: #0000ff;">import</span><span style="color: #000000;"> sys

</span><span style="color: #0000ff;">class</span><span style="color: #000000;"> WebSite:
    </span><span style="color: #0000ff;">def</span><span style="color: #000000;"> Use(self):
        </span><span style="color: #0000ff;">pass</span>

<span style="color: #0000ff;">class</span><span style="color: #000000;"> ConcreteWebSite(WebSite):
    </span><span style="color: #0000ff;">def</span> <span style="color: #800080;">__init__</span><span style="color: #000000;">(self,strName):
        self.name </span>=<span style="color: #000000;"> strName
    </span><span style="color: #0000ff;">def</span><span style="color: #000000;"> Use(self,user):
        </span><span style="color: #0000ff;">print</span> <span style="color: #800000;">"</span><span style="color: #800000;">Website type:%s,user:%s</span><span style="color: #800000;">"</span> %<span style="color: #000000;">(self.name,user)

</span><span style="color: #0000ff;">class</span><span style="color: #000000;"> UnShareWebSite(WebSite):
    </span><span style="color: #0000ff;">def</span> <span style="color: #800080;">__init__</span><span style="color: #000000;">(self,strName):
        self.name </span>=<span style="color: #000000;"> strName
    </span><span style="color: #0000ff;">def</span><span style="color: #000000;"> Use(self,user):
        </span><span style="color: #0000ff;">print</span> <span style="color: #800000;">"</span><span style="color: #800000;">UnShare Website type:%s,user:%s</span><span style="color: #800000;">"</span> %<span style="color: #000000;">(self.name, user)

</span><span style="color: #0000ff;">class</span><span style="color: #000000;"> WebFactory:
    </span><span style="color: #0000ff;">def</span> <span style="color: #800080;">__init__</span><span style="color: #000000;">(self):
        test </span>= ConcreteWebSite(<span style="color: #800000;">"</span><span style="color: #800000;">test</span><span style="color: #800000;">"</span><span style="color: #000000;">)
        self.webtype </span>={<span style="color: #800000;">"</span><span style="color: #800000;">test</span><span style="color: #800000;">"</span><span style="color: #000000;">:test}
        self.count </span>= {<span style="color: #800000;">"</span><span style="color: #800000;">test</span><span style="color: #800000;">"</span><span style="color: #000000;">:0}
    </span><span style="color: #0000ff;">def</span><span style="color: #000000;"> GetWeb(self,webtype):
        </span><span style="color: #0000ff;">if</span> webtype <span style="color: #0000ff;">not</span> <span style="color: #0000ff;">in</span><span style="color: #000000;"> self.webtype:
            temp </span>=<span style="color: #000000;"> ConcreteWebSite(webtype)
            self.webtype[webtype] </span>=<span style="color: #000000;"> temp
            self.count[webtype] </span>=1
        <span style="color: #0000ff;">else</span><span style="color: #000000;">:
            temp </span>=<span style="color: #000000;"> self.webtype[webtype]
            self.count[webtype] </span>= self.count[webtype]+1
        <span style="color: #0000ff;">return</span><span style="color: #000000;"> temp
    </span><span style="color: #0000ff;">def</span><span style="color: #000000;"> GetCount(self):
        </span><span style="color: #0000ff;">for</span> key <span style="color: #0000ff;">in</span><span style="color: #000000;"> self.webtype:
            </span><span style="color: #008000;">#</span><span style="color: #008000;">print "type: %s, count:%d" %(key,sys.getrefcount(self.webtype[key]))</span>
            <span style="color: #0000ff;">print</span> <span style="color: #800000;">"</span><span style="color: #800000;">type: %s, count:%d </span><span style="color: #800000;">"</span> %<span style="color: #000000;">(key,self.count[key])

</span><span style="color: #0000ff;">if</span> <span style="color: #800080;">__name__</span> == <span style="color: #800000;">"</span><span style="color: #800000;">__main__</span><span style="color: #800000;">"</span><span style="color: #000000;">:
    f </span>=<span style="color: #000000;"> WebFactory()
    ws</span>=f.GetWeb(<span style="color: #800000;">"</span><span style="color: #800000;">blog</span><span style="color: #800000;">"</span><span style="color: #000000;">)
    ws.Use(</span><span style="color: #800000;">"</span><span style="color: #800000;">Lee</span><span style="color: #800000;">"</span><span style="color: #000000;">)
    ws2</span>=f.GetWeb(<span style="color: #800000;">"</span><span style="color: #800000;">show</span><span style="color: #800000;">"</span><span style="color: #000000;">)
    ws2.Use(</span><span style="color: #800000;">"</span><span style="color: #800000;">Jack</span><span style="color: #800000;">"</span><span style="color: #000000;">)
    ws3</span>=f.GetWeb(<span style="color: #800000;">"</span><span style="color: #800000;">blog</span><span style="color: #800000;">"</span><span style="color: #000000;">)
    ws3.Use(</span><span style="color: #800000;">"</span><span style="color: #800000;">Chen</span><span style="color: #800000;">"</span><span style="color: #000000;">)
    ws4</span>=UnShareWebSite(<span style="color: #800000;">"</span><span style="color: #800000;">TEST</span><span style="color: #800000;">"</span><span style="color: #000000;">)
    ws4.Use(</span><span style="color: #800000;">"</span><span style="color: #800000;">Mr.Q</span><span style="color: #800000;">"</span><span style="color: #000000;">)
    </span><span style="color: #0000ff;">print</span><span style="color: #000000;"> f.webtype
    f.GetCount()
    </span></pre>
</div>
</div>
<p> </p>
<p><strong>二十三、解释器模式</strong></p>
<p><strong><img alt="" height="355" src="http://images.cnblogs.com/cnblogs_com/wuyuegb2312/468244/o_ch23.%e8%a7%a3%e9%87%8a%e5%99%a8%e6%a8%a1%e5%bc%8f.png" style="display: block; margin-left: auto; margin-right: auto;" width="538"/></strong></p>
<p> </p>
<p>模式特点：给定一个语言，定义它的文法的一种表示，并定义一个解释器，这个解释器使用该表示来解释语言中的句子。</p>
<p>程序实例：（只是模式特点的最简单示范）</p>
<p>代码特点：无</p>
<div class="cnblogs_code" onclick="cnblogs_code_show('8d8c9ecd-76f2-4664-9009-a2aa783d8a46')"><img alt="" class="code_img_closed" id="code_img_closed_8d8c9ecd-76f2-4664-9009-a2aa783d8a46" src="http://images.cnblogs.com/OutliningIndicators/ContractedBlock.gif"/><img alt="" class="code_img_opened" id="code_img_opened_8d8c9ecd-76f2-4664-9009-a2aa783d8a46" onclick="cnblogs_code_hide('8d8c9ecd-76f2-4664-9009-a2aa783d8a46',event)" src="http://images.cnblogs.com/OutliningIndicators/ExpandedBlockStart.gif" style="display: none;"/><span class="cnblogs_code_collapse">解释器模式</span>
<div class="cnblogs_code_hide" id="cnblogs_code_open_8d8c9ecd-76f2-4664-9009-a2aa783d8a46">
<pre><span style="color: #0000ff;">class</span><span style="color: #000000;"> Context:
    </span><span style="color: #0000ff;">def</span> <span style="color: #800080;">__init__</span><span style="color: #000000;">(self):
        self.input</span>=<span style="color: #800000;">""</span><span style="color: #000000;">
        self.output</span>=<span style="color: #800000;">""</span>

<span style="color: #0000ff;">class</span><span style="color: #000000;"> AbstractExpression:
    </span><span style="color: #0000ff;">def</span><span style="color: #000000;"> Interpret(self,context):
        </span><span style="color: #0000ff;">pass</span>

<span style="color: #0000ff;">class</span><span style="color: #000000;"> Expression(AbstractExpression):
    </span><span style="color: #0000ff;">def</span><span style="color: #000000;"> Interpret(self,context):
        </span><span style="color: #0000ff;">print</span> <span style="color: #800000;">"</span><span style="color: #800000;">terminal interpret</span><span style="color: #800000;">"</span>

<span style="color: #0000ff;">class</span><span style="color: #000000;"> NonterminalExpression(AbstractExpression):
    </span><span style="color: #0000ff;">def</span><span style="color: #000000;"> Interpret(self,context):
        </span><span style="color: #0000ff;">print</span> <span style="color: #800000;">"</span><span style="color: #800000;">Nonterminal interpret</span><span style="color: #800000;">"</span>

<span style="color: #0000ff;">if</span> <span style="color: #800080;">__name__</span> == <span style="color: #800000;">"</span><span style="color: #800000;">__main__</span><span style="color: #800000;">"</span><span style="color: #000000;">:
    context</span>= <span style="color: #800000;">""</span><span style="color: #000000;">
    c </span>=<span style="color: #000000;"> []
    c </span>= c +<span style="color: #000000;"> [Expression()]
    c </span>= c +<span style="color: #000000;"> [NonterminalExpression()]
    c </span>= c +<span style="color: #000000;"> [Expression()]
    c </span>= c +<span style="color: #000000;"> [Expression()]
    </span><span style="color: #0000ff;">for</span> a <span style="color: #0000ff;">in</span><span style="color: #000000;"> c:
        a.Interpret(context)</span></pre>
</div>
</div>
<p> </p>
<p><strong>二十四、访问者模式</strong></p>
<p><strong><img alt="" height="563" src="http://images.cnblogs.com/cnblogs_com/wuyuegb2312/468244/o_ch24.%e8%ae%bf%e9%97%ae%e8%80%85%e6%a8%a1%e5%bc%8f.png" style="display: block; margin-left: auto; margin-right: auto;" width="553"/></strong></p>
<p> </p>
<p>模式特点：表示一个作用于某对象结构中的各元素的操作。它使你可以在不改变各元素的类的前提下定义作用于这些元素的新操作。</p>
<p>程序实例：对于男人和女人（接受访问者的元素，ObjectStructure用于穷举这些元素），不同的遭遇（具体的访问者）引发两种对象的不同行为。</p>
<p>代码特点：无</p>
<div class="cnblogs_code" onclick="cnblogs_code_show('70063e18-76db-4242-88ac-f286b68b90d7')"><img alt="" class="code_img_closed" id="code_img_closed_70063e18-76db-4242-88ac-f286b68b90d7" src="http://images.cnblogs.com/OutliningIndicators/ContractedBlock.gif"/><img alt="" class="code_img_opened" id="code_img_opened_70063e18-76db-4242-88ac-f286b68b90d7" onclick="cnblogs_code_hide('70063e18-76db-4242-88ac-f286b68b90d7',event)" src="http://images.cnblogs.com/OutliningIndicators/ExpandedBlockStart.gif" style="display: none;"/><span class="cnblogs_code_collapse">访问者模式</span>
<div class="cnblogs_code_hide" id="cnblogs_code_open_70063e18-76db-4242-88ac-f286b68b90d7">
<pre><span style="color: #008000;">#</span><span style="color: #008000;"> -*- coding: UTF-8 -*-</span>
<span style="color: #0000ff;">class</span><span style="color: #000000;"> Person:
    </span><span style="color: #0000ff;">def</span><span style="color: #000000;"> Accept(self,visitor):
        </span><span style="color: #0000ff;">pass</span>

<span style="color: #0000ff;">class</span><span style="color: #000000;"> Man(Person):
    </span><span style="color: #0000ff;">def</span><span style="color: #000000;"> Accept(self,visitor):
        visitor.GetManConclusion(self)

</span><span style="color: #0000ff;">class</span><span style="color: #000000;"> Woman(Person):
    </span><span style="color: #0000ff;">def</span><span style="color: #000000;"> Accept(self,visitor):
        visitor.GetWomanConclusion(self)

</span><span style="color: #0000ff;">class</span><span style="color: #000000;"> Action:
    </span><span style="color: #0000ff;">def</span><span style="color: #000000;"> GetManConclusion(self,concreteElementA):
        </span><span style="color: #0000ff;">pass</span>
    <span style="color: #0000ff;">def</span><span style="color: #000000;"> GetWomanConclusion(self,concreteElementB):
        </span><span style="color: #0000ff;">pass</span>

<span style="color: #0000ff;">class</span><span style="color: #000000;"> Success(Action):
    </span><span style="color: #0000ff;">def</span><span style="color: #000000;"> GetManConclusion(self,concreteElementA):
        </span><span style="color: #0000ff;">print</span> <span style="color: #800000;">"</span><span style="color: #800000;">男人成功时，背后有个伟大的女人</span><span style="color: #800000;">"</span>
    <span style="color: #0000ff;">def</span><span style="color: #000000;"> GetWomanConclusion(self,concreteElementB):
        </span><span style="color: #0000ff;">print</span> <span style="color: #800000;">"</span><span style="color: #800000;">女人成功时，背后有个不成功的男人</span><span style="color: #800000;">"</span>

<span style="color: #0000ff;">class</span><span style="color: #000000;"> Failure(Action):
    </span><span style="color: #0000ff;">def</span><span style="color: #000000;"> GetManConclusion(self,concreteElementA):
        </span><span style="color: #0000ff;">print</span> <span style="color: #800000;">"</span><span style="color: #800000;">男人失败时，闷头喝酒，谁也不用劝</span><span style="color: #800000;">"</span>
    <span style="color: #0000ff;">def</span><span style="color: #000000;"> GetWomanConclusion(self,concreteElementB):
        </span><span style="color: #0000ff;">print</span> <span style="color: #800000;">"</span><span style="color: #800000;">女人失败时，眼泪汪汪，谁也劝不了</span><span style="color: #800000;">"</span>


<span style="color: #0000ff;">class</span><span style="color: #000000;"> ObjectStructure:
    </span><span style="color: #0000ff;">def</span> <span style="color: #800080;">__init__</span><span style="color: #000000;">(self):
        self.plist</span>=<span style="color: #000000;">[]
    </span><span style="color: #0000ff;">def</span><span style="color: #000000;"> Add(self,p):
        self.plist</span>=self.plist+<span style="color: #000000;">[p]
    </span><span style="color: #0000ff;">def</span><span style="color: #000000;"> Display(self,act):
        </span><span style="color: #0000ff;">for</span> p <span style="color: #0000ff;">in</span><span style="color: #000000;"> self.plist:
            p.Accept(act)

</span><span style="color: #0000ff;">if</span> <span style="color: #800080;">__name__</span> == <span style="color: #800000;">"</span><span style="color: #800000;">__main__</span><span style="color: #800000;">"</span><span style="color: #000000;">:
    os </span>=<span style="color: #000000;"> ObjectStructure()
    os.Add(Man())
    os.Add(Woman())
    sc </span>=<span style="color: #000000;"> Success()
    os.Display(sc)
    fl </span>=<span style="color: #000000;"> Failure()
    os.Display(fl)</span></pre>
</div>
</div>
<p> </p></div>
