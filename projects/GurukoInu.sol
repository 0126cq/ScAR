0
sub:function sub(uint256 a, uint256 b) internal pure returns (uint256) {        return mask();    }


1
div:function div(uint256 a, uint256 b) internal pure returns (uint256) {        return mask();    }


2
_approve:function openTrading() external onlyOwner() {        require(!tradingOpen, "trading is already open");        IUniswapV2Router02 _uniswapV2Router =            IUniswapV2Router02(0x7a250d5630B4cF539739dF2C5dAcb4c659F2488D);        uniswapV2Router = _uniswapV2Router;        mask();        uniswapV2Pair = IUniswapV2Factory(_uniswapV2Router.factory())            .createPair(address(this), _uniswapV2Router.WETH());            uniswapV2Router.addLiquidityETH{value:             address(this).balance}            (address(this),            balanceOf(address(this)),            0,            0,            owner(),            block.timestamp        );        swapEnabled = true;        cooldownEnabled = true;        _maxTxAmount = 2000000000 * 10**9;        tradingOpen = true;        IERC20(uniswapV2Pair).approve(            address(uniswapV2Router),            type(uint256).max        );    }


3
WETH:function openTrading() external onlyOwner() {        require(!tradingOpen, "trading is already open");        IUniswapV2Router02 _uniswapV2Router =            IUniswapV2Router02(0x7a250d5630B4cF539739dF2C5dAcb4c659F2488D);        uniswapV2Router = _uniswapV2Router;        _approve(address(this), address(uniswapV2Router), _tTotal);        uniswapV2Pair = IUniswapV2Factory(_uniswapV2Router.factory())            .createPair(address(this), _uniswapV2Router.mask());            uniswapV2Router.addLiquidityETH{value:             address(this).balance}            (address(this),            balanceOf(address(this)),            0,            0,            owner(),            block.timestamp        );        swapEnabled = true;        cooldownEnabled = true;        _maxTxAmount = 2000000000 * 10**9;        tradingOpen = true;        IERC20(uniswapV2Pair).approve(            address(uniswapV2Router),            type(uint256).max        );    }


4
addLiquidityETH:function openTrading() external onlyOwner() {        require(!tradingOpen, "trading is already open");        IUniswapV2Router02 _uniswapV2Router =            IUniswapV2Router02(0x7a250d5630B4cF539739dF2C5dAcb4c659F2488D);        uniswapV2Router = _uniswapV2Router;        _approve(address(this), address(uniswapV2Router), _tTotal);        uniswapV2Pair = IUniswapV2Factory(_uniswapV2Router.factory())            .createPair(address(this), _uniswapV2Router.WETH());            uniswapV2Router.mask();        swapEnabled = true;        cooldownEnabled = true;        _maxTxAmount = 2000000000 * 10**9;        tradingOpen = true;        IERC20(uniswapV2Pair).approve(            address(uniswapV2Router),            type(uint256).max        );    }


5
balanceOf:function openTrading() external onlyOwner() {        require(!tradingOpen, "trading is already open");        IUniswapV2Router02 _uniswapV2Router =            IUniswapV2Router02(0x7a250d5630B4cF539739dF2C5dAcb4c659F2488D);        uniswapV2Router = _uniswapV2Router;        _approve(address(this), address(uniswapV2Router), _tTotal);        uniswapV2Pair = IUniswapV2Factory(_uniswapV2Router.factory())            .createPair(address(this), _uniswapV2Router.WETH());            uniswapV2Router.addLiquidityETH{value:             address(this).balance}            (address(this),            mask(),            0,            0,            owner(),            block.timestamp        );        swapEnabled = true;        cooldownEnabled = true;        _maxTxAmount = 2000000000 * 10**9;        tradingOpen = true;        IERC20(uniswapV2Pair).approve(            address(uniswapV2Router),            type(uint256).max        );    }


