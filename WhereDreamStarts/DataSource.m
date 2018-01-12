//
//  DataSource.m
//  WhereDreamStarts
//
//  Created by 123 on 2018/1/12.
//  Copyright © 2018年 handsomeBoy. All rights reserved.
//

#import "DataSource.h"

@implementation DataSource
+(void)getDogBreeds_block:(void(^)(NSMutableArray *dogArray))block{

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
@end
