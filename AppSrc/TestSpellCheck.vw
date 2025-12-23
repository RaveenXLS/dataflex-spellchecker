Use Windows.pkg
Use DFClient.pkg
Use cTextEdit.pkg
Use cSpellTextEdit.pkg
Use cDbSpellTextEdit.pkg // Testing Only
Use cScrollingContainer.pkg

Deferred_View Activate_oTestSpellCheck for ;
Object oTestSpellCheck is a View
  Set Border_Style to Border_Thick
  Set Size to 195 565
  Set Location to 2 1
  Set Label to "TestSpellCheck"
  
  Object oScrollingContainer1 is a cScrollingContainer
    Object oScrollingClientArea1 is a cScrollingClientArea
      
      Object oSpellTextEdit is a cSpellTextEdit
        Set Size to 146 257
        Set Location to 14 16
        Set piFontSize to (12*18)
        Set Label to "Full SpellChecker"
        Set psDefLanguage to "en-NZ"
        Set pbSpellCheck to True
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
          Set value of oSpellTextEdit to """
            For example, using the text "the wordl has over 100 breeds of dogs", 
            a red squiggly line appears under the word "wordl", and right-clicking it returns a suggestion — great!
            """
          // This forces a Spell Check
          Send RefreshSpellCheck of oSpellTextEdit
        End_Procedure // OnClick
      End_Object
      
    End_Object
  End_Object
    
Cd_End_Object

