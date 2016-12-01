//
//  XYYSinglePhotoController.m
//  PhotosPicker
//
//  Created by 全球沃 on 2016/12/1.
//  Copyright © 2016年 全球沃. All rights reserved.
//

#import "XYYSinglePhotoController.h"
#import <Masonry.h>
#import <Social/Social.h>

@interface XYYSinglePhotoController ()<UIImagePickerControllerDelegate,UINavigationControllerDelegate>

/** imageView */
@property (strong, nonatomic) UIImageView *imageView;

/** UIImagePickerController */
@property (strong, nonatomic) UIImagePickerController *ipc;

@end

@implementation XYYSinglePhotoController

- (UIImagePickerController *)ipc {
    
    if (!_ipc) {
        
        _ipc = [[UIImagePickerController alloc]init];
        
    }
    
    return _ipc;
    
}


- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor lightGrayColor];
    
    [self setupImageView];
    
    self.title = @"Single";
    
    [self setupBackBtn];

}

- (void)viewDidLayoutSubviews {
    
    [self setupButton];
    
}

- (void)setupBackBtn {
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"返回" style:UIBarButtonItemStylePlain target:self action:@selector(dismiss)];
    
    [self.navigationItem.leftBarButtonItem setTintColor:[UIColor blackColor]];
    
}

- (void)dismiss {
    
    [self dismissViewControllerAnimated:YES completion:nil];
    
}

- (void)setupButton {
    
    for (int i = 0 ; i < 3; i++) {
        
        UIButton *button = [[UIButton alloc]init];
        
        [button setBackgroundColor:[UIColor purpleColor]];
        
        [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        
        switch (i) {
            case 0:
                
                [button setTitle:@"选择" forState:UIControlStateNormal];
                
                [button addTarget:self action:@selector(pickPhotos) forControlEvents:UIControlEventTouchUpInside];
                
                [button setFrame:CGRectMake(BSImageViewX, BSImageViewH + padding + 84, 50, 35)];

                break;
                
            case 1:
                
                [button setTitle:@"清空" forState:UIControlStateNormal];
                
                [button addTarget:self action:@selector(clearTheImage) forControlEvents:UIControlEventTouchUpInside];
                
                [button setFrame:CGRectMake(self.imageView.center.x - (CGFloat)25, BSImageViewH + padding + 84, 50, 35)];
                
                break;
                
            case 2:
                
                [button setTitle:@"分享" forState:UIControlStateNormal];
                
                [button addTarget:self action:@selector(presentShare) forControlEvents:UIControlEventTouchUpInside];
                
                [button setFrame:CGRectMake(BSImageViewW - (CGFloat)30, BSImageViewH + padding + 84, 50, 35)];
                
                break;
                
            default:
                break;
        }
        
        [self.view addSubview:button];
        
    }
    
    
}

- (void)setupImageView {
    
    UIImageView *imageView = [[UIImageView alloc]init];
    
    imageView.backgroundColor = [UIColor brownColor];
    
    [self.view addSubview:imageView];
    
    [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.mas_equalTo(self.view.mas_left).offset(padding);
        
        make.right.mas_equalTo(self.view.mas_right).offset(-padding);
        
        make.top.mas_equalTo(self.view.mas_top).offset(84);
        
        make.bottom.mas_equalTo(self.view.mas_bottom).offset(-200);
        
    }];
    
    self.imageView = imageView;
    
}


- (void)presentShare {
    
    NSString *text = @"分享内容";
    
    UIImage *image = self.imageView.image;
    
    NSURL *url = [NSURL URLWithString:@"http://www.qqw16888.com"];
    
    if (image == nil) {
        
        UIAlertAction *ac = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDestructive handler:nil];
        
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:nil message:@"请选择图片" preferredStyle:UIAlertControllerStyleAlert];
        
        [alert addAction:ac];
        
        [self presentViewController:alert animated:YES completion:nil];
        
        return;
        
    }
    
    NSArray *activityItems = @[text, image, url];
    
    UIActivityViewController *activityViewController = [[UIActivityViewController alloc] initWithActivityItems:activityItems applicationActivities:nil];
    
    
    [self presentViewController:activityViewController animated:YES completion:nil];
    
    [activityViewController setCompletionWithItemsHandler:^(NSString * __nullable activityType, BOOL completed, NSArray * __nullable returnedItems, NSError * __nullable activityError) {
        
        if (completed) {
            
            UIAlertAction *action = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil];
            
            UIAlertController *ac = [UIAlertController alertControllerWithTitle:nil message:@"分享成功" preferredStyle:UIAlertControllerStyleAlert];
            
            [ac addAction:action];
            
            [self presentViewController:ac animated:YES completion:nil];
            
        }else {
            
            UIAlertAction *action = [UIAlertAction actionWithTitle:@"FAILED" style:UIAlertActionStyleDefault handler:nil];
            
            UIAlertController *ac = [UIAlertController alertControllerWithTitle:nil message:@"分享失败" preferredStyle:UIAlertControllerStyleAlert];
            
            [ac addAction:action];
            
            [self presentViewController:ac animated:YES completion:nil];
            
            
        }
        
        
    }];
    
}

- (void)pickPhotos {
    
    if (![UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypePhotoLibrary]) return;
    
    self.ipc.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    
    self.ipc.delegate = self;
    
    self.ipc.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
    
    [self presentViewController:self.ipc animated:YES completion:nil];
    
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingImage:(UIImage *)image editingInfo:(nullable NSDictionary<NSString *,id> *)editingInfo {
    
    [picker dismissViewControllerAnimated:YES completion:nil];
    
    self.imageView.image = image;
    
}

- (void)clearTheImage {
    
    
    self.imageView.image = nil;
    
}

@end
