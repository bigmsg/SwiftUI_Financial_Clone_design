//
//  ContentView.swift
//  SwiftUI_Financial_Clone_design
//
//  Created by 양팀장(iMac) on 2019/11/15.
//  Copyright © 2019 양팀장(iMac). All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State var isNew = false
    @State var userMoney = "0.00"
    @State var userGrade = "Premium"
    @State var isSeeAll = false
    
    
    var body: some View {
        VStack {
            
            VStack {
                // 네비게이션
                HomeNavigationBar(isNew: self.$isNew)
                    .padding(.top, UIApplication.shared.statusBarFrame.height)
                    .padding(.horizontal, 30)
 
                
                // 사용자금액과 등급을 표시하는 부분
                HomeUserInfoView(userGrade: self.$userGrade)
                    .padding(.horizontal, 30)
                
                
                HomeButtonView()
                    .padding(.horizontal , 30)
                
                
                // 입금 출금 버튼 그룹
                    
                    
                
                    
                Spacer()
                
            }.background(Color(red: 51/255, green: 104/255, blue: 255/255))
            //Rectangle().frame(width: 20, height: 896-44)
                //.offset(y: 44)
            
        }.edgesIgnoringSafeArea(.all)
            
    }
        
}

fileprivate struct HomeButtonView: View {
    
    var body: some View {
        HStack(alignment: .center) {
            ZStack {
                RoundedRectangle(cornerRadius: 10)
                    .foregroundColor(.orange)
                    .frame(width: (UIScreen.main.bounds.width - 60 - 10)/2,
                           height: 50, alignment: .center)
                Text("Deposit")
                    .foregroundColor(.white)
                    .font(Font.system(size: 20, design: .default))
                .bold()
            }
            
            ZStack {
                   RoundedRectangle(cornerRadius: 10)
                       .foregroundColor(Color.black)
                       .frame(width: (UIScreen.main.bounds.width - 60 - 10) / 2 ,
                              height: 50,
                              alignment: .center)

                   Text("Withdraw")
                       .foregroundColor(Color.white)
                       .font(Font.system(size: 20, design: .default))
                       .bold()
               }

        }
    }
}





fileprivate struct HomeUserInfoView: View {
    @Binding var userGrade: String
    @State var msg = "hello"
    var body: some View {
        VStack(alignment: .leading) {
            
            HStack {
                Text("$18 624.00")
                    .foregroundColor(Color.white)
                    .font(Font.system(size: 40, design: .default))
                .bold()
                Spacer()
                Image(systemName: "dollarsign.square.fill")
                    .resizable()
                    .frame(width: 30, height: 30, alignment: .center)
                    .scaledToFit()
                    .foregroundColor(.white)
            }.padding(.bottom, 0)
            
            Rectangle()
                .frame(minWidth: 0, idealWidth: UIScreen.main.bounds.width,
                       maxWidth: UIScreen.main.bounds.width)
                .frame(height: 0.5)
                .foregroundColor(Color.white.opacity(0.5))
                .padding(.top, 0)
            Text(userGrade)
                .bold()
                .foregroundColor(Color.white)
            //Divider()
                //.frame(width: 100, height: 100)
            Text(msg)
        
        }.onAppear() {
            let inset = UIView().safeAreaInsets
            let top = inset.bottom

            
            self.msg = "top: \(top)"
        }
        
    }
}

fileprivate struct HomeNavigationBar: View {
    @Binding var isNew: Bool
    var body: some View {
        HStack {
            Text("Wallet").foregroundColor(.white)
            Spacer()
            Button(action: {
                self.isNew.toggle()
            }){
                ZStack{
                    Image(systemName: "bell.fill")
                    .resizable()
                        .frame(width: 20, height: 20, alignment: .center)
                        .foregroundColor(Color.white)
                    .scaledToFit()
                    
                    Circle()
                        .opacity(isNew ? 1 : 0)
                        .frame(width: 10, height: 10)
                        .foregroundColor(Color.red)
                        .padding(.top, -10)
                        .padding(.trailing, -10)
                        
                    
                }
                
            }
                

        }
        
            
    }
}











struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
