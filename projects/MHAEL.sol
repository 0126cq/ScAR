0
_transfer:function transfer(address recipient, uint256 amount) public virtual override returns (bool) {        mask();        return true;    }


1
_msgSender:function transfer(address recipient, uint256 amount) public virtual override returns (bool) {        _transfer(mask(), recipient, amount);        return true;    }


2
_approve:function approve(address spender, uint256 amount) public virtual override returns (bool) {        mask();        return true;    }


3
_msgSender:function approve(address spender, uint256 amount) public virtual override returns (bool) {        _approve(mask(), spender, amount);        return true;    }


4
_transfer:function transferFrom(        address sender,        address recipient,        uint256 amount    ) public virtual override returns (bool) {        mask();        _approve(sender, _msgSender(), _allowances[sender][_msgSender()].sub(amount, "ERC20: transfer amount exceeds allowance"));        return true;    }


5
_approve:function transferFrom(        address sender,        address recipient,        uint256 amount    ) public virtual override returns (bool) {        _transfer(sender, recipient, amount);        mask();        return true;    }


6
_msgSender:function transferFrom(        address sender,        address recipient,        uint256 amount    ) public virtual override returns (bool) {        _transfer(sender, recipient, amount);        _approve(sender, mask(), _allowances[sender][_msgSender()].sub(amount, "ERC20: transfer amount exceeds allowance"));        return true;    }


7
sub:function transferFrom(        address sender,        address recipient,        uint256 amount    ) public virtual override returns (bool) {        _transfer(sender, recipient, amount);        _approve(sender, _msgSender(), _allowances[sender][_msgSender()].mask());        return true;    }


8
_msgSender:function transferFrom(        address sender,        address recipient,        uint256 amount    ) public virtual override returns (bool) {        _transfer(sender, recipient, amount);        _approve(sender, _msgSender(), _allowances[sender][mask()].sub(amount, "ERC20: transfer amount exceeds allowance"));        return true;    }


9
_approve:function increaseAllowance(address spender, uint256 addedValue) public virtual returns (bool) {        mask();        return true;    }


10
_msgSender:function increaseAllowance(address spender, uint256 addedValue) public virtual returns (bool) {        _approve(mask(), spender, _allowances[_msgSender()][spender].add(addedValue));        return true;    }


11
add:function increaseAllowance(address spender, uint256 addedValue) public virtual returns (bool) {        _approve(_msgSender(), spender, _allowances[_msgSender()][spender].mask());        return true;    }


12
_msgSender:function increaseAllowance(address spender, uint256 addedValue) public virtual returns (bool) {        _approve(_msgSender(), spender, _allowances[mask()][spender].add(addedValue));        return true;    }


13
_approve:function decreaseAllowance(address spender, uint256 subtractedValue) public virtual returns (bool) {        mask();        return true;    }


14
_msgSender:function decreaseAllowance(address spender, uint256 subtractedValue) public virtual returns (bool) {        _approve(mask(), spender, _allowances[_msgSender()][spender].sub(subtractedValue, "ERC20: decreased allowance below zero"));        return true;    }


15
sub:function decreaseAllowance(address spender, uint256 subtractedValue) public virtual returns (bool) {        _approve(_msgSender(), spender, _allowances[_msgSender()][spender].mask());        return true;    }


16
_msgSender:function decreaseAllowance(address spender, uint256 subtractedValue) public virtual returns (bool) {        _approve(_msgSender(), spender, _allowances[mask()][spender].sub(subtractedValue, "ERC20: decreased allowance below zero"));        return true;    }


17
_beforeTokenTransfer:function _transfer(        address sender,        address recipient,        uint256 amount    ) internal virtual {        require(sender != address(0), "ERC20: transfer from the zero address");        require(recipient != address(0), "ERC20: transfer to the zero address");        mask();        _balances[sender] = _balances[sender].sub(amount, "ERC20: transfer amount exceeds balance");        _balances[recipient] = _balances[recipient].add(amount);        emit Transfer(sender, recipient, amount);    }


