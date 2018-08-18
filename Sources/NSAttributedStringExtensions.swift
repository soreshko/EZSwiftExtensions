//
//  NSAttributedStringExtensions.swift
//  EZSwiftExtensions
//
//  Created by Lucas Farah on 18/02/16.
//  Copyright (c) 2016 Lucas Farah. All rights reserved.
//

#if os(iOS) || os(tvOS)

#if swift(>=4.2)
public typealias AttributedStringKey = NSAttributedString.Key
#else
public typealias AttributedStringKey = NSAttributedStringKey
#endif

extension NSAttributedString {
    /// EZSE: Adds bold attribute to NSAttributedString and returns it

    #if os(iOS)

    public func bold() -> NSAttributedString {
        guard let copy = self.mutableCopy() as? NSMutableAttributedString else { return self }

        let range = (self.string as NSString).range(of: self.string)
        copy.addAttributes([AttributedStringKey.font: UIFont.boldSystemFont(ofSize: UIFont.systemFontSize)], range: range)
        return copy
    }

    #endif

    /// EZSE: Adds underline attribute to NSAttributedString and returns it
    public func underline() -> NSAttributedString {
        guard let copy = self.mutableCopy() as? NSMutableAttributedString else { return self }

        let range = (self.string as NSString).range(of: self.string)

        #if swift(>=4.2)
          let styleSingle = NSUnderlineStyle.single
        #else
          let styleSingle = NSUnderlineStyle.styleSingle
        #endif
      
        copy.addAttributes([AttributedStringKey.underlineStyle: styleSingle.rawValue], range: range)
        return copy
    }

    #if os(iOS)

    /// EZSE: Adds italic attribute to NSAttributedString and returns it
    public func italic() -> NSAttributedString {
        guard let copy = self.mutableCopy() as? NSMutableAttributedString else { return self }

        let range = (self.string as NSString).range(of: self.string)
        copy.addAttributes([AttributedStringKey.font: UIFont.italicSystemFont(ofSize: UIFont.systemFontSize)], range: range)
        return copy
    }

    /// EZSE: Adds strikethrough attribute to NSAttributedString and returns it
    public func strikethrough() -> NSAttributedString {
        guard let copy = self.mutableCopy() as? NSMutableAttributedString else { return self }

        #if swift(>=4.2)
          let styleSingle = NSUnderlineStyle.single
        #else
          let styleSingle = NSUnderlineStyle.styleSingle
        #endif

        let range = (self.string as NSString).range(of: self.string)
        let attributes = [
            AttributedStringKey.strikethroughStyle: NSNumber(value: styleSingle.rawValue as Int)]
        copy.addAttributes(attributes, range: range)

        return copy
    }

    #endif

    /// EZSE: Adds color attribute to NSAttributedString and returns it
    public func color(_ color: UIColor) -> NSAttributedString {
        guard let copy = self.mutableCopy() as? NSMutableAttributedString else { return self }

        let range = (self.string as NSString).range(of: self.string)
        copy.addAttributes([AttributedStringKey.foregroundColor: color], range: range)
        return copy
    }
}

/// EZSE: Appends one NSAttributedString to another NSAttributedString and returns it
public func += (left: inout NSAttributedString, right: NSAttributedString) {
    let ns = NSMutableAttributedString(attributedString: left)
    ns.append(right)
    left = ns
}
    
/// EZSE: Sum of one NSAttributedString with another NSAttributedString
public func + (left: NSAttributedString, right: NSAttributedString) -> NSAttributedString {
    let ns = NSMutableAttributedString(attributedString: left)
    ns.append(right)
    return ns
}

#endif
