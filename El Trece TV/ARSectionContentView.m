//
//  ARSectionContentView.m
//  El Trece TV
//
//  Created by Julian Gutierrez Ferrara on 1/6/16.
//  Copyright (c) 2016 Artear. All rights reserved.
//

#import "ARSectionContentView.h"
@implementation ARSectionContentView
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        _webView = [[UIWebView alloc]initWithFrame:frame];
        _webView.backgroundColor = [UIColor clearColor];
        [self addSubview:_webView];
    }
    return self;
}
-(void)setTitle:(NSString*)title{
    NSLog(@"%@",title);
    title = [NSString stringWithFormat:@"<h2>%@</h2>",title];
    [self addToWebView:title];
}
-(void)setLink:(NSString*)link{
    NSLog(@"%@",link);
    link = [NSString stringWithFormat:@"<a href=%@>%@</a>",link, link];
    [self addToWebView:link];
}
-(void)setImage:(NSString*)img{
    NSLog(@"%@",img);
    img = [NSString stringWithFormat:@"<img src=%@>%@</a>",img, img];
    [self addToWebView:img];
}
-(void)setText:(NSString*)text{
    NSLog(@"%@",text);
    text = [NSString stringWithFormat:@"<p>%@</p>",text];
    [self addToWebView:text];
}
#pragma mark - private
- (void)addToWebView:(NSString *)toAdd {
    NSString *java = [NSString stringWithFormat:@"document.body.innerHTML += '%@'", toAdd];
    [_webView stringByEvaluatingJavaScriptFromString:java];
}
@end
