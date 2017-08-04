//
//  KalmanFilter.m
//  PhoneTracker
//
//  Created by AnhTu on 2/21/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import "KalmanFilter.h"

@interface KalmanFilter()

@property (nonatomic) float est_last;
@property (nonatomic) float P_last;

//the noise in the system
@property (nonatomic) float Q;
@property (nonatomic) float R;

// Kalman Gain
@property (nonatomic) float K;

// error coveriance
@property (nonatomic) float P;

@property (nonatomic) float P_temp;
@property (nonatomic) float temp_est;

@property (nonatomic) float est;
@property (nonatomic) float measured;

@end


@implementation KalmanFilter

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self initParam];
    }
    return self;
}

- (void)initParam {
    _est_last = 0;
    _P_last = 0;
    
    _Q = 0.022;
    _R = 0.617;
}

#pragma mark -

- (void)setupEst:(float)est_last P:(float)P_last Q:(float )Q R:(float )R
{
    _est_last = est_last;
    _P_last = P_last;
    //the noise in the system
    _Q = Q;
    _R = R;
}

#pragma mark filter

- (float)estimateElement: (float)value {
    _temp_est = _est_last;
    _P_temp = _P_last + _Q;
    
    // calculate the Kalman gain
    _K = _P_temp * (1.0/(_P_temp + _R));
    //measure
    
    _measured = value; //the real measurement plus noise
    //correct
    _est = _temp_est + _K * (_measured - _temp_est);
    _P = (1- _K) * _P_temp;
    
    //update our last's
    _P_last = _P;
    _est_last = _est;
    
    return _est;
}

- (NSMutableArray *)estimateArray: (NSMutableArray *)arrData {
    
    NSMutableArray *arrResult = [NSMutableArray new];
    
    double result = 0;
    
    for (int i=0; i<arrData.count; i++) {
        //do a prediction
        _temp_est = _est_last;
        _P_temp = _P_last + _Q;
        //calculate the Kalman gain
        _K = _P_temp * (1.0/(_P_temp + _R));
        
        //measure
        _measured = [arrData[i] doubleValue]; //the real measurement plus noise
        //correct
        _est = _temp_est + _K * (_measured - _temp_est);
        _P = (1- _K) * _P_temp;
        
        //update our last's
        _P_last = _P;
        _est_last = _est;
        
        result = _est;
        
        [arrResult addObject:@(result)];
    }
    
    return arrResult;
}


@end
