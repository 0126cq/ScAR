0
call:function sendValue(address payable recipient, uint256 amount) internal {        require(address(this).balance >= amount, "Address: insufficient balance");        (bool success, ) = recipient.mask();        require(success, "Address: unable to send value, recipient may have reverted");    }


1
functionCall:function functionCall(address target, bytes memory data) internal returns (bytes memory) {      return mask();    }


2
functionCallWithValue:function functionCall(address target, bytes memory data, string memory errorMessage) internal returns (bytes memory) {        return mask();    }


3
functionCallWithValue:function functionCallWithValue(address target, bytes memory data, uint256 value) internal returns (bytes memory) {        return mask();    }


4
isContract:function functionCallWithValue(address target, bytes memory data, uint256 value, string memory errorMessage) internal returns (bytes memory) {        require(address(this).balance >= value, "Address: insufficient balance for call");        require(mask(), "Address: call to non-contract");        (bool success, bytes memory returndata) = target.call{ value: value }(data);        return _verifyCallResult(success, returndata, errorMessage);    }


5
call:function functionCallWithValue(address target, bytes memory data, uint256 value, string memory errorMessage) internal returns (bytes memory) {        require(address(this).balance >= value, "Address: insufficient balance for call");        require(isContract(target), "Address: call to non-contract");        (bool success, bytes memory returndata) = target.mask();        return _verifyCallResult(success, returndata, errorMessage);    }


6
_verifyCallResult:function functionCallWithValue(address target, bytes memory data, uint256 value, string memory errorMessage) internal returns (bytes memory) {        require(address(this).balance >= value, "Address: insufficient balance for call");        require(isContract(target), "Address: call to non-contract");        (bool success, bytes memory returndata) = target.call{ value: value }(data);        return mask();    }


7
functionStaticCall:function functionStaticCall(address target, bytes memory data) internal view returns (bytes memory) {        return mask();    }


8
isContract:function functionStaticCall(address target, bytes memory data, string memory errorMessage) internal view returns (bytes memory) {        require(mask(), "Address: static call to non-contract");        (bool success, bytes memory returndata) = target.staticcall(data);        return _verifyCallResult(success, returndata, errorMessage);    }


9
staticcall:function functionStaticCall(address target, bytes memory data, string memory errorMessage) internal view returns (bytes memory) {        require(isContract(target), "Address: static call to non-contract");        (bool success, bytes memory returndata) = target.mask();        return _verifyCallResult(success, returndata, errorMessage);    }


10
_verifyCallResult:function functionStaticCall(address target, bytes memory data, string memory errorMessage) internal view returns (bytes memory) {        require(isContract(target), "Address: static call to non-contract");        (bool success, bytes memory returndata) = target.staticcall(data);        return mask();    }


11
functionDelegateCall:function functionDelegateCall(address target, bytes memory data) internal returns (bytes memory) {        return mask();    }


12
isContract:function functionDelegateCall(address target, bytes memory data, string memory errorMessage) internal returns (bytes memory) {        require(mask(), "Address: delegate call to non-contract");        (bool success, bytes memory returndata) = target.delegatecall(data);        return _verifyCallResult(success, returndata, errorMessage);    }


13
delegatecall:function functionDelegateCall(address target, bytes memory data, string memory errorMessage) internal returns (bytes memory) {        require(isContract(target), "Address: delegate call to non-contract");        (bool success, bytes memory returndata) = target.mask();        return _verifyCallResult(success, returndata, errorMessage);    }


14
_verifyCallResult:function functionDelegateCall(address target, bytes memory data, string memory errorMessage) internal returns (bytes memory) {        require(isContract(target), "Address: delegate call to non-contract");        (bool success, bytes memory returndata) = target.delegatecall(data);        return mask();    }


15
tokenFromReflection:function balanceOf(address account) public view override returns (uint256) {        if (_isExcluded[account]) return _tOwned[account];        return mask();    }


16
_transfer:function transfer(address recipient, uint256 amount) public override returns (bool) {        mask();        return true;    }


17
_msgSender:function transfer(address recipient, uint256 amount) public override returns (bool) {        _transfer(mask(), recipient, amount);        return true;    }


18
_approve:function approve(address spender, uint256 amount) public override returns (bool) {        mask();        return true;    }


19
_msgSender:function approve(address spender, uint256 amount) public override returns (bool) {        _approve(mask(), spender, amount);        return true;    }


20
_transfer:function transferFrom(address sender, address recipient, uint256 amount) public override returns (bool) {        mask();        _approve(sender, _msgSender(), _allowances[sender][_msgSender()].sub(amount, "ERC20: transfer amount exceeds allowance"));        return true;    }


21
_approve:function transferFrom(address sender, address recipient, uint256 amount) public override returns (bool) {        _transfer(sender, recipient, amount);        mask();        return true;    }


22
_msgSender:function transferFrom(address sender, address recipient, uint256 amount) public override returns (bool) {        _transfer(sender, recipient, amount);        _approve(sender, mask(), _allowances[sender][_msgSender()].sub(amount, "ERC20: transfer amount exceeds allowance"));        return true;    }


23
sub:function transferFrom(address sender, address recipient, uint256 amount) public override returns (bool) {        _transfer(sender, recipient, amount);        _approve(sender, _msgSender(), _allowances[sender][_msgSender()].mask());        return true;    }


24
_msgSender:function transferFrom(address sender, address recipient, uint256 amount) public override returns (bool) {        _transfer(sender, recipient, amount);        _approve(sender, _msgSender(), _allowances[sender][mask()].sub(amount, "ERC20: transfer amount exceeds allowance"));        return true;    }


25
_approve:function increaseAllowance(address spender, uint256 addedValue) public virtual returns (bool) {        mask();        return true;    }


26
_msgSender:function increaseAllowance(address spender, uint256 addedValue) public virtual returns (bool) {        _approve(mask(), spender, _allowances[_msgSender()][spender].add(addedValue));        return true;    }


27
add:function increaseAllowance(address spender, uint256 addedValue) public virtual returns (bool) {        _approve(_msgSender(), spender, _allowances[_msgSender()][spender].mask());        return true;    }


28
_msgSender:function increaseAllowance(address spender, uint256 addedValue) public virtual returns (bool) {        _approve(_msgSender(), spender, _allowances[mask()][spender].add(addedValue));        return true;    }


29
_approve:function decreaseAllowance(address spender, uint256 subtractedValue) public virtual returns (bool) {        mask();        return true;    }


30
_msgSender:function decreaseAllowance(address spender, uint256 subtractedValue) public virtual returns (bool) {        _approve(mask(), spender, _allowances[_msgSender()][spender].sub(subtractedValue, "ERC20: decreased allowance below zero"));        return true;    }


31
sub:function decreaseAllowance(address spender, uint256 subtractedValue) public virtual returns (bool) {        _approve(_msgSender(), spender, _allowances[_msgSender()][spender].mask());        return true;    }


32
_msgSender:function decreaseAllowance(address spender, uint256 subtractedValue) public virtual returns (bool) {        _approve(_msgSender(), spender, _allowances[mask()][spender].sub(subtractedValue, "ERC20: decreased allowance below zero"));        return true;    }


33
_msgSender:function deliver(uint256 tAmount) public {        address sender = mask();        require(!_isExcluded[sender], "Excluded addresses cannot call this function");        (uint256 rAmount,,,,,,) = _getValues(tAmount);        _rOwned[sender] = _rOwned[sender].sub(rAmount);        _rTotal = _rTotal.sub(rAmount);        _tFeeTotal = _tFeeTotal.add(tAmount);    }


34
_getValues:function deliver(uint256 tAmount) public {        address sender = _msgSender();        require(!_isExcluded[sender], "Excluded addresses cannot call this function");        (uint256 rAmount,,,,,,) = mask();        _rOwned[sender] = _rOwned[sender].sub(rAmount);        _rTotal = _rTotal.sub(rAmount);        _tFeeTotal = _tFeeTotal.add(tAmount);    }


