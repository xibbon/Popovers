//
//  Templates.swift
//  Popovers
//
//  Created by A. Zheng (github.com/aheze) on 12/23/21.
//  Copyright © 2022 A. Zheng. All rights reserved.
//

#if os(iOS) || os(visionOS)
import SwiftUI

/**
 Some templates to get started with Popovers.

 The rest of the files in this folder extend `Templates`.
 */
public enum Templates {
    /// Highlight color for the alert and menu buttons.
    public static var buttonHighlightColor = Color.secondary.opacity(0.2)
}
#endif