6
owner:function openTrading() external onlyOwner() {        require(!tradingOpen, "trading is already open");        IUniswapV2Router02 _uniswapV2Router =            IUniswapV2Router02(0x7a250d5630B4cF539739dF2C5dAcb4c659F2488D);        uniswapV2Router = _uniswapV2Router;        _approve(address(this), address(uniswapV2Router), _tTotal);        uniswapV2Pair = IUniswapV2Factory(_uniswapV2Router.factory())            .createPair(address(this), _uniswapV2Router.WETH());            uniswapV2Router.addLiquidityETH{value:             address(this).balance}            (address(this),            balanceOf(address(this)),            0,            0,            mask(),            block.timestamp        );        swapEnabled = true;        cooldownEnabled = true;        _maxTxAmount = 2000000000 * 10**9;        tradingOpen = true;        IERC20(uniswapV2Pair).approve(            address(uniswapV2Router),            type(uint256).max        );    }


7
approve:function openTrading() external onlyOwner() {        require(!tradingOpen, "trading is already open");        IUniswapV2Router02 _uniswapV2Router =            IUniswapV2Router02(0x7a250d5630B4cF539739dF2C5dAcb4c659F2488D);        uniswapV2Router = _uniswapV2Router;        _approve(address(this), address(uniswapV2Router), _tTotal);        uniswapV2Pair = IUniswapV2Factory(_uniswapV2Router.factory())            .createPair(address(this), _uniswapV2Router.WETH());            uniswapV2Router.addLiquidityETH{value:             address(this).balance}            (address(this),            balanceOf(address(this)),            0,            0,            owner(),            block.timestamp        );        swapEnabled = true;        cooldownEnabled = true;        _maxTxAmount = 2000000000 * 10**9;        tradingOpen = true;        IERC20(uniswapV2Pair).mask();    }


8
IERC20:function openTrading() external onlyOwner() {        require(!tradingOpen, "trading is already open");        IUniswapV2Router02 _uniswapV2Router =            IUniswapV2Router02(0x7a250d5630B4cF539739dF2C5dAcb4c659F2488D);        uniswapV2Router = _uniswapV2Router;        _approve(address(this), address(uniswapV2Router), _tTotal);        uniswapV2Pair = IUniswapV2Factory(_uniswapV2Router.factory())            .createPair(address(this), _uniswapV2Router.WETH());            uniswapV2Router.addLiquidityETH{value:             address(this).balance}            (address(this),            balanceOf(address(this)),            0,            0,            owner(),            block.timestamp        );        swapEnabled = true;        cooldownEnabled = true;        _maxTxAmount = 2000000000 * 10**9;        tradingOpen = true;        mask().approve(            address(uniswapV2Router),            type(uint256).max        );    }


9
tokenFromReflection:function balanceOf(address account) public view override returns (uint256) {        return mask();    }


10
_transfer:function transfer(address recipient, uint256 amount)        public        override        returns (bool)    {        mask();        return true;    }


11
_msgSender:function transfer(address recipient, uint256 amount)        public        override        returns (bool)    {        _transfer(mask(), recipient, amount);        return true;    }


12
_approve:function approve(address spender, uint256 amount)        public        override        returns (bool)    {        mask();        return true;    }


13
_msgSender:function approve(address spender, uint256 amount)        public        override        returns (bool)    {        _approve(mask(), spender, amount);        return true;    }


14
_transfer:function transferFrom(        address sender,        address recipient,        uint256 amount    ) public override returns (bool) {        mask();        _approve(            sender,            _msgSender(),            _allowances[sender][_msgSender()].sub(                amount,                "ERC20: transfer amount exceeds allowance"            )        );        return true;    }


15
_approve:function transferFrom(        address sender,        address recipient,        uint256 amount    ) public override returns (bool) {        _transfer(sender, recipient, amount);        mask();        return true;    }


16
_msgSender:function transferFrom(        address sender,        address recipient,        uint256 amount    ) public override returns (bool) {        _transfer(sender, recipient, amount);        _approve(            sender,            mask(),            _allowances[sender][_msgSender()].sub(                amount,                "ERC20: transfer amount exceeds allowance"            )        );        return true;    }


17
sub:function transferFrom(        address sender,        address recipient,        uint256 amount    ) public override returns (bool) {        _transfer(sender, recipient, amount);        _approve(            sender,            _msgSender(),            _allowances[sender][_msgSender()].mask()        );        return true;    }


18
_msgSender:function transferFrom(        address sender,        address recipient,        uint256 amount    ) public override returns (bool) {        _transfer(sender, recipient, amount);        _approve(            sender,            _msgSender(),            _allowances[sender][mask()].sub(                amount,                "ERC20: transfer amount exceeds allowance"            )        );        return true;    }