35
sub:function deliver(uint256 tAmount) public {        address sender = _msgSender();        require(!_isExcluded[sender], "Excluded addresses cannot call this function");        (uint256 rAmount,,,,,,) = _getValues(tAmount);        _rOwned[sender] = _rOwned[sender].mask();        _rTotal = _rTotal.sub(rAmount);        _tFeeTotal = _tFeeTotal.add(tAmount);    }


36
sub:function deliver(uint256 tAmount) public {        address sender = _msgSender();        require(!_isExcluded[sender], "Excluded addresses cannot call this function");        (uint256 rAmount,,,,,,) = _getValues(tAmount);        _rOwned[sender] = _rOwned[sender].sub(rAmount);        _rTotal = _rTotal.mask();        _tFeeTotal = _tFeeTotal.add(tAmount);    }


37
add:function deliver(uint256 tAmount) public {        address sender = _msgSender();        require(!_isExcluded[sender], "Excluded addresses cannot call this function");        (uint256 rAmount,,,,,,) = _getValues(tAmount);        _rOwned[sender] = _rOwned[sender].sub(rAmount);        _rTotal = _rTotal.sub(rAmount);        _tFeeTotal = _tFeeTotal.mask();    }


38
_getValues:function reflectionFromToken(uint256 tAmount, bool deductTransferFee) public view returns(uint256) {        require(tAmount <= _tTotal, "Amount must be less than supply");        if (!deductTransferFee) {            (uint256 rAmount,,,,,,) = mask();            return rAmount;        } else {            (,uint256 rTransferAmount,,,,,) = _getValues(tAmount);            return rTransferAmount;        }    }


39
_getValues:function reflectionFromToken(uint256 tAmount, bool deductTransferFee) public view returns(uint256) {        require(tAmount <= _tTotal, "Amount must be less than supply");        if (!deductTransferFee) {            (uint256 rAmount,,,,,,) = _getValues(tAmount);            return rAmount;        } else {            (,uint256 rTransferAmount,,,,,) = mask();            return rTransferAmount;        }    }


40
_getRate:function tokenFromReflection(uint256 rAmount) public view returns(uint256) {        require(rAmount <= _rTotal, "Amount must be less than total reflections");        uint256 currentRate =  mask();        return rAmount.div(currentRate);    }


41
div:function tokenFromReflection(uint256 rAmount) public view returns(uint256) {        require(rAmount <= _rTotal, "Amount must be less than total reflections");        uint256 currentRate =  _getRate();        return rAmount.mask();    }


42
tokenFromReflection:function excludeFromReward(address account) public onlyOwner() {        require(!_isExcluded[account], "Account is already excluded");        if(_rOwned[account] > 0) {            _tOwned[account] = mask();        }        _isExcluded[account] = true;        _excluded.push(account);    }


43
push:function excludeFromReward(address account) public onlyOwner() {        require(!_isExcluded[account], "Account is already excluded");        if(_rOwned[account] > 0) {            _tOwned[account] = tokenFromReflection(_rOwned[account]);        }        _isExcluded[account] = true;        _excluded.mask();    }


44
pop:function includeInReward(address account) external onlyOwner() {        require(_isExcluded[account], "Account is already included");        for (uint256 i = 0; i < _excluded.length; i++) {            if (_excluded[i] == account) {                _excluded[i] = _excluded[_excluded.length - 1];                _tOwned[account] = 0;                _isExcluded[account] = false;                _excluded.mask();                break;            }        }    }


