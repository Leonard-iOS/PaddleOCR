//  OcrData.h
//  leonard.
//
//  Created by Leonard on 2020/9/28.
//  Copyright © 2020 Ruiyu. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface OcrData : NSObject
@property(nonatomic, copy) NSString *label;
@property(nonatomic) int category;
@property(nonatomic) float accuracy;
@property(nonatomic) NSArray *polygonPoints;

@end
