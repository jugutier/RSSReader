//
//  ARSectionShowsSetting.m
//  El Trece TV
//
//  Created by Julian Gutierrez Ferrara on 1/6/16.
//  Copyright (c) 2016 Artear. All rights reserved.
//

#import "ARSectionShowsSetting.h"
#import "UIColor+ElTrece.h"
#import "UIFont+ElTrece.h"

@implementation ARSectionShowsSetting
+(UIFont *)font{
    return [[[UIFont alloc]init] sectionShowsFont];
}
+(UIColor *)color{
    return [[[UIColor alloc]init] sectionShowsColor];
}
+(NSString *)title{
    return @"Shows";
}
+(UIColor *)backgroundcolor{
    return [[[UIColor alloc]init] sectionShowsBackgroundColor];
}
@end
