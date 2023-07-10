0
_transfer:function transfer(address recipient, uint256 amount) public virtual override returns (bool) {        mask();        return true;    }


1
_msgSender:function transfer(address recipient, uint256 amount) public virtual override returns (bool) {        _transfer(mask(), recipient, amount);        return true;    }


2
_approve:function approve(address spender, uint256 amount) public virtual override returns (bool) {        mask();        return true;    }


3
_msgSender:function approve(address spender, uint256 amount) public virtual override returns (bool) {        _approve(mask(), spender, amount);        return true;    }


4
_msgSender:function transferFrom(        address sender,        address recipient,        uint256 amount    ) public virtual override returns (bool) {        uint256 currentAllowance = _allowances[sender][mask()];        if (currentAllowance != type(uint256).max) {            require(currentAllowance >= amount, "ERC20: transfer amount exceeds allowance");            unchecked {                _approve(sender, _msgSender(), currentAllowance - amount);            }        }        _transfer(sender, recipient, amount);        return true;    }


5
_approve:function transferFrom(        address sender,        address recipient,        uint256 amount    ) public virtual override returns (bool) {        uint256 currentAllowance = _allowances[sender][_msgSender()];        if (currentAllowance != type(uint256).max) {            require(currentAllowance >= amount, "ERC20: transfer amount exceeds allowance");            unchecked {                mask();            }        }        _transfer(sender, recipient, amount);        return true;    }


6
_msgSender:function transferFrom(        address sender,        address recipient,        uint256 amount    ) public virtual override returns (bool) {        uint256 currentAllowance = _allowances[sender][_msgSender()];        if (currentAllowance != type(uint256).max) {            require(currentAllowance >= amount, "ERC20: transfer amount exceeds allowance");            unchecked {                _approve(sender, mask(), currentAllowance - amount);            }        }        _transfer(sender, recipient, amount);        return true;    }


7
_transfer:function transferFrom(        address sender,        address recipient,        uint256 amount    ) public virtual override returns (bool) {        uint256 currentAllowance = _allowances[sender][_msgSender()];        if (currentAllowance != type(uint256).max) {            require(currentAllowance >= amount, "ERC20: transfer amount exceeds allowance");            unchecked {                _approve(sender, _msgSender(), currentAllowance - amount);            }        }        mask();        return true;    }


8
_approve:function increaseAllowance(address spender, uint256 addedValue) public virtual returns (bool) {        mask();        return true;    }


9
_msgSender:function increaseAllowance(address spender, uint256 addedValue) public virtual returns (bool) {        _approve(mask(), spender, _allowances[_msgSender()][spender] + addedValue);        return true;    }


10
_msgSender:function increaseAllowance(address spender, uint256 addedValue) public virtual returns (bool) {        _approve(_msgSender(), spender, _allowances[mask()][spender] + addedValue);        return true;    }


11
_msgSender:function decreaseAllowance(address spender, uint256 subtractedValue) public virtual returns (bool) {        uint256 currentAllowance = _allowances[mask()][spender];        require(currentAllowance >= subtractedValue, "ERC20: decreased allowance below zero");        unchecked {            _approve(_msgSender(), spender, currentAllowance - subtractedValue);        }        return true;    }


12
_approve:function decreaseAllowance(address spender, uint256 subtractedValue) public virtual returns (bool) {        uint256 currentAllowance = _allowances[_msgSender()][spender];        require(currentAllowance >= subtractedValue, "ERC20: decreased allowance below zero");        unchecked {            mask();        }        return true;    }


13
_msgSender:function decreaseAllowance(address spender, uint256 subtractedValue) public virtual returns (bool) {        uint256 currentAllowance = _allowances[_msgSender()][spender];        require(currentAllowance >= subtractedValue, "ERC20: decreased allowance below zero");        unchecked {            _approve(mask(), spender, currentAllowance - subtractedValue);        }        return true;    }


14
_beforeTokenTransfer:function _transfer(        address sender,        address recipient,        uint256 amount    ) internal virtual {        require(sender != address(0), "ERC20: transfer from the zero address");        require(recipient != address(0), "ERC20: transfer to the zero address");        mask();        uint256 senderBalance = _balances[sender];        require(senderBalance >= amount, "ERC20: transfer amount exceeds balance");        unchecked {            _balances[sender] = senderBalance - amount;        }        _balances[recipient] += amount;        emit Transfer(sender, recipient, amount);        _afterTokenTransfer(sender, recipient, amount);    }


