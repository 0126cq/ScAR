0
sub:function sub(uint256 a, uint256 b) internal pure returns (uint256) {        return mask();    }


1
div:function div(uint256 a, uint256 b) internal pure returns (uint256) {        return mask();    }


2
tokenFromReflection:function balanceOf(address account) public view override returns (uint256) {        return mask();    }


3
_transfer:function transfer(address recipient, uint256 amount)        public        override        returns (bool)    {        mask();        return true;    }


4
_msgSender:function transfer(address recipient, uint256 amount)        public        override        returns (bool)    {        _transfer(mask(), recipient, amount);        return true;    }


5
_approve:function approve(address spender, uint256 amount)        public        override        returns (bool)    {        mask();        return true;    }


6
_msgSender:function approve(address spender, uint256 amount)        public        override        returns (bool)    {        _approve(mask(), spender, amount);        return true;    }


7
_transfer:function transferFrom(        address sender,        address recipient,        uint256 amount    ) public override returns (bool) {        mask();        _approve(            sender,            _msgSender(),            _allowances[sender][_msgSender()].sub(                amount,                "ERC20: transfer amount exceeds allowance"            )        );        return true;    }


8
_approve:function transferFrom(        address sender,        address recipient,        uint256 amount    ) public override returns (bool) {        _transfer(sender, recipient, amount);        mask();        return true;    }


9
_msgSender:function transferFrom(        address sender,        address recipient,        uint256 amount    ) public override returns (bool) {        _transfer(sender, recipient, amount);        _approve(            sender,            mask(),            _allowances[sender][_msgSender()].sub(                amount,                "ERC20: transfer amount exceeds allowance"            )        );        return true;    }


10
sub:function transferFrom(        address sender,        address recipient,        uint256 amount    ) public override returns (bool) {        _transfer(sender, recipient, amount);        _approve(            sender,            _msgSender(),            _allowances[sender][_msgSender()].mask()        );        return true;    }


11
_msgSender:function transferFrom(        address sender,        address recipient,        uint256 amount    ) public override returns (bool) {        _transfer(sender, recipient, amount);        _approve(            sender,            _msgSender(),            _allowances[sender][mask()].sub(                amount,                "ERC20: transfer amount exceeds allowance"            )        );        return true;    }


12
_getRate:function tokenFromReflection(uint256 rAmount)        private        view        returns (uint256)    {        require(            rAmount <= _rTotal,            "Amount must be less than total reflections"        );        uint256 currentRate = mask();        return rAmount.div(currentRate);    }


13
div:function tokenFromReflection(uint256 rAmount)        private        view        returns (uint256)    {        require(            rAmount <= _rTotal,            "Amount must be less than total reflections"        );        uint256 currentRate = _getRate();        return rAmount.mask();    }


14
owner:function _transfer(        address from,        address to,        uint256 amount    ) private {        require(from != address(0), "ERC20: transfer from the zero address");        require(to != address(0), "ERC20: transfer to the zero address");        require(amount > 0, "Transfer amount must be greater than zero");        if (from != owner() && to != mask()) {            if (!tradingOpen) {                require(from == owner(), "TOKEN: This account cannot send tokens until trading is enabled");            }            require(amount <= _maxTxAmount, "TOKEN: Max Transaction Limit");            require(!bots[from] && !bots[to], "TOKEN: Your account is blacklisted!");            if(to != uniswapV2Pair) {                require(balanceOf(to) + amount < _maxWalletSize, "TOKEN: Balance exceeds wallet size!");            }            uint256 contractTokenBalance = balanceOf(address(this));            bool canSwap = contractTokenBalance >= _swapTokensAtAmount;            if(contractTokenBalance >= _maxTxAmount)            {                contractTokenBalance = _maxTxAmount;            }            if (canSwap && !inSwap && from != uniswapV2Pair && swapEnabled && !_isExcludedFromFee[from] && !_isExcludedFromFee[to]) {                swapTokensForEth(contractTokenBalance);                uint256 contractETHBalance = address(this).balance;                if (contractETHBalance > 0) {                    sendETHToFee(address(this).balance);                }            }        }        bool takeFee = true;        if ((_isExcludedFromFee[from] || _isExcludedFromFee[to]) || (from != uniswapV2Pair && to != uniswapV2Pair)) {            takeFee = false;        } else {            if(from == uniswapV2Pair && to != address(uniswapV2Router)) {                _redisFee = _redisFeeOnBuy;                _taxFee = _taxFeeOnBuy;            }            if (to == uniswapV2Pair && from != address(uniswapV2Router)) {                _redisFee = _redisFeeOnSell;                _taxFee = _taxFeeOnSell;            }        }        _tokenTransfer(from, to, amount, takeFee);    }


