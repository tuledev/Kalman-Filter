Simple Kalman Filter
====================

A simple Kalman Filter Objective-C codes.

![](https://github.com/anhtukhtn/Kalman-Filter/blob/master/accelerometer.png)
![](https://github.com/anhtukhtn/Kalman-Filter/blob/master/discontinuous_data.png)

## Usage

Useful for digital data with noises.

``` Objective-C
KalmanFilter * filter = [KalmanFilter new];
filteredData = [filter estimateArray:arrData];
```

## License

Available under the MIT license
