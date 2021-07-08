//  MLOcrData.h
//  leonard.
//
//  Created by Leonard on 2020/9/28.
//  Copyright © 2020 Ruiyu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MLOcrData : NSObject

/// OCR recognized text
/// There may be errors in the text. The current model in the project only supports Chinese and Arabic letters
@property(nonatomic, copy) NSString *label;

/// The rectangular area of the text recognized by OCR
/// It can be drawn with some personalized display effects through the Point in the Array
@property(nonatomic) NSArray *polygonPoints;

@property(nonatomic) int category;

@property(nonatomic) float accuracy;

@end
