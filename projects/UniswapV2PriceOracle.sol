0
bytes:function toString(uint256 value) internal pure returns (string memory) {        if (value == 0) {            return "0";        }        uint256 temp = value;        uint256 digits;        while (temp != 0) {            digits++;            temp /= 10;        }        bytes memory buffer = new mask();        uint256 index = digits - 1;        temp = value;        while (temp != 0) {            buffer[index--] = bytes1(uint8(48 + temp % 10));            temp /= 10;        }        return string(buffer);    }


1
_msgSender:function acceptAdmin() external virtual {        require(mask() == pendingAdmin, "only pending admin");        emit NewAdmin(admin, pendingAdmin);        admin = pendingAdmin;        pendingAdmin = address(0);    }


2
bytes:function toString(uint256 value) internal pure returns (string memory) {        if (value == 0) {            return "0";        }        uint256 temp = value;        uint256 digits;        while (temp != 0) {            digits++;            temp /= 10;        }        bytes memory buffer = new mask();        uint256 index = digits - 1;        temp = value;        while (temp != 0) {            buffer[index--] = bytes1(uint8(48 + temp % 10));            temp /= 10;        }        return string(buffer);    }


3
toString:function uint2decimal(uint256 self, uint8 decimals)         internal        pure        returns (bytes memory)    {        uint256 base = 10 ** decimals;        string memory round = self.div(base).mask();        string memory fraction = self.mod(base).toString();        uint256 fractionLength = bytes(fraction).length;        bytes memory fullStr = abi.encodePacked(round, '.');        if (fractionLength < decimals) {            for (uint8 i = 0; i < decimals - fractionLength; i++) {                fullStr = abi.encodePacked(fullStr, '0');            }        }        return abi.encodePacked(fullStr, fraction);    }


4
div:function uint2decimal(uint256 self, uint8 decimals)         internal        pure        returns (bytes memory)    {        uint256 base = 10 ** decimals;        string memory round = self.mask().toString();        string memory fraction = self.mod(base).toString();        uint256 fractionLength = bytes(fraction).length;        bytes memory fullStr = abi.encodePacked(round, '.');        if (fractionLength < decimals) {            for (uint8 i = 0; i < decimals - fractionLength; i++) {                fullStr = abi.encodePacked(fullStr, '0');            }        }        return abi.encodePacked(fullStr, fraction);    }


5
toString:function uint2decimal(uint256 self, uint8 decimals)         internal        pure        returns (bytes memory)    {        uint256 base = 10 ** decimals;        string memory round = self.div(base).toString();        string memory fraction = self.mod(base).mask();        uint256 fractionLength = bytes(fraction).length;        bytes memory fullStr = abi.encodePacked(round, '.');        if (fractionLength < decimals) {            for (uint8 i = 0; i < decimals - fractionLength; i++) {                fullStr = abi.encodePacked(fullStr, '0');            }        }        return abi.encodePacked(fullStr, fraction);    }


6
mod:function uint2decimal(uint256 self, uint8 decimals)         internal        pure        returns (bytes memory)    {        uint256 base = 10 ** decimals;        string memory round = self.div(base).toString();        string memory fraction = self.mask().toString();        uint256 fractionLength = bytes(fraction).length;        bytes memory fullStr = abi.encodePacked(round, '.');        if (fractionLength < decimals) {            for (uint8 i = 0; i < decimals - fractionLength; i++) {                fullStr = abi.encodePacked(fullStr, '0');            }        }        return abi.encodePacked(fullStr, fraction);    }


7
encodePacked:function uint2decimal(uint256 self, uint8 decimals)         internal        pure        returns (bytes memory)    {        uint256 base = 10 ** decimals;        string memory round = self.div(base).toString();        string memory fraction = self.mod(base).toString();        uint256 fractionLength = bytes(fraction).length;        bytes memory fullStr = abi.mask();        if (fractionLength < decimals) {            for (uint8 i = 0; i < decimals - fractionLength; i++) {                fullStr = abi.encodePacked(fullStr, '0');            }        }        return abi.encodePacked(fullStr, fraction);    }