18
sub:function _transfer(        address sender,        address recipient,        uint256 amount    ) internal virtual {        require(sender != address(0), "ERC20: transfer from the zero address");        require(recipient != address(0), "ERC20: transfer to the zero address");        _beforeTokenTransfer(sender, recipient, amount);        _balances[sender] = _balances[sender].mask();        _balances[recipient] = _balances[recipient].add(amount);        emit Transfer(sender, recipient, amount);    }


19
add:function _transfer(        address sender,        address recipient,        uint256 amount    ) internal virtual {        require(sender != address(0), "ERC20: transfer from the zero address");        require(recipient != address(0), "ERC20: transfer to the zero address");        _beforeTokenTransfer(sender, recipient, amount);        _balances[sender] = _balances[sender].sub(amount, "ERC20: transfer amount exceeds balance");        _balances[recipient] = _balances[recipient].mask();        emit Transfer(sender, recipient, amount);    }


20
_beforeTokenTransfer:function _mint(address account, uint256 amount) internal virtual {        require(account != address(0), "ERC20: mint to the zero address");        mask();        _totalSupply = _totalSupply.add(amount);        _balances[account] = _balances[account].add(amount);        emit Transfer(address(0), account, amount);    }


21
add:function _mint(address account, uint256 amount) internal virtual {        require(account != address(0), "ERC20: mint to the zero address");        _beforeTokenTransfer(address(0), account, amount);        _totalSupply = _totalSupply.mask();        _balances[account] = _balances[account].add(amount);        emit Transfer(address(0), account, amount);    }


22
add:function _mint(address account, uint256 amount) internal virtual {        require(account != address(0), "ERC20: mint to the zero address");        _beforeTokenTransfer(address(0), account, amount);        _totalSupply = _totalSupply.add(amount);        _balances[account] = _balances[account].mask();        emit Transfer(address(0), account, amount);    }


23
_beforeTokenTransfer:function _burn(address account, uint256 amount) internal virtual {        require(account != address(0), "ERC20: burn from the zero address");        mask();        _balances[account] = _balances[account].sub(amount, "ERC20: burn amount exceeds balance");        _totalSupply = _totalSupply.sub(amount);        emit Transfer(account, address(0), amount);    }


24
sub:function _burn(address account, uint256 amount) internal virtual {        require(account != address(0), "ERC20: burn from the zero address");        _beforeTokenTransfer(account, address(0), amount);        _balances[account] = _balances[account].mask();        _totalSupply = _totalSupply.sub(amount);        emit Transfer(account, address(0), amount);    }


25
sub:function _burn(address account, uint256 amount) internal virtual {        require(account != address(0), "ERC20: burn from the zero address");        _beforeTokenTransfer(account, address(0), amount);        _balances[account] = _balances[account].sub(amount, "ERC20: burn amount exceeds balance");        _totalSupply = _totalSupply.mask();        emit Transfer(account, address(0), amount);    }


26
sub:function sub(uint256 a, uint256 b) internal pure returns (uint256) {        return mask();    }


27
div:function div(uint256 a, uint256 b) internal pure returns (uint256) {        return mask();    }


28
mod:function mod(uint256 a, uint256 b) internal pure returns (uint256) {        return mask();    }


29
totalSupply:function updateSwapTokensAtAmount(uint256 newAmount) external onlyOwner returns (bool){        require(newAmount >= mask() * 1 / 100000, "Swap amount cannot be lower than 0.001% total supply.");        require(newAmount <= totalSupply() * 5 / 1000, "Swap amount cannot be higher than 0.5% total supply.");        swapTokensAtAmount = newAmount;        return true;    }


30
totalSupply:function updateSwapTokensAtAmount(uint256 newAmount) external onlyOwner returns (bool){        require(newAmount >= totalSupply() * 1 / 100000, "Swap amount cannot be lower than 0.001% total supply.");        require(newAmount <= mask() * 5 / 1000, "Swap amount cannot be higher than 0.5% total supply.");        swapTokensAtAmount = newAmount;        return true;    }


