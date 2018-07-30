//
//  UCUIMacro.h
//  UCPlanKit
//
//  Created by 范杨 on 2018/7/27.
//  Copyright © 2018年 RPGLiker. All rights reserved.
//

#ifndef UCUIMacro_h
#define UCUIMacro_h

#pragma mark - 屏幕
//获取屏幕 宽度、高度
#define UC_SCREEN_BOUNDS ([UIScreen mainScreen].bounds)
#define UC_SCREEN_WIDTH  ([UIScreen mainScreen].bounds.size.width)
#define UC_SCREEN_HEIGHT ([UIScreen mainScreen].bounds.size.height)
#define UC_SCREEN_SCALE  ([UIScreen mainScreen].bounds.size.width/320.0)

//是否是iPad
#define UC_IS_PAD (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)

#pragma mark - 图片
//建议使用前两种宏定义,性能高于后者
//读取本地图片
#define UC_LOAD_IMAGE(file,ext) [UIImage imageWithContentsOfFile:[[NSBundle mainBundle]pathForResource:file ofType:ext]]
#define UC_IMAGE(A) [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:A ofType:nil]]
#define UC_IMAGE_NAMED(_pointer) [UIImage imageNamed:_pointer]

// PNG JPG 图片路径
#define UC_PNG_PATH(NAME)           [[NSBundle mainBundle] pathForResource:[NSString stringWithUTF8String:NAME] ofType:@"png"]
#define UC_JPG_PATH(NAME)           [[NSBundle mainBundle] pathForResource:[NSString stringWithUTF8String:NAME] ofType:@"jpg"]
#define UC_PATH(NAME, EXT)          [[NSBundle mainBundle] pathForResource:(NAME) ofType:(EXT)]

// 加载图片
#define UC_LOAD_PNG_IMAGE(NAME)     [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:(NAME) ofType:@"png"]]
#define UC_LOAD_JPG_IMAGE(NAME)     [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:(NAME) ofType:@"jpg"]]
#define UC_LOAD_IMAGE(NAME, EXT)    [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:(NAME) ofType:(EXT)]]

#pragma mark - 颜色
// 随机色
#define UC_RANDOM_COLOR [UIColor colorWithRed:arc4random_uniform(256) / 255.0 green:arc4random_uniform(256) / 255.0 blue:arc4random_uniform(256) / 255.0 alpha:1]
// rgb颜色转换（16进制->10进制）
#define UC_COLOR_RGB_VALUE_16_TO_10(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

// 获取RGB颜色
#define UC_RGBA(r,g,b,a) [UIColor colorWithRed:r/255.0f green:g/255.0f blue:b/255.0f alpha:a]
#define UC_RGB(r,g,b) RGBA(r,g,b,1.0f)

//清除背景色
#define UC_CLEAR_COLOR [UIColor clearColor]

///常用颜色
#define UC_BLACK_COLOR      [UIColor blackColor]
#define UC_BLUE_COLOR       [UIColor blueColor]
#define UC_BROWN_COLOR      [UIColor brownColor]
#define UC_CLEAR_COLOR      [UIColor clearColor]
#define UC_GREEN_COLOR      [UIColor greenColor]
#define UC_GRAY_COLOR       [UIColor grayColor]
#define UC_WHITE_COLOR      [UIColor whiteColor]
#define UC_YELLOW_COLOR     [UIColor yellowColor]
#define UC_RED_COLOR        [UIColor redColor]
#define UC_ORANGE_COLOR     [UIColor orangeColor]
#define UC_PURPLE_COLOR     [UIColor purpleColor]

#define UC_DARK_GRAY_COLOR  [UIColor darkGrayColor]
#define UC_DARK_TEXT_COLOR  [UIColor darkTextColor]

#define UC_LIGHT_TEXT_COLOR [UIColor lightTextColor]
#define UC_LIGHT_GRAY_COLOR [UIColor lightGrayColor]

#pragma mark - 字体

