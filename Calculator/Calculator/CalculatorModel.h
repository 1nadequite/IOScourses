#import <Foundation/Foundation.h>

@interface CalculatorModel : NSObject

@property (retain, nonatomic) NSDictionary *unaryOperations;
@property (retain, nonatomic) NSDictionary *binaryOperations;

- (id)init;

- (double)executeUnaryOperand:(double)operand
                    Operation:(NSString *)operation;
- (double)executeBinaryLeftOperand:(double)leftOperand
                         Operation:(NSString *)operation
                      RightOperand:(double)rightOperand;

@end
