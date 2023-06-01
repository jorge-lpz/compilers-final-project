# final-activity-compilers
---

## Description

Current functionalities:
- Filter rows based on conditions:
    - "more than [number] [column_name]"
    - "less than [number] [column_name]"
- Combining conditions with "and" or "or".

## Getting Started

### Dependencies

* GCC
* Lex
* Yacc

### Building and Running

To build and run the project:

```bash
make
./compiler.out input.txt
```

The above commands will generate Python code based on the query in `input.txt`. These commands must also be run from the `/activity` folder.

### Cleanup

To clean up generated files:

```bash
make clean
```

## Usage 

Example of input query:

```
Search all the results in results.csv with more than 10 points or less than 40 laps
```

Generated output:

```
import pandas as pd
df = pd.read_csv('results.csv')
df = df[(df['points'] > 10) or (df['laps'] < 40)]
```


## Authors

- Andrés Refugio Contreras Gutiérrez
- Carlos Estrada Ceballos
- Eduardo Esteva Camacho
- Ernesto López Villarreal
- Jorge Alejandro López Sosa
- Marian Alejandra Herrera Ayala 