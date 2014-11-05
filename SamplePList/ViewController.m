//
//  ViewController.m
//  SamplePList
//
//  Created by 佐藤凌馬 on 2014/11/04.
//  Copyright (c) 2014年 RyomaSato. All rights reserved.
//

#import "ViewController.h"
#import "DetailViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    //プロジェクト内のファイルにアクセスできるオブジェクトを宣言
    NSBundle *bundle = [NSBundle mainBundle];
    
    //読み込むプロパティリストのファイルパス（場所）を指定
    NSString *path = [bundle pathForResource:@"FriendsPerArea" ofType:@"plist"];
    
    //プロパティリストの中身のデータを取得
    NSDictionary *dic = [NSDictionary dictionaryWithContentsOfFile:path];
    
    //取得できた配列のデータをメンバ変数に代入
    _pListArray = [dic objectForKey:@"PrefectureList"];
    
   // _pListArray = @[@"北海道",@"青森県",@"岩手県"];
    
    NSLog(@"配列の中身の数:%ld",_pListArray.count);
    
     _myTableView.delegate = self;
     _myTableView.dataSource = self;
    
}


//行数を決定するメソッド
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _pListArray.count;
}

//行に表示するデータの作成
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    NSDictionary *FriendsWithArea = _pListArray[indexPath.row];
    
    cell.textLabel.text = [FriendsWithArea objectForKey:@"Name"];
    
//    cell.textLabel.text = [NSString stringWithFormat:@"%@",_pListArray[indexPath.row]];
    return cell;
}


//セルがタップされた時に発動するメソッド
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{

    //画面遷移するViewControllerのカプセル化（インスタンス化）
    DetailViewController *dvc = [self.storyboard instantiateViewControllerWithIdentifier:@"DetailViewController"];
    
    //選択された地域の情報をDetailViewControllerに渡す
    dvc.friendsList = _pListArray[indexPath.row];
    
    //ナビゲーションコントローラーの機能で画面遷移
    [[self navigationController] pushViewController:dvc animated:YES];

}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
