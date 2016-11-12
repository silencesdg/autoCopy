//
//  testObj.h
//  testNew
//
//  Created by skladmin on 2016/11/10.
//  Copyright © 2016年 skladmin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreGraphics/CGBase.h>

@interface testObjInContainer : NSObject

@property (nonatomic, strong) NSString *strStrong_Pro;
@property (nonatomic, copy) NSString *strCopy_Pro;
@property (nonatomic, strong) NSArray *arrayIM_Pro;
@property (nonatomic, strong) NSMutableArray *arrayM_Pro;
@property (nonatomic, strong) NSDictionary *dicIM_Pro;
@property (nonatomic, strong) NSMutableDictionary *dicM_Pro;
@property (nonatomic, assign) BOOL b_Pro;
@property (nonatomic, assign) float f_Pro;

@end


@interface testObj : NSObject

@property (nonatomic, strong) NSString *strStrong_Pro;
@property (nonatomic, copy)   NSString *strCopy_Pro;
@property (nonatomic, strong) NSArray<testObjInContainer *> *arrayIM_Pro;
@property (nonatomic, strong) NSMutableArray<testObjInContainer *> *arrayM_Pro;
@property (nonatomic, strong) NSDictionary *dicIM_Pro;
@property (nonatomic, strong) NSMutableDictionary *dicM_Pro;
@property (nonatomic, assign) BOOL b_Pro;
@property (nonatomic, assign) float f_Pro;

@end
