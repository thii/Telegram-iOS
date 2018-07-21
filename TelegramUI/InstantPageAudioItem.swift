import Foundation
import Postbox
import TelegramCore
import AsyncDisplayKit

final class InstantPageAudioItem: InstantPageItem {
    var frame: CGRect
    let wantsNode: Bool = true
    let medias: [InstantPageMedia]
    
    let media: InstantPageMedia
    let webpage: TelegramMediaWebpage
    
    init(frame: CGRect, media: InstantPageMedia, webpage: TelegramMediaWebpage) {
        self.frame = frame
        self.media = media
        self.webpage = webpage
        self.medias = [media]
    }
    
    func node(account: Account, strings: PresentationStrings, theme: InstantPageTheme, openMedia: @escaping (InstantPageMedia) -> Void, openPeer: @escaping (PeerId) -> Void) -> (InstantPageNode & ASDisplayNode)? {
        return InstantPageAudioNode(account: account, strings: strings, theme: theme, webPage: self.webpage, media: self.media, openMedia: openMedia)
    }
    
    func matchesAnchor(_ anchor: String) -> Bool {
        return false
    }
    
    func matchesNode(_ node: InstantPageNode) -> Bool {
        if let node = node as? InstantPageAudioNode {
            return self.media == node.media
        } else {
            return false
        }
    }
    
    func distanceThresholdGroup() -> Int? {
        return 4
    }
    
    func distanceThresholdWithGroupCount(_ count: Int) -> CGFloat {
        if count > 3 {
            return 1000.0
        } else {
            return CGFloat.greatestFiniteMagnitude
        }
    }
    
    func linkSelectionRects(at point: CGPoint) -> [CGRect] {
        return []
    }
    
    func drawInTile(context: CGContext) {
    }
}

