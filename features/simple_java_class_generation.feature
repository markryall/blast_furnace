Feature: Generating a simple java class

Scenario: creating an empty class without a namespace
  Given a file named "class.blast" with:
    """
    class ClassAClass
    """
  When I run `blast src class.blast`
  Then the file "src/ClassAClass.java" should contain exactly:
    """
    public class ClassAClass {
    }

    """

Scenario: creating an empty class in a namespace with in clause
  Given a file named "class.blast" with:
    """
    in com/organisation/application
    class ClassyClass
    """
  When I run `blast src class.blast`
  Then the file "src/com/organisation/application/ClassyClass.java" should contain exactly:
    """
    package com.organisation.application;

    public class ClassyClass {
    }

    """

Scenario: creating an empty class in a namespace in class name
  Given a file named "class.blast" with:
    """
    class com/organisation/application/ClassyClass
    """
  When I run `blast src class.blast`
  Then the file "src/com/organisation/application/ClassyClass.java" should contain exactly:
    """
    package com.organisation.application;

    public class ClassyClass {
    }

    """