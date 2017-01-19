
//
//  ARSectionStoriesSetting.m
//  El Trece TV
//
//  Created by Julian Gutierrez Ferrara on 1/6/16.
//  Copyright (c) 2016 Artear. All rights reserved.
//

#import "ARSectionStoriesSetting.h"
#import "UIColor+ElTrece.h"
#import "UIFont+ElTrece.h"

@implementation ARSectionStoriesSetting
+(UIFont *)font{
    return [[[UIFont alloc]init] sectionStoriesFont];
}
+(UIColor *)color{
    return [[[UIColor alloc]init] sectionStoriesColor];
}
+(NSString *)title{
    return @"Stories";
}
+(UIColor *)backgroundcolor{
    return [[[UIColor alloc]init] sectionStoriesBackgroundColor];
}
@end