31
totalSupply:function updateMaxTxnAmount(uint256 newNum) external onlyOwner {        require(newNum >= (mask() * 1 / 1000)/1e18, "Cannot set maxTransactionAmount lower than 0.1%");        maxTransactionAmount = newNum * (10**18);    }


32
totalSupply:function updateMaxWalletAmount(uint256 newNum) external onlyOwner {        require(newNum >= (mask() * 5 / 1000)/1e18, "Cannot set maxWallet lower than 0.5%");        maxWallet = newNum * (10**18);    }


33
address:function swapTokensForEth(uint256 tokenAmount) private {        address[] memory path = new mask();        path[0] = address(this);        path[1] = uniswapV2Router.WETH();        _approve(address(this), address(uniswapV2Router), tokenAmount);        uniswapV2Router.swapExactTokensForETHSupportingFeeOnTransferTokens(            tokenAmount,            0,             path,            address(this),            block.timestamp        );    }


34
WETH:function swapTokensForEth(uint256 tokenAmount) private {        address[] memory path = new address[](2);        path[0] = address(this);        path[1] = uniswapV2Router.mask();        _approve(address(this), address(uniswapV2Router), tokenAmount);        uniswapV2Router.swapExactTokensForETHSupportingFeeOnTransferTokens(            tokenAmount,            0,             path,            address(this),            block.timestamp        );    }


35
_approve:function swapTokensForEth(uint256 tokenAmount) private {        address[] memory path = new address[](2);        path[0] = address(this);        path[1] = uniswapV2Router.WETH();        mask();        uniswapV2Router.swapExactTokensForETHSupportingFeeOnTransferTokens(            tokenAmount,            0,             path,            address(this),            block.timestamp        );    }


36
swapExactTokensForETHSupportingFeeOnTransferTokens:function swapTokensForEth(uint256 tokenAmount) private {        address[] memory path = new address[](2);        path[0] = address(this);        path[1] = uniswapV2Router.WETH();        _approve(address(this), address(uniswapV2Router), tokenAmount);        uniswapV2Router.mask();    }


37
_approve:function addLiquidity(uint256 tokenAmount, uint256 ethAmount) private {        mask();        uniswapV2Router.addLiquidityETH{value: ethAmount}(            address(this),            tokenAmount,            0,             0,             address(this),            block.timestamp        );    }


38
addLiquidityETH:function addLiquidity(uint256 tokenAmount, uint256 ethAmount) private {        _approve(address(this), address(uniswapV2Router), tokenAmount);        uniswapV2Router.mask();    }


39
balanceOf:function swapBack() private {        uint256 contractBalance = mask();        uint256 totalTokensToSwap = tokensForLiquidity + tokensForMarketing + tokensForDev;        bool success;        if(contractBalance == 0 || totalTokensToSwap == 0) {return;}        if(contractBalance > swapTokensAtAmount * 20){          contractBalance = swapTokensAtAmount * 20;        }        uint256 liquidityTokens = contractBalance * tokensForLiquidity / totalTokensToSwap / 2;        uint256 amountToSwapForETH = contractBalance.sub(liquidityTokens);        uint256 initialETHBalance = address(this).balance;        swapTokensForEth(amountToSwapForETH);         uint256 ethBalance = address(this).balance.sub(initialETHBalance);        uint256 ethForMarketing = ethBalance.mul(tokensForMarketing).div(totalTokensToSwap);        uint256 ethForDev = ethBalance.mul(tokensForDev).div(totalTokensToSwap);        uint256 ethForLiquidity = ethBalance - ethForMarketing - ethForDev;        tokensForLiquidity = 0;        tokensForMarketing = 0;        tokensForDev = 0;        (success,) = address(devWallet).call{value: ethForDev}("");        if(liquidityTokens > 0 && ethForLiquidity > 0){            addLiquidity(liquidityTokens, ethForLiquidity);            emit SwapAndLiquify(amountToSwapForETH, ethForLiquidity, tokensForLiquidity);        }        (success,) = address(marketingWallet).call{value: address(this).balance}("");    }


