//
//  TgModel.m
//  团购
//
//  Created by medicool on 15/2/16.
//  Copyright (c) 2015年 ZK. All rights reserved.
//

#import "TgModel.h"

@implementation TgModel

- (instancetype)initWithDict:(NSDictionary *)dict
{
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}

+ (instancetype)tgWithDict:(NSDictionary *)dict
{
    return [[self alloc]initWithDict:dict];
}

@end
