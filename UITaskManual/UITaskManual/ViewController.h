    #import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (nonatomic, retain) UILabel *firstNameLabel;
@property (nonatomic, retain) UILabel *lastNameLabel;
@property (nonatomic, retain) UILabel *fullNameLabel;
@property (nonatomic, retain) UITextField *firstNameTextField;
@property (nonatomic, retain) UITextField *lastNameTextField;
@property (nonatomic, retain) UIButton *helloButton;

- (IBAction)helloButtonTapped:(id)sender;

@end

