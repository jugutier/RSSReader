//
//  ARSectionViewController.m
//  El Trece TV
//
//  Created by Julian Gutierrez Ferrara on 1/5/16.
//  Copyright (c) 2016 Artear. All rights reserved.
//

#import "ARSectionViewController.h"

@interface ARSectionViewController (){
    @private
    ARSectionContentView * _contentView;
    ARFeedItem* _item;
}

@end

@implementation ARSectionViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    if(!_contentView){
        _contentView = [[ARSectionContentView alloc]initWithFrame:self.view.frame];
        [_contentView setTitle:_item.title];
        [_contentView setLink:_item.link];
        [_contentView setImage:_item.content];
        [_contentView setText:_item.summary];
        [self.view addSubview:_contentView];
    }
}
-(void)setItem:(ARFeedItem*)item{
    _item = item;
}
@end
