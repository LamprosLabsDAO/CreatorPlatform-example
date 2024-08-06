// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/token/ERC721/ERC721.sol";

contract CreatorToken is ERC20 {
    constructor(uint256 initialSupply) ERC20("CreatorToken", "CT") {
        _mint(msg.sender, initialSupply);
    }
}

contract CreatorPlatform is ERC721 {
    CreatorToken public token;

    struct Content {
        address creator;
        string contentURI;
        uint256 tipAmount;
    }

    struct Creator {
        uint256 subscriberCount;
        uint256 subscriptionFee;
        mapping(address => bool) subscribers;
    }

    mapping(uint256 => Content) public contents;
    mapping(address => Creator) public creators;

    uint256 public contentCount;

    event ContentCreated(
        uint256 indexed contentId,
        address indexed creator,
        string contentURI
    );
    event ContentTipped(
        uint256 indexed contentId,
        address indexed tipper,
        uint256 amount
    );
    event CreatorSubscribed(
        address indexed creator,
        address indexed subscriber
    );

    constructor(address _tokenAddress) ERC721("CreatorContent", "CC") {
        token = CreatorToken(_tokenAddress);
    }

    function createContent(string memory _contentURI) external {
        contentCount++;
        contents[contentCount] = Content(msg.sender, _contentURI, 0);
        _safeMint(msg.sender, contentCount);
        emit ContentCreated(contentCount, msg.sender, _contentURI);
    }

    function tipContent(uint256 _contentId, uint256 _amount) external {
        require(_contentId <= contentCount, "Content does not exist");
        Content storage content = contents[_contentId];
        require(_amount > 0, "Tip amount must be greater than 0");

        content.tipAmount += _amount;
        require(
            token.transferFrom(msg.sender, content.creator, _amount),
            "Token transfer failed"
        );

        emit ContentTipped(_contentId, msg.sender, _amount);
    }

    function setSubscriptionFee(uint256 _fee) external {
        creators[msg.sender].subscriptionFee = _fee;
    }

    function subscribe(address _creator) external {
        Creator storage creator = creators[_creator];
        require(!creator.subscribers[msg.sender], "Already subscribed");

        uint256 fee = creator.subscriptionFee;
        require(
            token.transferFrom(msg.sender, _creator, fee),
            "Token transfer failed"
        );

        creator.subscribers[msg.sender] = true;
        creator.subscriberCount++;

        emit CreatorSubscribed(_creator, msg.sender);
    }

    function isSubscribed(
        address _subscriber,
        address _creator
    ) external view returns (bool) {
        return creators[_creator].subscribers[_subscriber];
    }

    function getSubscriberCount(
        address _creator
    ) external view returns (uint256) {
        return creators[_creator].subscriberCount;
    }

    // function withdrawTips(uint256 _contentId) external nonReentrant {
    //     require(_contentId <= contentCount, "Content does not exist");
    //     Content storage content = contents[_contentId];
    //     require(msg.sender == content.creator, "Only the creator can withdraw tips");

    //     uint256 amount = content.tipAmount;
    //     content.tipAmount = 0;
    //     require(token.transfer(msg.sender, amount), "Token transfer failed");
    // }
}
