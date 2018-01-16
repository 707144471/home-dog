//
//  DataSource.m
//  WhereDreamStarts
//
//  Created by 123 on 2018/1/12.
//  Copyright © 2018年 handsomeBoy. All rights reserved.
//

#import "DataSource.h"

@implementation DataSource
+(void)getDogBreeds_block:(void(^)(NSMutableArray *typeArray))block{

    NSMutableArray *modelArray=[[NSMutableArray alloc]init];
    NSArray *nameArray=@[@"超小型",@"超大型",@"小型犬",@"中型犬",@"大型犬",@"家庭犬",@"玩具犬",@"工作犬",@"梗类犬",@"牧羊犬",@"狩猎犬",@"枪猎犬",@"聪明犬",@"粘人犬",@"不掉毛",@"不爱叫",@"友善犬",@"会看家",@"耐热犬",@"易训犬"];
    for (int i=0; i<nameArray.count; i++) {
        dogModel *model=[[dogModel alloc]init];
        model.name=nameArray[i];
        switch (i) {
            case 0:
            {
                model.sizeDog=Size_Subminiature;
            }
                break;
            case 1:
            {
                model.sizeDog=Size_VeryLarge;
            }
                break;
            case 2:
            {
                model.sizeDog=Size_Small;
            }
                break;
            case 3:
            {
                model.sizeDog=Size_Medium;
            }
                break;
            case 4:
            {
                model.sizeDog=Size_Large;
            }
                break;
            case 5:
            {
                model.functionDog=Function_familyDog;
            }
                break;
            case 6:
            {
                model.functionDog=Function_toyDog;
            }
                break;
            case 7:
            {
                model.functionDog=Function_WorkingDogs;
            }
                break;
            case 8:
            {
                model.functionDog=Function_terriersDog;
            }
                break;
            case 9:
            {
                model.functionDog=Function_shepherdDog;
            }
                break;
            case 10:
            {
                model.functionDog=Function_HuntingDogs;
            }
                break;
            case 11:
            {
                model.functionDog=Function_GunDog;
            }
                break;
            case 12:
            {
                model.characteristicsDog=Characteristics_smart;
            }
                break;
            case 13:
            {
                model.characteristicsDog=Characteristics_clingy;
            }
                break;
            case 14:
            {
                model.characteristicsDog=Characteristics_dropping;
            }
                break;
            case 15:
            {
                model.characteristicsDog=Characteristics_DontCall;
            }
                break;
            case 16:
            {
                model.characteristicsDog=Characteristics_friendly;
            }
                break;
            case 17:
            {
                model.characteristicsDog=Characteristics_housekeeping;
            }
                break;
            case 18:
            {
                model.characteristicsDog=Characteristics_HeatResistant;
            }
                break;
            case 19:
            {
                model.characteristicsDog=Characteristics_YiXun;
            }
                break;
                
                
            default:
                break;
        }
        [modelArray addObject:model];
        
    }
    block(modelArray);
    
}
#pragma mark -颜色值
+(UIColor *)colorWithHexString:(NSString *)color{
    
    NSString *cString = [[color stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] uppercaseString];
    if ([cString length] < 6) {
        return [UIColor clearColor];
    }
    if ([cString hasPrefix:@"0X"]) cString = [cString substringFromIndex:2];
    if ([cString hasPrefix:@"#"])cString = [cString substringFromIndex:1];
    if ([cString length] != 6) return [UIColor clearColor];
    NSRange range;
    range.location = 0;
    range.length = 2;
    NSString *rString = [cString substringWithRange:range];
    range.location = 2;
    NSString *gString = [cString substringWithRange:range];
    range.location = 4;
    NSString *bString = [cString substringWithRange:range];
    unsigned int r, g, b;
    [[NSScanner scannerWithString:rString] scanHexInt:&r];
    [[NSScanner scannerWithString:gString] scanHexInt:&g];
    [[NSScanner scannerWithString:bString] scanHexInt:&b];
    return [UIColor colorWithRed:((float) r / 255.0f) green:((float) g / 255.0f) blue:((float) b / 255.0f) alpha:1.0f];
}
#pragma mark转场动画
+(void)CurrentInterface:(CALayer *)layer time:(float)timeValue timingFunction:(CAMediaTimingFunction *)timingFunction type:(NSString *)type subtype:(NSString *)subtype{
    
    CATransition *animation = [CATransition animation];
    animation.duration = timeValue;
    animation.timingFunction = timingFunction;
    animation.type = type;
    animation.subtype = subtype;
    [layer addAnimation:animation forKey:nil];
    
}
#pragma mark 设置圆角
+(void)SetRoundedCorners:(UIView *)view Angle:(float)Angle{
    
    view.layer.cornerRadius = Angle;
    view.clipsToBounds  = YES;
}
#pragma mark 添加首页model数组数据
+(void)addModelArrayDatas_block:(void(^)(NSMutableArray *dogArray))block{

    NSMutableArray *dataArrays=[[NSMutableArray alloc]init];
    DogIntroducedModel *model1=[[DogIntroducedModel alloc]init];
    model1.Img=@"008";
    model1.title=@"寿命排行";
    model1.content=@"正常情况下犬的寿命在10~15年之间，平均寿命在12.6 岁左右，最长约20年以上。与猫的平均寿命相近，平均寿命以小型犬为长";
    model1.arrayModel=@[@"\n北京犬18岁以上",
                        @"\n中华田园犬18岁以上",
                        @"\n玛尔济斯犬18岁",
                        @"\n贵宾犬15岁",
                        @"\n迷你腊肠犬14.4岁",
                        @"\n惠比特犬14.3岁",
                        @"\n藏獒14岁左右",
                        @"\n博美犬14岁",
                        @"\n松狮犬13.5岁\n迷你雪纳瑞13.5岁",
                        @"\n米格鲁猎兔犬13.3岁\n喜乐帝犬13.3岁",
                        @"\n边境牧羊犬13.0岁\n吉娃娃(奇瓦瓦犬)13.0岁\n猎狐梗犬13.0岁",
                        @"\n巴吉度犬12.8岁\n西高地白梗犬12.8岁",
                        @"\n约克夏犬12.7岁",
                        @"\n美国可卡犬12.5岁",
                        @"\n柯利牧羊犬12.3岁",
                        @"\n伯恩蝴蝶犬12岁\n阿富汗猎犬12岁\n拉布拉多犬12岁\n金毛犬(金毛寻回猎犬)12岁\n山犬12岁\n法国斗牛犬12岁",
                        @"\n英国可卡犬11.8岁\n爱尔兰雪达犬11.8岁\n西伯利亚雪橇犬11.8岁",
                        @"\n威尔士柯基11.3岁",
                        @"\n萨摩耶犬11.0岁",
                        @"\n拳师犬10.3岁",
                        @"\n小鹿犬10岁",
                        @"\n杜宾犬9.8 岁",
                        @"\n大丹犬8.4 岁"];

    
    DogIntroducedModel *model2=[[DogIntroducedModel alloc]init];
    model2.Img=@"009";
    model2.title=@"世界犬种智商排行";
    model2.content=@"据不列颠哥伦比亚大学（University of British Columbia）大学心理学教授Stanley Coren结合208位各地育犬专家，63名小型动物兽医师，及14名研究警卫犬与护卫狗的专家对各种名犬种进行深入访谈与观察，对犬只的工作服从性和智商进行了排名。其实只要主人教学到位，不在名次的狗也能学习本领，好厨师不挑材料也能做美味佳肴。";
    model2.arrayModel=@[@"第1位: Border Collie(边境牧羊犬)",
                        @"第2位: Poodle(贵宾犬)",
                        @"第3位: German Shepderd(德国牧羊犬)",
                        @"第4位: Golden Retriever(黄金猎犬)",
                        @"第5位: Doberman Pinscher(都柏文犬)",
                        @"第6位: Shetland Sheepdog(喜乐蒂牧羊犬)",
                        @"第7位: Labrador Retriever(拉布拉多猎犬)",
                        @"第8位: Papilion(蝴蝶犬)",
                        @"第9位: Rottweiler(洛威拿犬)",
                        @"第10位: Australian Cattle Dog(澳洲牧牛犬)"];
    
    
    
    DogIntroducedModel *model3=[[DogIntroducedModel alloc]init];
    model3.Img=@"010";
    model3.title=@"驯养常识";
    model3.content=@"1.以领养代替交易;2.及时领狗证;3.遛狗注意;4.对于拦路狗;5.不可挑衅狗.";
    model3.arrayModel=@[@"以领养代替交易\n请以领养代替交易，减少流浪动物，没有买卖就没有伤亡。领养“必备”条件:\n\n1.全家同意的情况下领养，否则最终因家庭争执而受害和付出代价的还是狗。\n2.保证自身有足够经济能力养活“你自己和狗狗”。\n3.保证有多余时间和精力打扫和善后“狗带来的麻烦”。\n4.杜绝兴起而领养：可以先领养朋友家狗狗(最好选爱捣蛋的狗)试试，若能承受后果再做打算，否则有可能一场人类的心情起伏就会给狗带来终身遗憾。杜绝因“时尚和看电视电影”一时兴奋而领养后再扔。一时兴起只是因为你处于看到“美好一面”的时刻，等你看到狗狗“不足时”也是否会继续喜欢，才是领养必备心理要素。\n5.若领养便是一辈子。\n6.实在没法养了就尽可能给狗找个安身之所，而请不要遗弃。",
                        @"及时领狗证\n\n狗证是指，“狗可以活”的证明，你要是养条宠物狗那得办狗证，一年办一次，和汽车年检一样。自己办理或托正规宠物医院办理。办理流程：带狗到所在地的区城市市容环境卫生行政主管部门或者其委托的城市街道办事处申请注册登记，填写养犬登记表，并提供下列材料\n1.居民户口簿、身份证明与复印件；\n2.依法设立的动物防疫机构出具的免疫证明；\n3.犬只照片2张。",
                        @"遛狗注意\n\n1.散步时请务必给狗栓绳子，因为就算你家狗很温顺，但别人不知道，或者就算知道狗温顺也有怕的人，所以不该强迫别人接受你的习惯和你家“温顺”的狗。注意到路人怕你家狗时就请把狗绳拉近身，以示人们相互尊重，目的是尽量给“对狗有偏见的人”留下好印象。\n2.并且必带“拾狗粪的塑料袋”，以免狗乱排泄\n3.〖带嘴套遛恶狗〗对于爱咬人或爱吠吓人的狗，务必给带上牢靠的嘴套(不牢靠的嘴套狗会弄掉的)。（*提示:以免狗挣脱，请用“有手环”的狗链）\n4.〖带狗进电梯或过马路时〗进电梯或过马路时“必须”把狗绳拉近身，建议从狗的“脖子处”直接拉住再进电梯，否则狗万一跑出去时正好电梯门关闭的话，人和狗会被电梯门隔开，随着电梯上下、狗很可能被勒住脖子，并且“神质量”电梯也会有危险。（建议：用背带式且有手环的狗链。因为项圈式会勒脖子，没手环的易挣脱。）",
                        @"对于拦路狗\n\n1.大多朝你吠叫的狗算不上恶狗。真正的恶狗，它除非被限制了自由才会用吠叫恐吓你，否则通常不会费时给你逃离的机会朝你吠，而是尽可能恶狠狠的直扑向你，或者就算吠、也是边吠边凶恶的直逼向你。\n2.朝你吠却不太靠近的狗，是用吠叫警告你说“你在靠近它的禁区，附近有它维护的东西（幼犬、领地、食物、主人…）”这个意思，当你越来越靠近它维护的东西，狗的叫声就会更大更频繁，这时你要知道不该再靠近，你可以等它主人来了再继续。或者慢慢的绕道走，尽量不给它挑衅的误解，否则就算光吠不咬的狗，最终也可能以为受到要挟和恐惧而追赶你。\n3.遇到光吠不靠近的狗，不可直视它而是看向别处，蹲下来，等它不叫了再慢慢走开。\n4.或者，遇到光吠不靠近的狗，任它吠但不看它，不慌不忙慢慢的走开。否则你越急速走开就会越引起它的警惕性从而追你，这时你越反抗越接近悲剧。",
                        @"不可挑衅狗\n\n1.不可以挑衅狗，尤其是恶狗，一来狗的脾气会越来越差。二来，虽然某些狗被拴住或者主人在场，但狗若真动起怒来，就不会管三七二十一铁链都会挣脱，并且有些狗很认敌的。",
                        @"其她\n\n1.防止狗挠人：给狗剪掉指甲后，用“狗指甲套”给狗的指甲套上，以免它挠人。\n2.养狗常识"];
    
    DogIntroducedModel *model4=[[DogIntroducedModel alloc]init];
    model4.Img=@"011";
    model4.title=@"医疗常识";
    model4.content=@"1.及时绝育;2.孕妇与弓形虫;3.网上咨询;";
    model4.arrayModel=@[@"及时绝育\n如果不是用来繁育的狗，建议绝育，给狗绝育的好处\n\n1.避免不需要的繁殖。猫、狗如不进行绝育，生育后代的数量呈几何级数增长：一对未绝育的猫、狗任其交配繁殖，如果每年产仔2胎，每胎2-8只，理论上第5年就会增加到12680只。许多国家或地区的野猫或流浪狗成群，就是没有去势的宠物在外边不断繁殖的结果。大量不需要的小动物出生来到世上，命运必定是很悲惨的。\n2.去势的宠物脾气更为温驯、容易饲养；同时避免了宠物的思春之苦和可能因寻偶离家走失。未去势的雌狗每年发情2 次，雌猫每3个月发情一次。发情期间动物总是企图外出寻偶，即使关在家里，它们也会脾气暴躁不安，或者四处撒尿引诱异性，甚至损坏家具物件，带来不少麻烦。公狗之间也不会因争风吃醋互斗致伤。\n3.去势有利于宠物的健康，而且不再会发生生殖器官疾病，如雌性的乳房癌和子宫感染，雄性的睾丸癌和前列腺病。\n4.给宠物做去势手术是不是太残忍了？显然不是的。去势是小手术，特别是雄性去势手术更加简单。兽医师在麻醉下进行，动物不会痛苦，而且迅速恢复健康。",
                        @"孕妇与弓形虫\n\n弓形虫主要传染源是人误食了染弓形虫的动物肉、或者然弓形虫动物生产的副产品（例如鸡蛋、牛奶、蛋糕、雪糕…相关产品）。其他传染源还有：弓形虫病人传染、蚊子、蟑螂、蔬菜水果、草原、水、环境…等。弓形虫的传染，除了猫是终宿主，其他动物都只是中间宿主。感染的猫粪里有弓形虫的囊合子，猫感染后粪便排出囊合子的时间不长，只有10-20天。囊合子需要在外界发育1-2天或更长时间，才具有传染性，所以每日清除猫沙或猫粪的话，就不怕被传染。狗是弓形虫的中间宿主，狗接触弓形虫后并不能产生对人具有感染力的卵囊，它的粪便和排泄物都没有传染性，所以单纯接触狗不会感染弓形虫病。如果不食狗肉就不会传染。",
                        @"网上咨询\n\n自己网上多方咨询"];
    
    DogIntroducedModel *model5=[[DogIntroducedModel alloc]init];
    model5.Img=@"012";
    model5.title=@"学习才艺";
    model5.content=@"1.坐姿训练方法;2.卧姿训练方法;3.躺姿训练方法;4.过来训练方法;5.握手训练方法";
    model5.arrayModel=@[@"1.坐姿训练方法\n发出坐姿命令“坐”后，用手上提狗链，迫使狗狗用屁股着地，坐起来，保持这个姿势。观察狗狗的反应，如果有站起来的表现，可以再次重复该命令，当狗狗能坐姿坚持一会儿的时候，就给它一点食物奖励。",
                        @"2.卧姿训练方法\n首先命令狗狗坐下，然后一手拿着狗狗爱吃的食物，一手提着狗链。在狗狗面前，将食物自高到低慢慢放到地上，狗狗会随着主人手中的食物趴到地上，要不就无法吃到食物。这个训练可以多进行几次，每当狗狗开饭的时候就用这个方法训练。",
                        @"3.躺姿训练方法\n首先让狗狗趴下，然后按住狗狗的一只前脚，让食物在狗狗面前晃动，然后放到另一只脚的旁边，狗狗就会躺下去尝试吃食物，这时候，主人应该让狗狗吃到食物，重复进行这个步骤，也可以在狗狗开饭的时候进行训练方法。",
                        @"4.过来训练方法\n这个训练需要手势和口令同时进行，一边发出“过来”的口令，一边伸手招呼狗狗过来，当然手里要拿着狗狗爱吃的狗粮才行，我们可以通过这个方法一点一点的将狗粮喂给狗狗，狗狗习惯了这种吃饭的方式，一听到你发出的口令就会跑到你的跟前。",
                        @"5.握手训练方法\n主人蹲下，命令小狗也蹲好，然后主人用手轻点狗狗的一只前腿，狗狗会本能的将那只腿抬起。这时候主人要迅速的抓住那只抬起的腿并同时发出握手的口令，重复执行这个步骤，当狗狗听到命令后能自觉的将腿抬起的时候，就可以奖励它一些食物。"];
    
    DogIntroducedModel *model6=[[DogIntroducedModel alloc]init];
    model6.Img=@"013";
    model6.title=@"生活习性";
    model6.content=@"1.狗之嗅觉;2.狗之听觉;3.狗之视力;4.狗之牙齿;5.狗之汗腺";
    model6.arrayModel=@[@"1.狗之嗅觉\n犬的嗅觉灵敏度位居各畜之首，眼瞎的狗可以利用鼻子生活的像正常狗狗。犬灵敏的嗅觉主要表现在两个方面：一是对气味的敏感程度；二是辨别气味的能力。敏感度会因味道的种类而有所差别，约为人类嗅觉的1200倍。狗鼻子大约能辨别200万种不同的气味，而且它还具有高度分析的能力，能够从许多混杂在一起的气味中，嗅出它所寻找的那种气味。犬对气味的感知能力可达分子水平。如当1立方厘米含有9000个丁酸分子时，犬就能嗅到，而在一般情况下每立方厘米的空气中约有268×10.e+16个分子。因此，犬感受丁酸的浓度为3.36×10.e-17二有人将硫酸稀释千万分之一时，犬仍能嗅出，对酸性物质的嗅觉灵敏度要高出人类几万倍。\n欧洲肺病基金会的调查结果显示，肺癌是欧洲人的第二大致死癌症。研究发现，经过嗅觉训练的狗能够从100例肺癌病人的呼气采样中闻出71例，对于没有肺癌的采样也能达到372/400的辨别准确率。",
                        @"2.狗之听觉\n听觉感应力可达12万赫兹，是人类的16倍。听的最远距离大约是人的400倍。狗对于声音方向的辨别能力也是人类的2倍，能分辨32个方向。它可以区分出节拍器每分钟震动数为96或100次，133次或144次。狗对于人的口令和简单的语言，可以根据音调音节变化建立条件反射。\n狗能够听到四万周波数。将经由大耳朵所收集的声音，经过外耳道振动鼓膜，甚至振动中耳的耳小骨，传到内耳的淋巴液，再由听觉神经传送到大脑。狗可分辨极细小或者高频率的声音（超声波）。对声源的判断能力也很强。当狗听到声音时，由于耳与眼的交感作用完全可以做到眼观六路，耳听八方。晚上，它即使睡觉也保持着高度的警觉性，对1公里以内的声音都能分辨清楚。特别注意的是我们没有必要对狗大声叫喊，过高的声音或音频对它来说是一种逆境刺激，会使它有痛苦，惊恐或恐慌的感觉。",
                        @"3.狗之视力\n犬的视力大约只有人的四分之三，在所有动物种别中，狗的视力大约列在中等。狗的单眼只能看到25度，因此看不见正面最近的距离。狗狗的眼球水晶体比较大，像马的眼球一样变形，所以无法调节远近感，二、三十公尺大约是其界限。狗对移动的物体具有特别的侦视能力；它们能够侦视到每秒钟移动70条线的画面，而一般的电视画面线条的移动大约为每秒60挑。光线暗淡时，狗的视力比人的视力要好，狗是天生的食肉动物，靠着捕猎而生，所以它们在暗处也有相当的视力。狗的眼睛能看到短波长的色彩，此外，狗的角膜也较大，容许较多的光线进入眼内，因而较易在光线暗淡处见物。但在为全没有光线的黑暗之中，狗也无法看见。\n人与犬视觉的相异处在对光的反应上，人眼对造成各种色彩的三原色（红、绿、蓝）有反应。美国佛罗里达大学兽医学院眼科副教授DennisBrooks博士说，狗的视觉和人的视觉不同；狗无法像人一样分辨各种色彩，但狗的确可以看到某些颜色。狗能够分辨深浅不同的蓝、靛和紫色，但是对于光谱中的红、绿等高彩度色彩却没有特殊的感受力。Brooks博士的研究显示，红色对狗来说是暗色，而绿色对狗来说则是白色，所以绿色草坪在狗看来是一片白色草地.",
                        @"4.狗之牙齿\n犬齿全部为短冠形，上颌第一、二门齿齿冠为三峰形，中部是犬尖峰，两侧有小尖峰，其余门齿各有犬小两个尖峰，犬齿旱弯曲的圆锥形，尖端锋利，是进攻和自卫的有力武器，前日齿为三位形，日齿为多峰形。\n⑴成犬齿(恒齿)齿式为：门齿、犬齿、前臼齿、臼齿共计42枚。\n⑵幼犬齿齿式为：门齿、犬齿、前臼齿共计28枚，缺1枚前臼齿和臼齿。",
                        @"5.狗之汗腺\n狗和狼等犬科动物，身体里的汗腺并不是非常发达。不能像人一样，通过出汗来调节体温，它们的身体一旦热起来就很难降低体温，所以狗非常怕热。\n狗也有外分泌汗腺和顶泌汗腺两种汗腺。用于调节体温的外分泌汗腺，只分布在四个爪子的肉垫上，而且非常少，仅靠爪子出一点汗，是无法降低体温的。而引起它们体臭的顶泌汗腺，是分布在它们全身的，和体温调节没有什么关系。\n狗只要觉得有一点热，就会张开嘴，伸出舌头，大口大口地喘气，这样做可以分泌大量的唾液来代替汗水。狗通过使唾液蒸发来散发热量，降低体温。它们大量地流口水，通过口水蒸发吸热来降低体温。天气炎热时，仅靠这种方法是无法顺利降温的。所以，狗狗很难降低自己的体温。特别是哈巴狗、喇叭狗、狮子狗和吉娃娃犬等头很小的狗，因为呼吸器官较短，所以不善于调节体温，特别怕热，应该多加注意"];
    
    [dataArrays addObject:model1];
    [dataArrays addObject:model2];
    [dataArrays addObject:model3];
    [dataArrays addObject:model4];
    [dataArrays addObject:model5];
    [dataArrays addObject:model6];
    
    block(dataArrays);
    
}
#pragma mark 获取狗狗列表数据
+(void)getDogsList:(dogModel *)model index:(NSInteger)idx block:(void(^)(NSMutableArray *dogArray))block{
    NSMutableArray *allArray=[[NSMutableArray alloc]init];
    NSArray *array=[DataSource creatDogs];
    for (int i=0; i<array.count; i++) {
        dogModel *dmd=array[i];
        if (idx<5) {
            if (model.sizeDog==dmd.sizeDog) {
                [allArray addObject:dmd];
            }
        }else{
            NSArray *dogNameArray;
            if (idx==5){
#pragma mark 家庭犬
                dogNameArray=@[@"贵宾犬",
                                        @"松狮",
                                        @"柴犬",
                                        @"法国斗牛犬",
                                        @"英国斗牛犬",
                                        @"卷毛比雄犬",
                                        @"大麦町犬",
                                        @"美国爱斯基摩犬",
                                        @"拉萨犬",
                                        @"中国沙皮犬",
                                        @"波士顿梗",
                                        @"西藏猎犬",
                                        @"西藏梗",
                                        @"墨西哥无毛犬",
                                        @"荷兰毛狮犬",
                                        @"挪威伦德猎犬",
                                        @"西帕基犬",
                                        @"罗秦犬",
                                        @"芬兰波美拉尼亚丝毛狗"];
                
            }else if (idx==6){
            
#pragma mark 玩具犬
                dogNameArray=@[@"贵宾犬",
                               @"吉娃娃",
                               @"蝴蝶犬",
                               @"博美犬",
                               @"八哥犬",
                               @"西施犬",
                               @"马尔济斯犬",
                               @"北京犬",
                               @"迷你杜宾",
                               @"中国冠毛犬",
                               @"哈瓦那犬",
                               @"约克夏梗",
                               @"丝毛梗",
                               @"意大利灰狗",
                               @"骑士查理王小猎犬",
                               @"日本忡",
                               @"玩具曼彻斯特犬",
                               @"英国玩具犬",
                               @"猴头梗",
                               @"布鲁塞尔格里芬犬"];
            }else if (idx==7){
            
#pragma mark 工作犬
                dogNameArray=@[@"哈士奇",
                               @"藏獒",
                               @"秋田犬",
                               @"杜宾犬",
                               @"大丹犬",
                               @"卡斯罗",
                               @"罗威纳犬",
                               @"萨摩耶犬",
                               @"大白熊犬",
                               @"圣伯纳犬",
                               @"阿拉斯加雪橇犬",
                               @"兰波格犬",
                               @"纽芬兰犬",
                               @"伯恩山犬",
                               @"波尔多犬",
                               @"葡萄牙水犬",
                               @"马士提夫獒犬",
                               @"斗牛獒犬",
                               @"匈牙利牧羊犬",
                               @"拳狮犬",
                               @"德国宾莎犬",
                               @"库瓦兹犬",
                               @"奇努克犬",
                               @"巨型雪纳瑞犬",
                               @"安纳托利亚牧羊犬",
                               @"黑俄罗斯梗",
                               @"那不勒斯獒",
                               @"大瑞士山地犬",
                               @"标准型雪纳瑞犬"];
                
            }else if (idx==8){
                
#pragma mark 梗类犬
                dogNameArray=@[@"斗牛梗",
                               @"西高地白梗",
                               @"贝灵顿梗",
                               @"杰克罗素梗",
                               @"苏格兰梗",
                               @"万能梗",
                               @"刚毛猎狐梗",
                               @"小型雪纳瑞犬",
                               @"凯利蓝梗",
                               @"湖畔梗",
                               @"威尔士梗",
                               @"短毛猎狐梗",
                               @"短毛猎狐梗",
                               @"斯塔福郡斗牛梗",
                               @"帕尔森罗塞尔梗",
                               @"短脚长身梗",
                               @"爱尔兰梗",
                               @"挪威梗",
                               @"捷克梗",
                               @"锡利哈姆梗",
                               @"诺福克梗",
                               @"美国斯塔福郡梗",
                               @"玩具猎狐梗",
                               @"爱尔兰峡谷梗",
                               @"爱尔兰软毛梗",
                               @"凯斯梗",
                               @"捕鼠梗",
                               @"博得猎狐犬"];
                
            }else if (idx==9){
                
#pragma mark 牧羊犬
                dogNameArray=@[@"边境牧羊犬",
                               @"德国牧羊犬",
                               @"比利时牧羊犬",
                               @"喜乐蒂牧羊犬",
                               @"柯利犬",
                               @"波利犬",
                               @"卡迪根威尔士柯基犬",
                               @"古代英国牧羊犬",
                               @"法国狼犬",
                               @"澳大利亚牧羊犬",
                               @"彭布罗克威尔士柯基犬",
                               @"山地犬",
                               @"瑞典柯基犬",
                               @"芬兰拉普猎犬",
                               @"澳大利亚牧牛犬",
                               @"冰岛牧羊犬",
                               @"波兰低地牧羊犬",
                               @"比利时马林诺斯犬",
                               @"粗毛柯利犬",
                               @"比利时特伏丹犬",
                               @"挪威布哈德犬",
                               @"迦南犬",
                               @"布雷猎犬",
                               @"比利牛斯牧羊犬",
                               @"波兰德斯布比野犬"
                               ];
                
            }else if (idx==10){
                
#pragma mark 狩猎犬
                dogNameArray=@[@"阿富汗猎犬",
                                @"腊肠犬",
                                @"法老王猎犬",
                                @"寻血猎犬",
                                @"猎兔犬",
                                @"爱尔兰猎狼犬",
                                @"惠比特犬",
                                @"苏俄猎狼犬",
                                @"比格猎犬",
                                @"巴吉度犬",
                                @"英国猎狐犬",
                                @"罗得西亚脊背犬",
                                @"萨路基猎犬",
                                @"格雷伊猎犬",
                                @"普罗特猎犬",
                                @"美国猎狐犬",
                                @"挪威猎鹿犬",
                                @"苏格兰猎鹿犬",
                                @"红骨猎浣熊犬",
                                @"巴仙吉犬",
                                @"小型葡萄牙波登可犬",
                                @"猎水獭犬",
                                @"黑褐猎浣熊犬",
                                @"树丛浣熊猎犬",
                               @"美国英国猎浣熊犬",
                               @"伊比赞猎犬",
                               @"布鲁克浣熊猎犬",
                               @"迷你贝吉格里芬凡丁犬"];
                
            }else if (idx==11){
                
#pragma mark 枪猎犬
                dogNameArray=@[ @"金毛寻回犬",
                                @"拉布拉多寻回犬",
                                @"波音达",
                                @"英国可卡犬",
                                @"美国可卡犬",
                                @"爱尔兰雪达犬",
                                @"维希拉猎犬",
                                @"威玛犬",
                                @"爱尔兰水猎犬",
                                @"英国跳猎犬",
                                @"爱尔兰红白雪达犬",
                                @"德国短毛波音达",
                                @"戈登雪达犬",
                                @"切萨皮克海湾寻回犬",
                                @"卷毛寻回犬",
                                @"弗莱特寻回犬",
                                @"德国硬毛波音达",
                                @"布列塔尼犬",
                                @"美国水猎犬",
                                @"西班牙小猎犬",
                                @"史毕诺犬",
                                @"新斯科舍猎鸭寻猎犬",
                                @"田野小猎犬",
                                @"英格兰雪达犬",
                                @"威尔士跳猎犬",
                                @"苏塞克斯猎犬",
                                @"硬毛指示格里芬犬",
                                @"博伊金猎犬"
                                ];
                
            }else if (idx==12){
#pragma mark 聪明犬
                dogNameArray=@[ @"贵宾犬",
                                @"边境牧羊犬",
                                @"德国牧羊犬",
                                @"蝴蝶犬",
                                @"杜宾犬",
                                @"罗威纳犬",
                                @"金毛寻回犬",
                                @"比利时牧羊犬",
                                @"喜乐蒂牧羊犬",
                                @"柯利犬",
                                @"拉布拉多寻回犬",
                                @"英国可卡犬",
                                @"小型雪纳瑞犬",
                                @"美国可卡犬",
                                @"彭布罗克威尔士柯基犬",
                                @"澳大利亚牧牛犬",
                                @"荷兰毛狮犬",
                                @"英国跳猎犬",
                                @"西帕基犬",
                                @"标准型雪纳瑞犬",
                                @"德国短毛波音达",
                                @"比利时特伏丹犬",
                                @"弗莱特寻回犬",
                                @"布列塔尼犬"
                                ];
                
            }else if (idx==13){
                
#pragma mark 粘人犬
                dogNameArray=@[ @"圣伯纳犬",
                                @"纽芬兰犬",
                                @"中国沙皮犬",
                                @"古代英国牧羊犬",
                                @"罗秦犬",
                                @"猎水獭犬",
                                @"迦南犬",
                                @"布鲁塞尔格里芬犬",
                                @"迷你贝吉格里芬凡丁犬"
                                ];
                
            }else if (idx==14){
                
#pragma mark 不掉毛犬
                dogNameArray=@[ @"藏獒",
                                @"贵宾犬",
                                @"蝴蝶犬",
                                @"萨摩耶犬",
                                @"巴哥犬",
                                @"大白熊犬",
                                @"圣伯纳犬",
                                @"法老王猎犬",
                                @"西高地白梗",
                                @"卷毛比雄犬",
                                @"寻血猎犬",
                                @"贝灵顿梗",
                                @"波音达",
                                @"波利犬",
                                @"约克夏梗",
                                @"英国可卡犬",
                                @"古代英国牧羊犬",
                                @"小型雪纳瑞犬",
                                @"美国可卡犬",
                                @"凯利蓝梗",
                                @"丝毛梗",
                                @"拳狮犬",
                                @"萨路基猎犬",
                                @"格雷伊猎犬",
                                @"短毛猎狐梗",
                                @"斯塔福郡斗牛梗",
                                @"大瑞士山地犬",
                                @"戈登雪达犬",
                                @"诺福克梗",
                                @"猴头梗",
                                @"迷你贝吉格里芬凡丁犬",
                                @"田野小猎犬",
                                @"博得猎狐犬"
                                ];
                
            }else if (idx==15){
                
#pragma mark 不爱叫犬
                dogNameArray=@[@"藏獒",
                               @"松狮",
                               @"秋田犬",
                               @"蝴蝶犬",
                               @"柴犬",
                               @"大丹犬",
                               @"罗威纳犬",
                               @"阿富汗猎犬",
                               @"大白熊犬",
                               @"圣伯纳犬",
                               @"金毛寻回犬",
                               @"法老王猎犬",
                               @"斗牛梗",
                               @"阿拉斯加雪橇犬",
                               @"比利时牧羊犬",
                               @"卷毛比雄犬",
                               @"寻血猎犬",
                               @"纽芬兰犬",
                               @"爱尔兰猎狼犬",
                               @"伯恩山犬",
                               @"喜乐蒂牧羊犬",
                               @"迷你杜宾",
                               @"惠比特犬",
                               @"中国冠毛犬",
                               @"贝灵顿梗",
                               @"苏格兰梗",
                               @"拉布拉多寻回犬",
                               @"万能梗",
                               @"波音达",
                               @"波利犬",
                               @"比格猎犬",
                               @"古代英国牧羊犬",
                               @"小型雪纳瑞犬",
                               @"巴吉度犬",
                               @"西藏猎犬",
                               @"马士提夫獒犬",
                               @"凯利蓝梗",
                               @"澳大利亚牧羊犬",
                               @"英国猎狐犬",
                               @"丝毛梗",
                               @"匈牙利牧羊犬",
                               @"罗得西亚脊背犬",
                               @"西藏梗",
                               @"湖畔梗",
                               @"巨型雪纳瑞犬",
                               @"萨路基猎犬",
                               @"小型斗牛梗",
                               @"斯塔福郡斗牛梗",
                               @"意大利灰狗",
                               @"荷兰毛狮犬",
                               @"爱尔兰水猎犬",
                               @"美国猎狐犬",
                               @"爱尔兰梗",
                               @"波兰低地牧羊犬",
                               @"挪威梗",
                               @"锡利哈姆梗",
                               @"巴仙吉犬",
                               @"切萨皮克海湾寻回犬",
                               @"比利时特伏丹犬",
                               @"日本忡",
                               @"玩具曼彻斯特犬",
                               @"澳大利亚梗",
                               @"猴头梗",
                               @"弗莱特寻回犬",
                               @"布雷猎犬",
                               @"德国硬毛波音达",
                               @"美国水猎犬",
                               @"西班牙小猎犬",
                               @"波兰德斯布比野犬",
                               @"凯斯梗",
                               @"威尔士跳猎犬",
                               @"田野小猎犬",
                               @"博得猎狐犬",
                               @"硬毛指示格里芬犬"];
                
            }else if (idx==16){
                
#pragma mark 友善犬
                dogNameArray=@[ @"大丹犬",
                                @"萨摩耶犬",
                                @"金毛寻回犬",
                                @"寻血猎犬",
                                @"纽芬兰犬",
                                @"中国冠毛犬",
                                @"柯利犬",
                                @"拉布拉多寻回犬",
                                @"苏俄猎狼犬",
                                @"比格猎犬",
                                @"英国可卡犬",
                                @"美国可卡犬",
                                @"诺福克梗",
                                @"骑士查理王小猎犬",
                                @"切萨皮克海湾寻回犬",
                                @"猎水獭犬",
                                @"卷毛寻回犬",
                                @"布列塔尼犬",
                                @"迷你贝吉格里芬凡丁犬"];
                
            }else if (idx==17){
                
#pragma mark 会看家犬
                dogNameArray=@[ @"松狮",
                                @"吉娃娃",
                                @"秋田犬",
                                @"杜宾犬",
                                @"罗威纳犬",
                                @"阿富汗猎犬",
                                @"腊肠犬",
                                @"大白熊犬",
                                @"马尔济斯犬",
                                @"喜乐蒂牧羊犬",
                                @"迷你杜宾",
                                @"拉萨犬",
                                @"中国沙皮犬",
                                @"西藏猎犬",
                                @"斗牛獒犬",
                                @"匈牙利牧羊犬",
                                @"罗得西亚脊背犬",
                                @"湖畔梗",
                                @"巨型雪纳瑞犬",
                                @"萨路基猎犬",
                                @"荷兰毛狮犬",
                                @"爱尔兰梗",
                                @"苏格兰猎鹿犬",
                                @"罗秦犬",
                                @"诺福克梗",
                                @"玩具曼彻斯特犬",
                                @"迦南犬",
                                @"布雷猎犬",
                                @"黑褐猎浣熊犬"];
                
            }else if (idx==18){
                
#pragma mark 耐热犬
                dogNameArray=@[@"贵宾犬",
                               @"吉娃娃",
                               @"蝴蝶犬",
                               @"柴犬",
                               @"卡斯罗",
                               @"英国斗牛犬",
                               @"法老王猎犬",
                               @"马尔济斯犬",
                               @"美国爱斯基摩犬",
                               @"苏俄猎狼犬",
                               @"约克夏梗",
                               @"拉萨犬",
                               @"丝毛梗",
                               @"维希拉猎犬",
                               @"切萨皮克海湾寻回犬",
                               @"玩具曼彻斯特犬",
                               @"澳大利亚梗"];
                
            }else if (idx==19){
                
#pragma mark 易训犬
                dogNameArray=@[@"贵宾犬",
                               @"边境牧羊犬",
                               @"德国牧羊犬",
                               @"蝴蝶犬",
                               @"杜宾犬",
                               @"金毛寻回犬",
                               @"比利时牧羊犬",
                               @"喜乐蒂牧羊犬",
                               @"迷你杜宾",
                               @"拉布拉多寻回犬",
                               @"大麦町犬",
                               @"澳大利亚牧牛犬",
                               @"英国跳猎犬",
                               @"切萨皮克海湾寻回犬",
                               @"比利时特伏丹犬",
                               @"卷毛寻回犬",
                               @"弗莱特寻回犬",
                               @"苏塞克斯猎犬"];
                
            }
            
            
            
            
            [dogNameArray enumerateObjectsWithOptions:NSEnumerationReverse usingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
                if ([obj isEqualToString:dmd.name]) {
                    NSLog(@"%@-索引%d",obj, (int)idx);
                    [allArray addObject:dmd];
                }
            }];
        }
        
    }
    block(allArray);
    
}

