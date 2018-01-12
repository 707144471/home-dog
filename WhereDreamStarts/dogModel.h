//
//  dogModel.h
//  WhereDreamStarts
//
//  Created by 123 on 2018/1/12.
//  Copyright © 2018年 handsomeBoy. All rights reserved.
//

#import <Foundation/Foundation.h>
/*按照体型*/
typedef NS_ENUM(NSInteger, StateSizeDog)
{
    Size_Subminiature = 0,//超小型
    Size_VeryLarge = 1,//超大型
    Size_Small = 2,//小型
    Size_Medium = 3,//中型
    Size_Large = 4,//大型
    
    
};
/*按照功能*/
typedef NS_ENUM(NSInteger, StateFunctionDog)
{
    
    Function_familyDog = 0,//家庭犬
    Function_toyDog = 1,//玩具犬
    Function_WorkingDogs = 2,//工作犬
    Function_terriersDog = 3,//梗类犬
    Function_shepherdDog = 4,//牧羊犬
    Function_HuntingDogs = 5,//狩猎犬
    Function_GunDog = 6,//枪猎犬
    
    
};
/*按照特点*/
typedef NS_ENUM(NSInteger, StateCharacteristicsDog)
{
    
    Characteristics_smart = 0,//聪明犬
    Characteristics_clingy = 1,//粘人
    Characteristics_dropping = 2,//不掉毛
    Characteristics_DontCall = 3,//不爱叫
    Characteristics_friendly = 4,//友善
    Characteristics_housekeeping = 5,//会看家
    Characteristics_HeatResistant = 6,//耐热
    Characteristics_YiXun = 7,//易训
    
};
@interface dogModel : NSObject
@property(nonatomic,copy)NSString *name;//名称
@property(nonatomic,assign)StateSizeDog sizeDog;//体型
@property(nonatomic,assign)StateFunctionDog functionDog;//功能
@property(nonatomic,assign)StateCharacteristicsDog characteristicsDog;//特点
@property(nonatomic,copy)NSString *PhotoAddress;//预览图片地址
@property(nonatomic,copy)NSString *IQ;//智商
@end