//方正黑体
#define UC_FANGZHENG_FONT(fontSize) [UIFont fontWithName:@"FZHTJW--GB1-0" size:fontSize]
// 字体大小(常规/粗体)
#define UC_CUTI_FONT(fontSize)[UIFont boldSystemFontOfSize:fontSize]
#define UC_SYSTEM_FONT(fontSize)    [UIFont systemFontOfSize:fontSize]
//设置View的tag属性
#define UC_VIEW_WITH_TAG(_OBJECT, _TAG)    [_OBJECT viewWithTag : _TAG]
//程序的本地化,引用国际化的文件
#define UC_LOCAL_FILE(x, ...) NSLocalizedString(x, nil)

#pragma mark - 文本
// 计算文本的尺寸
#define textSize(text, fontSize, width) [text boundingRectWithSize:CGSizeMake(width, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin|NSStringDrawingUsesFontLeading attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:fontSize]} context:nil].size;

#pragma mark - storyboard
// 获取storybord && xib
#define UC_LOAD_STORY_BOARD(Name)          [UIStoryboard storyboardWithName:Name bundle:nil]
#define UC_NIB(Name)                       [[NSBundle mainBundle] loadNibNamed:@(Name) owner:nil options:nil][0]

#pragma mark - frame

#define UC_FRAME_GET_X(v)                    (v).frame.origin.x
#define UC_FRAME_GET_Y(v)                    (v).frame.origin.y
#define UC_FRAME_GET_WIDTH(v)                (v).frame.size.width
#define UC_FRAME_GET_HEIGHT(v)               (v).frame.size.height

#define UC_FRAME_GET_MIN_X(v)                 CGRectGetMinX((v).frame)
#define UC_FRAME_GET_MIN_Y(v)                 CGRectGetMinY((v).frame)

#define UC_FRAME_GET_MID_X(v)                 CGRectGetMidX((v).frame)
#define UC_FRAME_GET_MID_Y(v)                 CGRectGetMidY((v).frame)

#define UC_FRAME_GET_MAX_X(v)                 CGRectGetMaxX((v).frame)
#define UC_FRAME_GET_MAX_Y(v)                 CGRectGetMaxY((v).frame)

// 屏幕宽高
#define UC_ScreenWidth      [[UIScreen mainScreen] bounds].size.width
#define UC_ScreenHeight     [[UIScreen mainScreen] bounds].size.height

//iPhoneX底部安全区域
#define kSafeAreaBottom  (iPhoneX? 34.0f:0)
//键盘高度
#define KEYBOARD_HEIGHT       260.0

#pragma mark - 机型

#define UC_IS_IPHONE (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)
#define UC_IS_OS_8_OR_LATER    ([[[UIDevice currentDevice] systemVersion] floatValue] >= 8.0)
#define UC_IOS_SYSTEM_VERSION [[[UIDevice currentDevice] systemVersion] floatValue]

#define UC_IS_IPHONE_4 (IS_IPHONE && ([[UIScreen mainScreen] bounds].size.height == 480.0) && ((IS_OS_8_OR_LATER && [UIScreen mainScreen].nativeScale == [UIScreen mainScreen].scale) || (!IS_OS_8_OR_LATER && ([[UIScreen mainScreen] bounds].size.height == 480.0)) ))
#define UC_IS_IPHONE_5 (IS_IPHONE && ([[UIScreen mainScreen] bounds].size.height == 568.0) && ((IS_OS_8_OR_LATER && [UIScreen mainScreen].nativeScale == [UIScreen mainScreen].scale) || (!IS_OS_8_OR_LATER && ([[UIScreen mainScreen] bounds].size.height == 568.0)) ))
#define UC_IS_STANDARD_IPHONE_6 (IS_IPHONE && [[UIScreen mainScreen] bounds].size.height == 667.0  && IS_OS_8_OR_LATER && [UIScreen mainScreen].nativeScale == [UIScreen mainScreen].scale)
#define UC_IS_STANDARD_IPHONE_6_PLUS (IS_IPHONE && [[UIScreen mainScreen] bounds].size.height == 736.0)
#define UC_IS_STANDARD_IPHONE_X (IS_IPHONE && [[UIScreen mainScreen] bounds].size.height == 812.0)
















#endif /* UCUIMacro_h */





























