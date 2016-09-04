//
//  SwipeInteractiveTransition.h
//  ModalPresent
//
//  Created by Xueliang Zhu on 9/4/16.
//  Copyright © 2016 kotlinchina. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SwipeInteractiveTransition : UIPercentDrivenInteractiveTransition

@property (nonatomic, assign) BOOL isInteracting;

- (void)wireToViewController:(UIViewController*)viewController;

@end
