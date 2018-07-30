//
//  UCArgumentValidMacro.h
//  UCPlanKit
//
//  Created by 范杨 on 2018/7/27.
//  Copyright © 2018年 RPGLiker. All rights reserved.
//

#ifndef UCArgumentValidMacro_h
#define UCArgumentValidMacro_h

#define UC_PARAM_IS_NIL_ERROR(param) ((param == nil || [param isKindOfClass:[NSNull class]]) ? @"" : param)

#define UC_PARAM_IS_NIL_ERROR_MONEY(param) ((param == nil || [param isKindOfClass:[NSNull class]]) ? @"0.00" : param)

#define UC_PARAM_IS_NIL_PLACEHOLDER(param, placeholder) ((param == nil || [param isKindOfClass:[NSNull class]]) ? placeholder : param)

// 数据验证
#define UC_StrValid(f)(f!=nil &&[f isKindOfClass:[NSString class]]&& ![f isEqualToString:@""])

#define UC_SafeStr(f)(StrValid(f)?f:@"")

#define UC_HasString(str,eky)([str rangeOfString:key].location!=NSNotFound)

#define UC_ValidStr(f)StrValid(f)

#define UC_ValidDict(f)(f!=nil &&[f isKindOfClass:[NSDictionary class]])

#define UC_ValidArray(f)(f!=nil &&[f isKindOfClass:[NSArray class]]&&[f count]>0)

#define UC_ValidNum(f)(f!=nil &&[f isKindOfClass:[NSNumber class]])

#define UC_ValidClass(f,cls)(f!=nil &&[f isKindOfClass:[cls class]])

#define UC_ValidData(f)(f!=nil &&[f isKindOfClass:[NSData class]])

#endif /* UCArgumentValidMacro_h */