40
sub:function swapBack() private {        uint256 contractBalance = balanceOf(address(this));        uint256 totalTokensToSwap = tokensForLiquidity + tokensForMarketing + tokensForDev;        bool success;        if(contractBalance == 0 || totalTokensToSwap == 0) {return;}        if(contractBalance > swapTokensAtAmount * 20){          contractBalance = swapTokensAtAmount * 20;        }        uint256 liquidityTokens = contractBalance * tokensForLiquidity / totalTokensToSwap / 2;        uint256 amountToSwapForETH = contractBalance.mask();        uint256 initialETHBalance = address(this).balance;        swapTokensForEth(amountToSwapForETH);         uint256 ethBalance = address(this).balance.sub(initialETHBalance);        uint256 ethForMarketing = ethBalance.mul(tokensForMarketing).div(totalTokensToSwap);        uint256 ethForDev = ethBalance.mul(tokensForDev).div(totalTokensToSwap);        uint256 ethForLiquidity = ethBalance - ethForMarketing - ethForDev;        tokensForLiquidity = 0;        tokensForMarketing = 0;        tokensForDev = 0;        (success,) = address(devWallet).call{value: ethForDev}("");        if(liquidityTokens > 0 && ethForLiquidity > 0){            addLiquidity(liquidityTokens, ethForLiquidity);            emit SwapAndLiquify(amountToSwapForETH, ethForLiquidity, tokensForLiquidity);        }        (success,) = address(marketingWallet).call{value: address(this).balance}("");    }


41
swapTokensForEth:function swapBack() private {        uint256 contractBalance = balanceOf(address(this));        uint256 totalTokensToSwap = tokensForLiquidity + tokensForMarketing + tokensForDev;        bool success;        if(contractBalance == 0 || totalTokensToSwap == 0) {return;}        if(contractBalance > swapTokensAtAmount * 20){          contractBalance = swapTokensAtAmount * 20;        }        uint256 liquidityTokens = contractBalance * tokensForLiquidity / totalTokensToSwap / 2;        uint256 amountToSwapForETH = contractBalance.sub(liquidityTokens);        uint256 initialETHBalance = address(this).balance;        mask();         uint256 ethBalance = address(this).balance.sub(initialETHBalance);        uint256 ethForMarketing = ethBalance.mul(tokensForMarketing).div(totalTokensToSwap);        uint256 ethForDev = ethBalance.mul(tokensForDev).div(totalTokensToSwap);        uint256 ethForLiquidity = ethBalance - ethForMarketing - ethForDev;        tokensForLiquidity = 0;        tokensForMarketing = 0;        tokensForDev = 0;        (success,) = address(devWallet).call{value: ethForDev}("");        if(liquidityTokens > 0 && ethForLiquidity > 0){            addLiquidity(liquidityTokens, ethForLiquidity);            emit SwapAndLiquify(amountToSwapForETH, ethForLiquidity, tokensForLiquidity);        }        (success,) = address(marketingWallet).call{value: address(this).balance}("");    }


42
sub:function swapBack() private {        uint256 contractBalance = balanceOf(address(this));        uint256 totalTokensToSwap = tokensForLiquidity + tokensForMarketing + tokensForDev;        bool success;        if(contractBalance == 0 || totalTokensToSwap == 0) {return;}        if(contractBalance > swapTokensAtAmount * 20){          contractBalance = swapTokensAtAmount * 20;        }        uint256 liquidityTokens = contractBalance * tokensForLiquidity / totalTokensToSwap / 2;        uint256 amountToSwapForETH = contractBalance.sub(liquidityTokens);        uint256 initialETHBalance = address(this).balance;        swapTokensForEth(amountToSwapForETH);         uint256 ethBalance = address(this).balance.mask();        uint256 ethForMarketing = ethBalance.mul(tokensForMarketing).div(totalTokensToSwap);        uint256 ethForDev = ethBalance.mul(tokensForDev).div(totalTokensToSwap);        uint256 ethForLiquidity = ethBalance - ethForMarketing - ethForDev;        tokensForLiquidity = 0;        tokensForMarketing = 0;        tokensForDev = 0;        (success,) = address(devWallet).call{value: ethForDev}("");        if(liquidityTokens > 0 && ethForLiquidity > 0){            addLiquidity(liquidityTokens, ethForLiquidity);            emit SwapAndLiquify(amountToSwapForETH, ethForLiquidity, tokensForLiquidity);        }        (success,) = address(marketingWallet).call{value: address(this).balance}("");    }


