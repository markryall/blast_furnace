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