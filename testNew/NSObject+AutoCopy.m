//
//  NSObject+AutoCopy.m
//  testNew
//
//  Created by skladmin on 2016/11/10.
//  Copyright © 2016年 skladmin. All rights reserved.
//

#import "NSObject+AutoCopy.h"
#import <objc/runtime.h>

@implementation NSObject (AutoCopy)

-(id)autoCopy
{
/*已经实现copy协议*/
    
    //可变类
    if ([self conformsToProtocol:@protocol(NSMutableCopying)]) {
        typeof(self) copy = [self mutableCopy];
        //容器类
        if ([self conformsToProtocol:@protocol(NSFastEnumeration)]) {
            if ([copy respondsToSelector:@selector(removeAllObjects)]) {
                [copy performSelector:@selector(removeAllObjects)];
            } else {
                return copy;
            }
            
            for (id item in (id<NSFastEnumeration>)self) {
                //链表
                if ([copy respondsToSelector:@selector(addObject:)]) {
                    [copy performSelector:@selector(addObject:) withObject:[item autoCopy]];
                    continue;
                }
                
                //哈希表
                if ([copy respondsToSelector:@selector(setObject:forKey:)] && [copy respondsToSelector:@selector(objectForKey:)]) {
                    
                    id itemForKey = [self performSelector:@selector(objectForKey:) withObject:item];
                    [copy performSelector:@selector(setObject:forKey:) withObject:[itemForKey autoCopy] withObject:item];
                }
            }
        }
        return copy;
    }

    if ([self conformsToProtocol:@protocol(NSCopying)]) {
        return [self copy];
    }
    
/*未实现copy协议*/
    
    typeof(self) copy = [[self class] new];
    Class cls = [self class];
    while (cls && cls != [NSObject class]) {

        unsigned int numProperties;
        objc_property_t *properties = class_copyPropertyList([self class], &numProperties);

        for (int i = 0; i < numProperties; i++) {
            objc_property_t property = properties[i];
            NSString *propertyName = [[NSString alloc]initWithCString:property_getName(property) encoding:NSUTF8StringEncoding];
            
            //黑名单管理
            if ([self respondsToSelector:@selector(autoCopy_blackList)]) {
                NSArray *arrayBlackList = [self performSelector:@selector(autoCopy_blackList)];
                if ([arrayBlackList containsObject:propertyName]) {
                    continue;
                }
            }
            //白名单管理
            if ([self respondsToSelector:@selector(autoCopy_whiteList)]) {
                NSArray *arrayWhiteList = [self performSelector:@selector(autoCopy_blackList)];
                if (![arrayWhiteList containsObject:propertyName]) {
                    continue;
                }
            }
            
            id propertyValue = [self valueForKey:propertyName];
            id copiedValue = nil;
            if ([propertyValue conformsToProtocol:@protocol(NSCopying)]) {
                copiedValue = [propertyValue copy];
            }
            if (copiedValue) {
                [copy setValue:copiedValue forKey:propertyName];
            }
        }
        free(properties);
        
        cls = [cls superclass];
    }
    
    return copy;
}

@end