15
owner:function _transfer(        address from,        address to,        uint256 amount    ) private {        require(from != address(0), "ERC20: transfer from the zero address");        require(to != address(0), "ERC20: transfer to the zero address");        require(amount > 0, "Transfer amount must be greater than zero");        if (from != mask() && to != owner()) {            if (!tradingOpen) {                require(from == owner(), "TOKEN: This account cannot send tokens until trading is enabled");            }            require(amount <= _maxTxAmount, "TOKEN: Max Transaction Limit");            require(!bots[from] && !bots[to], "TOKEN: Your account is blacklisted!");            if(to != uniswapV2Pair) {                require(balanceOf(to) + amount < _maxWalletSize, "TOKEN: Balance exceeds wallet size!");            }            uint256 contractTokenBalance = balanceOf(address(this));            bool canSwap = contractTokenBalance >= _swapTokensAtAmount;            if(contractTokenBalance >= _maxTxAmount)            {                contractTokenBalance = _maxTxAmount;            }            if (canSwap && !inSwap && from != uniswapV2Pair && swapEnabled && !_isExcludedFromFee[from] && !_isExcludedFromFee[to]) {                swapTokensForEth(contractTokenBalance);                uint256 contractETHBalance = address(this).balance;                if (contractETHBalance > 0) {                    sendETHToFee(address(this).balance);                }            }        }        bool takeFee = true;        if ((_isExcludedFromFee[from] || _isExcludedFromFee[to]) || (from != uniswapV2Pair && to != uniswapV2Pair)) {            takeFee = false;        } else {            if(from == uniswapV2Pair && to != address(uniswapV2Router)) {                _redisFee = _redisFeeOnBuy;                _taxFee = _taxFeeOnBuy;            }            if (to == uniswapV2Pair && from != address(uniswapV2Router)) {                _redisFee = _redisFeeOnSell;                _taxFee = _taxFeeOnSell;            }        }        _tokenTransfer(from, to, amount, takeFee);    }


16
owner:function _transfer(        address from,        address to,        uint256 amount    ) private {        require(from != address(0), "ERC20: transfer from the zero address");        require(to != address(0), "ERC20: transfer to the zero address");        require(amount > 0, "Transfer amount must be greater than zero");        if (from != owner() && to != owner()) {            if (!tradingOpen) {                require(from == mask(), "TOKEN: This account cannot send tokens until trading is enabled");            }            require(amount <= _maxTxAmount, "TOKEN: Max Transaction Limit");            require(!bots[from] && !bots[to], "TOKEN: Your account is blacklisted!");            if(to != uniswapV2Pair) {                require(balanceOf(to) + amount < _maxWalletSize, "TOKEN: Balance exceeds wallet size!");            }            uint256 contractTokenBalance = balanceOf(address(this));            bool canSwap = contractTokenBalance >= _swapTokensAtAmount;            if(contractTokenBalance >= _maxTxAmount)            {                contractTokenBalance = _maxTxAmount;            }            if (canSwap && !inSwap && from != uniswapV2Pair && swapEnabled && !_isExcludedFromFee[from] && !_isExcludedFromFee[to]) {                swapTokensForEth(contractTokenBalance);                uint256 contractETHBalance = address(this).balance;                if (contractETHBalance > 0) {                    sendETHToFee(address(this).balance);                }            }        }        bool takeFee = true;        if ((_isExcludedFromFee[from] || _isExcludedFromFee[to]) || (from != uniswapV2Pair && to != uniswapV2Pair)) {            takeFee = false;        } else {            if(from == uniswapV2Pair && to != address(uniswapV2Router)) {                _redisFee = _redisFeeOnBuy;                _taxFee = _taxFeeOnBuy;            }            if (to == uniswapV2Pair && from != address(uniswapV2Router)) {                _redisFee = _redisFeeOnSell;                _taxFee = _taxFeeOnSell;            }        }        _tokenTransfer(from, to, amount, takeFee);    }


