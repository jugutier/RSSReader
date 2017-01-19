//
//  ARFeedManager.h
//  El Trece TV
//
//  Created by Julian Gutierrez Ferrara on 1/5/16.
//  Copyright (c) 2016 Artear. All rights reserved.
//
#import <Foundation/Foundation.h>
#import "ARFeedItem.h"
/**
 * Url feed seting
 */
#define FEED_URL @"https://rss.nytimes.com/services/xml/rss/nyt/HomePage.xml"

/**
 * The handler will receive the parsed items (ARFeedItem) in an array.
 */
typedef void (^ARDataLoadedHandler) (NSArray* items);

/**
 *@brief Singleton RSS Feed manager. Requests are asynchronous.
 */
@interface ARFeedManager : NSObject 
/**
 * @brief Acess the shared manager.
 */
+ (id)sharedManager;
/**
 * @brief start fetching and parsing data.
 */
-(void)start:(ARDataLoadedHandler) handler;
@end
