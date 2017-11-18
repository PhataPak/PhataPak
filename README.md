PhataPak
========
The main (mono) repository for PhataPak

About
--------

- The main goal of this project is to provide reusable data for usage in and the development of PHP software.

- Data in this project is not limited to data about PHP (development) itself but can contain information about other languages, infrastructure and IT ecosystems.

- The data in this project is made available in the [Data Package](http://frictionlessdata.io/specs/data-package/) format and under the [PDDL](http://www.opendatacommons.org/licenses/pddl/1.0/) license.

- The data packages in this project are not meant to be comprehensive, complete or 'correct'.
They are meant to be reference points to apply [DRY principle](https://en.wikipedia.org/wiki/Don%27t_repeat_yourself) on a data level and to support data driven development approaches.  

Usage
-----

- Data packages will be able to be obtained as single composer packages or as or as composer packages containing all data packages of a specific (sub-)category (e.g: vcs).

- A [datapackage](packages/datapackage.json) in the packages root directory contains information about individual datapackages in the project and acts as a registry for them.

- To work with the datapackages in your PHP project you can use the [Data Package](https://github.com/frictionlessdata/datapackage-php) or [Table Schema](https://github.com/frictionlessdata/tableschema-php) libraries provided by [Frictionless Data](http://frictionlessdata.io/)

- To import datapackages into your project or into any other format we recommend the [PortPHP](https://github.com/portphp/portphp) library in conjunction with above packages.

Example
-------

A quick example on how to import a Data Package into your Database via [Doctrine ORM](http://www.doctrine-project.org/) using [Table Schema](https://github.com/frictionlessdata/tableschema-php) and [PortPHP Doctrine](https://github.com/portphp/doctrine):

```php
use Port\Doctrine\DoctrineWriter;
use Port\Reader\IteratorReader;
use Port\Steps\StepAggregator as Workflow;
use frictionlessdata\tableschema\Table;
// create a table object from the source files
$table = new Table("data.csv", "datapackage.json");
// since the Table class implements (SPL) Iterator, we can use a IteratorReader
$reader = new IteratorReader($table);
// create the Doctrine ObjectManager (please, see Doctrine's documentation)
[...]
// create a Doctrine Writer
/** @var \Doctrine\Common\Persistence\ObjectManager $objectManager */
$writer = new DoctrineWriter($objectManager, 'YourNamespace:EntityName');
$writer->prepare();
// create a workflow object to wire up the reader and writer
$workflow = (new Workflow($reader))->addWriter($writer);
// import the data
$result = $workflow->process()
```


Guidelines
------
- This project is made under a [Code of
Conduct](CODE_OF_CONDUCT.md).

- The software in these project should follow this [checklist](http://phppackagechecklist.com/#1,2,3,4,5,6,7,8,9,10,11,12,13,14), the [SOLID principles](https://en.wikipedia.org/wiki/SOLID_(object-oriented_design)) and the guidelines found in the [CONTRIBUTING](dev/CONTRIBUTING.md) file.


Licenses
--------

 - Software:
The software source code in this project is made available under the 'MIT License' which can be found in the project's 
[LICENSE](LICENSE) file or at: https://opensource.org/licenses/MIT  

- Data: 
The data in this project  is made available under the 'Public Domain Dedication and License v1.0' (PDDL) which can be found in the project's 
[DATA_LICENSE](DATA_LICENSE) file or at: http://www.opendatacommons.org/licenses/pddl/1.0/ .
A human-readable summary of the PDDL can be found at: https://opendatacommons.org/licenses/pddl/summary/


Third Party Copyrights
----------------------

 - The Icon used as a Logo for PhetaPak is copyright [Icons8](https://icons8.com) and licensed under [CC BY-ND 3.0](https://creativecommons.org/licenses/by-nd/3.0/)