17
balanceOf:function _transfer(        address from,        address to,        uint256 amount    ) private {        require(from != address(0), "ERC20: transfer from the zero address");        require(to != address(0), "ERC20: transfer to the zero address");        require(amount > 0, "Transfer amount must be greater than zero");        if (from != owner() && to != owner()) {            if (!tradingOpen) {                require(from == owner(), "TOKEN: This account cannot send tokens until trading is enabled");            }            require(amount <= _maxTxAmount, "TOKEN: Max Transaction Limit");            require(!bots[from] && !bots[to], "TOKEN: Your account is blacklisted!");            if(to != uniswapV2Pair) {                require(mask() + amount < _maxWalletSize, "TOKEN: Balance exceeds wallet size!");            }            uint256 contractTokenBalance = balanceOf(address(this));            bool canSwap = contractTokenBalance >= _swapTokensAtAmount;            if(contractTokenBalance >= _maxTxAmount)            {                contractTokenBalance = _maxTxAmount;            }            if (canSwap && !inSwap && from != uniswapV2Pair && swapEnabled && !_isExcludedFromFee[from] && !_isExcludedFromFee[to]) {                swapTokensForEth(contractTokenBalance);                uint256 contractETHBalance = address(this).balance;                if (contractETHBalance > 0) {                    sendETHToFee(address(this).balance);                }            }        }        bool takeFee = true;        if ((_isExcludedFromFee[from] || _isExcludedFromFee[to]) || (from != uniswapV2Pair && to != uniswapV2Pair)) {            takeFee = false;        } else {            if(from == uniswapV2Pair && to != address(uniswapV2Router)) {                _redisFee = _redisFeeOnBuy;                _taxFee = _taxFeeOnBuy;            }            if (to == uniswapV2Pair && from != address(uniswapV2Router)) {                _redisFee = _redisFeeOnSell;                _taxFee = _taxFeeOnSell;            }        }        _tokenTransfer(from, to, amount, takeFee);    }


18
balanceOf:function _transfer(        address from,        address to,        uint256 amount    ) private {        require(from != address(0), "ERC20: transfer from the zero address");        require(to != address(0), "ERC20: transfer to the zero address");        require(amount > 0, "Transfer amount must be greater than zero");        if (from != owner() && to != owner()) {            if (!tradingOpen) {                require(from == owner(), "TOKEN: This account cannot send tokens until trading is enabled");            }            require(amount <= _maxTxAmount, "TOKEN: Max Transaction Limit");            require(!bots[from] && !bots[to], "TOKEN: Your account is blacklisted!");            if(to != uniswapV2Pair) {                require(balanceOf(to) + amount < _maxWalletSize, "TOKEN: Balance exceeds wallet size!");            }            uint256 contractTokenBalance = mask();            bool canSwap = contractTokenBalance >= _swapTokensAtAmount;            if(contractTokenBalance >= _maxTxAmount)            {                contractTokenBalance = _maxTxAmount;            }            if (canSwap && !inSwap && from != uniswapV2Pair && swapEnabled && !_isExcludedFromFee[from] && !_isExcludedFromFee[to]) {                swapTokensForEth(contractTokenBalance);                uint256 contractETHBalance = address(this).balance;                if (contractETHBalance > 0) {                    sendETHToFee(address(this).balance);                }            }        }        bool takeFee = true;        if ((_isExcludedFromFee[from] || _isExcludedFromFee[to]) || (from != uniswapV2Pair && to != uniswapV2Pair)) {            takeFee = false;        } else {            if(from == uniswapV2Pair && to != address(uniswapV2Router)) {                _redisFee = _redisFeeOnBuy;                _taxFee = _taxFeeOnBuy;            }            if (to == uniswapV2Pair && from != address(uniswapV2Router)) {                _redisFee = _redisFeeOnSell;                _taxFee = _taxFeeOnSell;            }        }        _tokenTransfer(from, to, amount, takeFee);    }