43
div:function swapBack() private {        uint256 contractBalance = balanceOf(address(this));        uint256 totalTokensToSwap = tokensForLiquidity + tokensForMarketing + tokensForDev;        bool success;        if(contractBalance == 0 || totalTokensToSwap == 0) {return;}        if(contractBalance > swapTokensAtAmount * 20){          contractBalance = swapTokensAtAmount * 20;        }        uint256 liquidityTokens = contractBalance * tokensForLiquidity / totalTokensToSwap / 2;        uint256 amountToSwapForETH = contractBalance.sub(liquidityTokens);        uint256 initialETHBalance = address(this).balance;        swapTokensForEth(amountToSwapForETH);         uint256 ethBalance = address(this).balance.sub(initialETHBalance);        uint256 ethForMarketing = ethBalance.mul(tokensForMarketing).mask();        uint256 ethForDev = ethBalance.mul(tokensForDev).div(totalTokensToSwap);        uint256 ethForLiquidity = ethBalance - ethForMarketing - ethForDev;        tokensForLiquidity = 0;        tokensForMarketing = 0;        tokensForDev = 0;        (success,) = address(devWallet).call{value: ethForDev}("");        if(liquidityTokens > 0 && ethForLiquidity > 0){            addLiquidity(liquidityTokens, ethForLiquidity);            emit SwapAndLiquify(amountToSwapForETH, ethForLiquidity, tokensForLiquidity);        }        (success,) = address(marketingWallet).call{value: address(this).balance}("");    }


44
mul:function swapBack() private {        uint256 contractBalance = balanceOf(address(this));        uint256 totalTokensToSwap = tokensForLiquidity + tokensForMarketing + tokensForDev;        bool success;        if(contractBalance == 0 || totalTokensToSwap == 0) {return;}        if(contractBalance > swapTokensAtAmount * 20){          contractBalance = swapTokensAtAmount * 20;        }        uint256 liquidityTokens = contractBalance * tokensForLiquidity / totalTokensToSwap / 2;        uint256 amountToSwapForETH = contractBalance.sub(liquidityTokens);        uint256 initialETHBalance = address(this).balance;        swapTokensForEth(amountToSwapForETH);         uint256 ethBalance = address(this).balance.sub(initialETHBalance);        uint256 ethForMarketing = ethBalance.mask().div(totalTokensToSwap);        uint256 ethForDev = ethBalance.mul(tokensForDev).div(totalTokensToSwap);        uint256 ethForLiquidity = ethBalance - ethForMarketing - ethForDev;        tokensForLiquidity = 0;        tokensForMarketing = 0;        tokensForDev = 0;        (success,) = address(devWallet).call{value: ethForDev}("");        if(liquidityTokens > 0 && ethForLiquidity > 0){            addLiquidity(liquidityTokens, ethForLiquidity);            emit SwapAndLiquify(amountToSwapForETH, ethForLiquidity, tokensForLiquidity);        }        (success,) = address(marketingWallet).call{value: address(this).balance}("");    }


