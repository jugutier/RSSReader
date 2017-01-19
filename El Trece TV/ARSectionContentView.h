//
//  ARSectionContentView.h
//  El Trece TV
//
//  Created by Julian Gutierrez Ferrara on 1/6/16.
//  Copyright (c) 2016 Artear. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <WebKit/WebKit.h>
#import "ARFeedItem.h"
@interface ARSectionContentView : UIView

@property(nonatomic,retain) UIWebView* webView;
/**
 * Method to display some text, for now represented in a webView... Could be anything we want it to be in the future.
 */
-(void)setText:(NSString*)text;
-(void)setImage:(NSString*)img;
-(void)setTitle:(NSString*)title;
-(void)setLink:(NSString*)link;
@end
