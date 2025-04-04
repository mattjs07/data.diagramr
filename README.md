# Package data.diagramr

This package contains function to easily create unicode diagrams of input to output data, to be easily copy/pasted at the beginning of scripts.

One passes vectors of strings and a shape to the function `create_data_diagram(inputs,outputs,shape)` 

```
create_data_diagram(
  inputs = "Input A", 
  outputs = c("Output A", "Output B"), 
  shape = "vertical")
```

Result: 
```
┌─────────┐ 
│ Input A │ 
└─────────┘ 
     ⬇ 
┌──────────┐ 
│ Output A │ 
└──────────┘ 
┌──────────┐ 
│ Output B │ 
└──────────┘ 
```

```
create_data_diagram(
  inputs = c("Input A", "Input B"), 
  outputs = c("Output A", "Output B"), 
  shape = "horizontal")
```

Result: 
```
┌─────────┐ ┌─────────┐     ┌──────────┐ ┌──────────┐ 
│ Input A │ │ Input B │ ==> │ Output A │ │ Output B │ 
└─────────┘ └─────────┘     └──────────┘ └──────────┘ 

```