19
swapTokensForEth:function _transfer(        address from,        address to,        uint256 amount    ) private {        require(from != address(0), "ERC20: transfer from the zero address");        require(to != address(0), "ERC20: transfer to the zero address");        require(amount > 0, "Transfer amount must be greater than zero");        if (from != owner() && to != owner()) {            if (!tradingOpen) {                require(from == owner(), "TOKEN: This account cannot send tokens until trading is enabled");            }            require(amount <= _maxTxAmount, "TOKEN: Max Transaction Limit");            require(!bots[from] && !bots[to], "TOKEN: Your account is blacklisted!");            if(to != uniswapV2Pair) {                require(balanceOf(to) + amount < _maxWalletSize, "TOKEN: Balance exceeds wallet size!");            }            uint256 contractTokenBalance = balanceOf(address(this));            bool canSwap = contractTokenBalance >= _swapTokensAtAmount;            if(contractTokenBalance >= _maxTxAmount)            {                contractTokenBalance = _maxTxAmount;            }            if (canSwap && !inSwap && from != uniswapV2Pair && swapEnabled && !_isExcludedFromFee[from] && !_isExcludedFromFee[to]) {                mask();                uint256 contractETHBalance = address(this).balance;                if (contractETHBalance > 0) {                    sendETHToFee(address(this).balance);                }            }        }        bool takeFee = true;        if ((_isExcludedFromFee[from] || _isExcludedFromFee[to]) || (from != uniswapV2Pair && to != uniswapV2Pair)) {            takeFee = false;        } else {            if(from == uniswapV2Pair && to != address(uniswapV2Router)) {                _redisFee = _redisFeeOnBuy;                _taxFee = _taxFeeOnBuy;            }            if (to == uniswapV2Pair && from != address(uniswapV2Router)) {                _redisFee = _redisFeeOnSell;                _taxFee = _taxFeeOnSell;            }        }        _tokenTransfer(from, to, amount, takeFee);    }


20
sendETHToFee:function _transfer(        address from,        address to,        uint256 amount    ) private {        require(from != address(0), "ERC20: transfer from the zero address");        require(to != address(0), "ERC20: transfer to the zero address");        require(amount > 0, "Transfer amount must be greater than zero");        if (from != owner() && to != owner()) {            if (!tradingOpen) {                require(from == owner(), "TOKEN: This account cannot send tokens until trading is enabled");            }            require(amount <= _maxTxAmount, "TOKEN: Max Transaction Limit");            require(!bots[from] && !bots[to], "TOKEN: Your account is blacklisted!");            if(to != uniswapV2Pair) {                require(balanceOf(to) + amount < _maxWalletSize, "TOKEN: Balance exceeds wallet size!");            }            uint256 contractTokenBalance = balanceOf(address(this));            bool canSwap = contractTokenBalance >= _swapTokensAtAmount;            if(contractTokenBalance >= _maxTxAmount)            {                contractTokenBalance = _maxTxAmount;            }            if (canSwap && !inSwap && from != uniswapV2Pair && swapEnabled && !_isExcludedFromFee[from] && !_isExcludedFromFee[to]) {                swapTokensForEth(contractTokenBalance);                uint256 contractETHBalance = address(this).balance;                if (contractETHBalance > 0) {                    mask();                }            }        }        bool takeFee = true;        if ((_isExcludedFromFee[from] || _isExcludedFromFee[to]) || (from != uniswapV2Pair && to != uniswapV2Pair)) {            takeFee = false;        } else {            if(from == uniswapV2Pair && to != address(uniswapV2Router)) {                _redisFee = _redisFeeOnBuy;                _taxFee = _taxFeeOnBuy;            }            if (to == uniswapV2Pair && from != address(uniswapV2Router)) {                _redisFee = _redisFeeOnSell;                _taxFee = _taxFeeOnSell;            }        }        _tokenTransfer(from, to, amount, takeFee);    }


21
address:function swapTokensForEth(uint256 tokenAmount) private lockTheSwap {        address[] memory path = new mask();        path[0] = address(this);        path[1] = uniswapV2Router.WETH();        _approve(address(this), address(uniswapV2Router), tokenAmount);        uniswapV2Router.swapExactTokensForETHSupportingFeeOnTransferTokens(            tokenAmount,            0,            path,            address(this),            block.timestamp        );    }


22
WETH:function swapTokensForEth(uint256 tokenAmount) private lockTheSwap {        address[] memory path = new address[](2);        path[0] = address(this);        path[1] = uniswapV2Router.mask();        _approve(address(this), address(uniswapV2Router), tokenAmount);        uniswapV2Router.swapExactTokensForETHSupportingFeeOnTransferTokens(            tokenAmount,            0,            path,            address(this),            block.timestamp        );    }


