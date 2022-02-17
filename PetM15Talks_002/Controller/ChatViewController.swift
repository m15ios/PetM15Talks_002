//
//  ChatViewController.swift
//  PetM15Talks_002
//
//  Created by Mikhail Petrenko on 17.02.2022.
//

import UIKit
import MessageKit

// for differ author
struct Sender: SenderType {
    var senderId: String
    var displayName: String
}

struct Message: MessageType {
    var sender: SenderType
    var messageId: String
    var sentDate: Date
    var kind: MessageKind
}

class ChatViewController: MessagesViewController {
        
    // self user - me
    var sender:Sender?
    
    // other side user
    var receiver:Sender?
    
    var messages = [Message]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //let appStorage: AppStorage = AppStorage.hole()
        //let isUserAuth = appStorage.getUserAuth()
        sender = Sender(senderId: "000", displayName: "me")
        receiver = Sender(senderId: "002", displayName: "notme")
        
        messages.append( Message(sender: sender!, messageId: "1", sentDate: Date().addingTimeInterval(-11122), kind: .text("Hello!") ) )
        messages.append( Message(sender: receiver!, messageId: "2", sentDate: Date().addingTimeInterval(-11112), kind: .text("Hi!") ) )

        
        messagesCollectionView.messagesDataSource = self
        messagesCollectionView.messagesLayoutDelegate = self
        messagesCollectionView.messagesDisplayDelegate = self
        
        showMessageTimestampOnSwipeLeft = true
    }
    
}

extension ChatViewController: MessagesDisplayDelegate, MessagesLayoutDelegate, MessagesDataSource {
    func currentSender() -> SenderType {
        return sender!
    }
    
    func messageForItem(at indexPath: IndexPath, in messagesCollectionView: MessagesCollectionView) -> MessageType {
        return messages[indexPath.section]
    }
    
    func numberOfSections(in messagesCollectionView: MessagesCollectionView) -> Int {
        return messages.count
    }
    
    
}
