//
//  DismissAnimation.m
//  ModalPresent
//
//  Created by Xueliang Zhu on 9/4/16.
//  Copyright © 2016 kotlinchina. All rights reserved.
//

#import "DismissAnimation.h"

@implementation DismissAnimation
// This is used for percent driven interactive transitions, as well as for container controllers that have companion animations that might need to
// synchronize with the main animation.
- (NSTimeInterval)transitionDuration:(nullable id <UIViewControllerContextTransitioning>)transitionContext {
    return 0.5;
}
// This method can only  be a nop if the transition is interactive and not a percentDriven interactive transition.
- (void)animateTransition:(id <UIViewControllerContextTransitioning>)transitionContext; {
    // 1. Get "to view controller" from transition context
    UIViewController *toVC = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    
    // 2. set "to view"'s init frame
    CGRect screenBounds = [[UIScreen mainScreen] bounds];
    toVC.view.frame = CGRectOffset(screenBounds, -screenBounds.size.width, 0);
    
    // 3. Add toVC's view to containerView
    UIView *containerView = [transitionContext containerView];
    [containerView addSubview:toVC.view];
    
    // 4. Do animation
    NSTimeInterval duration = [self transitionDuration:transitionContext];
    CGRect finalFrame = [transitionContext finalFrameForViewController:toVC];
    [UIView animateWithDuration:duration animations:^{
        toVC.view.frame = finalFrame;
    } completion:^(BOOL finished) {
        // 5. Tell context that animation completed.
        [transitionContext completeTransition:YES];
    }];
}
@end
