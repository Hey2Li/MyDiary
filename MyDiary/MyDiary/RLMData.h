//
//  RLMData.h
//  MyDiary
//
//  Created by Tebuy on 16/12/26.
//  Copyright © 2016年 Tebuy. All rights reserved.
//

#import <Realm/Realm.h>

@interface RLMData : RLMObject
/*
 objectClasses这个属性是用来控制对哪个类能够存储在指定 Realm 数据库中做出限制。例如，如果有两个团队分别负责开发您应用中的不同部分，并且同时在应用内部使用了 Realm 数据库，那么您肯定不希望为它们协调进行数据迁移您可以通过设置RLMRealmConfiguration的 objectClasses属性来对类做出限制。objectClasses一般可以不用设置。
 */
@property NSString *titleName;
@property NSString *diaryContent;
@property NSString *diaryTime;
@property NSString *diaryWeather;
@property NSString *diaryNumber;
@property NSString *diaryWeek;
//@property NSInteger id;
//RLM_ARRAY_TYPE(RLMData)

@end
