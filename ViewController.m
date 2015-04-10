//
//  ViewController.m
//  WaterfallFlow
//
//  Created by huai on 15/4/8.
//  Copyright (c) 2015年 huai. All rights reserved.
//

#import "ViewController.h"
#define CELLWITH (self.view.bounds.size.width/3)
#define CELLHEIGHT self.view.bounds.size.height
@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>

@property(nonatomic,strong) UITableView *leftTableView;
@property(nonatomic,strong) UITableView *middleTableView;
@property(nonatomic,strong) UITableView *rightTableView;
@property(nonatomic) NSMutableArray *leftDataSource;
@property(nonatomic) NSMutableArray *middleDataSource;
@property(nonatomic) NSMutableArray *rightDataSource;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self createTableView];
    [self createSourceData];
    [self randRomData];
}
-(void) createTableView
{
    self.leftTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, CELLWITH, CELLHEIGHT) style:UITableViewStylePlain];
    self.leftTableView.dataSource = self;
    self.leftTableView.delegate = self;
    [self.view addSubview:self.leftTableView];
    
    self.middleTableView = [[UITableView alloc] initWithFrame:CGRectMake(CELLWITH, 0, CELLWITH, CELLHEIGHT) style:UITableViewStylePlain];
    self.middleTableView.dataSource = self;
    self.middleTableView.delegate = self;
    [self.view addSubview:self.middleTableView];
    
    self.rightTableView = [[UITableView alloc] initWithFrame:CGRectMake(CELLWITH * 2, 0, CELLWITH, CELLHEIGHT) style:UITableViewStylePlain];
    self.rightTableView.dataSource = self;
    self.rightTableView.delegate = self;
    [self.view addSubview:self.rightTableView];
    
}

-(void) createSourceData
{
    self.leftDataSource = [[NSMutableArray alloc] init];
    self.rightDataSource = [[NSMutableArray alloc] init];
    self.middleDataSource = [[NSMutableArray alloc] init];
}
-(void) randRomData
{
    for (int i = 0 ; i < 100; i++) {
            NSString *imageName = [NSString stringWithFormat:@"%d",arc4random()%4+1];
            [self.leftDataSource addObject:imageName];
            
            imageName = [NSString stringWithFormat:@"%d",arc4random()%4+1];
            [self.middleDataSource addObject:imageName];
            
            imageName = [NSString stringWithFormat:@"%d",arc4random()%4+1];
            [self.rightDataSource addObject:imageName];
    }
    [self.leftTableView reloadData];
    [self.middleTableView reloadData];
    [self.rightTableView reloadData];
}
-(NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (tableView == self.leftTableView) {
        return self.leftDataSource.count;
    }
    if (tableView == self.middleTableView) {
        return self.middleDataSource.count;
    }
    if (tableView == self.rightTableView) {
        return self.rightDataSource.count;
    }
    return 1;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
        if (tableView == self.leftTableView) {
            UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
                if (cell == nil) {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
                }
            cell.accessoryView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:self.leftDataSource[indexPath.row]]];
            return cell;
        }
        if (tableView == self.middleTableView) {
            UITableViewCell *cell2 = [tableView dequeueReusableCellWithIdentifier:@"cell2"];
                if (cell2 == nil) {
            cell2 = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell2"];
                }
            cell2.accessoryView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:self.middleDataSource[indexPath.row]]];
            return cell2;
        }
        if (tableView == self.rightTableView) {
            UITableViewCell *cell3 = [tableView dequeueReusableCellWithIdentifier:@"cell3"];

                if (cell3 == nil) {
            cell3 = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell3"];
                }
            cell3.accessoryView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:self.rightDataSource[indexPath.row]]];
            return cell3;
    }
    return nil;
}
-(CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{

    if (tableView == self.leftTableView) {
        UIImage *image = [UIImage imageNamed:self.leftDataSource[indexPath.row]];
        return image.size.height;
    }
    if (tableView == self.middleTableView) {
        UIImage *image = [UIImage imageNamed:self.middleDataSource[indexPath.row]];
        return image.size.height;
    }
    if (tableView == self.rightTableView) {
        UIImage *image = [UIImage imageNamed:self.rightDataSource[indexPath.row]];
        return image.size.height;
    }
    return 0;
}
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    NSArray *array = [NSArray arrayWithObjects:self.leftTableView,self.middleTableView,self.rightTableView,nil];
    
    for (UIScrollView *s in array) {
        if (s != scrollView) {
            s.contentOffset = scrollView.contentOffset;
        }
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
