//
//  PYTableViewIndexManager.m
//  PYTableViewIndex
//
//  Created by Lq on 16/1/5.
//  Copyright © 2016年 Lq. All rights reserved.
//

#import "JGTeamMemberManager.h"
#import "pinyin.h"

@implementation JGTeamMemberManager

+(NSArray *)archiveNumbers:(NSArray *)originalArray{
    
    NSMutableArray *stringsToSort = [[NSMutableArray alloc]initWithArray:originalArray];
    
    //Step2:获取字符串中文字的拼音首字母并与字符串共同存放
    NSMutableArray *chineseStringsArray=[NSMutableArray array];
    for(int i=0;i<[stringsToSort count];i++){
        
        MY_LYPersonInfoModel *model = stringsToSort[i];
        
        model.chineseString = [[ChineseString alloc]init];
        if (![Utility isBlankString:model.nickName]) {
            model.chineseString.string = model.nickName;
        }
        
        
        if(model.chineseString.string==nil){
            model.chineseString.string=@"";
        }
        
        if(![model.chineseString.string isEqualToString:@""]){
            NSString *pinYinResult=[NSString string];
            
            for(int j=0;j<model.chineseString.string.length;j++){
                
                NSString *singlePinyinLetter=[[NSString stringWithFormat:@"%c",pinyinFirstLetter([model.chineseString.string characterAtIndex:j])]uppercaseString];
                
                pinYinResult=[pinYinResult stringByAppendingString:singlePinyinLetter];
                
            }
            model.chineseString.pinYin=pinYinResult;
        }else{
            model.chineseString.pinYin=@"";
        }
        [chineseStringsArray addObject:model];
    }
    
    NSArray *letters = @[@"A",@"B",@"C",@"D",@"E",@"F",@"G",@"H",@"I",@"J",@"K",@"L",@"M",@"N",@"O",@"P",@"Q",@"R",@"S",@"T",@"U",@"V",@"W",@"X",@"Y",@"Z",@"#"];
    NSArray *numbers = @[@"0",@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9"];
    NSMutableArray *datas = [[NSMutableArray alloc]init];
    
    for (int i = 0; i < 27; i++) {
        
        NSMutableArray *arr = [[NSMutableArray alloc]init];
        [datas addObject:arr];
    }
    
    for (int i = 0; i < chineseStringsArray.count; i++) {
        BOOL addd = YES;
        MY_LYPersonInfoModel *model = chineseStringsArray[i];
        
        for (int j = 0; j < letters.count; j++) {
            
            if (model.chineseString.pinYin.length > 0) {//
                if ([[model.chineseString.pinYin substringToIndex:1] isEqualToString:letters[j]]) {
                    [datas[j] insertObject:model atIndex:0];
                    addd = NO;
                }
            }//
            
        }
        for (int k = 0; k < 10; k ++) {
            
            if (model.chineseString.pinYin.length > 0) {
                if ([[model.chineseString.pinYin substringToIndex:1] isEqualToString:numbers[k]]) {
                    
                    [datas[26] insertObject:model atIndex:0];
                    addd = NO;
                }
            }
        }
        if (addd == YES) {
            [datas[26] insertObject:model atIndex:0];
        }
    }
    return datas;
}


@end
