
#import <UIKit/UIKit.h>
#import"CompanyModel.h"
#import "XiaDanListModel.h"

@interface AddDingdanViewController : UITableViewController
@property(strong,nonatomic)CompanyModel *model;
@property(nonatomic,strong)XiaDanListModel *khmodel;
@property(nonatomic,strong)NSString *state;

@end