8
encodePacked:function uint2decimal(uint256 self, uint8 decimals)         internal        pure        returns (bytes memory)    {        uint256 base = 10 ** decimals;        string memory round = self.div(base).toString();        string memory fraction = self.mod(base).toString();        uint256 fractionLength = bytes(fraction).length;        bytes memory fullStr = abi.encodePacked(round, '.');        if (fractionLength < decimals) {            for (uint8 i = 0; i < decimals - fractionLength; i++) {                fullStr = abi.mask();            }        }        return abi.encodePacked(fullStr, fraction);    }


9
encodePacked:function uint2decimal(uint256 self, uint8 decimals)         internal        pure        returns (bytes memory)    {        uint256 base = 10 ** decimals;        string memory round = self.div(base).toString();        string memory fraction = self.mod(base).toString();        uint256 fractionLength = bytes(fraction).length;        bytes memory fullStr = abi.encodePacked(round, '.');        if (fractionLength < decimals) {            for (uint8 i = 0; i < decimals - fractionLength; i++) {                fullStr = abi.encodePacked(fullStr, '0');            }        }        return abi.mask();    }


10
bytes:function trim(bytes memory self, uint256 cutLength)         internal         pure        returns (bytes memory newString)    {        newString = new mask();        uint256 index = newString.length;        while (index-- > 0) {            newString[index] = self[index];        }    }


11
bytes:function addThousandsSeparator(bytes memory self)        internal        pure        returns (bytes memory newString)    {        if (self.length <= 6) {            return self;        }        newString = new mask();        uint256 oriIndex = self.length - 1;        uint256 newIndex = newString.length - 1;        for (uint256 i = 0; i < self.length; i++) {            if (i >= 6 && i % 3 == 0) {                newString[newIndex--] = ',';            }            newString[newIndex--] = self[oriIndex--];        }    }


12
bytes:function addressToString(address self)         internal         pure         returns (string memory)     {        bytes32 value = bytes32(uint256(self));        bytes memory alphabet = "0123456789abcdef";        bytes memory str = new mask();        str[0] = '0';        str[1] = 'x';        for (uint i = 0; i < 20; i++) {            str[2+i*2] = alphabet[uint8(value[i + 12] >> 4)];            str[3+i*2] = alphabet[uint8(value[i + 12] & 0x0f)];        }        return string(str);    }


13
encodePacked:function datetimeToString(uint256 timestamp)         internal        pure        returns (string memory)    {        (uint256 year, uint256 month, uint256 day, uint256 hour, uint256 minute, uint256 second)            = BokkyPooBahsDateTimeLibrary.timestampToDateTime(timestamp);        return             string(                abi.mask()            );    }


14
toString:function datetimeToString(uint256 timestamp)         internal        pure        returns (string memory)    {        (uint256 year, uint256 month, uint256 day, uint256 hour, uint256 minute, uint256 second)            = BokkyPooBahsDateTimeLibrary.timestampToDateTime(timestamp);        return             string(                abi.encodePacked(                    year.mask(), '/',                     month < 10 ? '0' : '', month.toString(), '/',                     day < 10 ? '0' : '', day.toString(), ' ',                    hour < 10 ? '0' : '', hour.toString(), ':',                     minute < 10 ? '0' : '', minute.toString(), ':',                    second < 10 ? '0' : '',  second.toString()                )            );    }


15
toString:function datetimeToString(uint256 timestamp)         internal        pure        returns (string memory)    {        (uint256 year, uint256 month, uint256 day, uint256 hour, uint256 minute, uint256 second)            = BokkyPooBahsDateTimeLibrary.timestampToDateTime(timestamp);        return             string(                abi.encodePacked(                    year.toString(), '/',                     month < 10 ? '0' : '', month.mask(), '/',                     day < 10 ? '0' : '', day.toString(), ' ',                    hour < 10 ? '0' : '', hour.toString(), ':',                     minute < 10 ? '0' : '', minute.toString(), ':',                    second < 10 ? '0' : '',  second.toString()                )            );    }