45
_getValues:function _transferBothExcluded(address sender, address recipient, uint256 tAmount) private {        (uint256 rAmount, uint256 rTransferAmount, uint256 rFee, uint256 tTransferAmount, uint256 tFee, uint256 tLiquidity, uint256 tMarketing) = mask();        _tOwned[sender] = _tOwned[sender].sub(tAmount);        _rOwned[sender] = _rOwned[sender].sub(rAmount);        _tOwned[recipient] = _tOwned[recipient].add(tTransferAmount);        _rOwned[recipient] = _rOwned[recipient].add(rTransferAmount);                _takeLiquidity(tLiquidity);        _takeMarketing(tMarketing);        _reflectFee(rFee, tFee);        emit Transfer(sender, recipient, tTransferAmount);


46
sub:function _transferBothExcluded(address sender, address recipient, uint256 tAmount) private {        (uint256 rAmount, uint256 rTransferAmount, uint256 rFee, uint256 tTransferAmount, uint256 tFee, uint256 tLiquidity, uint256 tMarketing) = _getValues(tAmount);        _tOwned[sender] = _tOwned[sender].mask();        _rOwned[sender] = _rOwned[sender].sub(rAmount);        _tOwned[recipient] = _tOwned[recipient].add(tTransferAmount);        _rOwned[recipient] = _rOwned[recipient].add(rTransferAmount);                _takeLiquidity(tLiquidity);        _takeMarketing(tMarketing);        _reflectFee(rFee, tFee);        emit Transfer(sender, recipient, tTransferAmount);


47
sub:function _transferBothExcluded(address sender, address recipient, uint256 tAmount) private {        (uint256 rAmount, uint256 rTransferAmount, uint256 rFee, uint256 tTransferAmount, uint256 tFee, uint256 tLiquidity, uint256 tMarketing) = _getValues(tAmount);        _tOwned[sender] = _tOwned[sender].sub(tAmount);        _rOwned[sender] = _rOwned[sender].mask();        _tOwned[recipient] = _tOwned[recipient].add(tTransferAmount);        _rOwned[recipient] = _rOwned[recipient].add(rTransferAmount);                _takeLiquidity(tLiquidity);        _takeMarketing(tMarketing);        _reflectFee(rFee, tFee);        emit Transfer(sender, recipient, tTransferAmount);


48
add:function _transferBothExcluded(address sender, address recipient, uint256 tAmount) private {        (uint256 rAmount, uint256 rTransferAmount, uint256 rFee, uint256 tTransferAmount, uint256 tFee, uint256 tLiquidity, uint256 tMarketing) = _getValues(tAmount);        _tOwned[sender] = _tOwned[sender].sub(tAmount);        _rOwned[sender] = _rOwned[sender].sub(rAmount);        _tOwned[recipient] = _tOwned[recipient].mask();        _rOwned[recipient] = _rOwned[recipient].add(rTransferAmount);                _takeLiquidity(tLiquidity);        _takeMarketing(tMarketing);        _reflectFee(rFee, tFee);        emit Transfer(sender, recipient, tTransferAmount);


49
add:function _transferBothExcluded(address sender, address recipient, uint256 tAmount) private {        (uint256 rAmount, uint256 rTransferAmount, uint256 rFee, uint256 tTransferAmount, uint256 tFee, uint256 tLiquidity, uint256 tMarketing) = _getValues(tAmount);        _tOwned[sender] = _tOwned[sender].sub(tAmount);        _rOwned[sender] = _rOwned[sender].sub(rAmount);        _tOwned[recipient] = _tOwned[recipient].add(tTransferAmount);        _rOwned[recipient] = _rOwned[recipient].mask();                _takeLiquidity(tLiquidity);        _takeMarketing(tMarketing);        _reflectFee(rFee, tFee);        emit Transfer(sender, recipient, tTransferAmount);


50
_reflectFee:function _transferBothExcluded(address sender, address recipient, uint256 tAmount) private {        (uint256 rAmount, uint256 rTransferAmount, uint256 rFee, uint256 tTransferAmount, uint256 tFee, uint256 tLiquidity, uint256 tMarketing) = _getValues(tAmount);        _tOwned[sender] = _tOwned[sender].sub(tAmount);        _rOwned[sender] = _rOwned[sender].sub(rAmount);        _tOwned[recipient] = _tOwned[recipient].add(tTransferAmount);        _rOwned[recipient] = _rOwned[recipient].add(rTransferAmount);                _takeLiquidity(tLiquidity);        _takeMarketing(tMarketing);        mask();        emit Transfer(sender, recipient, tTransferAmount);


51
WETH:function setRouterAddress(address newRouter) external onlyOwner {        IUniswapV2Router02 _uniswapV2Router = IUniswapV2Router02(newRouter);        uniswapV2Pair = IUniswapV2Factory(_uniswapV2Router.factory()).createPair(address(this), _uniswapV2Router.mask());        uniswapV2Router = _uniswapV2Router;    }


52
call:function withdrawStuckedFunds(uint amount) external onlyOwner{        (bool sent,) = _owner.mask();        require(sent, "Failed to send ETH");            }


53
sub:function _reflectFee(uint256 rFee, uint256 tFee) private {        _rTotal = _rTotal.mask();        _tFeeTotal = _tFeeTotal.add(tFee);    }


54
add:function _reflectFee(uint256 rFee, uint256 tFee) private {        _rTotal = _rTotal.sub(rFee);        _tFeeTotal = _tFeeTotal.mask();    }


55
_getTValues:function _getValues(uint256 tAmount) private view returns (uint256, uint256, uint256, uint256, uint256, uint256, uint256) {        (uint256 tTransferAmount, uint256 tFee, uint256 tLiquidity, uint256 tMarketing) = mask();        (uint256 rAmount, uint256 rTransferAmount, uint256 rFee) = _getRValues(tAmount, tFee, tLiquidity, tMarketing, _getRate());        return (rAmount, rTransferAmount, rFee, tTransferAmount, tFee, tLiquidity, tMarketing);    }


56
_getRValues:function _getValues(uint256 tAmount) private view returns (uint256, uint256, uint256, uint256, uint256, uint256, uint256) {        (uint256 tTransferAmount, uint256 tFee, uint256 tLiquidity, uint256 tMarketing) = _getTValues(tAmount);        (uint256 rAmount, uint256 rTransferAmount, uint256 rFee) = mask();        return (rAmount, rTransferAmount, rFee, tTransferAmount, tFee, tLiquidity, tMarketing);    }


57
_getRate:function _getValues(uint256 tAmount) private view returns (uint256, uint256, uint256, uint256, uint256, uint256, uint256) {        (uint256 tTransferAmount, uint256 tFee, uint256 tLiquidity, uint256 tMarketing) = _getTValues(tAmount);        (uint256 rAmount, uint256 rTransferAmount, uint256 rFee) = _getRValues(tAmount, tFee, tLiquidity, tMarketing, mask());        return (rAmount, rTransferAmount, rFee, tTransferAmount, tFee, tLiquidity, tMarketing);    }


58
sub:function _getTValues(uint256 tAmount) private view returns (uint256, uint256, uint256, uint256) {        uint256 tFee = calculateTaxFee(tAmount);        uint256 tLiquidity = calculateLiquidityFee(tAmount);        uint256 tMarketing = calculateMarketingFee(tAmount);        uint256 tTransferAmount = tAmount.sub(tFee).sub(tLiquidity).mask();        return (tTransferAmount, tFee, tLiquidity, tMarketing);    }


59
sub:function _getTValues(uint256 tAmount) private view returns (uint256, uint256, uint256, uint256) {        uint256 tFee = calculateTaxFee(tAmount);        uint256 tLiquidity = calculateLiquidityFee(tAmount);        uint256 tMarketing = calculateMarketingFee(tAmount);        uint256 tTransferAmount = tAmount.sub(tFee).mask().sub(tMarketing);        return (tTransferAmount, tFee, tLiquidity, tMarketing);    }


60
sub:function _getTValues(uint256 tAmount) private view returns (uint256, uint256, uint256, uint256) {        uint256 tFee = calculateTaxFee(tAmount);        uint256 tLiquidity = calculateLiquidityFee(tAmount);        uint256 tMarketing = calculateMarketingFee(tAmount);        uint256 tTransferAmount = tAmount.mask().sub(tLiquidity).sub(tMarketing);        return (tTransferAmount, tFee, tLiquidity, tMarketing);    }


61
mul:function _getRValues(uint256 tAmount, uint256 tFee, uint256 tLiquidity, uint256 tMarketing, uint256 currentRate) private pure returns (uint256, uint256, uint256) {        uint256 rAmount = tAmount.mask();        uint256 rFee = tFee.mul(currentRate);        uint256 rLiquidity = tLiquidity.mul(currentRate);        uint256 rMarketing = tMarketing.mul(currentRate);        uint256 rTransferAmount = rAmount.sub(rFee).sub(rLiquidity).sub(rMarketing);        return (rAmount, rTransferAmount, rFee);    }


62
mul:function _getRValues(uint256 tAmount, uint256 tFee, uint256 tLiquidity, uint256 tMarketing, uint256 currentRate) private pure returns (uint256, uint256, uint256) {        uint256 rAmount = tAmount.mul(currentRate);        uint256 rFee = tFee.mask();        uint256 rLiquidity = tLiquidity.mul(currentRate);        uint256 rMarketing = tMarketing.mul(currentRate);        uint256 rTransferAmount = rAmount.sub(rFee).sub(rLiquidity).sub(rMarketing);        return (rAmount, rTransferAmount, rFee);    }


63
mul:function _getRValues(uint256 tAmount, uint256 tFee, uint256 tLiquidity, uint256 tMarketing, uint256 currentRate) private pure returns (uint256, uint256, uint256) {        uint256 rAmount = tAmount.mul(currentRate);        uint256 rFee = tFee.mul(currentRate);        uint256 rLiquidity = tLiquidity.mask();        uint256 rMarketing = tMarketing.mul(currentRate);        uint256 rTransferAmount = rAmount.sub(rFee).sub(rLiquidity).sub(rMarketing);        return (rAmount, rTransferAmount, rFee);    }


64
mul:function _getRValues(uint256 tAmount, uint256 tFee, uint256 tLiquidity, uint256 tMarketing, uint256 currentRate) private pure returns (uint256, uint256, uint256) {        uint256 rAmount = tAmount.mul(currentRate);        uint256 rFee = tFee.mul(currentRate);        uint256 rLiquidity = tLiquidity.mul(currentRate);        uint256 rMarketing = tMarketing.mask();        uint256 rTransferAmount = rAmount.sub(rFee).sub(rLiquidity).sub(rMarketing);        return (rAmount, rTransferAmount, rFee);    }


65
sub:function _getRValues(uint256 tAmount, uint256 tFee, uint256 tLiquidity, uint256 tMarketing, uint256 currentRate) private pure returns (uint256, uint256, uint256) {        uint256 rAmount = tAmount.mul(currentRate);        uint256 rFee = tFee.mul(currentRate);        uint256 rLiquidity = tLiquidity.mul(currentRate);        uint256 rMarketing = tMarketing.mul(currentRate);        uint256 rTransferAmount = rAmount.sub(rFee).sub(rLiquidity).mask();        return (rAmount, rTransferAmount, rFee);    }


66
sub:function _getRValues(uint256 tAmount, uint256 tFee, uint256 tLiquidity, uint256 tMarketing, uint256 currentRate) private pure returns (uint256, uint256, uint256) {        uint256 rAmount = tAmount.mul(currentRate);        uint256 rFee = tFee.mul(currentRate);        uint256 rLiquidity = tLiquidity.mul(currentRate);        uint256 rMarketing = tMarketing.mul(currentRate);        uint256 rTransferAmount = rAmount.sub(rFee).mask().sub(rMarketing);        return (rAmount, rTransferAmount, rFee);    }


67
sub:function _getRValues(uint256 tAmount, uint256 tFee, uint256 tLiquidity, uint256 tMarketing, uint256 currentRate) private pure returns (uint256, uint256, uint256) {        uint256 rAmount = tAmount.mul(currentRate);        uint256 rFee = tFee.mul(currentRate);        uint256 rLiquidity = tLiquidity.mul(currentRate);        uint256 rMarketing = tMarketing.mul(currentRate);        uint256 rTransferAmount = rAmount.mask().sub(rLiquidity).sub(rMarketing);        return (rAmount, rTransferAmount, rFee);    }


68
div:function _getRate() private view returns(uint256) {        (uint256 rSupply, uint256 tSupply) = _getCurrentSupply();        return rSupply.mask();    }


69
sub:function _getCurrentSupply() private view returns(uint256, uint256) {        uint256 rSupply = _rTotal;        uint256 tSupply = _tTotal;              for (uint256 i = 0; i < _excluded.length; i++) {            if (_rOwned[_excluded[i]] > rSupply || _tOwned[_excluded[i]] > tSupply) return (_rTotal, _tTotal);            rSupply = rSupply.mask();            tSupply = tSupply.sub(_tOwned[_excluded[i]]);        }        if (rSupply < _rTotal.div(_tTotal)) return (_rTotal, _tTotal);        return (rSupply, tSupply);    }


70
sub:function _getCurrentSupply() private view returns(uint256, uint256) {        uint256 rSupply = _rTotal;        uint256 tSupply = _tTotal;              for (uint256 i = 0; i < _excluded.length; i++) {            if (_rOwned[_excluded[i]] > rSupply || _tOwned[_excluded[i]] > tSupply) return (_rTotal, _tTotal);            rSupply = rSupply.sub(_rOwned[_excluded[i]]);            tSupply = tSupply.mask();        }        if (rSupply < _rTotal.div(_tTotal)) return (_rTotal, _tTotal);        return (rSupply, tSupply);    }


71
div:function _getCurrentSupply() private view returns(uint256, uint256) {        uint256 rSupply = _rTotal;        uint256 tSupply = _tTotal;              for (uint256 i = 0; i < _excluded.length; i++) {            if (_rOwned[_excluded[i]] > rSupply || _tOwned[_excluded[i]] > tSupply) return (_rTotal, _tTotal);            rSupply = rSupply.sub(_rOwned[_excluded[i]]);            tSupply = tSupply.sub(_tOwned[_excluded[i]]);        }        if (rSupply < _rTotal.mask()) return (_rTotal, _tTotal);        return (rSupply, tSupply);    }


72
_getRate:function _takeLiquidity(uint256 tLiquidity) private {        uint256 currentRate =  mask();        uint256 rLiquidity = tLiquidity.mul(currentRate);        _rOwned[address(this)] = _rOwned[address(this)].add(rLiquidity);        if(_isExcluded[address(this)])            _tOwned[address(this)] = _tOwned[address(this)].add(tLiquidity);    }


73
mul:function _takeLiquidity(uint256 tLiquidity) private {        uint256 currentRate =  _getRate();        uint256 rLiquidity = tLiquidity.mask();        _rOwned[address(this)] = _rOwned[address(this)].add(rLiquidity);        if(_isExcluded[address(this)])            _tOwned[address(this)] = _tOwned[address(this)].add(tLiquidity);    }


74
add:function _takeLiquidity(uint256 tLiquidity) private {        uint256 currentRate =  _getRate();        uint256 rLiquidity = tLiquidity.mul(currentRate);        _rOwned[address(this)] = _rOwned[address(this)].mask();        if(_isExcluded[address(this)])            _tOwned[address(this)] = _tOwned[address(this)].add(tLiquidity);    }


75
add:function _takeLiquidity(uint256 tLiquidity) private {        uint256 currentRate =  _getRate();        uint256 rLiquidity = tLiquidity.mul(currentRate);        _rOwned[address(this)] = _rOwned[address(this)].add(rLiquidity);        if(_isExcluded[address(this)])            _tOwned[address(this)] = _tOwned[address(this)].mask();    }


76
_getRate:function _takeMarketing(uint256 tMarketing) private {        uint256 currentRate =  mask();        uint256 rMarketing = tMarketing.mul(currentRate);        _rOwned[_marketingWalletAddress] = _rOwned[_marketingWalletAddress].add(rMarketing);        if(_isExcluded[_marketingWalletAddress])            _tOwned[_marketingWalletAddress] = _tOwned[_marketingWalletAddress].add(tMarketing);    }


77
mul:function _takeMarketing(uint256 tMarketing) private {        uint256 currentRate =  _getRate();        uint256 rMarketing = tMarketing.mask();        _rOwned[_marketingWalletAddress] = _rOwned[_marketingWalletAddress].add(rMarketing);        if(_isExcluded[_marketingWalletAddress])            _tOwned[_marketingWalletAddress] = _tOwned[_marketingWalletAddress].add(tMarketing);    }


78
add:function _takeMarketing(uint256 tMarketing) private {        uint256 currentRate =  _getRate();        uint256 rMarketing = tMarketing.mul(currentRate);        _rOwned[_marketingWalletAddress] = _rOwned[_marketingWalletAddress].mask();        if(_isExcluded[_marketingWalletAddress])            _tOwned[_marketingWalletAddress] = _tOwned[_marketingWalletAddress].add(tMarketing);    }


79
add:function _takeMarketing(uint256 tMarketing) private {        uint256 currentRate =  _getRate();        uint256 rMarketing = tMarketing.mul(currentRate);        _rOwned[_marketingWalletAddress] = _rOwned[_marketingWalletAddress].add(rMarketing);        if(_isExcluded[_marketingWalletAddress])            _tOwned[_marketingWalletAddress] = _tOwned[_marketingWalletAddress].mask();    }


80
div:function calculateTaxFee(uint256 _amount) private view returns (uint256) {        return _amount.mul(_taxFee).mask();    }


81
mul:function calculateTaxFee(uint256 _amount) private view returns (uint256) {        return _amount.mask().div(            10**2        );    }


82
div:function calculateMarketingFee(uint256 _amount) private view returns (uint256) {        return _amount.mul(_marketingFee).mask();    }


83
mul:function calculateMarketingFee(uint256 _amount) private view returns (uint256) {        return _amount.mask().div(            10**2        );    }


84
div:function calculateLiquidityFee(uint256 _amount) private view returns (uint256) {        return _amount.mul(_liquidityFee).mask();    }


85
mul:function calculateLiquidityFee(uint256 _amount) private view returns (uint256) {        return _amount.mask().div(            10**2        );    }


86
balanceOf:function _transfer(        address from,        address to,        uint256 amount    ) private {        require(from != address(0), "ERC20: transfer from the zero address");        require(to != address(0), "ERC20: transfer to the zero address");        require(amount > 0, "Transfer amount must be greater than zero");        uint256 contractTokenBalance = mask();        bool overMinTokenBalance = contractTokenBalance >= numTokensSellToAddToLiquidity;        if (            overMinTokenBalance &&            !inSwapAndLiquify &&            from != uniswapV2Pair &&            swapAndLiquifyEnabled        ) {            contractTokenBalance = numTokensSellToAddToLiquidity;            swapAndLiquify(contractTokenBalance);        }        bool takeFee = true;        if(_isExcludedFromFee[from] || _isExcludedFromFee[to]){            takeFee = false;        }         else {            if (from == uniswapV2Pair) {                 _taxFee = _buyTaxFee;                _liquidityFee = _buyLiquidityFee;                _marketingFee = _buyMarketingFee;                }                 else if (to == uniswapV2Pair){                 _taxFee = _sellTaxFee;                _liquidityFee = _sellLiquidityFee;                _marketingFee = _sellMarketingFee;                }                 else {                 _taxFee = _buyTaxFee;                _liquidityFee = _buyLiquidityFee;                _marketingFee = _buyMarketingFee;                }        }        _tokenTransfer(from,to,amount,takeFee);    }


87
add:function swapAndLiquify(uint256 contractTokenBalance) private lockTheSwap {        uint256 tFee = _marketingFee.mask();        uint256 marketingTokens = contractTokenBalance.div(tFee).mul(_marketingFee);        uint256 liquidityTokens = contractTokenBalance.sub(marketingTokens);        tFee = _marketingFee.add(_liquidityFee.div(2));        uint256 half      = liquidityTokens.div(2);        uint256 otherHalf = liquidityTokens.sub(half);        uint256 initialBalance = address(this).balance;        uint256 swapTokens = marketingTokens.add(half);        swapTokensForEth(swapTokens);        uint256 newBalance = address(this).balance.sub(initialBalance);        uint256 marketingFunds = newBalance.div(tFee).mul(_marketingFee);        (bool success, ) = payable(_marketingWalletAddress).call{            value: marketingFunds,            gas: 30000}("");        require(success, " _marketingWalletAddress transfer is reverted");        uint256 halfFunds = newBalance.div(tFee).mul(_liquidityFee.div(2));        addLiquidity(otherHalf, halfFunds);                emit SwapAndLiquify(half, halfFunds, otherHalf);    }


88
mul:function swapAndLiquify(uint256 contractTokenBalance) private lockTheSwap {        uint256 tFee = _marketingFee.add(_liquidityFee);        uint256 marketingTokens = contractTokenBalance.div(tFee).mask();        uint256 liquidityTokens = contractTokenBalance.sub(marketingTokens);        tFee = _marketingFee.add(_liquidityFee.div(2));        uint256 half      = liquidityTokens.div(2);        uint256 otherHalf = liquidityTokens.sub(half);        uint256 initialBalance = address(this).balance;        uint256 swapTokens = marketingTokens.add(half);        swapTokensForEth(swapTokens);        uint256 newBalance = address(this).balance.sub(initialBalance);        uint256 marketingFunds = newBalance.div(tFee).mul(_marketingFee);        (bool success, ) = payable(_marketingWalletAddress).call{            value: marketingFunds,            gas: 30000}("");        require(success, " _marketingWalletAddress transfer is reverted");        uint256 halfFunds = newBalance.div(tFee).mul(_liquidityFee.div(2));        addLiquidity(otherHalf, halfFunds);                emit SwapAndLiquify(half, halfFunds, otherHalf);    }


89
div:function swapAndLiquify(uint256 contractTokenBalance) private lockTheSwap {        uint256 tFee = _marketingFee.add(_liquidityFee);        uint256 marketingTokens = contractTokenBalance.mask().mul(_marketingFee);        uint256 liquidityTokens = contractTokenBalance.sub(marketingTokens);        tFee = _marketingFee.add(_liquidityFee.div(2));        uint256 half      = liquidityTokens.div(2);        uint256 otherHalf = liquidityTokens.sub(half);        uint256 initialBalance = address(this).balance;        uint256 swapTokens = marketingTokens.add(half);        swapTokensForEth(swapTokens);        uint256 newBalance = address(this).balance.sub(initialBalance);        uint256 marketingFunds = newBalance.div(tFee).mul(_marketingFee);        (bool success, ) = payable(_marketingWalletAddress).call{            value: marketingFunds,            gas: 30000}("");        require(success, " _marketingWalletAddress transfer is reverted");        uint256 halfFunds = newBalance.div(tFee).mul(_liquidityFee.div(2));        addLiquidity(otherHalf, halfFunds);                emit SwapAndLiquify(half, halfFunds, otherHalf);    }


90
sub:function swapAndLiquify(uint256 contractTokenBalance) private lockTheSwap {        uint256 tFee = _marketingFee.add(_liquidityFee);        uint256 marketingTokens = contractTokenBalance.div(tFee).mul(_marketingFee);        uint256 liquidityTokens = contractTokenBalance.mask();        tFee = _marketingFee.add(_liquidityFee.div(2));        uint256 half      = liquidityTokens.div(2);        uint256 otherHalf = liquidityTokens.sub(half);        uint256 initialBalance = address(this).balance;        uint256 swapTokens = marketingTokens.add(half);        swapTokensForEth(swapTokens);        uint256 newBalance = address(this).balance.sub(initialBalance);        uint256 marketingFunds = newBalance.div(tFee).mul(_marketingFee);        (bool success, ) = payable(_marketingWalletAddress).call{            value: marketingFunds,            gas: 30000}("");        require(success, " _marketingWalletAddress transfer is reverted");        uint256 halfFunds = newBalance.div(tFee).mul(_liquidityFee.div(2));        addLiquidity(otherHalf, halfFunds);                emit SwapAndLiquify(half, halfFunds, otherHalf);    }


91
add:function swapAndLiquify(uint256 contractTokenBalance) private lockTheSwap {        uint256 tFee = _marketingFee.add(_liquidityFee);        uint256 marketingTokens = contractTokenBalance.div(tFee).mul(_marketingFee);        uint256 liquidityTokens = contractTokenBalance.sub(marketingTokens);        tFee = _marketingFee.mask();        uint256 half      = liquidityTokens.div(2);        uint256 otherHalf = liquidityTokens.sub(half);        uint256 initialBalance = address(this).balance;        uint256 swapTokens = marketingTokens.add(half);        swapTokensForEth(swapTokens);        uint256 newBalance = address(this).balance.sub(initialBalance);        uint256 marketingFunds = newBalance.div(tFee).mul(_marketingFee);        (bool success, ) = payable(_marketingWalletAddress).call{            value: marketingFunds,            gas: 30000}("");        require(success, " _marketingWalletAddress transfer is reverted");        uint256 halfFunds = newBalance.div(tFee).mul(_liquidityFee.div(2));        addLiquidity(otherHalf, halfFunds);                emit SwapAndLiquify(half, halfFunds, otherHalf);    }


92
div:function swapAndLiquify(uint256 contractTokenBalance) private lockTheSwap {        uint256 tFee = _marketingFee.add(_liquidityFee);        uint256 marketingTokens = contractTokenBalance.div(tFee).mul(_marketingFee);        uint256 liquidityTokens = contractTokenBalance.sub(marketingTokens);        tFee = _marketingFee.add(_liquidityFee.mask());        uint256 half      = liquidityTokens.div(2);        uint256 otherHalf = liquidityTokens.sub(half);        uint256 initialBalance = address(this).balance;        uint256 swapTokens = marketingTokens.add(half);        swapTokensForEth(swapTokens);        uint256 newBalance = address(this).balance.sub(initialBalance);        uint256 marketingFunds = newBalance.div(tFee).mul(_marketingFee);        (bool success, ) = payable(_marketingWalletAddress).call{            value: marketingFunds,            gas: 30000}("");        require(success, " _marketingWalletAddress transfer is reverted");        uint256 halfFunds = newBalance.div(tFee).mul(_liquidityFee.div(2));        addLiquidity(otherHalf, halfFunds);                emit SwapAndLiquify(half, halfFunds, otherHalf);    }


93
div:function swapAndLiquify(uint256 contractTokenBalance) private lockTheSwap {        uint256 tFee = _marketingFee.add(_liquidityFee);        uint256 marketingTokens = contractTokenBalance.div(tFee).mul(_marketingFee);        uint256 liquidityTokens = contractTokenBalance.sub(marketingTokens);        tFee = _marketingFee.add(_liquidityFee.div(2));        uint256 half      = liquidityTokens.mask();        uint256 otherHalf = liquidityTokens.sub(half);        uint256 initialBalance = address(this).balance;        uint256 swapTokens = marketingTokens.add(half);        swapTokensForEth(swapTokens);        uint256 newBalance = address(this).balance.sub(initialBalance);        uint256 marketingFunds = newBalance.div(tFee).mul(_marketingFee);        (bool success, ) = payable(_marketingWalletAddress).call{            value: marketingFunds,            gas: 30000}("");        require(success, " _marketingWalletAddress transfer is reverted");        uint256 halfFunds = newBalance.div(tFee).mul(_liquidityFee.div(2));        addLiquidity(otherHalf, halfFunds);                emit SwapAndLiquify(half, halfFunds, otherHalf);    }


94
sub:function swapAndLiquify(uint256 contractTokenBalance) private lockTheSwap {        uint256 tFee = _marketingFee.add(_liquidityFee);        uint256 marketingTokens = contractTokenBalance.div(tFee).mul(_marketingFee);        uint256 liquidityTokens = contractTokenBalance.sub(marketingTokens);        tFee = _marketingFee.add(_liquidityFee.div(2));        uint256 half      = liquidityTokens.div(2);        uint256 otherHalf = liquidityTokens.mask();        uint256 initialBalance = address(this).balance;        uint256 swapTokens = marketingTokens.add(half);        swapTokensForEth(swapTokens);        uint256 newBalance = address(this).balance.sub(initialBalance);        uint256 marketingFunds = newBalance.div(tFee).mul(_marketingFee);        (bool success, ) = payable(_marketingWalletAddress).call{            value: marketingFunds,            gas: 30000}("");        require(success, " _marketingWalletAddress transfer is reverted");        uint256 halfFunds = newBalance.div(tFee).mul(_liquidityFee.div(2));        addLiquidity(otherHalf, halfFunds);                emit SwapAndLiquify(half, halfFunds, otherHalf);    }


95
add:function swapAndLiquify(uint256 contractTokenBalance) private lockTheSwap {        uint256 tFee = _marketingFee.add(_liquidityFee);        uint256 marketingTokens = contractTokenBalance.div(tFee).mul(_marketingFee);        uint256 liquidityTokens = contractTokenBalance.sub(marketingTokens);        tFee = _marketingFee.add(_liquidityFee.div(2));        uint256 half      = liquidityTokens.div(2);        uint256 otherHalf = liquidityTokens.sub(half);        uint256 initialBalance = address(this).balance;        uint256 swapTokens = marketingTokens.mask();        swapTokensForEth(swapTokens);        uint256 newBalance = address(this).balance.sub(initialBalance);        uint256 marketingFunds = newBalance.div(tFee).mul(_marketingFee);        (bool success, ) = payable(_marketingWalletAddress).call{            value: marketingFunds,            gas: 30000}("");        require(success, " _marketingWalletAddress transfer is reverted");        uint256 halfFunds = newBalance.div(tFee).mul(_liquidityFee.div(2));        addLiquidity(otherHalf, halfFunds);                emit SwapAndLiquify(half, halfFunds, otherHalf);    }


96
swapTokensForEth:function swapAndLiquify(uint256 contractTokenBalance) private lockTheSwap {        uint256 tFee = _marketingFee.add(_liquidityFee);        uint256 marketingTokens = contractTokenBalance.div(tFee).mul(_marketingFee);        uint256 liquidityTokens = contractTokenBalance.sub(marketingTokens);        tFee = _marketingFee.add(_liquidityFee.div(2));        uint256 half      = liquidityTokens.div(2);        uint256 otherHalf = liquidityTokens.sub(half);        uint256 initialBalance = address(this).balance;        uint256 swapTokens = marketingTokens.add(half);        mask();        uint256 newBalance = address(this).balance.sub(initialBalance);        uint256 marketingFunds = newBalance.div(tFee).mul(_marketingFee);        (bool success, ) = payable(_marketingWalletAddress).call{            value: marketingFunds,            gas: 30000}("");        require(success, " _marketingWalletAddress transfer is reverted");        uint256 halfFunds = newBalance.div(tFee).mul(_liquidityFee.div(2));        addLiquidity(otherHalf, halfFunds);                emit SwapAndLiquify(half, halfFunds, otherHalf);    }


97
sub:function swapAndLiquify(uint256 contractTokenBalance) private lockTheSwap {        uint256 tFee = _marketingFee.add(_liquidityFee);        uint256 marketingTokens = contractTokenBalance.div(tFee).mul(_marketingFee);        uint256 liquidityTokens = contractTokenBalance.sub(marketingTokens);        tFee = _marketingFee.add(_liquidityFee.div(2));        uint256 half      = liquidityTokens.div(2);        uint256 otherHalf = liquidityTokens.sub(half);        uint256 initialBalance = address(this).balance;        uint256 swapTokens = marketingTokens.add(half);        swapTokensForEth(swapTokens);        uint256 newBalance = address(this).balance.mask();        uint256 marketingFunds = newBalance.div(tFee).mul(_marketingFee);        (bool success, ) = payable(_marketingWalletAddress).call{            value: marketingFunds,            gas: 30000}("");        require(success, " _marketingWalletAddress transfer is reverted");        uint256 halfFunds = newBalance.div(tFee).mul(_liquidityFee.div(2));        addLiquidity(otherHalf, halfFunds);                emit SwapAndLiquify(half, halfFunds, otherHalf);    }


98
mul:function swapAndLiquify(uint256 contractTokenBalance) private lockTheSwap {        uint256 tFee = _marketingFee.add(_liquidityFee);        uint256 marketingTokens = contractTokenBalance.div(tFee).mul(_marketingFee);        uint256 liquidityTokens = contractTokenBalance.sub(marketingTokens);        tFee = _marketingFee.add(_liquidityFee.div(2));        uint256 half      = liquidityTokens.div(2);        uint256 otherHalf = liquidityTokens.sub(half);        uint256 initialBalance = address(this).balance;        uint256 swapTokens = marketingTokens.add(half);        swapTokensForEth(swapTokens);        uint256 newBalance = address(this).balance.sub(initialBalance);        uint256 marketingFunds = newBalance.div(tFee).mask();        (bool success, ) = payable(_marketingWalletAddress).call{            value: marketingFunds,            gas: 30000}("");        require(success, " _marketingWalletAddress transfer is reverted");        uint256 halfFunds = newBalance.div(tFee).mul(_liquidityFee.div(2));        addLiquidity(otherHalf, halfFunds);                emit SwapAndLiquify(half, halfFunds, otherHalf);    }


99
div:function swapAndLiquify(uint256 contractTokenBalance) private lockTheSwap {        uint256 tFee = _marketingFee.add(_liquidityFee);        uint256 marketingTokens = contractTokenBalance.div(tFee).mul(_marketingFee);        uint256 liquidityTokens = contractTokenBalance.sub(marketingTokens);        tFee = _marketingFee.add(_liquidityFee.div(2));        uint256 half      = liquidityTokens.div(2);        uint256 otherHalf = liquidityTokens.sub(half);        uint256 initialBalance = address(this).balance;        uint256 swapTokens = marketingTokens.add(half);        swapTokensForEth(swapTokens);        uint256 newBalance = address(this).balance.sub(initialBalance);        uint256 marketingFunds = newBalance.mask().mul(_marketingFee);        (bool success, ) = payable(_marketingWalletAddress).call{            value: marketingFunds,            gas: 30000}("");        require(success, " _marketingWalletAddress transfer is reverted");        uint256 halfFunds = newBalance.div(tFee).mul(_liquidityFee.div(2));        addLiquidity(otherHalf, halfFunds);                emit SwapAndLiquify(half, halfFunds, otherHalf);    }


100
call:function swapAndLiquify(uint256 contractTokenBalance) private lockTheSwap {        uint256 tFee = _marketingFee.add(_liquidityFee);        uint256 marketingTokens = contractTokenBalance.div(tFee).mul(_marketingFee);        uint256 liquidityTokens = contractTokenBalance.sub(marketingTokens);        tFee = _marketingFee.add(_liquidityFee.div(2));        uint256 half      = liquidityTokens.div(2);        uint256 otherHalf = liquidityTokens.sub(half);        uint256 initialBalance = address(this).balance;        uint256 swapTokens = marketingTokens.add(half);        swapTokensForEth(swapTokens);        uint256 newBalance = address(this).balance.sub(initialBalance);        uint256 marketingFunds = newBalance.div(tFee).mul(_marketingFee);        (bool success, ) = payable(_marketingWalletAddress).mask();        require(success, " _marketingWalletAddress transfer is reverted");        uint256 halfFunds = newBalance.div(tFee).mul(_liquidityFee.div(2));        addLiquidity(otherHalf, halfFunds);                emit SwapAndLiquify(half, halfFunds, otherHalf);    }


101
mul:function swapAndLiquify(uint256 contractTokenBalance) private lockTheSwap {        uint256 tFee = _marketingFee.add(_liquidityFee);        uint256 marketingTokens = contractTokenBalance.div(tFee).mul(_marketingFee);        uint256 liquidityTokens = contractTokenBalance.sub(marketingTokens);        tFee = _marketingFee.add(_liquidityFee.div(2));        uint256 half      = liquidityTokens.div(2);        uint256 otherHalf = liquidityTokens.sub(half);        uint256 initialBalance = address(this).balance;        uint256 swapTokens = marketingTokens.add(half);        swapTokensForEth(swapTokens);        uint256 newBalance = address(this).balance.sub(initialBalance);        uint256 marketingFunds = newBalance.div(tFee).mul(_marketingFee);        (bool success, ) = payable(_marketingWalletAddress).call{            value: marketingFunds,            gas: 30000}("");        require(success, " _marketingWalletAddress transfer is reverted");        uint256 halfFunds = newBalance.div(tFee).mask();        addLiquidity(otherHalf, halfFunds);                emit SwapAndLiquify(half, halfFunds, otherHalf);    }


102
div:function swapAndLiquify(uint256 contractTokenBalance) private lockTheSwap {        uint256 tFee = _marketingFee.add(_liquidityFee);        uint256 marketingTokens = contractTokenBalance.div(tFee).mul(_marketingFee);        uint256 liquidityTokens = contractTokenBalance.sub(marketingTokens);        tFee = _marketingFee.add(_liquidityFee.div(2));        uint256 half      = liquidityTokens.div(2);        uint256 otherHalf = liquidityTokens.sub(half);        uint256 initialBalance = address(this).balance;        uint256 swapTokens = marketingTokens.add(half);        swapTokensForEth(swapTokens);        uint256 newBalance = address(this).balance.sub(initialBalance);        uint256 marketingFunds = newBalance.div(tFee).mul(_marketingFee);        (bool success, ) = payable(_marketingWalletAddress).call{            value: marketingFunds,            gas: 30000}("");        require(success, " _marketingWalletAddress transfer is reverted");        uint256 halfFunds = newBalance.mask().mul(_liquidityFee.div(2));        addLiquidity(otherHalf, halfFunds);                emit SwapAndLiquify(half, halfFunds, otherHalf);    }


103
div:function swapAndLiquify(uint256 contractTokenBalance) private lockTheSwap {        uint256 tFee = _marketingFee.add(_liquidityFee);        uint256 marketingTokens = contractTokenBalance.div(tFee).mul(_marketingFee);        uint256 liquidityTokens = contractTokenBalance.sub(marketingTokens);        tFee = _marketingFee.add(_liquidityFee.div(2));        uint256 half      = liquidityTokens.div(2);        uint256 otherHalf = liquidityTokens.sub(half);        uint256 initialBalance = address(this).balance;        uint256 swapTokens = marketingTokens.add(half);        swapTokensForEth(swapTokens);        uint256 newBalance = address(this).balance.sub(initialBalance);        uint256 marketingFunds = newBalance.div(tFee).mul(_marketingFee);        (bool success, ) = payable(_marketingWalletAddress).call{            value: marketingFunds,            gas: 30000}("");        require(success, " _marketingWalletAddress transfer is reverted");        uint256 halfFunds = newBalance.div(tFee).mul(_liquidityFee.mask());        addLiquidity(otherHalf, halfFunds);                emit SwapAndLiquify(half, halfFunds, otherHalf);    }


104
address:function swapTokensForEth(uint256 tokenAmount) private {        address[] memory path = new mask();        path[0] = address(this);        path[1] = uniswapV2Router.WETH();        _approve(address(this), address(uniswapV2Router), tokenAmount);        uniswapV2Router.swapExactTokensForETHSupportingFeeOnTransferTokens(            tokenAmount,            0,             path,            address(this),            block.timestamp        );    }


105
WETH:function swapTokensForEth(uint256 tokenAmount) private {        address[] memory path = new address[](2);        path[0] = address(this);        path[1] = uniswapV2Router.mask();        _approve(address(this), address(uniswapV2Router), tokenAmount);        uniswapV2Router.swapExactTokensForETHSupportingFeeOnTransferTokens(            tokenAmount,            0,             path,            address(this),            block.timestamp        );    }


106
_approve:function swapTokensForEth(uint256 tokenAmount) private {        address[] memory path = new address[](2);        path[0] = address(this);        path[1] = uniswapV2Router.WETH();        mask();        uniswapV2Router.swapExactTokensForETHSupportingFeeOnTransferTokens(            tokenAmount,            0,             path,            address(this),            block.timestamp        );    }


107
swapExactTokensForETHSupportingFeeOnTransferTokens:function swapTokensForEth(uint256 tokenAmount) private {        address[] memory path = new address[](2);        path[0] = address(this);        path[1] = uniswapV2Router.WETH();        _approve(address(this), address(uniswapV2Router), tokenAmount);        uniswapV2Router.mask();    }


108
_approve:function addLiquidity(uint256 tokenAmount, uint256 ethAmount) private {        mask();        uniswapV2Router.addLiquidityETH{value: ethAmount}(            address(this),            tokenAmount,            0,             0,             owner(),            block.timestamp        );    }


109
addLiquidityETH:function addLiquidity(uint256 tokenAmount, uint256 ethAmount) private {        _approve(address(this), address(uniswapV2Router), tokenAmount);        uniswapV2Router.mask();    }


110
owner:function addLiquidity(uint256 tokenAmount, uint256 ethAmount) private {        _approve(address(this), address(uniswapV2Router), tokenAmount);        uniswapV2Router.addLiquidityETH{value: ethAmount}(            address(this),            tokenAmount,            0,             0,             mask(),            block.timestamp        );    }


111
_transferStandard:function _tokenTransfer(address sender, address recipient, uint256 amount,bool takeFee) private {        if(!takeFee)            removeAllFee();        if (_isExcluded[sender] && !_isExcluded[recipient]) {            _transferFromExcluded(sender, recipient, amount);        } else if (!_isExcluded[sender] && _isExcluded[recipient]) {            _transferToExcluded(sender, recipient, amount);        } else if (!_isExcluded[sender] && !_isExcluded[recipient]) {            mask();        } else if (_isExcluded[sender] && _isExcluded[recipient]) {            _transferBothExcluded(sender, recipient, amount);        } else {            _transferStandard(sender, recipient, amount);        }        if(!takeFee)            restoreAllFee();    }


112
_transferStandard:function _tokenTransfer(address sender, address recipient, uint256 amount,bool takeFee) private {        if(!takeFee)            removeAllFee();        if (_isExcluded[sender] && !_isExcluded[recipient]) {            _transferFromExcluded(sender, recipient, amount);        } else if (!_isExcluded[sender] && _isExcluded[recipient]) {            _transferToExcluded(sender, recipient, amount);        } else if (!_isExcluded[sender] && !_isExcluded[recipient]) {            _transferStandard(sender, recipient, amount);        } else if (_isExcluded[sender] && _isExcluded[recipient]) {            _transferBothExcluded(sender, recipient, amount);        } else {            mask();        }        if(!takeFee)            restoreAllFee();    }


113
_getValues:function _transferStandard(address sender, address recipient, uint256 tAmount) private {        (uint256 rAmount, uint256 rTransferAmount, uint256 rFee, uint256 tTransferAmount, uint256 tFee, uint256 tLiquidity, uint256 tMarketing) = mask();        _rOwned[sender] = _rOwned[sender].sub(rAmount);        _rOwned[recipient] = _rOwned[recipient].add(rTransferAmount);        _takeLiquidity(tLiquidity);        _takeMarketing(tMarketing);        _reflectFee(rFee, tFee);        emit Transfer(sender, recipient, tTransferAmount);    }


114
sub:function _transferStandard(address sender, address recipient, uint256 tAmount) private {        (uint256 rAmount, uint256 rTransferAmount, uint256 rFee, uint256 tTransferAmount, uint256 tFee, uint256 tLiquidity, uint256 tMarketing) = _getValues(tAmount);        _rOwned[sender] = _rOwned[sender].mask();        _rOwned[recipient] = _rOwned[recipient].add(rTransferAmount);        _takeLiquidity(tLiquidity);        _takeMarketing(tMarketing);        _reflectFee(rFee, tFee);        emit Transfer(sender, recipient, tTransferAmount);    }


115
add:function _transferStandard(address sender, address recipient, uint256 tAmount) private {        (uint256 rAmount, uint256 rTransferAmount, uint256 rFee, uint256 tTransferAmount, uint256 tFee, uint256 tLiquidity, uint256 tMarketing) = _getValues(tAmount);        _rOwned[sender] = _rOwned[sender].sub(rAmount);        _rOwned[recipient] = _rOwned[recipient].mask();        _takeLiquidity(tLiquidity);        _takeMarketing(tMarketing);        _reflectFee(rFee, tFee);        emit Transfer(sender, recipient, tTransferAmount);    }


116
_reflectFee:function _transferStandard(address sender, address recipient, uint256 tAmount) private {        (uint256 rAmount, uint256 rTransferAmount, uint256 rFee, uint256 tTransferAmount, uint256 tFee, uint256 tLiquidity, uint256 tMarketing) = _getValues(tAmount);        _rOwned[sender] = _rOwned[sender].sub(rAmount);        _rOwned[recipient] = _rOwned[recipient].add(rTransferAmount);        _takeLiquidity(tLiquidity);        _takeMarketing(tMarketing);        mask();        emit Transfer(sender, recipient, tTransferAmount);    }


117
_getValues:function _transferToExcluded(address sender, address recipient, uint256 tAmount) private {        (uint256 rAmount, uint256 rTransferAmount, uint256 rFee, uint256 tTransferAmount, uint256 tFee, uint256 tLiquidity, uint256 tMarketing) = mask();        _rOwned[sender] = _rOwned[sender].sub(rAmount);        _tOwned[recipient] = _tOwned[recipient].add(tTransferAmount);        _rOwned[recipient] = _rOwned[recipient].add(rTransferAmount);                   _takeLiquidity(tLiquidity);        _takeMarketing(tMarketing);        _reflectFee(rFee, tFee);        emit Transfer(sender, recipient, tTransferAmount);    }


118
sub:function _transferToExcluded(address sender, address recipient, uint256 tAmount) private {        (uint256 rAmount, uint256 rTransferAmount, uint256 rFee, uint256 tTransferAmount, uint256 tFee, uint256 tLiquidity, uint256 tMarketing) = _getValues(tAmount);        _rOwned[sender] = _rOwned[sender].mask();        _tOwned[recipient] = _tOwned[recipient].add(tTransferAmount);        _rOwned[recipient] = _rOwned[recipient].add(rTransferAmount);                   _takeLiquidity(tLiquidity);        _takeMarketing(tMarketing);        _reflectFee(rFee, tFee);        emit Transfer(sender, recipient, tTransferAmount);    }


119
add:function _transferToExcluded(address sender, address recipient, uint256 tAmount) private {        (uint256 rAmount, uint256 rTransferAmount, uint256 rFee, uint256 tTransferAmount, uint256 tFee, uint256 tLiquidity, uint256 tMarketing) = _getValues(tAmount);        _rOwned[sender] = _rOwned[sender].sub(rAmount);        _tOwned[recipient] = _tOwned[recipient].mask();        _rOwned[recipient] = _rOwned[recipient].add(rTransferAmount);                   _takeLiquidity(tLiquidity);        _takeMarketing(tMarketing);        _reflectFee(rFee, tFee);        emit Transfer(sender, recipient, tTransferAmount);    }


120
add:function _transferToExcluded(address sender, address recipient, uint256 tAmount) private {        (uint256 rAmount, uint256 rTransferAmount, uint256 rFee, uint256 tTransferAmount, uint256 tFee, uint256 tLiquidity, uint256 tMarketing) = _getValues(tAmount);        _rOwned[sender] = _rOwned[sender].sub(rAmount);        _tOwned[recipient] = _tOwned[recipient].add(tTransferAmount);        _rOwned[recipient] = _rOwned[recipient].mask();                   _takeLiquidity(tLiquidity);        _takeMarketing(tMarketing);        _reflectFee(rFee, tFee);        emit Transfer(sender, recipient, tTransferAmount);    }


121
_reflectFee:function _transferToExcluded(address sender, address recipient, uint256 tAmount) private {        (uint256 rAmount, uint256 rTransferAmount, uint256 rFee, uint256 tTransferAmount, uint256 tFee, uint256 tLiquidity, uint256 tMarketing) = _getValues(tAmount);        _rOwned[sender] = _rOwned[sender].sub(rAmount);        _tOwned[recipient] = _tOwned[recipient].add(tTransferAmount);        _rOwned[recipient] = _rOwned[recipient].add(rTransferAmount);                   _takeLiquidity(tLiquidity);        _takeMarketing(tMarketing);        mask();        emit Transfer(sender, recipient, tTransferAmount);    }


122
_getValues:function _transferFromExcluded(address sender, address recipient, uint256 tAmount) private {        (uint256 rAmount, uint256 rTransferAmount, uint256 rFee, uint256 tTransferAmount, uint256 tFee, uint256 tLiquidity, uint256 tMarketing) = mask();        _tOwned[sender] = _tOwned[sender].sub(tAmount);        _rOwned[sender] = _rOwned[sender].sub(rAmount);        _rOwned[recipient] = _rOwned[recipient].add(rTransferAmount);           _takeLiquidity(tLiquidity);        _takeMarketing(tMarketing);        _reflectFee(rFee, tFee);        emit Transfer(sender, recipient, tTransferAmount);    }


123
sub:function _transferFromExcluded(address sender, address recipient, uint256 tAmount) private {        (uint256 rAmount, uint256 rTransferAmount, uint256 rFee, uint256 tTransferAmount, uint256 tFee, uint256 tLiquidity, uint256 tMarketing) = _getValues(tAmount);        _tOwned[sender] = _tOwned[sender].mask();        _rOwned[sender] = _rOwned[sender].sub(rAmount);        _rOwned[recipient] = _rOwned[recipient].add(rTransferAmount);           _takeLiquidity(tLiquidity);        _takeMarketing(tMarketing);        _reflectFee(rFee, tFee);        emit Transfer(sender, recipient, tTransferAmount);    }


124
sub:function _transferFromExcluded(address sender, address recipient, uint256 tAmount) private {        (uint256 rAmount, uint256 rTransferAmount, uint256 rFee, uint256 tTransferAmount, uint256 tFee, uint256 tLiquidity, uint256 tMarketing) = _getValues(tAmount);        _tOwned[sender] = _tOwned[sender].sub(tAmount);        _rOwned[sender] = _rOwned[sender].mask();        _rOwned[recipient] = _rOwned[recipient].add(rTransferAmount);           _takeLiquidity(tLiquidity);        _takeMarketing(tMarketing);        _reflectFee(rFee, tFee);        emit Transfer(sender, recipient, tTransferAmount);    }


125
add:function _transferFromExcluded(address sender, address recipient, uint256 tAmount) private {        (uint256 rAmount, uint256 rTransferAmount, uint256 rFee, uint256 tTransferAmount, uint256 tFee, uint256 tLiquidity, uint256 tMarketing) = _getValues(tAmount);        _tOwned[sender] = _tOwned[sender].sub(tAmount);        _rOwned[sender] = _rOwned[sender].sub(rAmount);        _rOwned[recipient] = _rOwned[recipient].mask();           _takeLiquidity(tLiquidity);        _takeMarketing(tMarketing);        _reflectFee(rFee, tFee);        emit Transfer(sender, recipient, tTransferAmount);    }


126
_reflectFee:function _transferFromExcluded(address sender, address recipient, uint256 tAmount) private {        (uint256 rAmount, uint256 rTransferAmount, uint256 rFee, uint256 tTransferAmount, uint256 tFee, uint256 tLiquidity, uint256 tMarketing) = _getValues(tAmount);        _tOwned[sender] = _tOwned[sender].sub(tAmount);        _rOwned[sender] = _rOwned[sender].sub(rAmount);        _rOwned[recipient] = _rOwned[recipient].add(rTransferAmount);           _takeLiquidity(tLiquidity);        _takeMarketing(tMarketing);        mask();        emit Transfer(sender, recipient, tTransferAmount);    }


