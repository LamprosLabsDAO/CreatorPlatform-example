// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/utils/ReentrancyGuard.sol";

contract CreatorPlatform is ERC721, ReentrancyGuard {
    struct Content {
        address payable creator;
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

    constructor() ERC721("CreatorContent", "CC") {}

    function createContent(string memory _contentURI) external {
        contentCount++;
        contents[contentCount] = Content(payable(msg.sender), _contentURI, 0);
        _safeMint(msg.sender, contentCount);
        emit ContentCreated(contentCount, msg.sender, _contentURI);
    }

    function tipContent(uint256 _contentId) external payable {
        require(_contentId <= contentCount, "Content does not exist");
        Content storage content = contents[_contentId];
        require(msg.value > 0, "Tip amount must be greater than 0");

        content.tipAmount += msg.value;
        content.creator.transfer(msg.value);

        emit ContentTipped(_contentId, msg.sender, msg.value);
    }

    function setSubscriptionFee(uint256 _fee) external {
        creators[msg.sender].subscriptionFee = _fee;
    }

    function subscribe(address _creator) external payable {
        Creator storage creator = creators[_creator];
        require(!creator.subscribers[msg.sender], "Already subscribed");

        uint256 fee = creator.subscriptionFee;
        require(msg.value >= fee, "Insufficient subscription fee");

        creator.subscribers[msg.sender] = true;
        creator.subscriberCount++;
        payable(_creator).transfer(msg.value);

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

    function withdrawTips(uint256 _contentId) external nonReentrant {
        require(_contentId <= contentCount, "Content does not exist");
        Content storage content = contents[_contentId];
        require(
            msg.sender == content.creator,
            "Only the creator can withdraw tips"
        );

        uint256 amount = content.tipAmount;
        content.tipAmount = 0;
        content.creator.transfer(amount);
    }
}