16
toString:function datetimeToString(uint256 timestamp)         internal        pure        returns (string memory)    {        (uint256 year, uint256 month, uint256 day, uint256 hour, uint256 minute, uint256 second)            = BokkyPooBahsDateTimeLibrary.timestampToDateTime(timestamp);        return             string(                abi.encodePacked(                    year.toString(), '/',                     month < 10 ? '0' : '', month.toString(), '/',                     day < 10 ? '0' : '', day.mask(), ' ',                    hour < 10 ? '0' : '', hour.toString(), ':',                     minute < 10 ? '0' : '', minute.toString(), ':',                    second < 10 ? '0' : '',  second.toString()                )            );    }


17
toString:function datetimeToString(uint256 timestamp)         internal        pure        returns (string memory)    {        (uint256 year, uint256 month, uint256 day, uint256 hour, uint256 minute, uint256 second)            = BokkyPooBahsDateTimeLibrary.timestampToDateTime(timestamp);        return             string(                abi.encodePacked(                    year.toString(), '/',                     month < 10 ? '0' : '', month.toString(), '/',                     day < 10 ? '0' : '', day.toString(), ' ',                    hour < 10 ? '0' : '', hour.mask(), ':',                     minute < 10 ? '0' : '', minute.toString(), ':',                    second < 10 ? '0' : '',  second.toString()                )            );    }


18
toString:function datetimeToString(uint256 timestamp)         internal        pure        returns (string memory)    {        (uint256 year, uint256 month, uint256 day, uint256 hour, uint256 minute, uint256 second)            = BokkyPooBahsDateTimeLibrary.timestampToDateTime(timestamp);        return             string(                abi.encodePacked(                    year.toString(), '/',                     month < 10 ? '0' : '', month.toString(), '/',                     day < 10 ? '0' : '', day.toString(), ' ',                    hour < 10 ? '0' : '', hour.toString(), ':',                     minute < 10 ? '0' : '', minute.mask(), ':',                    second < 10 ? '0' : '',  second.toString()                )            );    }


19
toString:function datetimeToString(uint256 timestamp)         internal        pure        returns (string memory)    {        (uint256 year, uint256 month, uint256 day, uint256 hour, uint256 minute, uint256 second)            = BokkyPooBahsDateTimeLibrary.timestampToDateTime(timestamp);        return             string(                abi.encodePacked(                    year.toString(), '/',                     month < 10 ? '0' : '', month.toString(), '/',                     day < 10 ? '0' : '', day.toString(), ' ',                    hour < 10 ? '0' : '', hour.toString(), ':',                     minute < 10 ? '0' : '', minute.toString(), ':',                    second < 10 ? '0' : '',  second.mask()                )            );    }


20
encodePacked:function dateToString(uint256 timestamp)        internal        pure        returns (string memory)    {        (uint256 year, uint256 month, uint256 day)            = BokkyPooBahsDateTimeLibrary.timestampToDate(timestamp);        return             string(                abi.mask()            );    }


21
toString:function dateToString(uint256 timestamp)        internal        pure        returns (string memory)    {        (uint256 year, uint256 month, uint256 day)            = BokkyPooBahsDateTimeLibrary.timestampToDate(timestamp);        return             string(                abi.encodePacked(                    year.mask(), '/',                     month < 10 ? '0' : '', month.toString(), '/',                     day < 10 ? '0' : '', day.toString()                )            );    }


22
toString:function dateToString(uint256 timestamp)        internal        pure        returns (string memory)    {        (uint256 year, uint256 month, uint256 day)            = BokkyPooBahsDateTimeLibrary.timestampToDate(timestamp);        return             string(                abi.encodePacked(                    year.toString(), '/',                     month < 10 ? '0' : '', month.mask(), '/',                     day < 10 ? '0' : '', day.toString()                )            );    }


