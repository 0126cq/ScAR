# API Recommendation for Smart Contract Using Deep Learning from Augmented Code Representation
This is the dataset  for the paper ''API Recommendation for Smart Contract Using Deep Learning from Augmented Code Representation".


**Dataset directory**


text/：It is the processed data set, including training set, validation set, and test set. The name of the subfolder is the label, which is the recommended API. The files in the subfolder are the corresponding function samples, and the recommended points in the function are covered by "\<mask0>".


projects/：This is the test set of eight contract projects that have been processed, and the sub-file name is contract. The data format in the sub-file is:  
```
serial number  
label: function containing recommendation point.
```


**Main steps of dataset construction:**


During the process, the tools we used: JoranHonig. tree-sitter-solidity. https://github.com/JoranHonig/tree-sitter-solidity, 2022.


The main steps are as follows:

1.Use tree-sitter-solidity to extract functions in contracts

2.We perform the the pre-order traversal on AST for nodes whose ’type’ field’s value is *call_expression* which should be the root nodes for API calling statements.

3.Traverse under the root node of the API call statement to find the called API as a label.

4.Mask the API and its parameters called by the current function with "\<mask0>", and use the masked position as the recommended point.

**Other introduction**


The method proposed in our paper is applicable to all API features extracted according to the above data set construction methods. Considering the limited computing power, we selected the most widely used 98 APIs as our dataset. Each API selects 1400 samples to avoid the problem of data imbalance.