#pragma mark 进入个人中心
+(void)goPeopleCenter:(UIViewController *)viewCtrl{
    
    [DataSource CurrentInterface:viewCtrl.view.window.layer time:0.3 timingFunction:UIViewAnimationCurveEaseInOut type:kCATransitionFade subtype:kCATransitionFromLeft];
    peopleCenterViewController *myViewCtrol=[[peopleCenterViewController alloc]init];
    UINavigationController *nav=[[UINavigationController alloc]initWithRootViewController:myViewCtrol];
    nav.modalPresentationStyle = UIModalPresentationOverFullScreen;
    nav.modalTransitionStyle=UIModalTransitionStyleCrossDissolve;
    [viewCtrl presentViewController:nav animated:NO completion:^{
        nav.view.backgroundColor = [[UIColor clearColor] colorWithAlphaComponent:0.5];
    }];
}
#pragma mark 创建全部狗
+(NSArray *)creatDogs{
    NSMutableArray *array=[[NSMutableArray alloc]init];
#pragma mark 超小型
    NSArray *nameArray1=@[@"吉娃娃",
                          @"博美犬",
                          @"马尔济斯犬",
                          @"约克夏梗"];
    NSArray *urlArray1=@[@"https://ss0.baidu.com/6ONWsjip0QIZ8tyhnq/it/u=3678727023,2613768931&fm=58",
                         @"https://ss1.baidu.com/6ONXsjip0QIZ8tyhnq/it/u=2029921186,158604549&fm=5",
                         @"https://ss1.baidu.com/6ONXsjip0QIZ8tyhnq/it/u=1426763083,628786910&fm=5",
                         @"https://ss1.baidu.com/6ONXsjip0QIZ8tyhnq/it/u=1876203052,395878551&fm=5"];
    NSArray *BaiKeUrlArray=@[@"https://baike.baidu.com/item/%E5%90%89%E5%A8%83%E5%A8%83/124178?fr=aladdin",
                        @"https://baike.baidu.com/item/%E5%8D%9A%E7%BE%8E%E7%8A%AC",
                        @"https://baike.baidu.com/item/%E9%A9%AC%E5%B0%94%E6%B5%8E%E6%96%AF%E7%8A%AC",
                             @"https://baike.baidu.com/item/%E7%BA%A6%E5%85%8B%E5%A4%8F%E6%A2%97%E7%8A%AC"];
    for (int i=0; i<nameArray1.count; i++) {
        dogModel *model=[[dogModel alloc]init];
        model.name=nameArray1[i];
        model.PhotoAddress=urlArray1[i];
        model.sizeDog=Size_Subminiature;
        model.BaiKeUrlStr=BaiKeUrlArray[i];
        [array addObject:model];
    }
    
#pragma mark 超大型
    NSArray *nameArray2=@[@"秋田犬",
                          @"杜宾犬",
                          @"大丹犬",
                          @"大白熊犬",
                          @"兰波格犬",
                          @"纽芬兰犬",
                          @"爱尔兰猎狼犬",
                          @"苏俄猎狼犬",
                          @"波音达",
                          @"马士提夫獒犬",
                          @"库瓦兹犬",
                          @"萨路基猎犬",
                          @"格雷伊猎犬",
                          @"安纳托利亚牧羊犬",
                          @"挪威伦德猎犬",
                          @"黑俄罗斯梗",
                          @"苏格兰猎鹿犬",
                          @"大瑞士山地犬",
                          @"那不勒斯獒",
                          @"凯斯梗"];
    NSArray *urlArray2=@[@"https://ss1.baidu.com/6ONXsjip0QIZ8tyhnq/it/u=598069525,3705173246&fm=5",
                         @"https://ss1.baidu.com/6ONXsjip0QIZ8tyhnq/it/u=620185774,165030302&fm=5",
                         @"https://ss0.baidu.com/6ONWsjip0QIZ8tyhnq/it/u=1995132213,601620123&fm=5",
                         @"https://ss1.baidu.com/6ONXsjip0QIZ8tyhnq/it/u=2102578504,1136252409&fm=5",
                         @"https://ss2.baidu.com/6ONYsjip0QIZ8tyhnq/it/u=1461624413,4163696592&fm=5",
                         @"https://ss1.baidu.com/6ONXsjip0QIZ8tyhnq/it/u=1366773049,4123697663&fm=5",
                         @"https://ss0.baidu.com/6ONWsjip0QIZ8tyhnq/it/u=1694804343,325786490&fm=5",
                         @"https://ss2.baidu.com/6ONYsjip0QIZ8tyhnq/it/u=2329826432,772061664&fm=5",
                         @"https://ss0.baidu.com/6ONWsjip0QIZ8tyhnq/it/u=640481835,72467456&fm=5",
                         @"https://ss2.baidu.com/6ONYsjip0QIZ8tyhnq/it/u=1763015690,361252998&fm=5",
                         @"https://ss1.baidu.com/6ONXsjip0QIZ8tyhnq/it/u=2454269317,1224649392&fm=5",
                         @"https://ss0.baidu.com/6ONWsjip0QIZ8tyhnq/it/u=2215408068,1122655369&fm=5",
                         @"https://ss2.baidu.com/6ONYsjip0QIZ8tyhnq/it/u=1622253515,300607452&fm=5",
                         @"https://ss2.baidu.com/6ONYsjip0QIZ8tyhnq/it/u=1668128240,208195347&fm=5",
                         @"https://ss2.baidu.com/6ONYsjip0QIZ8tyhnq/it/u=2251154054,662446146&fm=5",
                         @"https://ss1.baidu.com/6ONXsjip0QIZ8tyhnq/it/u=2202214312,469993448&fm=5",
                         @"https://ss1.baidu.com/6ONXsjip0QIZ8tyhnq/it/u=469862686,3517731497&fm=5",
                         @"https://ss1.baidu.com/6ONXsjip0QIZ8tyhnq/it/u=2126055670,701489619&fm=5",
                         @"https://ss1.baidu.com/6ONXsjip0QIZ8tyhnq/it/u=2004583711,1016295501&fm=5",
                         @"https://ss0.baidu.com/6ONWsjip0QIZ8tyhnq/it/u=2354839272,621776008&fm=5"];
    for (int i=0; i<nameArray2.count; i++) {
        dogModel *model=[[dogModel alloc]init];
        model.name=nameArray2[i];
        model.PhotoAddress=urlArray2[i];
        model.sizeDog=Size_VeryLarge;
        [array addObject:model];
    }
#pragma mark 小型犬
    NSArray *nameArray3=@[@"贵宾犬",
                          @"蝴蝶犬",
                          @"巴哥犬",
                          @"西施犬",
                          @"西高地白梗",
                          @"卷毛比雄犬",
                          @"北京犬",
                          @"迷你杜宾",
                          @"中国冠毛犬",
                          @"捷克罗素梗",
                          @"哈瓦那犬",
                          @"苏格兰梗",
                          @"刚毛猎狐梗",
                          @"拉萨犬",
                          @"卡迪根威尔士柯基犬",
                          @"比格猎犬",
                          @"小型雪纳瑞犬",
                          @"巴吉度犬",
                          @"美国可卡犬",
                          @"西藏猎犬",
                          @"彭布罗克威尔士柯基犬",
                          @"丝毛梗",
                          @"湖畔梗",
                          @"瑞典柯基犬",
                          @"威尔士梗",
                          @"小型斗牛梗",
                          @"短毛猎狐梗",
                          @"意大利灰狗",
                          @"帕尔森罗塞尔梗",
                          @"短脚长身梗",
                          @"西帕基犬",
                          @"挪威梗",
                          @"罗秦犬",
                          @"捷克梗",
                          @"锡利哈姆梗",
                          @"诺福克梗",
                          @"小型葡萄牙波登可犬",
                          @"骑士查理王小猎犬",
                          @"玩具曼彻斯特犬",
                          @"日本忡",
                          @"玩具猎狐梗",
                          @"爱尔兰峡谷梗",
                          @"澳大利亚梗",
                          @"猴头梗",
                          @"英国玩具犬",
                          @"布鲁塞尔格里芬犬",
                          @"迷你贝吉格里芬凡丁犬",
                          @"博得猎狐犬",
                          @"苏塞克斯猎犬"];
    NSArray *urlArray3=@[@"https://ss0.baidu.com/6ONWsjip0QIZ8tyhnq/it/u=2152435263,329091142&fm=5",
                         @"https://ss1.baidu.com/6ONXsjip0QIZ8tyhnq/it/u=2038406380,317017081&fm=5",
                         @"https://ss0.baidu.com/6ONWsjip0QIZ8tyhnq/it/u=2203179441,686428929&fm=5",
                         @"https://ss2.baidu.com/6ONYsjip0QIZ8tyhnq/it/u=2165927228,548828044&fm=5",
                         @"https://ss2.baidu.com/6ONYsjip0QIZ8tyhnq/it/u=663646823,257272054&fm=5",
                         @"https://ss0.baidu.com/6ONWsjip0QIZ8tyhnq/it/u=2171062080,496211314&fm=5",
                         @"https://ss1.baidu.com/6ONXsjip0QIZ8tyhnq/it/u=1920670735,744256156&fm=5",
                         @"https://ss1.baidu.com/6ONXsjip0QIZ8tyhnq/it/u=1816395469,193641591&fm=5",
                         @"https://ss0.baidu.com/6ONWsjip0QIZ8tyhnq/it/u=2282493825,794358149&fm=5",
                         @"https://ss1.baidu.com/6ONXsjip0QIZ8tyhnq/it/u=1918904107,153654932&fm=5",
                         @"https://ss0.baidu.com/6ONWsjip0QIZ8tyhnq/it/u=1840761816,447898441&fm=5",
                         @"https://ss2.baidu.com/6ONYsjip0QIZ8tyhnq/it/u=1752872558,485178626&fm=5",
                         @"https://ss2.baidu.com/6ONYsjip0QIZ8tyhnq/it/u=1403019557,598925940&fm=5",
                         @"https://ss2.baidu.com/6ONYsjip0QIZ8tyhnq/it/u=1554361559,35822447&fm=5",
                         @"https://ss2.baidu.com/6ONYsjip0QIZ8tyhnq/it/u=1510885910,240986520&fm=5",
                         @"https://ss2.baidu.com/6ONYsjip0QIZ8tyhnq/it/u=1794638012,351517914&fm=5",
                         @"https://ss1.baidu.com/6ONXsjip0QIZ8tyhnq/it/u=1581004036,339027218&fm=5",
                         @"https://ss0.baidu.com/6ONWsjip0QIZ8tyhnq/it/u=1511818455,218306731&fm=5",
                         @"https://ss1.baidu.com/6ONXsjip0QIZ8tyhnq/it/u=539145094,127345307&fm=5",
                         @"https://ss0.baidu.com/6ONWsjip0QIZ8tyhnq/it/u=2095438962,1192138642&fm=5",
                         @"https://ss1.baidu.com/6ONXsjip0QIZ8tyhnq/it/u=1663445875,290726112&fm=5",
                         @"https://ss1.baidu.com/6ONXsjip0QIZ8tyhnq/it/u=2354251705,1148921344&fm=5",
                         @"https://ss0.baidu.com/6ONWsjip0QIZ8tyhnq/it/u=644075910,42787078&fm=5",
                         @"https://ss1.baidu.com/6ONXsjip0QIZ8tyhnq/it/u=2126856259,608128962&fm=5",
                         @"https://ss0.baidu.com/6ONWsjip0QIZ8tyhnq/it/u=2060405814,972497729&fm=5",
                         @"https://ss0.baidu.com/6ONWsjip0QIZ8tyhnq/it/u=2005761516,959942203&fm=5",
                         @"https://ss0.baidu.com/6ONWsjip0QIZ8tyhnq/it/u=2034250824,983043118&fm=5",
                         @"https://ss1.baidu.com/6ONXsjip0QIZ8tyhnq/it/u=2009379220,550263340&fm=5",
                         @"https://ss2.baidu.com/6ONYsjip0QIZ8tyhnq/it/u=1968858176,529097473&fm=5",
                         @"https://ss0.baidu.com/6ONWsjip0QIZ8tyhnq/it/u=2206652823,1235689525&fm=5",
                         @"https://ss1.baidu.com/6ONXsjip0QIZ8tyhnq/it/u=2063829094,861333472&fm=5",
                         @"https://ss0.baidu.com/6ONWsjip0QIZ8tyhnq/it/u=1977835422,978969536&fm=5",
                         @"https://ss1.baidu.com/6ONXsjip0QIZ8tyhnq/it/u=2190152482,302503096&fm=5",
                         @"https://ss1.baidu.com/6ONXsjip0QIZ8tyhnq/it/u=1845556828,25873933&fm=5",
                         @"https://ss2.baidu.com/6ONYsjip0QIZ8tyhnq/it/u=1813332923,164485430&fm=5",
                         @"https://ss0.baidu.com/6ONWsjip0QIZ8tyhnq/it/u=1787623236,424237963&fm=5",
                         @"https://ss1.baidu.com/6ONXsjip0QIZ8tyhnq/it/u=2236726903,1297002161&fm=5",
                         @"https://ss1.baidu.com/6ONXsjip0QIZ8tyhnq/it/u=1918402777,520664393&fm=5",
                         @"https://ss0.baidu.com/6ONWsjip0QIZ8tyhnq/it/u=824651646,114625014&fm=5",
                         @"https://ss1.baidu.com/6ONXsjip0QIZ8tyhnq/it/u=2208239410,859041218&fm=5",
                         @"https://ss1.baidu.com/6ONXsjip0QIZ8tyhnq/it/u=1943754301,495104261&fm=5",
                         @"https://ss1.baidu.com/6ONXsjip0QIZ8tyhnq/it/u=1930169461,979000531&fm=5",
                         @"https://ss1.baidu.com/6ONXsjip0QIZ8tyhnq/it/u=2260891507,1233384633&fm=5",
                         @"https://ss1.baidu.com/6ONXsjip0QIZ8tyhnq/it/u=1934161036,691773032&fm=5",
                         @"https://ss1.baidu.com/6ONXsjip0QIZ8tyhnq/it/u=2129145754,341890744&fm=5",
                         @"https://ss0.baidu.com/6ONWsjip0QIZ8tyhnq/it/u=1695582726,29699195&fm=5",
                         @"https://ss1.baidu.com/6ONXsjip0QIZ8tyhnq/it/u=1923371332,990962128&fm=5",
                         @"https://ss0.baidu.com/6ONWsjip0QIZ8tyhnq/it/u=2010590817,1093462108&fm=5",
                         @"https://ss1.baidu.com/6ONXsjip0QIZ8tyhnq/it/u=2562675280,1420232047&fm=5"];
    for (int i=0; i<nameArray3.count; i++) {
        dogModel *model=[[dogModel alloc]init];
        model.name=nameArray3[i];
        model.PhotoAddress=urlArray3[i];
        model.sizeDog=Size_Small;
        [array addObject:model];
    }
    
#pragma mark 中型犬
    NSArray *nameArray4=@[@"哈士奇",
                          @"松狮",
                          @"边境牧羊犬",
                          @"柴犬",
                          @"法国斗牛犬",
                          @"英国斗牛犬",
                          @"萨摩耶犬",
                          @"腊肠犬",
                          @"斗牛梗",
                          @"猎兔犬",
                          @"喜乐蒂牧羊犬",
                          @"惠比特犬",
                          
                          @"贝灵顿梗",
                          @"拉布拉多巡回犬",
                          @"大麦町犬",
                          @"美国爱斯基摩犬",
                          @"万能梗",
                          @"葡萄牙水犬",
                          @"波利犬",
                          @"中国沙皮犬",
                          @"波士顿梗",
                          @"英国可卡犬",
                          @"古代英国牧羊犬",
                          @"凯利蓝梗",
                          
                          @"澳大利亚牧羊犬",
                          @"山地犬",
                          @"西藏梗",
                          @"芬兰拉普猎犬",
                          @"德国宾莎犬",
                          @"澳大利亚牧牛犬",
                          @"墨西哥无毛犬",
                          @"斯塔福郡斗牛梗",
                          @"荷兰毛狮犬",
                          @"冰岛牧羊犬",
                          @"英国跳猎犬",
                          @"爱尔兰梗",
                          
                          @"挪威猎鹿犬",
                          @"波兰低地牧羊犬",
                          @"标准型雪纳瑞犬",
                          @"巴仙吉犬",
                          @"美国斯塔福郡梗",
                          @"粗毛柯利犬",
                          @"芬兰波美拉尼亚丝毛狗",
                          @"挪威布哈德犬",
                          @"爱尔兰软毛梗",
                          @"布列塔尼犬",
                          @"美国水猎犬",
                          @"西班牙小猎犬",
                          
                          @"比利牛斯牧羊犬",
                          @"捕鼠梗",
                          @"新斯科舍猎鸭寻猎犬",
                          @"田野小猎犬",
                          @"威尔士跳猎犬",
                          @"博伊金猎犬"];
    
    NSArray *urlArray4=@[@"https://ss1.baidu.com/6ONXsjip0QIZ8tyhnq/it/u=2300875363,445064071&fm=5",
                         @"https://ss0.baidu.com/6ONWsjip0QIZ8tyhnq/it/u=942120003,4005302423&fm=5",
                         @"https://ss2.baidu.com/6ONYsjip0QIZ8tyhnq/it/u=1820154701,1076679668&fm=5",
                         @"https://ss0.baidu.com/6ONWsjip0QIZ8tyhnq/it/u=1067412999,107277101&fm=5",
                         @"https://ss0.baidu.com/6ONWsjip0QIZ8tyhnq/it/u=1621205601,4231440712&fm=5",
                         @"https://ss1.baidu.com/6ONXsjip0QIZ8tyhnq/it/u=2101259488,1054091876&fm=5",
                         @"https://ss1.baidu.com/6ONXsjip0QIZ8tyhnq/it/u=2165241247,947729812&fm=5",
                         @"https://ss0.baidu.com/6ONWsjip0QIZ8tyhnq/it/u=1849327302,4248698017&fm=5",
                         @"https://ss1.baidu.com/6ONXsjip0QIZ8tyhnq/it/u=2107302067,321987429&fm=5",
                         @"https://ss0.baidu.com/6ONWsjip0QIZ8tyhnq/it/u=1956995265,506888786&fm=5",
                         @"https://ss1.baidu.com/6ONXsjip0QIZ8tyhnq/it/u=1798578619,534917662&fm=5",
                         @"https://ss1.baidu.com/6ONXsjip0QIZ8tyhnq/it/u=1891082833,412187221&fm=5",
                         
                         @"https://ss2.baidu.com/6ONYsjip0QIZ8tyhnq/it/u=1843158914,665029288&fm=5",
                         @"https://ss0.baidu.com/6ONWsjip0QIZ8tyhnq/it/u=1867305213,522151695&fm=5",
                         @"https://ss2.baidu.com/6ONYsjip0QIZ8tyhnq/it/u=1943371376,478460723&fm=5",
                         @"https://ss2.baidu.com/6ONYsjip0QIZ8tyhnq/it/u=1715945531,548831254&fm=5",
                         @"https://ss2.baidu.com/6ONYsjip0QIZ8tyhnq/it/u=696520409,179513420&fm=5",
                         @"https://ss2.baidu.com/6ONYsjip0QIZ8tyhnq/it/u=1491886508,123068581&fm=5",
                         @"https://ss1.baidu.com/6ONXsjip0QIZ8tyhnq/it/u=1373568475,600393472&fm=5",
                         @"https://ss2.baidu.com/6ONYsjip0QIZ8tyhnq/it/u=515571275,136587921&fm=5",
                         @"https://ss1.baidu.com/6ONXsjip0QIZ8tyhnq/it/u=2526214204,1336328310&fm=5",
                         @"https://ss0.baidu.com/6ONWsjip0QIZ8tyhnq/it/u=1985772057,239341773&fm=5",
                         @"https://ss1.baidu.com/6ONXsjip0QIZ8tyhnq/it/u=2004925471,1196004308&fm=5",
                         @"https://ss2.baidu.com/6ONYsjip0QIZ8tyhnq/it/u=769819088,85607228&fm=5",
                         
                         @"https://ss0.baidu.com/6ONWsjip0QIZ8tyhnq/it/u=2202193419,428160295&fm=5",
                         @"https://ss2.baidu.com/6ONYsjip0QIZ8tyhnq/it/u=1689205697,492387653&fm=5",
                         @"https://ss0.baidu.com/6ONWsjip0QIZ8tyhnq/it/u=2157243723,593537572&fm=5",
                         @"https://ss1.baidu.com/6ONXsjip0QIZ8tyhnq/it/u=2152011301,917697701&fm=5",
                         @"https://ss1.baidu.com/6ONXsjip0QIZ8tyhnq/it/u=700715857,3693416376&fm=5",
                         @"https://ss2.baidu.com/6ONYsjip0QIZ8tyhnq/it/u=2367924413,566410597&fm=5",
                         @"https://ss2.baidu.com/6ONYsjip0QIZ8tyhnq/it/u=1993241054,519372056&fm=5",
                         @"https://ss0.baidu.com/6ONWsjip0QIZ8tyhnq/it/u=2305849779,579901568&fm=5",
                         @"https://ss0.baidu.com/6ONWsjip0QIZ8tyhnq/it/u=2009850201,603409364&fm=5",
                         @"https://ss1.baidu.com/6ONXsjip0QIZ8tyhnq/it/u=1828410985,493937485&fm=5",
                         @"https://ss0.baidu.com/6ONWsjip0QIZ8tyhnq/it/u=1916059878,266482363&fm=5",
                         @"https://ss1.baidu.com/6ONXsjip0QIZ8tyhnq/it/u=2193472237,1075619716&fm=5",
                         
                         @"https://ss1.baidu.com/6ONXsjip0QIZ8tyhnq/it/u=1903024546,395634218&fm=5",
                         @"https://ss0.baidu.com/6ONWsjip0QIZ8tyhnq/it/u=2337479175,624242617&fm=5",
                         @"https://ss1.baidu.com/6ONXsjip0QIZ8tyhnq/it/u=2266050451,1108746436&fm=5",
                         @"https://ss1.baidu.com/6ONXsjip0QIZ8tyhnq/it/u=1642707514,167767606&fm=5",
                         @"https://ss0.baidu.com/6ONWsjip0QIZ8tyhnq/it/u=2204331513,1005833192&fm=5",
                         @"https://ss0.baidu.com/6ONWsjip0QIZ8tyhnq/it/u=2106834369,530869425&fm=5",
                         @"https://ss1.baidu.com/6ONXsjip0QIZ8tyhnq/it/u=2184396880,1019641144&fm=5",
                         @"https://ss1.baidu.com/6ONXsjip0QIZ8tyhnq/it/u=1757931655,483435249&fm=5",
                         @"https://ss0.baidu.com/6ONWsjip0QIZ8tyhnq/it/u=2055914364,857457140&fm=5",
                         @"https://ss2.baidu.com/6ONYsjip0QIZ8tyhnq/it/u=1571537420,898878059&fm=5",
                         @"https://ss0.baidu.com/6ONWsjip0QIZ8tyhnq/it/u=1664261706,180756645&fm=5",
                         @"https://ss0.baidu.com/6ONWsjip0QIZ8tyhnq/it/u=1953655524,423594358&fm=5",
                         
                         @"https://ss0.baidu.com/6ONWsjip0QIZ8tyhnq/it/u=2139280014,1003400607&fm=5",
                         @"https://ss0.baidu.com/6ONWsjip0QIZ8tyhnq/it/u=1842460374,712175843&fm=5",
                         @"https://ss1.baidu.com/6ONXsjip0QIZ8tyhnq/it/u=2396743708,662775936&fm=5",
                         @"https://ss2.baidu.com/6ONYsjip0QIZ8tyhnq/it/u=1823838251,365326372&fm=5",
                         @"https://ss2.baidu.com/6ONYsjip0QIZ8tyhnq/it/u=2244683195,1236464999&fm=5",
                         @"https://ss0.baidu.com/6ONWsjip0QIZ8tyhnq/it/u=2021477337,1039756913&fm=5"];
    for (int i=0; i<nameArray4.count; i++) {
        dogModel *model=[[dogModel alloc]init];
        model.name=nameArray4[i];
        model.PhotoAddress=urlArray4[i];
        model.sizeDog=Size_Medium;
        [array addObject:model];
    }
    
#pragma mark 大型犬
    NSArray *nameArray5=@[@"藏獒",
                          @"德国牧羊犬",
                          @"卡斯罗",
                          @"罗威纳犬",
                          @"阿富汗猎犬",
                          @"圣伯纳犬",
                          @"金毛巡回犬",
                          @"法老王猎犬",
                          @"阿拉斯加雪橇犬",
                          @"比利时牧羊犬",
                          @"寻血猎犬",
                          @"伯恩山犬",
                          
                          @"波尔多犬",
                          @"柯利犬",
                          @"斗牛獒犬",
                          @"法国狼犬",
                          @"英国猎狐犬",
                          @"匈牙利牧羊犬",
                          @"拳师犬",
                          @"罗得西亚脊背犬",
                          @"爱尔兰雪达",
                          @"奇努克犬",
                          @"巨型雪纳瑞犬",
                          @"维希拉猎犬",
                          
                          @"普罗特猎犬",
                          @"威玛犬",
                          @"爱尔兰水猎犬",
                          @"美国猎狐犬",
                          @"爱尔兰红白雪达犬",
                          @"比利时马林诺斯犬",
                          @"德国短毛波音达",
                          @"红骨猎浣熊犬",
                          @"戈登雪达犬",
                          @"切萨皮克海湾寻回犬",
                          @"比利时特伏丹犬",
                          @"猎水獭犬",
                          
                          @"卷毛寻回犬",
                          @"迦南犬",
                          @"弗莱特寻回犬",
                          @"德国硬毛波音达",
                          @"布雷猎犬",
                          @"黑褐猎浣熊犬",
                          @"史毕诺犬",
                          @"树丛浣熊猎犬",
                          @"波兰德斯布比野犬",
                          @"美国英国猎浣熊犬",
                          @"伊比赞猎犬",
                          @"布鲁克浣熊猎犬",
                          
                          @"英格兰雪达犬",
                          @"硬毛指示格里芬犬"];
    NSArray *urlArray5=@[@"https://ss0.baidu.com/6ONWsjip0QIZ8tyhnq/it/u=1794064296,746211315&fm=5",
                         @"https://ss1.baidu.com/6ONXsjip0QIZ8tyhnq/it/u=2169658390,1178081336&fm=5",
                         @"https://ss2.baidu.com/6ONYsjip0QIZ8tyhnq/it/u=1785085109,127233019&fm=5",
                         @"https://ss2.baidu.com/6ONYsjip0QIZ8tyhnq/it/u=2227828694,1273977616&fm=5",
                         @"https://ss1.baidu.com/6ONXsjip0QIZ8tyhnq/it/u=1750517539,423265606&fm=5",
                         @"https://ss2.baidu.com/6ONYsjip0QIZ8tyhnq/it/u=1797044018,357854437&fm=5",
                         @"https://ss0.baidu.com/6ONWsjip0QIZ8tyhnq/it/u=1538951973,627565780&fm=5",
                         @"https://ss1.baidu.com/6ONXsjip0QIZ8tyhnq/it/u=1742836627,352313558&fm=5",
                         @"https://ss0.baidu.com/6ONWsjip0QIZ8tyhnq/it/u=2284174980,259589504&fm=5",
                         @"https://ss1.baidu.com/6ONXsjip0QIZ8tyhnq/it/u=1851425290,1159094009&fm=5",
                         @"https://ss2.baidu.com/6ONYsjip0QIZ8tyhnq/it/u=1805624111,426400140&fm=5",
                         @"https://ss0.baidu.com/6ONWsjip0QIZ8tyhnq/it/u=2257322229,976022740&fm=5",
                         
                         @"https://ss1.baidu.com/6ONXsjip0QIZ8tyhnq/it/u=1860031294,359607068&fm=5",
                         @"https://ss2.baidu.com/6ONYsjip0QIZ8tyhnq/it/u=2502004643,1158696502&fm=5",
                         @"https://ss0.baidu.com/6ONWsjip0QIZ8tyhnq/it/u=1895984823,312884046&fm=5",
                         @"https://ss2.baidu.com/6ONYsjip0QIZ8tyhnq/it/u=1691211494,274363081&fm=5",
                         @"https://ss2.baidu.com/6ONYsjip0QIZ8tyhnq/it/u=1793878097,987971413&fm=5",
                         @"https://ss0.baidu.com/6ONWsjip0QIZ8tyhnq/it/u=2242154067,717361411&fm=5",
                         @"https://ss2.baidu.com/6ONYsjip0QIZ8tyhnq/it/u=1215515234,4067754273&fm=5",
                         @"https://ss2.baidu.com/6ONYsjip0QIZ8tyhnq/it/u=2202883268,1144017013&fm=5",
                         @"https://ss0.baidu.com/6ONWsjip0QIZ8tyhnq/it/u=1986233445,832373609&fm=5",
                         @"https://ss2.baidu.com/6ONYsjip0QIZ8tyhnq/it/u=2352393503,1325817842&fm=5",
                         @"https://ss0.baidu.com/6ONWsjip0QIZ8tyhnq/it/u=1997402157,466171528&fm=5",
                         @"https://ss1.baidu.com/6ONXsjip0QIZ8tyhnq/it/u=832549255,3837391444&fm=5",
                         
                         @"https://ss2.baidu.com/6ONYsjip0QIZ8tyhnq/it/u=1854661841,238021435&fm=5",
                         @"https://ss1.baidu.com/6ONXsjip0QIZ8tyhnq/it/u=2200891225,647137615&fm=5",
                         @"https://ss2.baidu.com/6ONYsjip0QIZ8tyhnq/it/u=1737554132,630087286&fm=5",
                         @"https://ss0.baidu.com/6ONWsjip0QIZ8tyhnq/it/u=746667753,258117162&fm=5",
                         @"https://ss0.baidu.com/6ONWsjip0QIZ8tyhnq/it/u=2123969931,1249614517&fm=5",
                         @"https://ss0.baidu.com/6ONWsjip0QIZ8tyhnq/it/u=2140664409,803065958&fm=5",
                         @"https://ss0.baidu.com/6ONWsjip0QIZ8tyhnq/it/u=1654370742,71297074&fm=5",
                         @"https://ss1.baidu.com/6ONXsjip0QIZ8tyhnq/it/u=1888922083,585268057&fm=5",
                         @"https://ss1.baidu.com/6ONXsjip0QIZ8tyhnq/it/u=1990475578,939244546&fm=5",
                         @"https://ss2.baidu.com/6ONYsjip0QIZ8tyhnq/it/u=2014779128,526044223&fm=5",
                         @"https://ss1.baidu.com/6ONXsjip0QIZ8tyhnq/it/u=2383591009,552069184&fm=5",
                         @"https://ss1.baidu.com/6ONXsjip0QIZ8tyhnq/it/u=1791714841,299697630&fm=5",
                         
                         @"https://ss2.baidu.com/6ONYsjip0QIZ8tyhnq/it/u=1939100684,917394432&fm=5",
                         @"https://ss0.baidu.com/6ONWsjip0QIZ8tyhnq/it/u=1746653481,260603831&fm=5",
                         @"https://ss2.baidu.com/6ONYsjip0QIZ8tyhnq/it/u=1728725156,245903019&fm=5",
                         @"https://ss1.baidu.com/6ONXsjip0QIZ8tyhnq/it/u=1927659805,577504848&fm=5",
                         @"https://ss0.baidu.com/6ONWsjip0QIZ8tyhnq/it/u=1976267226,711525229&fm=5",
                         @"https://ss1.baidu.com/6ONXsjip0QIZ8tyhnq/it/u=2073107806,447048124&fm=5",
                         @"https://ss1.baidu.com/6ONXsjip0QIZ8tyhnq/it/u=891452329,3809749002&fm=5",
                         @"https://ss1.baidu.com/6ONXsjip0QIZ8tyhnq/it/u=2168774635,684318184&fm=5",
                         @"https://ss1.baidu.com/6ONXsjip0QIZ8tyhnq/it/u=1604099356,371279932&fm=5",
                         @"https://ss2.baidu.com/6ONYsjip0QIZ8tyhnq/it/u=1700179568,451780168&fm=5",
                         @"https://ss0.baidu.com/6ONWsjip0QIZ8tyhnq/it/u=711857886,412619504&fm=5",
                         @"https://ss0.baidu.com/6ONWsjip0QIZ8tyhnq/it/u=2062393668,327721364&fm=5",
                         
                         @"https://ss2.baidu.com/6ONYsjip0QIZ8tyhnq/it/u=2554383533,622622468&fm=5",
                         @"https://ss1.baidu.com/6ONXsjip0QIZ8tyhnq/it/u=2280035938,1114001359&fm=5"
                         ];
    for (int i=0; i<nameArray5.count; i++) {
        dogModel *model=[[dogModel alloc]init];
        model.name=nameArray5[i];
        model.PhotoAddress=urlArray5[i];
        model.sizeDog=Size_Large;
        [array addObject:model];
    }

    
    return array;
}
@end