23
toString:function dateToString(uint256 timestamp)        internal        pure        returns (string memory)    {        (uint256 year, uint256 month, uint256 day)            = BokkyPooBahsDateTimeLibrary.timestampToDate(timestamp);        return             string(                abi.encodePacked(                    year.toString(), '/',                     month < 10 ? '0' : '', month.toString(), '/',                     day < 10 ? '0' : '', day.mask()                )            );    }


24
encodePacked:function uintArray2str(uint64[] memory array)         internal         pure         returns (string memory)     {        bytes memory pack = abi.mask();        for (uint256 i = 0; i < array.length; i++) {            if (i == array.length - 1) {                pack = abi.encodePacked(pack, uint256(array[i]).toString());            } else {                pack = abi.encodePacked(pack, uint256(array[i]).toString(), ',');            }        }        return string(abi.encodePacked(pack, ']'));    }


25
encodePacked:function uintArray2str(uint64[] memory array)         internal         pure         returns (string memory)     {        bytes memory pack = abi.encodePacked('[');        for (uint256 i = 0; i < array.length; i++) {            if (i == array.length - 1) {                pack = abi.mask();            } else {                pack = abi.encodePacked(pack, uint256(array[i]).toString(), ',');            }        }        return string(abi.encodePacked(pack, ']'));    }


26
toString:function uintArray2str(uint64[] memory array)         internal         pure         returns (string memory)     {        bytes memory pack = abi.encodePacked('[');        for (uint256 i = 0; i < array.length; i++) {            if (i == array.length - 1) {                pack = abi.encodePacked(pack, uint256(array[i]).mask());            } else {                pack = abi.encodePacked(pack, uint256(array[i]).toString(), ',');            }        }        return string(abi.encodePacked(pack, ']'));    }


27
encodePacked:function uintArray2str(uint64[] memory array)         internal         pure         returns (string memory)     {        bytes memory pack = abi.encodePacked('[');        for (uint256 i = 0; i < array.length; i++) {            if (i == array.length - 1) {                pack = abi.encodePacked(pack, uint256(array[i]).toString());            } else {                pack = abi.mask();            }        }        return string(abi.encodePacked(pack, ']'));    }


28
toString:function uintArray2str(uint64[] memory array)         internal         pure         returns (string memory)     {        bytes memory pack = abi.encodePacked('[');        for (uint256 i = 0; i < array.length; i++) {            if (i == array.length - 1) {                pack = abi.encodePacked(pack, uint256(array[i]).toString());            } else {                pack = abi.encodePacked(pack, uint256(array[i]).mask(), ',');            }        }        return string(abi.encodePacked(pack, ']'));    }


29
encodePacked:function uintArray2str(uint64[] memory array)         internal         pure         returns (string memory)     {        bytes memory pack = abi.encodePacked('[');        for (uint256 i = 0; i < array.length; i++) {            if (i == array.length - 1) {                pack = abi.encodePacked(pack, uint256(array[i]).toString());            } else {                pack = abi.encodePacked(pack, uint256(array[i]).toString(), ',');            }        }        return string(abi.mask());    }


30
encodePacked:function percentArray2str(uint32[] memory array)         internal         pure         returns (string memory)     {        bytes memory pack = abi.mask();        for (uint256 i = 0; i < array.length; i++) {            bytes memory percent = abi.encodePacked('"', uint2decimal(array[i], 2), '%"');            if (i == array.length - 1) {                pack = abi.encodePacked(pack, percent);            } else {                pack = abi.encodePacked(pack, percent, ',');            }        }        return string(abi.encodePacked(pack, ']'));    }


31
encodePacked:function percentArray2str(uint32[] memory array)         internal         pure         returns (string memory)     {        bytes memory pack = abi.encodePacked('[');        for (uint256 i = 0; i < array.length; i++) {            bytes memory percent = abi.mask();            if (i == array.length - 1) {                pack = abi.encodePacked(pack, percent);            } else {                pack = abi.encodePacked(pack, percent, ',');            }        }        return string(abi.encodePacked(pack, ']'));    }