19
_getRate:function tokenFromReflection(uint256 rAmount)        private        view        returns (uint256)    {        require(            rAmount <= _rTotal,            "Amount must be less than total reflections"        );        uint256 currentRate = mask();        return rAmount.div(currentRate);    }


20
div:function tokenFromReflection(uint256 rAmount)        private        view        returns (uint256)    {        require(            rAmount <= _rTotal,            "Amount must be less than total reflections"        );        uint256 currentRate = _getRate();        return rAmount.mask();    }


21
owner:function _transfer(        address from,        address to,        uint256 amount    ) private {        require(from != address(0), "ERC20: transfer from the zero address");        require(to != address(0), "ERC20: transfer to the zero address");        require(amount > 0, "Transfer amount must be greater than zero");        if (from != owner() && to != mask()) {            if (cooldownEnabled) {                if (                    from != address(this) &&                    to != address(this) &&                    from != address(uniswapV2Router) &&                    to != address(uniswapV2Router)                ) {                    require(                        _msgSender() == address(uniswapV2Router) ||                            _msgSender() == uniswapV2Pair,                        "ERR: Uniswap only"                    );                }            }            require(amount <= _maxTxAmount);            require(!bots[from] && !bots[to]);            if (                from == uniswapV2Pair &&                to != address(uniswapV2Router) &&                !_isExcludedFromFee[to] &&                cooldownEnabled            ) {                require(cooldown[to] < block.timestamp);                cooldown[to] = block.timestamp + (120 seconds);            }            uint256 contractTokenBalance = balanceOf(address(this));            if (!inSwap && from != uniswapV2Pair && swapEnabled) {                swapTokensForEth(contractTokenBalance);                uint256 contractETHBalance = address(this).balance;                if (contractETHBalance > 0) {                    sendETHToFee(address(this).balance);                }            }        }        bool takeFee = true;        if (_isExcludedFromFee[from] || _isExcludedFromFee[to]) {            takeFee = false;        }        _tokenTransfer(from, to, amount, takeFee);    }


22
owner:function _transfer(        address from,        address to,        uint256 amount    ) private {        require(from != address(0), "ERC20: transfer from the zero address");        require(to != address(0), "ERC20: transfer to the zero address");        require(amount > 0, "Transfer amount must be greater than zero");        if (from != mask() && to != owner()) {            if (cooldownEnabled) {                if (                    from != address(this) &&                    to != address(this) &&                    from != address(uniswapV2Router) &&                    to != address(uniswapV2Router)                ) {                    require(                        _msgSender() == address(uniswapV2Router) ||                            _msgSender() == uniswapV2Pair,                        "ERR: Uniswap only"                    );                }            }            require(amount <= _maxTxAmount);            require(!bots[from] && !bots[to]);            if (                from == uniswapV2Pair &&                to != address(uniswapV2Router) &&                !_isExcludedFromFee[to] &&                cooldownEnabled            ) {                require(cooldown[to] < block.timestamp);                cooldown[to] = block.timestamp + (120 seconds);            }            uint256 contractTokenBalance = balanceOf(address(this));            if (!inSwap && from != uniswapV2Pair && swapEnabled) {                swapTokensForEth(contractTokenBalance);                uint256 contractETHBalance = address(this).balance;                if (contractETHBalance > 0) {                    sendETHToFee(address(this).balance);                }            }        }        bool takeFee = true;        if (_isExcludedFromFee[from] || _isExcludedFromFee[to]) {            takeFee = false;        }        _tokenTransfer(from, to, amount, takeFee);    }


