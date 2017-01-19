//
//  ARFeedManager.m
//  El Trece TV
//
//  Created by Julian Gutierrez Ferrara on 1/5/16.
//  Copyright (c) 2016 Artear. All rights reserved.
//
//  DISCLAIMER Part of the code hereby is taken from MWFeedParser's sample classes see https://github.com/mwaterfall/MWFeedParser/blob/master/Classes/RootViewController.m

#import "ARFeedManager.h"
#import "MWFeedParser.h"
@interface ARFeedManager () <MWFeedParserDelegate>{
    @private
    MWFeedParser* _feedParser;
    NSMutableArray * _parsedItems;
    ARDataLoadedHandler _handler;
}
@end
@implementation ARFeedManager
#pragma mark - Lifecycle
- (instancetype)init
{
    self = [super init];
    if (self) {
        NSURL *feedURL = [NSURL URLWithString:FEED_URL];
        _feedParser = [[MWFeedParser alloc] initWithFeedURL:feedURL];
        _feedParser.delegate = self;
        _feedParser.connectionType = ConnectionTypeAsynchronously;
        _feedParser.feedParseType = ParseTypeFull;
        _parsedItems = [[NSMutableArray alloc] init];
    }
    return self;
}
#pragma mark - Public methods
+ (id)sharedManager {
    static ARFeedManager *sharedManager = nil;
    if (!sharedManager){//This is to not enter the lock unnecesarily
        @synchronized(self) {
            if (!sharedManager) //This one is for syncronization
                sharedManager = [[self alloc] init];
        }
    }
    return sharedManager;
}
-(void)start:(ARDataLoadedHandler)handler{
    _handler = handler;
    [_feedParser parse];
}
#pragma mark - MWFeedParserDelegate
//This method is called for every node on the feed.
- (void)feedParser:(MWFeedParser *)parser didParseFeedItem:(MWFeedItem *)item {
    if (item) [_parsedItems addObject:[[ARFeedItem alloc]initWithItem:item]];
}

- (void)feedParserDidFinish:(MWFeedParser *)parser{
    NSLog(@"Finished Parsing%@", (parser.stopped ? @" (Stopped)" : @""));
    _handler(_parsedItems);
}
- (void)feedParser:(MWFeedParser *)parser didFailWithError:(NSError *)error{
    NSLog(@"Error while parsing %@",error);
    //TODO: pass on the error message to a different lambda block for user handling.
}
@end
