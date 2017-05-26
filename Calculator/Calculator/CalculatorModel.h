#import <Foundation/Foundation.h>
#import "Constants.h"

@class CalculatorModel;

@protocol CalculatorModelDelegate <NSObject>

- (void)calculatorModelDidUpdatedValue:(double) value;
- (void)calculatorModelDidWrongOperation:(NSString *) error;

@end

@interface CalculatorModel : NSObject

@property (assign, nonatomic) double leftOperand;
@property (assign, nonatomic) double rightOperand;
@property (retain, nonatomic) NSString *prevOperation;
@property (assign, nonatomic, getter=isExpression) BOOL expression;

@property (assign, nonatomic) id<CalculatorModelDelegate> delegate;

- (void)executeUnaryOperation:(NSString *)operation;
- (void)executeBinaryOperation:(NSString *)operation;

@end
