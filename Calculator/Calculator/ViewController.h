#import <UIKit/UIKit.h>
#import "CalculatorModel.h"

@interface ViewController : UIViewController

@property (assign, nonatomic) CalculatorModel *model;

@property (retain, nonatomic) IBOutlet UILabel *displayLabel;

@property (retain, nonatomic) IBOutletCollection(UIButton) NSArray *digitCollectionButtons;
@property (retain, nonatomic) IBOutletCollection(UIButton) NSArray *unaryOperationCollectionButtons;
@property (retain, nonatomic) IBOutletCollection(UIButton) NSArray *binaryOperationCollectionButtons;

@property (retain, nonatomic) IBOutlet UIButton *clearButton;
@property (retain, nonatomic) IBOutlet UIButton *dotButton;

@property (retain, nonatomic) IBOutlet UIBarButtonItem *aboutBarButtonItem;
@property (retain, nonatomic) IBOutlet UIButton *licenseButton;

@property (assign, nonatomic, getter=isFloatNumber) BOOL floatNumber;
@property (assign, nonatomic, getter=isNewNumber) BOOL newNumber;
@property (assign, nonatomic) double leftOperand;
@property (assign, nonatomic) double rightOperand;
@property (retain, nonatomic) NSString *operation;


- (IBAction)digitCollectionButtonTapped:(id)sender;

- (IBAction)unaryOperationCollectionButtonTapped:(id)sender;
- (IBAction)binaryOperationCollectionButtonTapped:(id)sender;

- (IBAction)clearButtonTapped:(id)sender;
- (IBAction)dotButtonTapped:(id)sender;

- (void)swipeRight:(UISwipeGestureRecognizer*)gestureRecognizer;

- (IBAction)aboutButtonTapped:(id)sender;
- (IBAction)licenseButtonTapped:(id)sender;

@end

