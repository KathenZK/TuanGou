//
//  TgModel.h
//  团购
//
//  Created by medicool on 15/2/16.
//  Copyright (c) 2015年 ZK. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TgModel : NSObject

@property (nonatomic, copy) NSString *title;

@property (nonatomic, copy) NSString *price;

@property (nonatomic, copy) NSString *icon;

@property (nonatomic, copy) NSString *buyCount;

- (instancetype)initWithDict:(NSDictionary *)dict;

+ (instancetype)tgWithDict:(NSDictionary *)dict;

@end
