//
//  ARMainViewController.m
//  El Trece TV
//
//  Created by Julian Gutierrez Ferrara on 1/5/16.
//  Copyright (c) 2016 Artear. All rights reserved.
//

#import "ARMainViewController.h"
#import "ARFeedManager.h"
#import "ARSectionViewController.h"
#import "ARSectionStoriesSetting.h"
#import "ARSectionShowsSetting.h"
@interface ARMainViewController (){
    NSArray* _dataSource;
    UINavigationBar * _bar;
}
@end

@implementation ARMainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor darkGrayColor];
    _bar = [[UINavigationBar alloc]initWithFrame:CGRectMake(0, 0, [[UIScreen mainScreen]bounds].size.width, 80)];
    [self.view addSubview:_bar];
    
    //Tell the user we are fetching first items off the internet.
    UIActivityIndicatorView *spinner = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
    spinner.center = self.view.center;
    spinner.hidesWhenStopped = YES;
    [self.view addSubview:spinner];
    [spinner startAnimating];
    
    __weak UIActivityIndicatorView *weakSpinner = spinner;//to avoid retain cycles
    [[ARFeedManager sharedManager]start:^(NSArray * items){
        _dataSource = items;
        //        for (ARFeedItem* item in items) {
        //            NSLog(@"%@",item.title);
        //        }
        [weakSpinner stopAnimating];
        [self preparePageController];
    }];
}
/**
 * @brief sets the bar style with font, color and title for each section.
 */
-(void)setBarStyleForIndex:(NSUInteger)index{
    NSShadow *shadow = [[NSShadow alloc] init];
    //This could also be part of each ARSectionXXSetting.
    shadow.shadowColor = [UIColor colorWithRed:0.0 green:0.0 blue:0.0 alpha:0.8];
    shadow.shadowOffset = CGSizeMake(0, 1);
    UIColor * currentFontColor;
    UIFont * currentFont;
    UIColor * currentBackgroundColor;
    UINavigationItem *navItem;
    if(!_bar.topItem){
        navItem = [UINavigationItem alloc];
        [_bar pushNavigationItem:navItem animated:NO];
    }else{
        navItem = _bar.topItem;
    }
    switch (index) {
        case 0://Stories
            currentFontColor = [ARSectionStoriesSetting color];
            currentFont = [ARSectionStoriesSetting font];
            currentBackgroundColor = [ARSectionStoriesSetting backgroundcolor];
            navItem.title = [ARSectionStoriesSetting title];
            
            break;
        case 1://Shows
            currentFontColor = [ARSectionShowsSetting color];
            currentFont = [ARSectionShowsSetting font];
            currentBackgroundColor = [ARSectionShowsSetting backgroundcolor];
            navItem.title = [ARSectionShowsSetting title];
            
            break;
            
            // @scaling add more cases here or create a section manager holding an array of settings and iterate over.
        default:
            currentFontColor = [UIColor colorWithRed:245.0/255.0 green:245.0/255.0 blue:245.0/255.0 alpha:1.0];
            currentFont =[UIFont fontWithName:@"HelveticaNeue-CondensedBlack" size:30.0];
            currentBackgroundColor = [UIColor brownColor];
            navItem.title = [NSString stringWithFormat:@"Section %lu",(unsigned long)index];
            //There could also be a default settings class
            break;
    }
    //_bar.backgroundColor = currentBackgroundColor;
    [UIView animateWithDuration:0.5 animations:^{
        _bar.layer.backgroundColor = currentBackgroundColor.CGColor;
    }];
    //    _bar.translucent = NO;
    //    _bar.opaque = YES;
    [_bar setTitleTextAttributes: [NSDictionary dictionaryWithObjectsAndKeys:                                                                       currentFontColor, NSForegroundColorAttributeName,
                                   shadow, NSShadowAttributeName,
                                   currentFont, NSFontAttributeName,
                                   nil]];
    
}
-(void)preparePageController{
    self.pageController = [[UIPageViewController alloc] initWithTransitionStyle:UIPageViewControllerTransitionStyleScroll navigationOrientation:UIPageViewControllerNavigationOrientationHorizontal options:nil];
    self.pageController.dataSource = self;
    CGRect frame = CGRectMake(0,_bar.frame.size.height , self.view.bounds.size.width, self.view.bounds.size.height-_bar.frame.size.height-20);//discounting 20 for the pagecontroll. This would go away when moved to the status bar.
    [self.pageController.view setFrame:frame];
    
    //set nav bar
    [self setBarStyleForIndex:0];
    //set content for section
    ARSectionViewController *initialViewController = [self viewControllerAtIndex:0];
    NSArray *viewControllers = [NSArray arrayWithObject:initialViewController];
    
    [self.pageController setViewControllers:viewControllers direction:UIPageViewControllerNavigationDirectionForward animated:YES completion:nil];
    
    for (UIView * view in self.pageController.view.subviews) {
        if([view isKindOfClass:[UIPageControl class]]){
            //            [self.view bringSubviewToFront:view];
            //            [view removeFromSuperview];
            //            view.frame =CGRectMake(0, 60, [[UIScreen mainScreen]bounds].size.width, 20);
            //            [_bar addSubview:view];
            //TODO: hack and move the pagecontrol into the navBar. Alternatively use our own UIPageControl.
        }
    }
    
    [self addChildViewController:self.pageController];
    [self.view addSubview:self.pageController.view];
    [self.pageController didMoveToParentViewController:self];
}
#pragma mark - UIPageViewControllerDataSource
- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController {
    
    NSUInteger index = [(ARSectionViewController *)viewController index];
    
    if (index == 0) {
        return nil;
    }
    
    index--;
    [self setBarStyleForIndex:index];
    return [self viewControllerAtIndex:index];
    
}

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController {
    
    NSUInteger index = [(ARSectionViewController *)viewController index];
    
    
    index++;
    
    if (index == [_dataSource count]) {
        return nil;
    }
    [self setBarStyleForIndex:index];
    return [self viewControllerAtIndex:index];
    
}
- (ARSectionViewController *)viewControllerAtIndex:(NSUInteger)index {
    
    ARSectionViewController *childViewController = [[ARSectionViewController alloc] init];
    [childViewController setItem:[_dataSource objectAtIndex:index]];
    childViewController.index = index;
    
    return childViewController;
    
}
#pragma mark - UIPageControllDelegate
- (NSInteger)presentationCountForPageViewController:(UIPageViewController *)pageViewController {
    // The number of items reflected in the page indicator.
    return [_dataSource count];
}

- (NSInteger)presentationIndexForPageViewController:(UIPageViewController *)pageViewController {
    // The selected item reflected in the page indicator.
    return 0;
}
@end
