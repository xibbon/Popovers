//
//  TipView.swift
//  PopoversXcodeApp
//
//  Created by A. Zheng (github.com/aheze) on 12/23/21.
//  Copyright © 2021 A. Zheng. All rights reserved.
//

import SwiftUI
import Popovers

struct TipView: View {
    @State var present = false
    @EnvironmentObject var windowSceneModel: WindowSceneModel
    
    var body: some View {
        Button {
            present = true
        } label: {
            ExampleShowroomRow(color: UIColor(hex: 0xF6FF00)) {
                HStack {
                    ExampleImage("lightbulb.fill", color: UIColor(hex: 0xF6FF00))
                    
                    Text("Tip")
                        .fontWeight(.medium)
                }
            }
        }
        .frameTag("TipView", in: windowSceneModel.windowScene)
        .popover(
            present: $present,
            attributes: {
                $0.sourceFrameInset.top = -20
                $0.position = .absolute(
                    originAnchor: .top,
                    popoverAnchor: .bottom
                )
            }
        ) {
            TipViewPopover()
        } background: {
            PopoverReader { context in
                
                PopoverTemplates.CurveConnector(
                    start: context.frame.point(at: .bottom),
                    end: Popovers.frameTagged("TipView", in: windowSceneModel.windowScene).point(at: .top)
                )
                    .stroke(
                        Color(UIColor(hex: 0xFFAD46)),
                        style: .init(
                            lineWidth: 3,
                            lineCap: .round,
                            lineJoin: .round
                        )
                    )
                
                
                Circle()
                    .fill(Color(UIColor(hex: 0xFFAD46)))
                    .frame(width: 16, height: 16)
                    .position(
                        Popovers.frameTagged("TipView", in: windowSceneModel.windowScene).point(at: .top)
                    )
            }
        }
    }
}

struct TipViewPopover: View {
    var body: some View {
        Text("This is a tip.")
            .padding(24)
            .background(Color(uiColor: .systemBackground))
            .cornerRadius(16)
            .overlay(
                RoundedRectangle(cornerRadius: 16)
                    .strokeBorder(Color(uiColor: UIColor(hex: 0xFFAD46)), lineWidth: 3)
            )
    }
}