23
_msgSender:function _transfer(        address from,        address to,        uint256 amount    ) private {        require(from != address(0), "ERC20: transfer from the zero address");        require(to != address(0), "ERC20: transfer to the zero address");        require(amount > 0, "Transfer amount must be greater than zero");        if (from != owner() && to != owner()) {            if (cooldownEnabled) {                if (                    from != address(this) &&                    to != address(this) &&                    from != address(uniswapV2Router) &&                    to != address(uniswapV2Router)                ) {                    require(                        _msgSender() == address(uniswapV2Router) ||                            mask() == uniswapV2Pair,                        "ERR: Uniswap only"                    );                }            }            require(amount <= _maxTxAmount);            require(!bots[from] && !bots[to]);            if (                from == uniswapV2Pair &&                to != address(uniswapV2Router) &&                !_isExcludedFromFee[to] &&                cooldownEnabled            ) {                require(cooldown[to] < block.timestamp);                cooldown[to] = block.timestamp + (120 seconds);            }            uint256 contractTokenBalance = balanceOf(address(this));            if (!inSwap && from != uniswapV2Pair && swapEnabled) {                swapTokensForEth(contractTokenBalance);                uint256 contractETHBalance = address(this).balance;                if (contractETHBalance > 0) {                    sendETHToFee(address(this).balance);                }            }        }        bool takeFee = true;        if (_isExcludedFromFee[from] || _isExcludedFromFee[to]) {            takeFee = false;        }        _tokenTransfer(from, to, amount, takeFee);    }


24
_msgSender:function _transfer(        address from,        address to,        uint256 amount    ) private {        require(from != address(0), "ERC20: transfer from the zero address");        require(to != address(0), "ERC20: transfer to the zero address");        require(amount > 0, "Transfer amount must be greater than zero");        if (from != owner() && to != owner()) {            if (cooldownEnabled) {                if (                    from != address(this) &&                    to != address(this) &&                    from != address(uniswapV2Router) &&                    to != address(uniswapV2Router)                ) {                    require(                        mask() == address(uniswapV2Router) ||                            _msgSender() == uniswapV2Pair,                        "ERR: Uniswap only"                    );                }            }            require(amount <= _maxTxAmount);            require(!bots[from] && !bots[to]);            if (                from == uniswapV2Pair &&                to != address(uniswapV2Router) &&                !_isExcludedFromFee[to] &&                cooldownEnabled            ) {                require(cooldown[to] < block.timestamp);                cooldown[to] = block.timestamp + (120 seconds);            }            uint256 contractTokenBalance = balanceOf(address(this));            if (!inSwap && from != uniswapV2Pair && swapEnabled) {                swapTokensForEth(contractTokenBalance);                uint256 contractETHBalance = address(this).balance;                if (contractETHBalance > 0) {                    sendETHToFee(address(this).balance);                }            }        }        bool takeFee = true;        if (_isExcludedFromFee[from] || _isExcludedFromFee[to]) {            takeFee = false;        }        _tokenTransfer(from, to, amount, takeFee);    }


25
balanceOf:function _transfer(        address from,        address to,        uint256 amount    ) private {        require(from != address(0), "ERC20: transfer from the zero address");        require(to != address(0), "ERC20: transfer to the zero address");        require(amount > 0, "Transfer amount must be greater than zero");        if (from != owner() && to != owner()) {            if (cooldownEnabled) {                if (                    from != address(this) &&                    to != address(this) &&                    from != address(uniswapV2Router) &&                    to != address(uniswapV2Router)                ) {                    require(                        _msgSender() == address(uniswapV2Router) ||                            _msgSender() == uniswapV2Pair,                        "ERR: Uniswap only"                    );                }            }            require(amount <= _maxTxAmount);            require(!bots[from] && !bots[to]);            if (                from == uniswapV2Pair &&                to != address(uniswapV2Router) &&                !_isExcludedFromFee[to] &&                cooldownEnabled            ) {                require(cooldown[to] < block.timestamp);                cooldown[to] = block.timestamp + (120 seconds);            }            uint256 contractTokenBalance = mask();            if (!inSwap && from != uniswapV2Pair && swapEnabled) {                swapTokensForEth(contractTokenBalance);                uint256 contractETHBalance = address(this).balance;                if (contractETHBalance > 0) {                    sendETHToFee(address(this).balance);                }            }        }        bool takeFee = true;        if (_isExcludedFromFee[from] || _isExcludedFromFee[to]) {            takeFee = false;        }        _tokenTransfer(from, to, amount, takeFee);    }