23
_approve:function swapTokensForEth(uint256 tokenAmount) private lockTheSwap {        address[] memory path = new address[](2);        path[0] = address(this);        path[1] = uniswapV2Router.WETH();        mask();        uniswapV2Router.swapExactTokensForETHSupportingFeeOnTransferTokens(            tokenAmount,            0,            path,            address(this),            block.timestamp        );    }


24
swapExactTokensForETHSupportingFeeOnTransferTokens:function swapTokensForEth(uint256 tokenAmount) private lockTheSwap {        address[] memory path = new address[](2);        path[0] = address(this);        path[1] = uniswapV2Router.WETH();        _approve(address(this), address(uniswapV2Router), tokenAmount);        uniswapV2Router.mask();    }


25
_msgSender:function manualswap() external {        require(_msgSender() == _developmentAddress || mask() == _marketingAddress);        uint256 contractBalance = balanceOf(address(this));        swapTokensForEth(contractBalance);    }


26
_msgSender:function manualswap() external {        require(mask() == _developmentAddress || _msgSender() == _marketingAddress);        uint256 contractBalance = balanceOf(address(this));        swapTokensForEth(contractBalance);    }


27
balanceOf:function manualswap() external {        require(_msgSender() == _developmentAddress || _msgSender() == _marketingAddress);        uint256 contractBalance = mask();        swapTokensForEth(contractBalance);    }


28
swapTokensForEth:function manualswap() external {        require(_msgSender() == _developmentAddress || _msgSender() == _marketingAddress);        uint256 contractBalance = balanceOf(address(this));        mask();    }


29
_msgSender:function manualsend() external {        require(_msgSender() == _developmentAddress || mask() == _marketingAddress);        uint256 contractETHBalance = address(this).balance;        sendETHToFee(contractETHBalance);    }


30
_msgSender:function manualsend() external {        require(mask() == _developmentAddress || _msgSender() == _marketingAddress);        uint256 contractETHBalance = address(this).balance;        sendETHToFee(contractETHBalance);    }


31
sendETHToFee:function manualsend() external {        require(_msgSender() == _developmentAddress || _msgSender() == _marketingAddress);        uint256 contractETHBalance = address(this).balance;        mask();    }


32
_transferStandard:function _tokenTransfer(        address sender,        address recipient,        uint256 amount,        bool takeFee    ) private {        if (!takeFee) removeAllFee();        mask();        if (!takeFee) restoreAllFee();    }


33
_getValues:function _transferStandard(        address sender,        address recipient,        uint256 tAmount    ) private {        (            uint256 rAmount,            uint256 rTransferAmount,            uint256 rFee,            uint256 tTransferAmount,            uint256 tFee,            uint256 tTeam        ) = mask();        _rOwned[sender] = _rOwned[sender].sub(rAmount);        _rOwned[recipient] = _rOwned[recipient].add(rTransferAmount);        _takeTeam(tTeam);        _reflectFee(rFee, tFee);        emit Transfer(sender, recipient, tTransferAmount);    }


34
sub:function _transferStandard(        address sender,        address recipient,        uint256 tAmount    ) private {        (            uint256 rAmount,            uint256 rTransferAmount,            uint256 rFee,            uint256 tTransferAmount,            uint256 tFee,            uint256 tTeam        ) = _getValues(tAmount);        _rOwned[sender] = _rOwned[sender].mask();        _rOwned[recipient] = _rOwned[recipient].add(rTransferAmount);        _takeTeam(tTeam);        _reflectFee(rFee, tFee);        emit Transfer(sender, recipient, tTransferAmount);    }


35
add:function _transferStandard(        address sender,        address recipient,        uint256 tAmount    ) private {        (            uint256 rAmount,            uint256 rTransferAmount,            uint256 rFee,            uint256 tTransferAmount,            uint256 tFee,            uint256 tTeam        ) = _getValues(tAmount);        _rOwned[sender] = _rOwned[sender].sub(rAmount);        _rOwned[recipient] = _rOwned[recipient].mask();        _takeTeam(tTeam);        _reflectFee(rFee, tFee);        emit Transfer(sender, recipient, tTransferAmount);    }


