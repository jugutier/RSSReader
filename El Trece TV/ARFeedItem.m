//
//  ARFeedItem.m
//  El Trece TV
//
//  Created by Julian Gutierrez Ferrara on 1/6/16.
//  Copyright (c) 2016 Artear. All rights reserved.
//

#import "ARFeedItem.h"
@interface ARFeedItem(){
    @private
    MWFeedItem* _item;
}
@end
@implementation ARFeedItem
- (instancetype)initWithItem:(MWFeedItem*)item
{
    self = [super init];
    if (self) {
        _item = item;
    }
    return self;
}
-(NSString*)getTitle{
    return _item.title;
}
-(NSString*)getLink{
    return _item.link;
}
-(NSDate*)getDate{
    return _item.date;
}
-(NSString*)getSummary{
    return _item.summary;
}
-(NSString*)getContent{
    return _item.content;
}
-(NSString*)getAuthor{
    return _item.author;
}
-(NSArray*)getEnclosures{
    return _item.enclosures;
}
@end