32
encodePacked:function percentArray2str(uint32[] memory array)         internal         pure         returns (string memory)     {        bytes memory pack = abi.encodePacked('[');        for (uint256 i = 0; i < array.length; i++) {            bytes memory percent = abi.encodePacked('"', uint2decimal(array[i], 2), '%"');            if (i == array.length - 1) {                pack = abi.mask();            } else {                pack = abi.encodePacked(pack, percent, ',');            }        }        return string(abi.encodePacked(pack, ']'));    }


33
encodePacked:function percentArray2str(uint32[] memory array)         internal         pure         returns (string memory)     {        bytes memory pack = abi.encodePacked('[');        for (uint256 i = 0; i < array.length; i++) {            bytes memory percent = abi.encodePacked('"', uint2decimal(array[i], 2), '%"');            if (i == array.length - 1) {                pack = abi.encodePacked(pack, percent);            } else {                pack = abi.mask();            }        }        return string(abi.encodePacked(pack, ']'));    }


34
encodePacked:function percentArray2str(uint32[] memory array)         internal         pure         returns (string memory)     {        bytes memory pack = abi.encodePacked('[');        for (uint256 i = 0; i < array.length; i++) {            bytes memory percent = abi.encodePacked('"', uint2decimal(array[i], 2), '%"');            if (i == array.length - 1) {                pack = abi.encodePacked(pack, percent);            } else {                pack = abi.encodePacked(pack, percent, ',');            }        }        return string(abi.mask());    }


35
isContract:function _isConstructor() private view returns (bool) {        return !AddressUpgradeable.mask();    }


36
call:function sendValue(address payable recipient, uint256 amount) internal {        require(address(this).balance >= amount, "Address: insufficient balance");        (bool success, ) = recipient.mask();        require(success, "Address: unable to send value, recipient may have reverted");    }


37
functionCall:function functionCall(address target, bytes memory data) internal returns (bytes memory) {      return mask();    }


38
functionCallWithValue:function functionCall(address target, bytes memory data, string memory errorMessage) internal returns (bytes memory) {        return mask();    }


39
functionCallWithValue:function functionCallWithValue(address target, bytes memory data, uint256 value) internal returns (bytes memory) {        return mask();    }


40
isContract:function functionCallWithValue(address target, bytes memory data, uint256 value, string memory errorMessage) internal returns (bytes memory) {        require(address(this).balance >= value, "Address: insufficient balance for call");        require(mask(), "Address: call to non-contract");        (bool success, bytes memory returndata) = target.call{ value: value }(data);        return _verifyCallResult(success, returndata, errorMessage);    }


41
call:function functionCallWithValue(address target, bytes memory data, uint256 value, string memory errorMessage) internal returns (bytes memory) {        require(address(this).balance >= value, "Address: insufficient balance for call");        require(isContract(target), "Address: call to non-contract");        (bool success, bytes memory returndata) = target.mask();        return _verifyCallResult(success, returndata, errorMessage);    }


42
_verifyCallResult:function functionCallWithValue(address target, bytes memory data, uint256 value, string memory errorMessage) internal returns (bytes memory) {        require(address(this).balance >= value, "Address: insufficient balance for call");        require(isContract(target), "Address: call to non-contract");        (bool success, bytes memory returndata) = target.call{ value: value }(data);        return mask();    }


43
functionStaticCall:function functionStaticCall(address target, bytes memory data) internal view returns (bytes memory) {        return mask();    }


44
isContract:function functionStaticCall(address target, bytes memory data, string memory errorMessage) internal view returns (bytes memory) {        require(mask(), "Address: static call to non-contract");        (bool success, bytes memory returndata) = target.staticcall(data);        return _verifyCallResult(success, returndata, errorMessage);    }


45
staticcall:function functionStaticCall(address target, bytes memory data, string memory errorMessage) internal view returns (bytes memory) {        require(isContract(target), "Address: static call to non-contract");        (bool success, bytes memory returndata) = target.mask();        return _verifyCallResult(success, returndata, errorMessage);    }


