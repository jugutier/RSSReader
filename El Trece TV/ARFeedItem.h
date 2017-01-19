//
//  ARFeedItem.h
//  El Trece TV
//
//  Created by Julian Gutierrez Ferrara on 1/6/16.
//  Copyright (c) 2016 Artear. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MWFeedItem.h"
@interface ARFeedItem : NSObject

@property (nonatomic, getter=getTitle) NSString *title;
@property (nonatomic, getter=getLink) NSString *link;
@property (nonatomic,getter=getDate) NSDate *date;
@property (nonatomic,getter=getSummary) NSString *summary;
@property (nonatomic,getter=getContent) NSString *content;
@property (nonatomic,getter=getAuthor) NSString *author;
@property (nonatomic,getter=getEnclosures) NSArray *enclosures;

/**
 * Initializer to be used only by ARFeedManager, exposes only the variables we are interested in and avoids coupling with an external library.
 */
- (instancetype)initWithItem:(MWFeedItem*)item;
@end
