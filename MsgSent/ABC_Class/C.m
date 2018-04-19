//
//  C.m
//  Test
//
//  Created by Michael on 2018/4/19.
//  Copyright © 2018年 michaelyht. All rights reserved.
//

#import "C.h"
#import "B.h"

#import <objc/runtime.h>

@implementation C
//
///******************1.新增实现************如果程序不实现，会导致程序崩溃************/
//void sleepA(id self, SEL _cmd){
//    NSLog(@"%@ %s",self, sel_getName(_cmd));
//    NSLog(@"add sleepA selector");
//}
//
//+ (BOOL)resolveInstanceMethod:(SEL)sel{
//    if (sel == @selector(sleepA)) {
//        class_addMethod(self, sel, (IMP)sleepA, "v@:");//
//        return YES;
//    }
//    return [super resolveInstanceMethod:sel];
//}


///*******************2.消息转发，更改消息接收者************************/
//- (id)forwardingTargetForSelector:(SEL)aSelector{
//    return [[B alloc] init];
//}


/*******************3.消息转发 方法签名************************/
/*****
关于生成签名的类型"v@:"解释一下。每一个方法会默认隐藏两个参数，self、_cmd，self代表方法调用者，_cmd代表这个方法的SEL，签名类型就是用来描述这个方法的返回值、参数的，v代表返回值为void，@表示self，:表示_cmd。
 *****/
- (NSMethodSignature *)methodSignatureForSelector:(SEL)aSelector{
    NSString *sel = NSStringFromSelector(aSelector);
    //判断需要转发的消息
    if([sel isEqualToString:@"sleepA"]){
        //手动生成签名
        return [NSMethodSignature signatureWithObjCTypes:"v@:"];
    }
    return [super methodSignatureForSelector:aSelector];
}

- (void)forwardInvocation:(NSInvocation *)anInvocation{
    SEL selector = [anInvocation selector];
    //新建需要转发消息的对象
    B *b = [[B alloc] init];
    if([b respondsToSelector:selector]){
        //唤醒这个方法
        [anInvocation invokeWithTarget:b];
    }
}


@end
