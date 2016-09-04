//
//  ViewController.m
//  ModalPresent
//
//  Created by Xueliang Zhu on 9/4/16.
//  Copyright © 2016 kotlinchina. All rights reserved.
//

#import "ViewController.h"
#import "ModalViewController.h"
#import "BouncePresentAnimation.h"
#import "DismissAnimation.h"
#import "SwipeInteractiveTransition.h"

@interface ViewController ()<ModalViewControllerDelegate, UIViewControllerTransitioningDelegate>
@property (nonatomic, strong) BouncePresentAnimation *presentAnimation;
@property (nonatomic, strong) DismissAnimation *dismissAnimation;
@property (nonatomic, strong) SwipeInteractiveTransition *transitionController;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _presentAnimation = [BouncePresentAnimation new];
    _dismissAnimation = [DismissAnimation new];
    _transitionController = [SwipeInteractiveTransition new];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    button.frame = CGRectMake(80.0, 210.0, 160.0, 40.0);
    [button setTitle:@"Click me" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
}

-(void) buttonClicked:(id)sender {
    ModalViewController *mvc =  [[ModalViewController alloc] init];
    mvc.delegate = self;
    mvc.transitioningDelegate = self;
    [self.transitionController wireToViewController:mvc];
    [self presentViewController:mvc animated:YES completion:nil];
}

-(void)modalViewControllerDidClickedDismissButton:(ModalViewController *)viewController {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (nullable id <UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source {
    return self.presentAnimation;
}

- (nullable id <UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed {
    return self.dismissAnimation;
}

- (nullable id <UIViewControllerInteractiveTransitioning>)interactionControllerForDismissal:(id <UIViewControllerAnimatedTransitioning>)animator {
    return self.transitionController.isInteracting ? self.transitionController : nil;
}

@end
