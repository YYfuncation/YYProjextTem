//
//  ZFJTransition.m
//  poseidon
//
//  Created by ZFJ on 2017/3/24.
//  Copyright © 2017年 张福杰. All rights reserved.
//

#import "ZFJTransition.h"
#import <objc/runtime.h>
#import <dlfcn.h>

static ZFJTransitionGestureRecognizerType __ZFJTransitionGestureRecognizerType = ZFJTransitionGestureRecognizerTypePan;

void __ZFJTransition_Swizzle(Class c, SEL origSEL, SEL newSEL){

    Method origMethod = class_getInstanceMethod(c, origSEL);
    Method newMethod = nil;
    if (!origMethod) {
        origMethod = class_getClassMethod(c, origSEL);
        newMethod = class_getClassMethod(c, newSEL);
    }else{
        newMethod = class_getInstanceMethod(c, newSEL);
    }
    
    if (!origMethod||!newMethod) {
        return;
    }

    if(class_addMethod(c, origSEL, method_getImplementation(newMethod), method_getTypeEncoding(newMethod))){
        class_replaceMethod(c, newSEL, method_getImplementation(origMethod), method_getTypeEncoding(origMethod));
    }else{
        method_exchangeImplementations(origMethod, newMethod);
    }
}

@interface NSString (__ZFJTransition_Encrypt)

- (NSString *)__zfjEncryptString;
- (NSString *)__zfjDecryptString;

@end

@implementation NSString (__ZFJTransition_Encrypt)

- (NSString *)__zfjRot13{
    const char *source = [self cStringUsingEncoding:NSASCIIStringEncoding];
    char *dest = (char *)malloc((self.length + 1) * sizeof(char));
    if (!dest) {
        return nil;
    }
    
    NSUInteger i = 0;
    for ( ; i < self.length; i++) {
        char c = source[i];
        if (c >= 'A' && c <= 'Z') {
            c = (c - 'A' + 13) % 26 + 'A';
        }
        else if (c >= 'a' && c <= 'z') {
            c = (c - 'a' + 13) % 26 + 'a';
        }
        dest[i] = c;
    }
    dest[i] = '\0';
    
    NSString *result = [[NSString alloc] initWithCString:dest encoding:NSASCIIStringEncoding];
    free(dest);
    
    return result;
}

- (NSString *)__zfjEncryptString{
    NSData *data = [self dataUsingEncoding:NSUTF8StringEncoding];
    NSString *base64 = [data base64EncodedStringWithOptions:0];
    return [base64 __zfjRot13];
}

