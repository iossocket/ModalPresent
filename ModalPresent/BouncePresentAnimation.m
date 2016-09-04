//
//  BouncePresentAnimation.m
//  ModalPresent
//
//  Created by Xueliang Zhu on 9/4/16.
//  Copyright © 2016 kotlinchina. All rights reserved.
//

#import "BouncePresentAnimation.h"

//UIViewControllerContextTransitioning 这个接口负责切换的具体内容，也即“切换中应该发生什么”。开发者在做自定义切换效果时大部分代码会是用来实现这个接口。

@implementation BouncePresentAnimation

// 系统给出一个切换上下文，我们根据上下文环境返回这个切换所需要的花费时间（一般就返回动画的时间就好了，SDK会用这个时间来在百分比驱动的切换中进行帧的计算，后面再详细展开）
- (NSTimeInterval)transitionDuration:(nullable id <UIViewControllerContextTransitioning>)transitionContext {
    return 0.5;
}

// 在进行切换的时候将调用该方法，我们对于切换时的UIView的设置和动画都在这个方法中完成
- (void)animateTransition:(id <UIViewControllerContextTransitioning>)transitionContext {
    
    // 1. Get "to view controller" from transition context
    UIViewController *toVC = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    
    // 2. set "to view"'s init frame
    CGRect screenBounds = [[UIScreen mainScreen] bounds];
    toVC.view.frame = CGRectOffset(screenBounds, screenBounds.size.width, 0);
    
    // 3. Add toVC's view to containerView
    UIView *containerView = [transitionContext containerView];
    [containerView addSubview:toVC.view];
    
    // 4. Do animation
    NSTimeInterval duration = [self transitionDuration:transitionContext];
    CGRect finalFrame = [transitionContext finalFrameForViewController:toVC];
    [UIView animateWithDuration:duration
                          delay:0.0
         usingSpringWithDamping:0.6
          initialSpringVelocity:0.0
                        options:UIViewAnimationOptionCurveLinear
                     animations:^{
                         toVC.view.frame = finalFrame;
                     } completion:^(BOOL finished) {
                         // 5. Tell context that animation completed.
                         [transitionContext completeTransition:YES];
                     }];
}
@end