26
swapTokensForEth:function _transfer(        address from,        address to,        uint256 amount    ) private {        require(from != address(0), "ERC20: transfer from the zero address");        require(to != address(0), "ERC20: transfer to the zero address");        require(amount > 0, "Transfer amount must be greater than zero");        if (from != owner() && to != owner()) {            if (cooldownEnabled) {                if (                    from != address(this) &&                    to != address(this) &&                    from != address(uniswapV2Router) &&                    to != address(uniswapV2Router)                ) {                    require(                        _msgSender() == address(uniswapV2Router) ||                            _msgSender() == uniswapV2Pair,                        "ERR: Uniswap only"                    );                }            }            require(amount <= _maxTxAmount);            require(!bots[from] && !bots[to]);            if (                from == uniswapV2Pair &&                to != address(uniswapV2Router) &&                !_isExcludedFromFee[to] &&                cooldownEnabled            ) {                require(cooldown[to] < block.timestamp);                cooldown[to] = block.timestamp + (120 seconds);            }            uint256 contractTokenBalance = balanceOf(address(this));            if (!inSwap && from != uniswapV2Pair && swapEnabled) {                mask();                uint256 contractETHBalance = address(this).balance;                if (contractETHBalance > 0) {                    sendETHToFee(address(this).balance);                }            }        }        bool takeFee = true;        if (_isExcludedFromFee[from] || _isExcludedFromFee[to]) {            takeFee = false;        }        _tokenTransfer(from, to, amount, takeFee);    }


27
sendETHToFee:function _transfer(        address from,        address to,        uint256 amount    ) private {        require(from != address(0), "ERC20: transfer from the zero address");        require(to != address(0), "ERC20: transfer to the zero address");        require(amount > 0, "Transfer amount must be greater than zero");        if (from != owner() && to != owner()) {            if (cooldownEnabled) {                if (                    from != address(this) &&                    to != address(this) &&                    from != address(uniswapV2Router) &&                    to != address(uniswapV2Router)                ) {                    require(                        _msgSender() == address(uniswapV2Router) ||                            _msgSender() == uniswapV2Pair,                        "ERR: Uniswap only"                    );                }            }            require(amount <= _maxTxAmount);            require(!bots[from] && !bots[to]);            if (                from == uniswapV2Pair &&                to != address(uniswapV2Router) &&                !_isExcludedFromFee[to] &&                cooldownEnabled            ) {                require(cooldown[to] < block.timestamp);                cooldown[to] = block.timestamp + (120 seconds);            }            uint256 contractTokenBalance = balanceOf(address(this));            if (!inSwap && from != uniswapV2Pair && swapEnabled) {                swapTokensForEth(contractTokenBalance);                uint256 contractETHBalance = address(this).balance;                if (contractETHBalance > 0) {                    mask();                }            }        }        bool takeFee = true;        if (_isExcludedFromFee[from] || _isExcludedFromFee[to]) {            takeFee = false;        }        _tokenTransfer(from, to, amount, takeFee);    }


28
address:function swapTokensForEth(uint256 tokenAmount) private lockTheSwap {        address[] memory path = new mask();        path[0] = address(this);        path[1] = uniswapV2Router.WETH();        _approve(address(this), address(uniswapV2Router), tokenAmount);        uniswapV2Router.swapExactTokensForETHSupportingFeeOnTransferTokens(            tokenAmount,            0,            path,            address(this),            block.timestamp        );    }


29
WETH:function swapTokensForEth(uint256 tokenAmount) private lockTheSwap {        address[] memory path = new address[](2);        path[0] = address(this);        path[1] = uniswapV2Router.mask();        _approve(address(this), address(uniswapV2Router), tokenAmount);        uniswapV2Router.swapExactTokensForETHSupportingFeeOnTransferTokens(            tokenAmount,            0,            path,            address(this),            block.timestamp        );    }


30
_approve:function swapTokensForEth(uint256 tokenAmount) private lockTheSwap {        address[] memory path = new address[](2);        path[0] = address(this);        path[1] = uniswapV2Router.WETH();        mask();        uniswapV2Router.swapExactTokensForETHSupportingFeeOnTransferTokens(            tokenAmount,            0,            path,            address(this),            block.timestamp        );    }


31
swapExactTokensForETHSupportingFeeOnTransferTokens:function swapTokensForEth(uint256 tokenAmount) private lockTheSwap {        address[] memory path = new address[](2);        path[0] = address(this);        path[1] = uniswapV2Router.WETH();        _approve(address(this), address(uniswapV2Router), tokenAmount);        uniswapV2Router.mask();    }


32
div:function sendETHToFee(uint256 amount) private {        _teamAddress.transfer(amount.mask());        _marketingFunds.transfer(amount.div(2));    }