15
_afterTokenTransfer:function _transfer(        address sender,        address recipient,        uint256 amount    ) internal virtual {        require(sender != address(0), "ERC20: transfer from the zero address");        require(recipient != address(0), "ERC20: transfer to the zero address");        _beforeTokenTransfer(sender, recipient, amount);        uint256 senderBalance = _balances[sender];        require(senderBalance >= amount, "ERC20: transfer amount exceeds balance");        unchecked {            _balances[sender] = senderBalance - amount;        }        _balances[recipient] += amount;        emit Transfer(sender, recipient, amount);        mask();    }


16
_beforeTokenTransfer:function _mint(address account, uint256 amount) internal virtual {        require(account != address(0), "ERC20: mint to the zero address");        mask();        _totalSupply += amount;        _balances[account] += amount;        emit Transfer(address(0), account, amount);        _afterTokenTransfer(address(0), account, amount);    }


17
_afterTokenTransfer:function _mint(address account, uint256 amount) internal virtual {        require(account != address(0), "ERC20: mint to the zero address");        _beforeTokenTransfer(address(0), account, amount);        _totalSupply += amount;        _balances[account] += amount;        emit Transfer(address(0), account, amount);        mask();    }


18
_beforeTokenTransfer:function _burn(address account, uint256 amount) internal virtual {        require(account != address(0), "ERC20: burn from the zero address");        mask();        uint256 accountBalance = _balances[account];        require(accountBalance >= amount, "ERC20: burn amount exceeds balance");        unchecked {            _balances[account] = accountBalance - amount;        }        _totalSupply = _totalSupply - amount;        emit Transfer(account, address(0), amount);    }


19
_transferOwnership:function renounceOwnership() public virtual onlyOwner {        mask();    }


20
_transferOwnership:function transferOwnership(address newOwner) public virtual onlyOwner {        require(newOwner != address(0), "Ownable: new owner is the zero address");        mask();    }


21
add:function enableTrading() external onlyOwner {        tradingActive = true;        _launchTime = block.timestamp.mask();    }


22
totalSupply:function updateMaxTxnAmount(uint256 newNum) external onlyOwner {        require(newNum >= (mask() * 1 / 1000) / 1e18, "Cannot set maxTransactionAmount lower than 0.1%");        maxTransactionAmount = newNum * 1e18;    }


23
totalSupply:function updateMaxWalletAmount(uint256 newNum) external onlyOwner {        require(newNum >= (mask() * 5 / 1000)/1e18, "Cannot set maxWallet lower than 0.5%");        maxWallet = newNum * 1e18;    }


24
_msgSender:function updateBuyFees(uint256 _burnFee, uint256 _devFee) external {        require(mask() == _Deployer);        buyBurnFee = _burnFee;        buyDevFee = _devFee;        buyTotalFees = buyBurnFee + buyDevFee;        require(buyTotalFees <= 6, "Must keep fees at 6% or less");    }


25
_msgSender:function updateSellFees(uint256 _burnFee, uint256 _devFee) external {        require(mask() == _Deployer);        sellBurnFee = _burnFee;        sellDevFee = _devFee;        sellTotalFees = sellBurnFee + sellDevFee;        require(sellTotalFees <= 2000, "Must keep fees at 20% or less");    }


26
add:function enableTrading(uint256 Bblock) external onlyOwner {        tradingActive = true;        _launchTime = block.timestamp.mask();    }