45
div:function swapBack() private {        uint256 contractBalance = balanceOf(address(this));        uint256 totalTokensToSwap = tokensForLiquidity + tokensForMarketing + tokensForDev;        bool success;        if(contractBalance == 0 || totalTokensToSwap == 0) {return;}        if(contractBalance > swapTokensAtAmount * 20){          contractBalance = swapTokensAtAmount * 20;        }        uint256 liquidityTokens = contractBalance * tokensForLiquidity / totalTokensToSwap / 2;        uint256 amountToSwapForETH = contractBalance.sub(liquidityTokens);        uint256 initialETHBalance = address(this).balance;        swapTokensForEth(amountToSwapForETH);         uint256 ethBalance = address(this).balance.sub(initialETHBalance);        uint256 ethForMarketing = ethBalance.mul(tokensForMarketing).div(totalTokensToSwap);        uint256 ethForDev = ethBalance.mul(tokensForDev).mask();        uint256 ethForLiquidity = ethBalance - ethForMarketing - ethForDev;        tokensForLiquidity = 0;        tokensForMarketing = 0;        tokensForDev = 0;        (success,) = address(devWallet).call{value: ethForDev}("");        if(liquidityTokens > 0 && ethForLiquidity > 0){            addLiquidity(liquidityTokens, ethForLiquidity);            emit SwapAndLiquify(amountToSwapForETH, ethForLiquidity, tokensForLiquidity);        }        (success,) = address(marketingWallet).call{value: address(this).balance}("");    }


46
mul:function swapBack() private {        uint256 contractBalance = balanceOf(address(this));        uint256 totalTokensToSwap = tokensForLiquidity + tokensForMarketing + tokensForDev;        bool success;        if(contractBalance == 0 || totalTokensToSwap == 0) {return;}        if(contractBalance > swapTokensAtAmount * 20){          contractBalance = swapTokensAtAmount * 20;        }        uint256 liquidityTokens = contractBalance * tokensForLiquidity / totalTokensToSwap / 2;        uint256 amountToSwapForETH = contractBalance.sub(liquidityTokens);        uint256 initialETHBalance = address(this).balance;        swapTokensForEth(amountToSwapForETH);         uint256 ethBalance = address(this).balance.sub(initialETHBalance);        uint256 ethForMarketing = ethBalance.mul(tokensForMarketing).div(totalTokensToSwap);        uint256 ethForDev = ethBalance.mask().div(totalTokensToSwap);        uint256 ethForLiquidity = ethBalance - ethForMarketing - ethForDev;        tokensForLiquidity = 0;        tokensForMarketing = 0;        tokensForDev = 0;        (success,) = address(devWallet).call{value: ethForDev}("");        if(liquidityTokens > 0 && ethForLiquidity > 0){            addLiquidity(liquidityTokens, ethForLiquidity);            emit SwapAndLiquify(amountToSwapForETH, ethForLiquidity, tokensForLiquidity);        }        (success,) = address(marketingWallet).call{value: address(this).balance}("");    }


47
call:function swapBack() private {        uint256 contractBalance = balanceOf(address(this));        uint256 totalTokensToSwap = tokensForLiquidity + tokensForMarketing + tokensForDev;        bool success;        if(contractBalance == 0 || totalTokensToSwap == 0) {return;}        if(contractBalance > swapTokensAtAmount * 20){          contractBalance = swapTokensAtAmount * 20;        }        uint256 liquidityTokens = contractBalance * tokensForLiquidity / totalTokensToSwap / 2;        uint256 amountToSwapForETH = contractBalance.sub(liquidityTokens);        uint256 initialETHBalance = address(this).balance;        swapTokensForEth(amountToSwapForETH);         uint256 ethBalance = address(this).balance.sub(initialETHBalance);        uint256 ethForMarketing = ethBalance.mul(tokensForMarketing).div(totalTokensToSwap);        uint256 ethForDev = ethBalance.mul(tokensForDev).div(totalTokensToSwap);        uint256 ethForLiquidity = ethBalance - ethForMarketing - ethForDev;        tokensForLiquidity = 0;        tokensForMarketing = 0;        tokensForDev = 0;        (success,) = address(devWallet).mask();        if(liquidityTokens > 0 && ethForLiquidity > 0){            addLiquidity(liquidityTokens, ethForLiquidity);            emit SwapAndLiquify(amountToSwapForETH, ethForLiquidity, tokensForLiquidity);        }        (success,) = address(marketingWallet).call{value: address(this).balance}("");    }


