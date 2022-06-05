//
//  RichTextExtension.swift
//  
//
//  Created by 이웅재(NuPlay) on 2021/08/27.
//  https://github.com/NuPlay/RichText

import SwiftUI

extension RichText {
    public func customCSS(_ customCSS: String) -> RichText {
        var result = self
        result.configuration.customCSS += customCSS
        return result
    }
    
    public func lineHeight(_ lineHeight: CGFloat) -> RichText {
        var result = self
        result.configuration.lineHeight = lineHeight
        return result
    }

    public func imageRadius(_ imageRadius: CGFloat) -> RichText {
        var result = self
        result.configuration.imageRadius = imageRadius
        return result
    }

    public func fontType(_ fontType: FontType) -> RichText {
        var result = self
        result.configuration.fontType = fontType
        return result
    }
    
    @available(iOS 14.0, *)
    public func foregroundColor(lightColor light: Color, darkColor dark: Color) -> RichText {
        var result = self
        result.configuration.linkColor = .init(light: light, dark: dark)
        return result
    }
    
    public func foregroundColor(lightColor light: UIColor, darkColor dark: UIColor) -> RichText {
        var result = self
        result.configuration.linkColor = .init(light: light, dark: dark)
        return result
    }
    
    public func linkColor(_ linkColor: ColorSet) -> RichText {
        var result = self
        result.configuration.linkColor = linkColor
        return result
    }

    public func linkOpenType(_ linkOpenType: LinkOpenType) -> RichText {
        var result = self
        result.configuration.linkOpenType = linkOpenType
        return result
    }
    
    public func colorPreference(_ preference: ColorPreference) -> RichText {
        var result = self
        result.configuration.isColorsImportant = preference
        
        switch preference {
        case .all:
            result.configuration.linkColor.isImportant = true
            result.configuration.fontColor.isImportant = true
        case .onlyLinks:
            result.configuration.linkColor.isImportant = true
            result.configuration.fontColor.isImportant = false
        case .none:
            result.configuration.linkColor.isImportant = false
            result.configuration.fontColor.isImportant = false
        }
        
        return result
    }
    
    public func placeholder<T>(@ViewBuilder content: () -> T) -> RichText where T: View {
        var result = self
        result.placeholder = AnyView(content())
        return result
    }
}
