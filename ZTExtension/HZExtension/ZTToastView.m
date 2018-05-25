//
//  ZTToastText.m
//  ZTExtension
//
//  Created by 黄露 on 2018/5/24.
//  Copyright © 2018年 huanglu. All rights reserved.
//

#import "ZTToastView.h"
#import "UIView+ZTExtension.h"
#import "UIColor+ZTHex.h"

#define RATE ([UIScreen mainScreen].bounds.size.width/375)
#define ICON_WIDTH (24)
#define ICON_HEIGHT (24)
#define MIDDLE_PADDING (10)
#define CONTENT_HOR_PADDING (16)
#define CONTENT_VER_PADDING (18)
#define CONTENT_MAX_WIDTH (200)

@interface ZTToastView()

@property (nonatomic , strong) UILabel *contentLabel;
@property (nonatomic , strong) UIImageView *icon;
@property (nonatomic , strong) UIView *maskView;

@end

static ZTToastView *shard;

@implementation ZTToastView

+ (instancetype) sharedView {
    if (!shard) {
        shard = [[ZTToastView alloc] init];
    }
    return shard;
}

- (instancetype) init {
    if (self = [super init]) {
        [self addSubviews];
    }
    return self;
}

- (void) addSubviews{
    self.contentLabel = [[UILabel alloc] init];
    self.icon = [[UIImageView alloc] init];
    self.maskView = [[UIView alloc] init];
    self.contentLabel.numberOfLines = 2;
    self.icon.contentMode = UIViewContentModeScaleAspectFit;
    
    [self addSubview:self.maskView];
    [self.maskView addSubview:self.contentLabel];
    [self.maskView addSubview:self.icon];
    
    self.contentLabel.right(CONTENT_HOR_PADDING)
    .top(CONTENT_VER_PADDING)
    .bottom(CONTENT_VER_PADDING)
    .left_space_to(self.icon, MIDDLE_PADDING)
    .constrain_MaxWidth(CONTENT_MAX_WIDTH*RATE);
    self.icon.left(CONTENT_HOR_PADDING).equal_hori_baseLine(self.contentLabel, 0).constrain_Width(ICON_WIDTH).constrain_Height(ICON_HEIGHT);
    self.maskView.layer.masksToBounds = YES;
    self.maskView.layer.cornerRadius = 2;
    self.maskView.backgroundColor = [UIColor colorWithHex:0x161616];
    self.contentLabel.textColor = [UIColor whiteColor];
    self.contentLabel.font = [UIFont systemFontOfSize:16 weight:UIFontWeightRegular];
    self.maskView.equal_hori_baseLine(self, 0).equal_verti_baseLine(self, 0);
}


#pragma mark - public
- (void) currentIcon:(UIImage *)icon {
    self.icon.image = icon;
}

- (void) currentTitle:(NSString *)title {
    self.contentLabel.text = title;
}

- (void) setPosition:(ZTToastPosition)position {
    _position = position;
}

- (void) setBgColor:(UIColor *)bgColor {
    self.maskView.backgroundColor = bgColor;
}

- (void) setTextFont:(UIFont *)textFont {
    self.contentLabel.font = textFont;
}

- (void) setTextColor:(UIColor *)textColor {
    self.contentLabel.textColor = textColor;
}

#pragma mark -
- (void) didMoveToSuperview {
    [self moveToSuperViewAtPosition:self.position];
}

#pragma mark - 根据position属性，设置位置
- (void) moveToSuperViewAtPosition:(ZTToastPosition)position {
    if (self.superview) {
        switch (position) {
            case ZTToastPosition_Middle:
            {
                self.equal_hori_baseLine(self.superview, 0).equal_verti_baseLine(self.superview, 0);
            }
                break;
                
            case ZTToastPosition_Top:
            {
                self.offsetTop(self.superview, 0).equal_verti_baseLine(self.superview, 0);
            }
            default:
                
            case ZTToastPosition_Bottom:
            {
                self.offsetBottom(self.superview, 50).equal_verti_baseLine(self.superview, 0);
            }
                break;
        }
    }
}

@end