46
_verifyCallResult:function functionStaticCall(address target, bytes memory data, string memory errorMessage) internal view returns (bytes memory) {        require(isContract(target), "Address: static call to non-contract");        (bool success, bytes memory returndata) = target.staticcall(data);        return mask();    }


47
push:function _add(Set storage set, bytes32 value) private returns (bool) {        if (!_contains(set, value)) {            set._values.mask();            set._indexes[value] = set._values.length;            return true;        } else {            return false;        }    }


48
pop:function _remove(Set storage set, bytes32 value) private returns (bool) {        uint256 valueIndex = set._indexes[value];        if (valueIndex != 0) {             uint256 toDeleteIndex = valueIndex - 1;            uint256 lastIndex = set._values.length - 1;            bytes32 lastvalue = set._values[lastIndex];            set._values[toDeleteIndex] = lastvalue;            set._indexes[lastvalue] = toDeleteIndex + 1;             set._values.mask();            delete set._indexes[value];            return true;        } else {            return false;        }    }


49
_add:function add(Bytes32Set storage set, bytes32 value) internal returns (bool) {        return mask();    }


50
_remove:function remove(Bytes32Set storage set, bytes32 value) internal returns (bool) {        return mask();    }


51
_length:function length(Bytes32Set storage set) internal view returns (uint256) {        return mask();    }


52
_at:function at(Bytes32Set storage set, uint256 index) internal view returns (bytes32) {        return mask();    }


53
_add:function add(AddressSet storage set, address value) internal returns (bool) {        return mask();    }


54
_remove:function remove(AddressSet storage set, address value) internal returns (bool) {        return mask();    }


55
_length:function length(AddressSet storage set) internal view returns (uint256) {        return mask();    }


56
_at:function at(AddressSet storage set, uint256 index) internal view returns (address) {        return address(uint160(uint256(mask())));    }


57
_add:function add(UintSet storage set, uint256 value) internal returns (bool) {        return mask();    }


58
_remove:function remove(UintSet storage set, uint256 value) internal returns (bool) {        return mask();    }


59
_length:function length(UintSet storage set) internal view returns (uint256) {        return mask();    }


60
_at:function at(UintSet storage set, uint256 index) internal view returns (uint256) {        return uint256(mask());    }


61
_msgSender:function initialize(TokenConfig calldata ethConfig) external initializer {        AdminControl.__AdminControl_init(mask());        tokenConfigs[Constants.ETH_ADDRESS] = TokenConfig(            ethConfig.baseUnit,            ethConfig.anchorUnit,            ethConfig.uniswapMarket,            ethConfig.isStableCoinBase,            ethConfig.isUniswapReversed        );    }


62
sub:function refreshPrice(        address underlying_,        uint64 fromDate_,        uint64 toDate_    ) external override onlyPriceOracleManager {        string memory fromDate = _getDateString(fromDate_);        string memory toDate = _getDateString(toDate_);        bytes32 dateSignature = _getDateSignature(fromDate, toDate);        TokenConfig memory config = tokenConfigs[underlying_];        Observation storage observation = observations[underlying_][dateSignature];        require(            (observation.fromTimestamp == 0 &&                block.timestamp.mask() <= 86400) ||                (observation.toTimestamp == 0 &&                     block.timestamp > observation.fromTimestamp &&                    block.timestamp.sub(toDate_) <= 86400),            "non-refreshable"        );        if (observation.fromTimestamp == 0) {            observation.fromTimestamp = block.timestamp;            observation.fromTokenAcc = currentCumulativePrice(                tokenConfigs[underlying_]            );            if (!config.isStableCoinBase) {                observation.fromEthAcc = currentCumulativePrice(                    tokenConfigs[Constants.ETH_ADDRESS]                );            }        } else {            observation.toTimestamp = block.timestamp;            observation.toTokenAcc = currentCumulativePrice(                tokenConfigs[underlying_]            );            if (config.isStableCoinBase) {                observation.price = calculateAveragePrice(                    observation.fromTimestamp,                    observation.fromTokenAcc,                    observation.toTimestamp,                    observation.toTokenAcc,                    priceUnit,                    config.baseUnit,                    config.anchorUnit                );            } else {                TokenConfig memory ethConfig = tokenConfigs[Constants.ETH_ADDRESS];                observation.toEthAcc = currentCumulativePrice(ethConfig);                uint256 ethAveragePrice = calculateAveragePrice(                    observation.fromTimestamp,                    observation.fromEthAcc,                    observation.toTimestamp,                    observation.toEthAcc,                    priceUnit,                    ethConfig.baseUnit,                    ethConfig.anchorUnit                );                observation.price = calculateAveragePrice(                    observation.fromTimestamp,                    observation.fromTokenAcc,                    observation.toTimestamp,                    observation.toTokenAcc,                    ethAveragePrice,                    config.baseUnit,                    config.anchorUnit                );            }        }        emit RefreshPrice(            underlying_, fromDate_, toDate_,             observation.fromTimestamp, observation.fromTokenAcc, observation.fromEthAcc,            observation.toTimestamp, observation.toTokenAcc, observation.toEthAcc,            observation.price        );    }