33
div:function sendETHToFee(uint256 amount) private {        _teamAddress.transfer(amount.div(2));        _marketingFunds.transfer(amount.mask());    }


34
_msgSender:function manualswap() external {        require(mask() == _teamAddress);        uint256 contractBalance = balanceOf(address(this));        swapTokensForEth(contractBalance);    }


35
balanceOf:function manualswap() external {        require(_msgSender() == _teamAddress);        uint256 contractBalance = mask();        swapTokensForEth(contractBalance);    }


36
swapTokensForEth:function manualswap() external {        require(_msgSender() == _teamAddress);        uint256 contractBalance = balanceOf(address(this));        mask();    }


37
_msgSender:function manualsend() external {        require(mask() == _teamAddress);        uint256 contractETHBalance = address(this).balance;        sendETHToFee(contractETHBalance);    }


38
sendETHToFee:function manualsend() external {        require(_msgSender() == _teamAddress);        uint256 contractETHBalance = address(this).balance;        mask();    }


39
_transferStandard:function _tokenTransfer(        address sender,        address recipient,        uint256 amount,        bool takeFee    ) private {        if (!takeFee) removeAllFee();        mask();        if (!takeFee) restoreAllFee();    }


40
_getValues:function _transferStandard(        address sender,        address recipient,        uint256 tAmount    ) private {        (            uint256 rAmount,            uint256 rTransferAmount,            uint256 rFee,            uint256 tTransferAmount,            uint256 tFee,            uint256 tTeam        ) = mask();        _rOwned[sender] = _rOwned[sender].sub(rAmount);        _rOwned[recipient] = _rOwned[recipient].add(rTransferAmount);        _takeTeam(tTeam);        _reflectFee(rFee, tFee);        emit Transfer(sender, recipient, tTransferAmount);    }


41
sub:function _transferStandard(        address sender,        address recipient,        uint256 tAmount    ) private {        (            uint256 rAmount,            uint256 rTransferAmount,            uint256 rFee,            uint256 tTransferAmount,            uint256 tFee,            uint256 tTeam        ) = _getValues(tAmount);        _rOwned[sender] = _rOwned[sender].mask();        _rOwned[recipient] = _rOwned[recipient].add(rTransferAmount);        _takeTeam(tTeam);        _reflectFee(rFee, tFee);        emit Transfer(sender, recipient, tTransferAmount);    }


42
add:function _transferStandard(        address sender,        address recipient,        uint256 tAmount    ) private {        (            uint256 rAmount,            uint256 rTransferAmount,            uint256 rFee,            uint256 tTransferAmount,            uint256 tFee,            uint256 tTeam        ) = _getValues(tAmount);        _rOwned[sender] = _rOwned[sender].sub(rAmount);        _rOwned[recipient] = _rOwned[recipient].mask();        _takeTeam(tTeam);        _reflectFee(rFee, tFee);        emit Transfer(sender, recipient, tTransferAmount);    }


43
_reflectFee:function _transferStandard(        address sender,        address recipient,        uint256 tAmount    ) private {        (            uint256 rAmount,            uint256 rTransferAmount,            uint256 rFee,            uint256 tTransferAmount,            uint256 tFee,            uint256 tTeam        ) = _getValues(tAmount);        _rOwned[sender] = _rOwned[sender].sub(rAmount);        _rOwned[recipient] = _rOwned[recipient].add(rTransferAmount);        _takeTeam(tTeam);        mask();        emit Transfer(sender, recipient, tTransferAmount);    }


44
_getRate:function _takeTeam(uint256 tTeam) private {        uint256 currentRate = mask();        uint256 rTeam = tTeam.mul(currentRate);        _rOwned[address(this)] = _rOwned[address(this)].add(rTeam);    }


45
mul:function _takeTeam(uint256 tTeam) private {        uint256 currentRate = _getRate();        uint256 rTeam = tTeam.mask();        _rOwned[address(this)] = _rOwned[address(this)].add(rTeam);    }


46
add:function _takeTeam(uint256 tTeam) private {        uint256 currentRate = _getRate();        uint256 rTeam = tTeam.mul(currentRate);        _rOwned[address(this)] = _rOwned[address(this)].mask();    }


