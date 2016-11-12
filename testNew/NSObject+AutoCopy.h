//
//  NSObject+AutoCopy.h
//  testNew
//
//  Created by skladmin on 2016/11/10.
//  Copyright © 2016年 skladmin. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol autoCopyNameList <NSObject>

- (NSArray<NSString *>*)autoCopy_whiteList;
- (NSArray<NSString *>*)autoCopy_blackList;

@end

@interface NSObject (AutoCopy)

- (id)autoCopy;



@end