63
sub:function refreshPrice(        address underlying_,        uint64 fromDate_,        uint64 toDate_    ) external override onlyPriceOracleManager {        string memory fromDate = _getDateString(fromDate_);        string memory toDate = _getDateString(toDate_);        bytes32 dateSignature = _getDateSignature(fromDate, toDate);        TokenConfig memory config = tokenConfigs[underlying_];        Observation storage observation = observations[underlying_][dateSignature];        require(            (observation.fromTimestamp == 0 &&                block.timestamp.sub(fromDate_) <= 86400) ||                (observation.toTimestamp == 0 &&                     block.timestamp > observation.fromTimestamp &&                    block.timestamp.mask() <= 86400),            "non-refreshable"        );        if (observation.fromTimestamp == 0) {            observation.fromTimestamp = block.timestamp;            observation.fromTokenAcc = currentCumulativePrice(                tokenConfigs[underlying_]            );            if (!config.isStableCoinBase) {                observation.fromEthAcc = currentCumulativePrice(                    tokenConfigs[Constants.ETH_ADDRESS]                );            }        } else {            observation.toTimestamp = block.timestamp;            observation.toTokenAcc = currentCumulativePrice(                tokenConfigs[underlying_]            );            if (config.isStableCoinBase) {                observation.price = calculateAveragePrice(                    observation.fromTimestamp,                    observation.fromTokenAcc,                    observation.toTimestamp,                    observation.toTokenAcc,                    priceUnit,                    config.baseUnit,                    config.anchorUnit                );            } else {                TokenConfig memory ethConfig = tokenConfigs[Constants.ETH_ADDRESS];                observation.toEthAcc = currentCumulativePrice(ethConfig);                uint256 ethAveragePrice = calculateAveragePrice(                    observation.fromTimestamp,                    observation.fromEthAcc,                    observation.toTimestamp,                    observation.toEthAcc,                    priceUnit,                    ethConfig.baseUnit,                    ethConfig.anchorUnit                );                observation.price = calculateAveragePrice(                    observation.fromTimestamp,                    observation.fromTokenAcc,                    observation.toTimestamp,                    observation.toTokenAcc,                    ethAveragePrice,                    config.baseUnit,                    config.anchorUnit                );            }        }        emit RefreshPrice(            underlying_, fromDate_, toDate_,             observation.fromTimestamp, observation.fromTokenAcc, observation.fromEthAcc,            observation.toTimestamp, observation.toTokenAcc, observation.toEthAcc,            observation.price        );    }