- (NSString *)__zfjDecryptString{
    NSString *rot13 = [self __zfjRot13];
    NSData *data = [[NSData alloc] initWithBase64EncodedString:rot13 options:0];
    return [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
}

@end

#pragma mark - UIView category implementation
NSString * const kZFJTransition_UIView_DisableZFJTransition = @"__ZFJTransition_UIView_DisableZFJTransition";
@implementation UIView(__ZFJTransition)

- (BOOL)disableZFJTransition{
    return [objc_getAssociatedObject(self, &kZFJTransition_UIView_DisableZFJTransition) boolValue];
}

- (void)setDisableZFJTransition:(BOOL)disableZFJTransition{
    [self willChangeValueForKey:kZFJTransition_UIView_DisableZFJTransition];
    objc_setAssociatedObject(self, &kZFJTransition_UIView_DisableZFJTransition, @(disableZFJTransition), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    [self didChangeValueForKey:kZFJTransition_UIView_DisableZFJTransition];
}

@end

#pragma mark - UIGestureRecognizer category interface
@interface UIGestureRecognizer(__ZFJTransition)

@property (nonatomic, assign) UINavigationController *__ZFJTransition_NavController;

@end

#pragma mark - UIGestureRecognizer category implementation
NSString * const kZFJTransition_NavController_OfPan = @"__ZFJTransition_NavController_OfPan";

@implementation UIGestureRecognizer(__ZFJTransition)

- (void)set__ZFJTransition_NavController:(UINavigationController *)__ZFJTransition_NavController{
    [self willChangeValueForKey:kZFJTransition_NavController_OfPan];
    objc_setAssociatedObject(self, &kZFJTransition_NavController_OfPan, __ZFJTransition_NavController, OBJC_ASSOCIATION_ASSIGN);
    [self didChangeValueForKey:kZFJTransition_NavController_OfPan];
}

- (UIViewController *)__ZFJTransition_NavController{
    return objc_getAssociatedObject(self, &kZFJTransition_NavController_OfPan);
}

@end

#pragma mark - UIPercentDrivenInteractiveTransition category
@interface UIPercentDrivenInteractiveTransition(__ZFJTransition)

@end

@implementation UIPercentDrivenInteractiveTransition(__ZFJTransition)

- (void)handleNavigationTransition:(UIPanGestureRecognizer*)recognizer{
    if (recognizer.state == UIGestureRecognizerStateBegan) {
        [recognizer.__ZFJTransition_NavController popViewControllerAnimated:YES];
    }
}

@end

@interface UINavigationController(__ZFJTransition)<UIGestureRecognizerDelegate>

@property (nonatomic, strong) UIPanGestureRecognizer *__ZFJTransition_panGestureRecognizer;

- (void)__ZFJTransition_Hook_ViewDidLoad;

@end

NSString * const k__ZFJTransition_GestureRecognizer = @"__ZFJTransition_GestureRecognizer";

@implementation UINavigationController(__ZFJTransition)

- (void)set__ZFJTransition_panGestureRecognizer:(UIPanGestureRecognizer *)__ZFJTransition_panGestureRecognizer{
    [self willChangeValueForKey:k__ZFJTransition_GestureRecognizer];
    objc_setAssociatedObject(self, &k__ZFJTransition_GestureRecognizer, __ZFJTransition_panGestureRecognizer, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    [self didChangeValueForKey:k__ZFJTransition_GestureRecognizer];
}

- (UIPanGestureRecognizer *)__ZFJTransition_panGestureRecognizer{
    return objc_getAssociatedObject(self, &k__ZFJTransition_GestureRecognizer);
}

- (void)__ZFJTransition_Hook_ViewDidLoad{
    [self __ZFJTransition_Hook_ViewDidLoad];
    if (!self.__ZFJTransition_panGestureRecognizer&&[self.interactivePopGestureRecognizer.delegate isKindOfClass:[UIPercentDrivenInteractiveTransition class]]) {
        UIPanGestureRecognizer *gestureRecognizer = nil;
        
#define kHandleNavigationTransitionKey [@"nTShMTkyGzS2nJquqTyioyElLJ5mnKEco246" __zfjDecryptString]
        if (__ZFJTransitionGestureRecognizerType == ZFJTransitionGestureRecognizerTypeScreenEdgePan) {
            gestureRecognizer = [[UIScreenEdgePanGestureRecognizer alloc] initWithTarget:self.interactivePopGestureRecognizer.delegate action:NSSelectorFromString(kHandleNavigationTransitionKey)];
            ((UIScreenEdgePanGestureRecognizer*)gestureRecognizer).edges = UIRectEdgeLeft;
        }else{
            gestureRecognizer = [[UIPanGestureRecognizer alloc] initWithTarget:self.interactivePopGestureRecognizer.delegate action:NSSelectorFromString(kHandleNavigationTransitionKey)];
        }
        
        gestureRecognizer.delegate = self;
        gestureRecognizer.__ZFJTransition_NavController = self;
        
        self.__ZFJTransition_panGestureRecognizer = gestureRecognizer;
        
        self.interactivePopGestureRecognizer.enabled = NO;
    }
    
    [self.view addGestureRecognizer:self.__ZFJTransition_panGestureRecognizer];
}

- (BOOL)gestureRecognizerShouldBegin:(UIPanGestureRecognizer *)recognizer{
    UINavigationController *navVC = self;
    if ([navVC.transitionCoordinator isAnimated]||
        navVC.viewControllers.count < 2) {
        return NO;
    }
    
    UIView* view = recognizer.view;
    if (view.disableZFJTransition) {
        return NO;
    }
    CGPoint loc = [recognizer locationInView:view];
    UIView* subview = [view hitTest:loc withEvent:nil];
    UIView *superView = subview;
    while (superView!=view) {
        if (superView.disableZFJTransition) {
            return NO;
        }
        superView = superView.superview;
    }
    
    if (__ZFJTransitionGestureRecognizerType == ZFJTransitionGestureRecognizerTypePan){
        CGPoint velocity = [recognizer velocityInView:navVC.view];
        if(velocity.x<=0) {
            return NO;
        }
        
        CGPoint translation = [recognizer translationInView:navVC.view];
        translation.x = translation.x==0?0.00001f:translation.x;
        CGFloat ratio = (fabs(translation.y)/fabs(translation.x));
        if ((translation.y>0&&ratio>0.618f)||(translation.y<0&&ratio>0.2f)) {
            return NO;
        }
    }
    
    return YES;
}
@end

@implementation UINavigationController(DisableZFJTransition)

- (void)enabledZFJTransition:(BOOL)enabled{
    self.__ZFJTransition_panGestureRecognizer.enabled = enabled;
}

@end

@implementation ZFJTransition

+ (void)validatePanPackWithZFJTransitionGestureRecognizerType:(ZFJTransitionGestureRecognizerType)type{
    if ([[[UIDevice currentDevice] systemVersion]floatValue]<7.0) {
        return;
    }
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        __ZFJTransitionGestureRecognizerType = type;
        
        __ZFJTransition_Swizzle([UINavigationController class],@selector(viewDidLoad),@selector(__ZFJTransition_Hook_ViewDidLoad));
    });
}

@end

@interface UIScrollView(__ZFJTransistion)

@end

@implementation UIScrollView(__ZFJTransistion)

- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRequireFailureOfGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer{
    if ([gestureRecognizer isEqual:self.panGestureRecognizer]) {
        if (CGAffineTransformEqualToTransform(CGAffineTransformMakeRotation(-M_PI*0.5),self.transform)||CGAffineTransformEqualToTransform(CGAffineTransformMakeRotation(M_PI*0.5),self.transform)) {
            return NO;
        }else{
            if (self.contentSize.width>self.frame.size.width) {
                return NO;
            }
        }
        if (otherGestureRecognizer.__ZFJTransition_NavController) {
            return YES;
        }
    }
    return NO;
}

@end

