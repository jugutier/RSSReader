//
//  ARSectionViewController.h
//  El Trece TV
//
//  Created by Julian Gutierrez Ferrara on 1/5/16.
//  Copyright (c) 2016 Artear. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ARFeedItem.h"
#import "ARSectionContentView.h"
@interface ARSectionViewController : UIViewController
@property (assign, nonatomic) NSInteger index;
/**
 * Set the item that will help draw the view.
 */
-(void)setItem:(ARFeedItem*)item;
@end