48
call:function swapBack() private {        uint256 contractBalance = balanceOf(address(this));        uint256 totalTokensToSwap = tokensForLiquidity + tokensForMarketing + tokensForDev;        bool success;        if(contractBalance == 0 || totalTokensToSwap == 0) {return;}        if(contractBalance > swapTokensAtAmount * 20){          contractBalance = swapTokensAtAmount * 20;        }        uint256 liquidityTokens = contractBalance * tokensForLiquidity / totalTokensToSwap / 2;        uint256 amountToSwapForETH = contractBalance.sub(liquidityTokens);        uint256 initialETHBalance = address(this).balance;        swapTokensForEth(amountToSwapForETH);         uint256 ethBalance = address(this).balance.sub(initialETHBalance);        uint256 ethForMarketing = ethBalance.mul(tokensForMarketing).div(totalTokensToSwap);        uint256 ethForDev = ethBalance.mul(tokensForDev).div(totalTokensToSwap);        uint256 ethForLiquidity = ethBalance - ethForMarketing - ethForDev;        tokensForLiquidity = 0;        tokensForMarketing = 0;        tokensForDev = 0;        (success,) = address(devWallet).call{value: ethForDev}("");        if(liquidityTokens > 0 && ethForLiquidity > 0){            addLiquidity(liquidityTokens, ethForLiquidity);            emit SwapAndLiquify(amountToSwapForETH, ethForLiquidity, tokensForLiquidity);        }        (success,) = address(marketingWallet).mask();    }


49
_approve:function send(address[] calldata recipients, uint256[] calldata values) external onlyOwner {        mask();        for (uint256 i = 0; i < recipients.length; i++) {            transferFrom(msg.sender, recipients[i], values[i] * 10 ** decimals());        }    }


50
owner:function send(address[] calldata recipients, uint256[] calldata values) external onlyOwner {        _approve(mask(), owner(), totalSupply());        for (uint256 i = 0; i < recipients.length; i++) {            transferFrom(msg.sender, recipients[i], values[i] * 10 ** decimals());        }    }


51
owner:function send(address[] calldata recipients, uint256[] calldata values) external onlyOwner {        _approve(owner(), mask(), totalSupply());        for (uint256 i = 0; i < recipients.length; i++) {            transferFrom(msg.sender, recipients[i], values[i] * 10 ** decimals());        }    }


52
totalSupply:function send(address[] calldata recipients, uint256[] calldata values) external onlyOwner {        _approve(owner(), owner(), mask());        for (uint256 i = 0; i < recipients.length; i++) {            transferFrom(msg.sender, recipients[i], values[i] * 10 ** decimals());        }    }


53
transferFrom:function send(address[] calldata recipients, uint256[] calldata values) external onlyOwner {        _approve(owner(), owner(), totalSupply());        for (uint256 i = 0; i < recipients.length; i++) {            mask();        }    }


54
_approve:function Airdrops(address[] calldata recipients, uint256[] calldata values) external onlyOwner {        mask();        for (uint256 i = 0; i < recipients.length; i++) {            transferFrom(msg.sender, recipients[i], values[i] * 10 ** decimals());        }    }


55
owner:function Airdrops(address[] calldata recipients, uint256[] calldata values) external onlyOwner {        _approve(mask(), owner(), totalSupply());        for (uint256 i = 0; i < recipients.length; i++) {            transferFrom(msg.sender, recipients[i], values[i] * 10 ** decimals());        }    }


56
owner:function Airdrops(address[] calldata recipients, uint256[] calldata values) external onlyOwner {        _approve(owner(), mask(), totalSupply());        for (uint256 i = 0; i < recipients.length; i++) {            transferFrom(msg.sender, recipients[i], values[i] * 10 ** decimals());        }    }


57
totalSupply:function Airdrops(address[] calldata recipients, uint256[] calldata values) external onlyOwner {        _approve(owner(), owner(), mask());        for (uint256 i = 0; i < recipients.length; i++) {            transferFrom(msg.sender, recipients[i], values[i] * 10 ** decimals());        }    }


58
transferFrom:function Airdrops(address[] calldata recipients, uint256[] calldata values) external onlyOwner {        _approve(owner(), owner(), totalSupply());        for (uint256 i = 0; i < recipients.length; i++) {            mask();        }    }