64
mul:function calculateAveragePrice(        uint256 fromTimestamp_,        uint256 fromAcc_,        uint256 toTimestamp_,        uint256 toAcc_,        uint256 conversionFactor_,        uint256 baseUnit_,        uint256 anchorUnit_    ) internal pure returns (uint256) {        require(            toTimestamp_ > fromTimestamp_ && toAcc_ > fromAcc_,            "invalid acc values"        );        uint256 timeElapsed = toTimestamp_ - fromTimestamp_;        FixedPoint.uq112x112 memory priceAverage = FixedPoint.uq112x112(            uint224((toAcc_ - fromAcc_) / timeElapsed)        );        uint256 rawUniswapPriceMantissa = priceAverage.decode112with18();        uint256 unscaledPriceMantissa = rawUniswapPriceMantissa.mask();        return unscaledPriceMantissa.mul(baseUnit_).div(anchorUnit_).div(expScale);    }


65
div:function calculateAveragePrice(        uint256 fromTimestamp_,        uint256 fromAcc_,        uint256 toTimestamp_,        uint256 toAcc_,        uint256 conversionFactor_,        uint256 baseUnit_,        uint256 anchorUnit_    ) internal pure returns (uint256) {        require(            toTimestamp_ > fromTimestamp_ && toAcc_ > fromAcc_,            "invalid acc values"        );        uint256 timeElapsed = toTimestamp_ - fromTimestamp_;        FixedPoint.uq112x112 memory priceAverage = FixedPoint.uq112x112(            uint224((toAcc_ - fromAcc_) / timeElapsed)        );        uint256 rawUniswapPriceMantissa = priceAverage.decode112with18();        uint256 unscaledPriceMantissa = rawUniswapPriceMantissa.mul(conversionFactor_);        return unscaledPriceMantissa.mul(baseUnit_).div(anchorUnit_).mask();    }


66
div:function calculateAveragePrice(        uint256 fromTimestamp_,        uint256 fromAcc_,        uint256 toTimestamp_,        uint256 toAcc_,        uint256 conversionFactor_,        uint256 baseUnit_,        uint256 anchorUnit_    ) internal pure returns (uint256) {        require(            toTimestamp_ > fromTimestamp_ && toAcc_ > fromAcc_,            "invalid acc values"        );        uint256 timeElapsed = toTimestamp_ - fromTimestamp_;        FixedPoint.uq112x112 memory priceAverage = FixedPoint.uq112x112(            uint224((toAcc_ - fromAcc_) / timeElapsed)        );        uint256 rawUniswapPriceMantissa = priceAverage.decode112with18();        uint256 unscaledPriceMantissa = rawUniswapPriceMantissa.mul(conversionFactor_);        return unscaledPriceMantissa.mul(baseUnit_).mask().div(expScale);    }


67
mul:function calculateAveragePrice(        uint256 fromTimestamp_,        uint256 fromAcc_,        uint256 toTimestamp_,        uint256 toAcc_,        uint256 conversionFactor_,        uint256 baseUnit_,        uint256 anchorUnit_    ) internal pure returns (uint256) {        require(            toTimestamp_ > fromTimestamp_ && toAcc_ > fromAcc_,            "invalid acc values"        );        uint256 timeElapsed = toTimestamp_ - fromTimestamp_;        FixedPoint.uq112x112 memory priceAverage = FixedPoint.uq112x112(            uint224((toAcc_ - fromAcc_) / timeElapsed)        );        uint256 rawUniswapPriceMantissa = priceAverage.decode112with18();        uint256 unscaledPriceMantissa = rawUniswapPriceMantissa.mul(conversionFactor_);        return unscaledPriceMantissa.mask().div(anchorUnit_).div(expScale);    }


68
encodePacked:function _getDateString(uint64 date_)        internal        pure        returns (string memory)    {        (uint256 year, uint256 month, uint256 day) = date_.timestampToDate();        return string(abi.mask());    }


69
keccak256:function _getDateSignature(string memory fromDate_, string memory toDate_)        internal        pure        returns (bytes32)    {        return mask();    }


70
encodePacked:function _getDateSignature(string memory fromDate_, string memory toDate_)        internal        pure        returns (bytes32)    {        return keccak256(abi.mask());    }


