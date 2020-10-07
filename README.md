# TelescopeRoassal3
A connector to Roassal3 graphic engine

## Installation

To install Telescope and the Roassal3, you simply need to execute the following code snippet in a playground in Pharo 8:
```Smalltalk
Metacello new
    baseline: 'TelescopeRoassal3';
    repository: 'github://TelescopeSt/TelescopeRoassal3';
    load.
```

In Pharo 9, you may want to use the following script (in order to avoid odd warnings from Metacello):

```Smalltalk
[Metacello new
    baseline: 'Roassal3';
    repository: 'github://ObjectProfile/Roassal3';
    load ] on: MCMergeOrLoadWarning do: [:warning | warning load ]
```  

Note that this code snippet also loads Telescope, there is no need to load [Telescope](https://github.com/TelescopeSt/Telescope) therefore.

![alt](images/image.png)
