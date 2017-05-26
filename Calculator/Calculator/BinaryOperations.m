#import "CalculatorModel.h"

@interface CalculatorModel (BinaryOperations)

@end

@implementation CalculatorModel (BinaryOperations)

- (void)additionOperation {
    self.leftOperand += self.rightOperand;
}

- (void)substractOperation {
    self.leftOperand -= self.rightOperand;
}

- (void)divideOperation {
    if (self.rightOperand == 0) {
        [self.delegate calculatorModelDidWrongOperation:ERROR_DIVIDE_BY_ZERO];
        return;
    }
    self.leftOperand /= self.rightOperand;
}

- (void)multiplyOperation {
    self.leftOperand *= self.rightOperand;
}

- (void)modOperation {
    self.leftOperand = fmod(self.leftOperand, self.rightOperand);
}

@end
