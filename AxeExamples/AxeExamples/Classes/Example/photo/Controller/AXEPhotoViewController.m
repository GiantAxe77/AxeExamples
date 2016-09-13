//
//  AXEPhotoViewController.m
//  AxeExamples
//
//  Created by GiantAxe on 16/8/15.
//  Copyright © 2016年 GiantAxe. All rights reserved.
//

#import "AXEPhotoViewController.h"

// tools
#import <AFNetworking.h>

// controller
#import "AXEUMengSocialViewController.h"
#import "AXEParticleViewController.h"

@interface AXEPhotoViewController () <UIImagePickerControllerDelegate, UINavigationControllerDelegate, NSURLConnectionDataDelegate, UIViewControllerPreviewingDelegate>

@property (nonatomic, strong) UIImageView *imgView;

@end

@implementation AXEPhotoViewController

#pragma mark - life cycle

- (void)viewDidLoad {
    [super viewDidLoad];


    [self setup];
    [self setupUI];
    
    // 给响应Peek&Pop手势的视图进行注册,这里是给一个imgView进行注册
    [self registerForPreviewingWithDelegate:self sourceView:self.imgView];
    
    
    
//    [self praticeAfn];
}

#pragma mark - 3DTouch

- (void)traitCollectionDidChange:(UITraitCollection *)previousTraitCollection
{
    if(self.traitCollection.forceTouchCapability == UIForceTouchCapabilityAvailable)
    {
        NSLog(@"do sth");
    }
}

#pragma mark - UIViewControllerPreviewingDelegate

- (UIViewController *)previewingContext:(id<UIViewControllerPreviewing>)previewingContext viewControllerForLocation:(CGPoint)location
{
    // 通过上下文可以调整不被虚化的范围
    previewingContext.sourceRect = CGRectMake(10, 10, 10, 10);
    
    // 预览的控制器是我的另外一个控制器
//    AXEUMengSocialViewController *vc = [AXEUMengSocialViewController new];
    AXEParticleViewController *vc = [AXEParticleViewController new];
    return vc;
}

- (void)previewingContext:(id<UIViewControllerPreviewing>)previewingContext commitViewController:(UIViewController *)viewControllerToCommit
{
    // 这个相当于push操作,push到预览的控制器
    [self showViewController:viewControllerToCommit sender:self];
}


#pragma mark - http

- (void)praticeAfn
{
    NSURLRequest *request = [[NSURLRequest alloc] initWithURL:[NSURL URLWithString:@"http://baidu.com"]];
    NSURLConnection *connection = [[NSURLConnection alloc] initWithRequest:request delegate:self startImmediately:NO];
    [connection start];
    
}

#pragma mark - NSURLConnectionDataDelegate

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    AXELog(@"%@", data);

    NSString *dataStr = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    AXELog(@"%@", dataStr);
}

- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error
{
    AXELog(@"%@", error);
}

- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response
{
    AXELog(@"%@", response);
}

- (void)setup
{
    self.navigationItem.title = @"take photo";
    self.view.backgroundColor = AXEColor(242, 245, 243);
}

- (void)setupUI
{
    UIImageView *imgView = [[UIImageView alloc] init];
    imgView.frame = CGRectMake(100, 100, 128, 128);
    imgView.image = [UIImage imageNamed:@"bennet10"];
    imgView.userInteractionEnabled = YES;
    [self.view addSubview:imgView];
    self.imgView = imgView;
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(clickAvatar)];
    [imgView addGestureRecognizer:tap];

}

- (void)clickAvatar
{
    AXEWeakSelf;
    UIAlertController *vc = [UIAlertController alertControllerWithTitle:@"setting avatar" message:nil preferredStyle:UIAlertControllerStyleActionSheet];
    
    UIAlertAction *action1 = [UIAlertAction actionWithTitle:@"take photo" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
        UIImagePickerController *imgPicker = [[UIImagePickerController alloc] init];
        imgPicker.sourceType = UIImagePickerControllerSourceTypeCamera;
        imgPicker.delegate = weakSelf;
        imgPicker.allowsEditing = YES;
        [weakSelf presentViewController:imgPicker animated:YES completion:nil];
    }];
    
    UIAlertAction *action2 = [UIAlertAction actionWithTitle:@"album" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
        UIImagePickerController *imgPicker = [[UIImagePickerController alloc] init];
        imgPicker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
        imgPicker.delegate = weakSelf;
        imgPicker.allowsEditing = YES;
        [weakSelf presentViewController:imgPicker animated:YES completion:nil];
    }];
    
    UIAlertAction *action3 = [UIAlertAction actionWithTitle:@"cancel" style:UIAlertActionStyleDestructive handler:nil];
    
    [vc addAction:action1];
    [vc addAction:action2];
    [vc addAction:action3];
    
    [self presentViewController:vc animated:YES completion:nil];
}

#pragma mark - UIImagePickerControllerDelegate

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info
{
    [self dismissViewControllerAnimated:YES completion:nil];
    
    UIImage *image = [info valueForKey:@"UIImagePickerControllerEditedImage"];
    
    if(image)
    {
    }
}

@end
