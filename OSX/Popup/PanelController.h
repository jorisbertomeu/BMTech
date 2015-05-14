#import "BackgroundView.h"
#import "StatusItemView.h"
#import <errno.h>

#define D_VERSION "1.6"

@class PanelController;

@protocol PanelControllerDelegate <NSObject>

@optional

- (StatusItemView *)statusItemViewForPanelController:(PanelController *)controller;

@end

#pragma mark -

@interface PanelController : NSWindowController <NSWindowDelegate>
{
    __unsafe_unretained IBOutlet NSSecureTextField *passwordField;
    __unsafe_unretained IBOutlet NSTextField *userField;
    int _pidDemon;
    __unsafe_unretained IBOutlet NSSecureTextField *_passwordText;
    __unsafe_unretained IBOutlet NSTextField *_loginText;
    __unsafe_unretained IBOutlet NSProgressIndicator *_sharingLoading;
    __unsafe_unretained IBOutlet NSProgressIndicator *_nsLoading;
    __unsafe_unretained IBOutlet NSProgressIndicator *_userListLoading;
    __unsafe_unretained IBOutlet NSButton *_nsSharingBtn;
    __unsafe_unretained IBOutlet NSButton *_nsBtn;
    __unsafe_unretained IBOutlet NSButton *_browseBtn;
    __unsafe_unretained IBOutlet NSButton *_sharingBtn;
    NSString *_login;
    __unsafe_unretained IBOutlet NSComboBox *_loginList;
    NSThread  *_netsoulThread;
    NSThread  *_sharingThread;
    NSThread  *_userListThread;
    int _firstOpenning;
    __unsafe_unretained IBOutlet NSTextField *_aboutTxt;
    __unsafe_unretained IBOutlet NSTextField *_stateValue;
    BOOL _hasActivePanel;
    BOOL _sharing;
    BOOL _netsoul;
    BOOL _userList;
    BOOL _nsSharing;
    BOOL _bad;
    BOOL _catched;
    __unsafe_unretained BackgroundView *_backgroundView;
    __unsafe_unretained id<PanelControllerDelegate> _delegate;
    __unsafe_unretained NSSearchField *_searchField;
    __unsafe_unretained NSTextField *_textField;
}

@property (nonatomic, unsafe_unretained) IBOutlet BackgroundView *backgroundView;
@property (nonatomic, unsafe_unretained) IBOutlet NSSearchField *searchField;
@property (nonatomic, unsafe_unretained) IBOutlet NSTextField *textField;

@property (nonatomic) BOOL hasActivePanel;
@property (nonatomic, unsafe_unretained, readonly) id<PanelControllerDelegate> delegate;
NSString    *runCommand(NSString * commandToRun);
char        *get_macs(void);

- (id)initWithDelegate:(id<PanelControllerDelegate>)delegate;

- (void)openPanel;
- (void)closePanel;

@end
