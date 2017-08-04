//
//  KalmanFilter.h
//  PhoneTracker
//
//  Created by AnhTu on 2/21/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface KalmanFilter : NSObject {
}

- (void)setupEst:(float)est_last P:(float)P_last Q:(float )Q R:(float )R;
- (float)estimateElement: (float)value;
- (NSMutableArray *)estimateArray: (NSMutableArray *)arrData;

@end
