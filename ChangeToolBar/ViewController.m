//
//  ViewController.m
//  ChangeToolBar
//
//  Created by 誠也 前田 on 12/07/22.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    //初期起動でリフレッシュボタンを表示しておく
    [self rightItemButtonWithRefresh];
}

//リフレッシュボタン
-(void)rightItemButtonWithRefresh{
    
    //バーにボタンを追加
    UIBarButtonItem *rightItemButtonWithRefresh = [[UIBarButtonItem alloc] 
                                       initWithBarButtonSystemItem:UIBarButtonSystemItemRefresh
                                       target:self 
                                       action:@selector(refreshBtnEvent:)
                               ];
    
    [self setToolbarItems:[NSArray arrayWithObjects:rightItemButtonWithRefresh, nil] animated:YES];
    self.navigationItem.rightBarButtonItem = rightItemButtonWithRefresh;
}

//インジケーターボタン
-(void)rightItemButtonWithActivityIndicator{
    //インジケーター インスタンス生成
    UIActivityIndicatorView *activityIndicator = [[UIActivityIndicatorView alloc] initWithFrame:CGRectMake(0, 0, 20, 20)];
    
    //ボタンにインジケーターをセットする
    UIBarButtonItem *activityButtonItem = [[UIBarButtonItem alloc] initWithCustomView:activityIndicator];
    [self setToolbarItems:[NSArray arrayWithObjects:activityButtonItem, nil] animated:YES]; 
    self.navigationItem.rightBarButtonItem = activityButtonItem;
    
    //くるくるスタート
    [activityIndicator startAnimating];
    
    //↓ここに何か処理
    NSLog(@"ここに何か処理");
    //↑ここに何か処理
    
    //activityIndicatorBtnEvent:を呼ぶ.今回は例としてafterDelay:で2秒のウェイトを乗せてます
    [self performSelector:@selector(activityIndicatorBtnEvent:) withObject:nil afterDelay:2.0];
    
    [activityIndicator release];
    [activityButtonItem release];
     
}

- (void) refreshBtnEvent:(id)sender
{
    // インジケーターボタンに切り替える
    [self rightItemButtonWithActivityIndicator];
    
}

- (void) activityIndicatorBtnEvent:(id)sender
{
    //インジケーター インスタンス生成
    UIActivityIndicatorView *activityIndicator = [[UIActivityIndicatorView alloc]init];
    //くるくるストップ
    [activityIndicator stopAnimating];
    [activityIndicator release];
    
    //リフレッシュボタンに切り替える
    [self rightItemButtonWithRefresh];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

@end