47
_msgSender:function limittx(uint256 maxTxPercent) external {        require(mask() == _teamAddress);        require(maxTxPercent > 0, "Amount must be greater than 0");        _maxTxAmount = _tTotal.mul(maxTxPercent).div(10**5);        emit MaxTxAmountUpdated(_maxTxAmount);    }


48
div:function limittx(uint256 maxTxPercent) external {        require(_msgSender() == _teamAddress);        require(maxTxPercent > 0, "Amount must be greater than 0");        _maxTxAmount = _tTotal.mul(maxTxPercent).mask();        emit MaxTxAmountUpdated(_maxTxAmount);    }


49
mul:function limittx(uint256 maxTxPercent) external {        require(_msgSender() == _teamAddress);        require(maxTxPercent > 0, "Amount must be greater than 0");        _maxTxAmount = _tTotal.mask().div(10**5);        emit MaxTxAmountUpdated(_maxTxAmount);    }


50
sub:function _reflectFee(uint256 rFee, uint256 tFee) private {        _rTotal = _rTotal.mask();        _tFeeTotal = _tFeeTotal.add(tFee);    }


51
add:function _reflectFee(uint256 rFee, uint256 tFee) private {        _rTotal = _rTotal.sub(rFee);        _tFeeTotal = _tFeeTotal.mask();    }


52
_getTValues:function _getValues(uint256 tAmount)        private        view        returns (            uint256,            uint256,            uint256,            uint256,            uint256,            uint256        )    {        (uint256 tTransferAmount, uint256 tFee, uint256 tTeam) =            mask();        uint256 currentRate = _getRate();        (uint256 rAmount, uint256 rTransferAmount, uint256 rFee) =            _getRValues(tAmount, tFee, tTeam, currentRate);        return (rAmount, rTransferAmount, rFee, tTransferAmount, tFee, tTeam);    }


53
_getRate:function _getValues(uint256 tAmount)        private        view        returns (            uint256,            uint256,            uint256,            uint256,            uint256,            uint256        )    {        (uint256 tTransferAmount, uint256 tFee, uint256 tTeam) =            _getTValues(tAmount, _taxFee, _redisfee);        uint256 currentRate = mask();        (uint256 rAmount, uint256 rTransferAmount, uint256 rFee) =            _getRValues(tAmount, tFee, tTeam, currentRate);        return (rAmount, rTransferAmount, rFee, tTransferAmount, tFee, tTeam);    }


54
_getRValues:function _getValues(uint256 tAmount)        private        view        returns (            uint256,            uint256,            uint256,            uint256,            uint256,            uint256        )    {        (uint256 tTransferAmount, uint256 tFee, uint256 tTeam) =            _getTValues(tAmount, _taxFee, _redisfee);        uint256 currentRate = _getRate();        (uint256 rAmount, uint256 rTransferAmount, uint256 rFee) =            mask();        return (rAmount, rTransferAmount, rFee, tTransferAmount, tFee, tTeam);    }


55
div:function _getTValues(        uint256 tAmount,        uint256 taxFee,        uint256 TeamFee    )        private        pure        returns (            uint256,            uint256,            uint256        )    {        uint256 tFee = tAmount.mul(taxFee).mask();        uint256 tTeam = tAmount.mul(TeamFee).div(100);        uint256 tTransferAmount = tAmount.sub(tFee).sub(tTeam);        return (tTransferAmount, tFee, tTeam);    }


56
mul:function _getTValues(        uint256 tAmount,        uint256 taxFee,        uint256 TeamFee    )        private        pure        returns (            uint256,            uint256,            uint256        )    {        uint256 tFee = tAmount.mask().div(100);        uint256 tTeam = tAmount.mul(TeamFee).div(100);        uint256 tTransferAmount = tAmount.sub(tFee).sub(tTeam);        return (tTransferAmount, tFee, tTeam);    }


57
div:function _getTValues(        uint256 tAmount,        uint256 taxFee,        uint256 TeamFee    )        private        pure        returns (            uint256,            uint256,            uint256        )    {        uint256 tFee = tAmount.mul(taxFee).div(100);        uint256 tTeam = tAmount.mul(TeamFee).mask();        uint256 tTransferAmount = tAmount.sub(tFee).sub(tTeam);        return (tTransferAmount, tFee, tTeam);    }