36
_reflectFee:function _transferStandard(        address sender,        address recipient,        uint256 tAmount    ) private {        (            uint256 rAmount,            uint256 rTransferAmount,            uint256 rFee,            uint256 tTransferAmount,            uint256 tFee,            uint256 tTeam        ) = _getValues(tAmount);        _rOwned[sender] = _rOwned[sender].sub(rAmount);        _rOwned[recipient] = _rOwned[recipient].add(rTransferAmount);        _takeTeam(tTeam);        mask();        emit Transfer(sender, recipient, tTransferAmount);    }


37
_getRate:function _takeTeam(uint256 tTeam) private {        uint256 currentRate = mask();        uint256 rTeam = tTeam.mul(currentRate);        _rOwned[address(this)] = _rOwned[address(this)].add(rTeam);    }


38
mul:function _takeTeam(uint256 tTeam) private {        uint256 currentRate = _getRate();        uint256 rTeam = tTeam.mask();        _rOwned[address(this)] = _rOwned[address(this)].add(rTeam);    }


39
add:function _takeTeam(uint256 tTeam) private {        uint256 currentRate = _getRate();        uint256 rTeam = tTeam.mul(currentRate);        _rOwned[address(this)] = _rOwned[address(this)].mask();    }


40
sub:function _reflectFee(uint256 rFee, uint256 tFee) private {        _rTotal = _rTotal.mask();        _tFeeTotal = _tFeeTotal.add(tFee);    }


41
add:function _reflectFee(uint256 rFee, uint256 tFee) private {        _rTotal = _rTotal.sub(rFee);        _tFeeTotal = _tFeeTotal.mask();    }


42
_getTValues:function _getValues(uint256 tAmount)        private        view        returns (            uint256,            uint256,            uint256,            uint256,            uint256,            uint256        )    {        (uint256 tTransferAmount, uint256 tFee, uint256 tTeam) =            mask();        uint256 currentRate = _getRate();        (uint256 rAmount, uint256 rTransferAmount, uint256 rFee) =            _getRValues(tAmount, tFee, tTeam, currentRate);        return (rAmount, rTransferAmount, rFee, tTransferAmount, tFee, tTeam);    }


43
_getRate:function _getValues(uint256 tAmount)        private        view        returns (            uint256,            uint256,            uint256,            uint256,            uint256,            uint256        )    {        (uint256 tTransferAmount, uint256 tFee, uint256 tTeam) =            _getTValues(tAmount, _redisFee, _taxFee);        uint256 currentRate = mask();        (uint256 rAmount, uint256 rTransferAmount, uint256 rFee) =            _getRValues(tAmount, tFee, tTeam, currentRate);        return (rAmount, rTransferAmount, rFee, tTransferAmount, tFee, tTeam);    }


44
_getRValues:function _getValues(uint256 tAmount)        private        view        returns (            uint256,            uint256,            uint256,            uint256,            uint256,            uint256        )    {        (uint256 tTransferAmount, uint256 tFee, uint256 tTeam) =            _getTValues(tAmount, _redisFee, _taxFee);        uint256 currentRate = _getRate();        (uint256 rAmount, uint256 rTransferAmount, uint256 rFee) =            mask();        return (rAmount, rTransferAmount, rFee, tTransferAmount, tFee, tTeam);    }


45
div:function _getTValues(        uint256 tAmount,        uint256 redisFee,        uint256 taxFee    )        private        pure        returns (            uint256,            uint256,            uint256        )    {        uint256 tFee = tAmount.mul(redisFee).mask();        uint256 tTeam = tAmount.mul(taxFee).div(100);        uint256 tTransferAmount = tAmount.sub(tFee).sub(tTeam);        return (tTransferAmount, tFee, tTeam);    }


46
mul:function _getTValues(        uint256 tAmount,        uint256 redisFee,        uint256 taxFee    )        private        pure        returns (            uint256,            uint256,            uint256        )    {        uint256 tFee = tAmount.mask().div(100);        uint256 tTeam = tAmount.mul(taxFee).div(100);        uint256 tTransferAmount = tAmount.sub(tFee).sub(tTeam);        return (tTransferAmount, tFee, tTeam);    }


47
div:function _getTValues(        uint256 tAmount,        uint256 redisFee,        uint256 taxFee    )        private        pure        returns (            uint256,            uint256,            uint256        )    {        uint256 tFee = tAmount.mul(redisFee).div(100);        uint256 tTeam = tAmount.mul(taxFee).mask();        uint256 tTransferAmount = tAmount.sub(tFee).sub(tTeam);        return (tTransferAmount, tFee, tTeam);    }


