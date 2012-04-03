Feature: Generating a simple java class

@wip
Scenario: creating an empty class without a namespace
  Given a file named "class.blast" with:
    """
    class ClassAClass
    """
  When I run `blast class.blast src`
  Then the file "src/ClassAClass.java" should contain exactly:
    """
    class ClassAClass {
    }
    """