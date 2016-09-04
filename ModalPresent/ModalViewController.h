//
//  ModalViewController.h
//  ModalPresent
//
//  Created by Xueliang Zhu on 9/4/16.
//  Copyright © 2016 kotlinchina. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ModalViewController;
@protocol ModalViewControllerDelegate <NSObject>
-(void) modalViewControllerDidClickedDismissButton:(ModalViewController *)viewController;
@end

@interface ModalViewController : UIViewController
@property (nonatomic, weak) id<ModalViewControllerDelegate> delegate;
@end
