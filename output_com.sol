pragma solidity ^0.8.0;

contract ResourceDistribution {
    uint256 public totalSupply;
    mapping (address => uint256) public allocation;
    mapping (address => uint8) public refugeeStatus;

    enum RefugeeStatus {
        Child,
        Woman,
        Elderly,
        PersonWithDisability,
        Other
    }

    constructor(uint256 _totalSupply) public {
        totalSupply = _totalSupply;
    }

    function setRefugeeStatus(address _refugee, uint8 _status) public {
        require(_status <= uint8(RefugeeStatus.Other), "Invalid refugee status");
        refugeeStatus[_refugee] = _status;
    }

    function allocate(address _refugee) public {
        uint256 allocationAmount;
        switch (refugeeStatus[_refugee]) {
            case uint8(RefugeeStatus.Child):
                allocationAmount = totalSupply * 0.15;
                break;
            case uint8(RefugeeStatus.Woman):
                allocationAmount = totalSupply * 0.20;
                break;
            case uint8(RefugeeStatus.Elderly):
                allocationAmount = totalSupply * 0.25;
                break;
            case uint8(RefugeeStatus.PersonWithDisability):
                allocationAmount = totalSupply * 0.30;
                break;
            default:
                allocationAmount = totalSupply * 0.10;
                break;
        }
        allocation[_refugee] = allocationAmount;
    }
}