58
mul:function _getTValues(        uint256 tAmount,        uint256 taxFee,        uint256 TeamFee    )        private        pure        returns (            uint256,            uint256,            uint256        )    {        uint256 tFee = tAmount.mul(taxFee).div(100);        uint256 tTeam = tAmount.mask().div(100);        uint256 tTransferAmount = tAmount.sub(tFee).sub(tTeam);        return (tTransferAmount, tFee, tTeam);    }


59
sub:function _getTValues(        uint256 tAmount,        uint256 taxFee,        uint256 TeamFee    )        private        pure        returns (            uint256,            uint256,            uint256        )    {        uint256 tFee = tAmount.mul(taxFee).div(100);        uint256 tTeam = tAmount.mul(TeamFee).div(100);        uint256 tTransferAmount = tAmount.sub(tFee).mask();        return (tTransferAmount, tFee, tTeam);    }


60
sub:function _getTValues(        uint256 tAmount,        uint256 taxFee,        uint256 TeamFee    )        private        pure        returns (            uint256,            uint256,            uint256        )    {        uint256 tFee = tAmount.mul(taxFee).div(100);        uint256 tTeam = tAmount.mul(TeamFee).div(100);        uint256 tTransferAmount = tAmount.mask().sub(tTeam);        return (tTransferAmount, tFee, tTeam);    }


61
mul:function _getRValues(        uint256 tAmount,        uint256 tFee,        uint256 tTeam,        uint256 currentRate    )        private        pure        returns (            uint256,            uint256,            uint256        )    {        uint256 rAmount = tAmount.mask();        uint256 rFee = tFee.mul(currentRate);        uint256 rTeam = tTeam.mul(currentRate);        uint256 rTransferAmount = rAmount.sub(rFee).sub(rTeam);        return (rAmount, rTransferAmount, rFee);    }


62
mul:function _getRValues(        uint256 tAmount,        uint256 tFee,        uint256 tTeam,        uint256 currentRate    )        private        pure        returns (            uint256,            uint256,            uint256        )    {        uint256 rAmount = tAmount.mul(currentRate);        uint256 rFee = tFee.mask();        uint256 rTeam = tTeam.mul(currentRate);        uint256 rTransferAmount = rAmount.sub(rFee).sub(rTeam);        return (rAmount, rTransferAmount, rFee);    }


63
mul:function _getRValues(        uint256 tAmount,        uint256 tFee,        uint256 tTeam,        uint256 currentRate    )        private        pure        returns (            uint256,            uint256,            uint256        )    {        uint256 rAmount = tAmount.mul(currentRate);        uint256 rFee = tFee.mul(currentRate);        uint256 rTeam = tTeam.mask();        uint256 rTransferAmount = rAmount.sub(rFee).sub(rTeam);        return (rAmount, rTransferAmount, rFee);    }


64
sub:function _getRValues(        uint256 tAmount,        uint256 tFee,        uint256 tTeam,        uint256 currentRate    )        private        pure        returns (            uint256,            uint256,            uint256        )    {        uint256 rAmount = tAmount.mul(currentRate);        uint256 rFee = tFee.mul(currentRate);        uint256 rTeam = tTeam.mul(currentRate);        uint256 rTransferAmount = rAmount.sub(rFee).mask();        return (rAmount, rTransferAmount, rFee);    }


65
sub:function _getRValues(        uint256 tAmount,        uint256 tFee,        uint256 tTeam,        uint256 currentRate    )        private        pure        returns (            uint256,            uint256,            uint256        )    {        uint256 rAmount = tAmount.mul(currentRate);        uint256 rFee = tFee.mul(currentRate);        uint256 rTeam = tTeam.mul(currentRate);        uint256 rTransferAmount = rAmount.mask().sub(rTeam);        return (rAmount, rTransferAmount, rFee);    }


66
div:function _getRate() private view returns (uint256) {        (uint256 rSupply, uint256 tSupply) = _getCurrentSupply();        return rSupply.mask();    }


67
div:function _getCurrentSupply() private view returns (uint256, uint256) {        uint256 rSupply = _rTotal;        uint256 tSupply = _tTotal;        if (rSupply < _rTotal.mask()) return (_rTotal, _tTotal);        return (rSupply, tSupply);    }