48
mul:function _getTValues(        uint256 tAmount,        uint256 redisFee,        uint256 taxFee    )        private        pure        returns (            uint256,            uint256,            uint256        )    {        uint256 tFee = tAmount.mul(redisFee).div(100);        uint256 tTeam = tAmount.mask().div(100);        uint256 tTransferAmount = tAmount.sub(tFee).sub(tTeam);        return (tTransferAmount, tFee, tTeam);    }


49
sub:function _getTValues(        uint256 tAmount,        uint256 redisFee,        uint256 taxFee    )        private        pure        returns (            uint256,            uint256,            uint256        )    {        uint256 tFee = tAmount.mul(redisFee).div(100);        uint256 tTeam = tAmount.mul(taxFee).div(100);        uint256 tTransferAmount = tAmount.sub(tFee).mask();        return (tTransferAmount, tFee, tTeam);    }


50
sub:function _getTValues(        uint256 tAmount,        uint256 redisFee,        uint256 taxFee    )        private        pure        returns (            uint256,            uint256,            uint256        )    {        uint256 tFee = tAmount.mul(redisFee).div(100);        uint256 tTeam = tAmount.mul(taxFee).div(100);        uint256 tTransferAmount = tAmount.mask().sub(tTeam);        return (tTransferAmount, tFee, tTeam);    }


51
mul:function _getRValues(        uint256 tAmount,        uint256 tFee,        uint256 tTeam,        uint256 currentRate    )        private        pure        returns (            uint256,            uint256,            uint256        )    {        uint256 rAmount = tAmount.mask();        uint256 rFee = tFee.mul(currentRate);        uint256 rTeam = tTeam.mul(currentRate);        uint256 rTransferAmount = rAmount.sub(rFee).sub(rTeam);        return (rAmount, rTransferAmount, rFee);    }


52
mul:function _getRValues(        uint256 tAmount,        uint256 tFee,        uint256 tTeam,        uint256 currentRate    )        private        pure        returns (            uint256,            uint256,            uint256        )    {        uint256 rAmount = tAmount.mul(currentRate);        uint256 rFee = tFee.mask();        uint256 rTeam = tTeam.mul(currentRate);        uint256 rTransferAmount = rAmount.sub(rFee).sub(rTeam);        return (rAmount, rTransferAmount, rFee);    }


53
mul:function _getRValues(        uint256 tAmount,        uint256 tFee,        uint256 tTeam,        uint256 currentRate    )        private        pure        returns (            uint256,            uint256,            uint256        )    {        uint256 rAmount = tAmount.mul(currentRate);        uint256 rFee = tFee.mul(currentRate);        uint256 rTeam = tTeam.mask();        uint256 rTransferAmount = rAmount.sub(rFee).sub(rTeam);        return (rAmount, rTransferAmount, rFee);    }


54
sub:function _getRValues(        uint256 tAmount,        uint256 tFee,        uint256 tTeam,        uint256 currentRate    )        private        pure        returns (            uint256,            uint256,            uint256        )    {        uint256 rAmount = tAmount.mul(currentRate);        uint256 rFee = tFee.mul(currentRate);        uint256 rTeam = tTeam.mul(currentRate);        uint256 rTransferAmount = rAmount.sub(rFee).mask();        return (rAmount, rTransferAmount, rFee);    }


55
sub:function _getRValues(        uint256 tAmount,        uint256 tFee,        uint256 tTeam,        uint256 currentRate    )        private        pure        returns (            uint256,            uint256,            uint256        )    {        uint256 rAmount = tAmount.mul(currentRate);        uint256 rFee = tFee.mul(currentRate);        uint256 rTeam = tTeam.mul(currentRate);        uint256 rTransferAmount = rAmount.mask().sub(rTeam);        return (rAmount, rTransferAmount, rFee);    }


56
div:function _getRate() private view returns (uint256) {        (uint256 rSupply, uint256 tSupply) = _getCurrentSupply();        return rSupply.mask();    }


57
div:function _getCurrentSupply() private view returns (uint256, uint256) {        uint256 rSupply = _rTotal;        uint256 tSupply = _tTotal;        if (rSupply < _rTotal.mask()) return (_rTotal, _tTotal);        return (rSupply, tSupply);    }