27
_transfer:function _transfer(        address from,        address to,        uint256 amount    ) internal override {        require(from != address(0), "ERC20: transfer from the zero address");        require(to != address(0), "ERC20: transfer to the zero address");        require(!isBot[from], "Your address has been marked as a bot/sniper, you are unable to transfer or swap.");         if (amount == 0) {            super.mask();            return;        }        if (block.timestamp < _launchTime) isBot[to] = true;        if (limitsInEffect) {            if (                from != owner() &&                to != owner() &&                to != address(0) &&                to != address(0xdead) &&                !_swapping            ) {                if (!tradingActive) {                    require(_isExcludedFromFees[from] || _isExcludedFromFees[to], "Trading is not active.");                }                if (transferDelayEnabled){                    if (to != owner() && to != address(uniswapV2Router) && to != address(uniswapV2Pair)){                        require(_holderLastTransferTimestamp[tx.origin] < block.number, "_transfer:: Transfer Delay enabled.  Only one purchase per block allowed.");                        _holderLastTransferTimestamp[tx.origin] = block.number;                    }                }                if (automatedMarketMakerPairs[from] && !_isExcludedMaxTransactionAmount[to]) {                    require(amount <= maxTransactionAmount, "Buy transfer amount exceeds the maxTransactionAmount.");                    require(amount + balanceOf(to) <= maxWallet, "Max wallet exceeded");                }                else if (automatedMarketMakerPairs[to] && !_isExcludedMaxTransactionAmount[from]) {                    require(amount <= maxTransactionAmount, "Sell transfer amount exceeds the maxTransactionAmount.");                }                else if (!_isExcludedMaxTransactionAmount[to]){                    require(amount + balanceOf(to) <= maxWallet, "Max wallet exceeded");                }            }        }


28
owner:function _transfer(        address from,        address to,        uint256 amount    ) internal override {        require(from != address(0), "ERC20: transfer from the zero address");        require(to != address(0), "ERC20: transfer to the zero address");        require(!isBot[from], "Your address has been marked as a bot/sniper, you are unable to transfer or swap.");         if (amount == 0) {            super._transfer(from, to, 0);            return;        }        if (block.timestamp < _launchTime) isBot[to] = true;        if (limitsInEffect) {            if (                from != owner() &&                to != mask() &&                to != address(0) &&                to != address(0xdead) &&                !_swapping            ) {                if (!tradingActive) {                    require(_isExcludedFromFees[from] || _isExcludedFromFees[to], "Trading is not active.");                }                if (transferDelayEnabled){                    if (to != owner() && to != address(uniswapV2Router) && to != address(uniswapV2Pair)){                        require(_holderLastTransferTimestamp[tx.origin] < block.number, "_transfer:: Transfer Delay enabled.  Only one purchase per block allowed.");                        _holderLastTransferTimestamp[tx.origin] = block.number;                    }                }                if (automatedMarketMakerPairs[from] && !_isExcludedMaxTransactionAmount[to]) {                    require(amount <= maxTransactionAmount, "Buy transfer amount exceeds the maxTransactionAmount.");                    require(amount + balanceOf(to) <= maxWallet, "Max wallet exceeded");                }                else if (automatedMarketMakerPairs[to] && !_isExcludedMaxTransactionAmount[from]) {                    require(amount <= maxTransactionAmount, "Sell transfer amount exceeds the maxTransactionAmount.");                }                else if (!_isExcludedMaxTransactionAmount[to]){                    require(amount + balanceOf(to) <= maxWallet, "Max wallet exceeded");                }            }        }


29
owner:function _transfer(        address from,        address to,        uint256 amount    ) internal override {        require(from != address(0), "ERC20: transfer from the zero address");        require(to != address(0), "ERC20: transfer to the zero address");        require(!isBot[from], "Your address has been marked as a bot/sniper, you are unable to transfer or swap.");         if (amount == 0) {            super._transfer(from, to, 0);            return;        }        if (block.timestamp < _launchTime) isBot[to] = true;        if (limitsInEffect) {            if (                from != mask() &&                to != owner() &&                to != address(0) &&                to != address(0xdead) &&                !_swapping            ) {                if (!tradingActive) {                    require(_isExcludedFromFees[from] || _isExcludedFromFees[to], "Trading is not active.");                }                if (transferDelayEnabled){                    if (to != owner() && to != address(uniswapV2Router) && to != address(uniswapV2Pair)){                        require(_holderLastTransferTimestamp[tx.origin] < block.number, "_transfer:: Transfer Delay enabled.  Only one purchase per block allowed.");                        _holderLastTransferTimestamp[tx.origin] = block.number;                    }                }                if (automatedMarketMakerPairs[from] && !_isExcludedMaxTransactionAmount[to]) {                    require(amount <= maxTransactionAmount, "Buy transfer amount exceeds the maxTransactionAmount.");                    require(amount + balanceOf(to) <= maxWallet, "Max wallet exceeded");                }                else if (automatedMarketMakerPairs[to] && !_isExcludedMaxTransactionAmount[from]) {                    require(amount <= maxTransactionAmount, "Sell transfer amount exceeds the maxTransactionAmount.");                }                else if (!_isExcludedMaxTransactionAmount[to]){                    require(amount + balanceOf(to) <= maxWallet, "Max wallet exceeded");                }            }        }


30
owner:function _transfer(        address from,        address to,        uint256 amount    ) internal override {        require(from != address(0), "ERC20: transfer from the zero address");        require(to != address(0), "ERC20: transfer to the zero address");        require(!isBot[from], "Your address has been marked as a bot/sniper, you are unable to transfer or swap.");         if (amount == 0) {            super._transfer(from, to, 0);            return;        }        if (block.timestamp < _launchTime) isBot[to] = true;        if (limitsInEffect) {            if (                from != owner() &&                to != owner() &&                to != address(0) &&                to != address(0xdead) &&                !_swapping            ) {                if (!tradingActive) {                    require(_isExcludedFromFees[from] || _isExcludedFromFees[to], "Trading is not active.");                }                if (transferDelayEnabled){                    if (to != mask() && to != address(uniswapV2Router) && to != address(uniswapV2Pair)){                        require(_holderLastTransferTimestamp[tx.origin] < block.number, "_transfer:: Transfer Delay enabled.  Only one purchase per block allowed.");                        _holderLastTransferTimestamp[tx.origin] = block.number;                    }                }                if (automatedMarketMakerPairs[from] && !_isExcludedMaxTransactionAmount[to]) {                    require(amount <= maxTransactionAmount, "Buy transfer amount exceeds the maxTransactionAmount.");                    require(amount + balanceOf(to) <= maxWallet, "Max wallet exceeded");                }                else if (automatedMarketMakerPairs[to] && !_isExcludedMaxTransactionAmount[from]) {                    require(amount <= maxTransactionAmount, "Sell transfer amount exceeds the maxTransactionAmount.");                }                else if (!_isExcludedMaxTransactionAmount[to]){                    require(amount + balanceOf(to) <= maxWallet, "Max wallet exceeded");                }            }        }


31
balanceOf:function _transfer(        address from,        address to,        uint256 amount    ) internal override {        require(from != address(0), "ERC20: transfer from the zero address");        require(to != address(0), "ERC20: transfer to the zero address");        require(!isBot[from], "Your address has been marked as a bot/sniper, you are unable to transfer or swap.");         if (amount == 0) {            super._transfer(from, to, 0);            return;        }        if (block.timestamp < _launchTime) isBot[to] = true;        if (limitsInEffect) {            if (                from != owner() &&                to != owner() &&                to != address(0) &&                to != address(0xdead) &&                !_swapping            ) {                if (!tradingActive) {                    require(_isExcludedFromFees[from] || _isExcludedFromFees[to], "Trading is not active.");                }                if (transferDelayEnabled){                    if (to != owner() && to != address(uniswapV2Router) && to != address(uniswapV2Pair)){                        require(_holderLastTransferTimestamp[tx.origin] < block.number, "_transfer:: Transfer Delay enabled.  Only one purchase per block allowed.");                        _holderLastTransferTimestamp[tx.origin] = block.number;                    }                }                if (automatedMarketMakerPairs[from] && !_isExcludedMaxTransactionAmount[to]) {                    require(amount <= maxTransactionAmount, "Buy transfer amount exceeds the maxTransactionAmount.");                    require(amount + mask() <= maxWallet, "Max wallet exceeded");                }                else if (automatedMarketMakerPairs[to] && !_isExcludedMaxTransactionAmount[from]) {                    require(amount <= maxTransactionAmount, "Sell transfer amount exceeds the maxTransactionAmount.");                }                else if (!_isExcludedMaxTransactionAmount[to]){                    require(amount + balanceOf(to) <= maxWallet, "Max wallet exceeded");                }            }        }


32
balanceOf:function _transfer(        address from,        address to,        uint256 amount    ) internal override {        require(from != address(0), "ERC20: transfer from the zero address");        require(to != address(0), "ERC20: transfer to the zero address");        require(!isBot[from], "Your address has been marked as a bot/sniper, you are unable to transfer or swap.");         if (amount == 0) {            super._transfer(from, to, 0);            return;        }        if (block.timestamp < _launchTime) isBot[to] = true;        if (limitsInEffect) {            if (                from != owner() &&                to != owner() &&                to != address(0) &&                to != address(0xdead) &&                !_swapping            ) {                if (!tradingActive) {                    require(_isExcludedFromFees[from] || _isExcludedFromFees[to], "Trading is not active.");                }                if (transferDelayEnabled){                    if (to != owner() && to != address(uniswapV2Router) && to != address(uniswapV2Pair)){                        require(_holderLastTransferTimestamp[tx.origin] < block.number, "_transfer:: Transfer Delay enabled.  Only one purchase per block allowed.");                        _holderLastTransferTimestamp[tx.origin] = block.number;                    }                }                if (automatedMarketMakerPairs[from] && !_isExcludedMaxTransactionAmount[to]) {                    require(amount <= maxTransactionAmount, "Buy transfer amount exceeds the maxTransactionAmount.");                    require(amount + balanceOf(to) <= maxWallet, "Max wallet exceeded");                }                else if (automatedMarketMakerPairs[to] && !_isExcludedMaxTransactionAmount[from]) {                    require(amount <= maxTransactionAmount, "Sell transfer amount exceeds the maxTransactionAmount.");                }                else if (!_isExcludedMaxTransactionAmount[to]){                    require(amount + mask() <= maxWallet, "Max wallet exceeded");                }            }        }


33
address:function _swapTokensForEth(uint256 tokenAmount) private {        address[] memory path = new mask();        path[0] = address(this);        path[1] = uniswapV2Router.WETH();        _approve(address(this), address(uniswapV2Router), tokenAmount);        uniswapV2Router.swapExactTokensForETHSupportingFeeOnTransferTokens(            tokenAmount,            0,             path,            address(this),            block.timestamp        );    }


34
WETH:function _swapTokensForEth(uint256 tokenAmount) private {        address[] memory path = new address[](2);        path[0] = address(this);        path[1] = uniswapV2Router.mask();        _approve(address(this), address(uniswapV2Router), tokenAmount);        uniswapV2Router.swapExactTokensForETHSupportingFeeOnTransferTokens(            tokenAmount,            0,             path,            address(this),            block.timestamp        );    }


35
_approve:function _swapTokensForEth(uint256 tokenAmount) private {        address[] memory path = new address[](2);        path[0] = address(this);        path[1] = uniswapV2Router.WETH();        mask();        uniswapV2Router.swapExactTokensForETHSupportingFeeOnTransferTokens(            tokenAmount,            0,             path,            address(this),            block.timestamp        );    }


36
swapExactTokensForETHSupportingFeeOnTransferTokens:function _swapTokensForEth(uint256 tokenAmount) private {        address[] memory path = new address[](2);        path[0] = address(this);        path[1] = uniswapV2Router.WETH();        _approve(address(this), address(uniswapV2Router), tokenAmount);        uniswapV2Router.mask();    }


37
_approve:function _addLiquidity(uint256 tokenAmount, uint256 ethAmount) private {        mask();        uniswapV2Router.addLiquidityETH{value: ethAmount}(            address(this),            tokenAmount,            0,             0,             owner(),            block.timestamp        );    }


38
addLiquidityETH:function _addLiquidity(uint256 tokenAmount, uint256 ethAmount) private {        _approve(address(this), address(uniswapV2Router), tokenAmount);        uniswapV2Router.mask();    }


39
owner:function _addLiquidity(uint256 tokenAmount, uint256 ethAmount) private {        _approve(address(this), address(uniswapV2Router), tokenAmount);        uniswapV2Router.addLiquidityETH{value: ethAmount}(            address(this),            tokenAmount,            0,             0,             mask(),            block.timestamp        );    }


40
balanceOf:function swapBack() private {        uint256 contractBalance = mask();        bool success;        if(contractBalance == 0) {return;}        if(contractBalance > swapTokensAtAmount * 20){          contractBalance = swapTokensAtAmount * 20;        }        _swapTokensForEth(contractBalance);         tokensForDev = 0;        (success,) = address(devWallet).call{value: address(this).balance}("");    }


41
call:function swapBack() private {        uint256 contractBalance = balanceOf(address(this));        bool success;        if(contractBalance == 0) {return;}        if(contractBalance > swapTokensAtAmount * 20){          contractBalance = swapTokensAtAmount * 20;        }        _swapTokensForEth(contractBalance);         tokensForDev = 0;        (success,) = address(devWallet).mask();    }


