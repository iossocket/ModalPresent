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
    // 1. Get controllers from transition context
    UIViewController *fromVC = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    UIViewController *toVC = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    
    // 2. Set init frame for fromVC
    CGRect screenBounds = [[UIScreen mainScreen] bounds];
    CGRect finalFrame = CGRectOffset(screenBounds, screenBounds.size.width, 0);
    
    // 3. Add target view to the container, and move it to back.
    UIView *containerView = [transitionContext containerView];
    [containerView addSubview:toVC.view];
    [containerView sendSubviewToBack:toVC.view];
    
    // 4. Do animate now
    NSTimeInterval duration = [self transitionDuration:transitionContext];
    [UIView animateWithDuration:duration animations:^{
        fromVC.view.frame = finalFrame;
    } completion:^(BOOL finished) {
        [transitionContext completeTransition:![transitionContext transitionWasCancelled]];
    }];
}
@end
