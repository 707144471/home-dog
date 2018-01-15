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
                               @"布鲁塞尔格里芬犬",
                               @"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@""];
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
                               @"标准型雪纳瑞犬",
                               @"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@""];
                
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
