Use Windows.pkg
Use DFClient.pkg
Use cTextEdit.pkg
Use cSpellChecker_Mixin.pkg

Class cSpellTextEdit is a cTextEdit
  Import_Class_Protocol cSpellChecker_Mixin
  Procedure Construct_Object
    Forward Send Construct_Object
    // Mixins
    Send Define_SpellChecker_Mixin
  End_Procedure
  Procedure End_Construct_Object
    Forward Send End_Construct_Object      
    Send End_Define_SpellChecker_Mixin
  End_Procedure // Construct_Object
End_Class

Deferred_View Activate_oTestSpellCheck for ;
Object oTestSpellCheck is a dbView
  Set Border_Style to Border_Thick
  Set Size to 195 565
  Set Location to 2 1
  Set Label to "TestSpellCheck"

  Object oTextEdit1 is a cSpellTextEdit
    Set Size to 146 257
    Set Location to 14 16
    Set piFontSize to (12*18)
    Set Label to "Full SpellChecker"
    #IF (!@ > 191)
    Set pbSpellCheck to True
    #ENDIF
  End_Object

  Object oStdTextEdit is a cTextEdit
    Set Size to 146 257
    Set Location to 15 284
    Set Floating_Menu_Object to 0
    Set piFontSize to (12*18)
    Set Label to "Basic SpellChecker"
    Procedure Page_Object Boolean bPage
      Integer iOptions
      Forward Send Page_Object bPage
      If (bPage) Begin
        Get  Windows_Message EM_GETLANGOPTIONS 0 0 to iOptions
        Send Windows_Message EM_SETLANGOPTIONS 0 (iOptions ior IMF_SPELLCHECKING ior IMF_TKBPREDICTION)
      End
    End_Procedure // Page_Object
  End_Object

  Object oButton1 is a Button
    Set Location to 169 18
    Set Label to 'Set Value'
    Procedure OnClick
      Set value of oTextEdit1 to """
        For example using the text: the wordl has over 100 breeds of dogs
        the red-squiggly line on the word "wordl" and if you right-click it it returns suggestion - great!
        
        But not when you set the value directly - why!!?? Need to figure out how to force trigger a spell check!
        """
      Send RefreshSpellCheck of oTextEdit1
    End_Procedure // OnClick
  End_Object

  

Cd_End_Object
