//
//  ARMainViewController.h
//  El Trece TV
//
//  Created by Julian Gutierrez Ferrara on 1/5/16.
//  Copyright (c) 2016 Artear. All rights reserved.
//

#import <UIKit/UIKit.h>
/**
 *@brief This is the host controller, which will defer to the section subcontrollers.
 */
@interface ARMainViewController : UIViewController <UIPageViewControllerDataSource>

@property (strong, nonatomic) UIPageViewController *pageController;

@end

