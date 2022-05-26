*** Settings ***
Library  SeleniumLibrary
Resource    ../../Base/base.robot


*** Variables ***
${Q:Interview Disposition A:Attempted for two days and unable to reach}    //p[text()='Attempted for two days and unable to reach']
${Q:Home/Cell Phone}    //span[text()='Home/Cell Phone']/following::div[1]/div[@class='widget']/descendant::input

${Q:Search For Address}    //span[text()='Search for Address']/following::div[1]/div[@class='widget']/descendant::input
${Address}     South Side River Bourgeois Road, Subdivision A, Nova Scotia B0E 2X0, Canada
${Fisrt address}    //li[contains(.,'South Side')]

${Q:County of residence}    (//*[contains(text(),'County')])[1]/following::span[@title='Please choose an item'][1]

${A:County of residence}    //label[.//*[contains(text(),'County')]]/following-sibling::div//select
#//*[contains(text(),'County')][1]/following::ul[@role='listbox']/li[1]
${Country success}    (//*[contains(text(),'County')])[1]/following::i[@class="fa fa-check text-success"][1]

${Q:State}    //span[text()='State']/following::span[@title='Please choose an item'][1]
${A:State}    //label[.//span[.='State']]/following-sibling::div//select
#//*[contains(text(),'State')][1]/following::ul[@role='listbox']/li[1]
${State success}    //span[text()='State']/following::i[@class="fa fa-check text-success"][1]

${Q:Zipcode_error}     (//label[.//*[contains(text(),'Zip Code')]]/following-sibling::div//textarea[contains(@data-bind,'value: $data.rawAnswer')])[1]
${Q:Zipcode_normal}     (//label[.//*[contains(text(),'Zip Code')]]/following-sibling::div//textarea)[1]
${Zipcode success}    (//label[.//*[contains(text(),'Zip Code')]]/following-sibling::div//i[@class="fa fa-check text-success"])[1]
${Zipcode failure}    (//label[.//*[contains(text(),'Zip Code')]]/following-sibling::div//i[@class="fa fa-warning text-danger clickable"])[1]

#${Q:Zipcode_error}     (//span[contains(text(), 'Zip Code')])[1]/following::div[1]/div[@class='widget has-error']/descendant::textarea
#${Q:Zipcode_normal}     (//span[contains(text(), 'Zip Code')])[1]/following::div[1]/div[@class='widget']/descendant::textarea
#${Zipcode success}    (//span[contains(text(), 'Zip Code')])[1]/following::i[@class="fa fa-check text-success"][1]
#${Zipcode failure}    (//span[contains(text(), 'Zip Code')])[1]/following::i[@class="fa fa-warning text-danger clickable"][1]
${Q:Transer Patient A:No}  //p[contains(.,'No, do not transfer')]
${Q:Convert Contact A:Yes}  //p[contains(.,'Yes, convert contact/traveler to PUI')]

${Q:Interview Disposition A:Reached person, agreed to call}    //p[text()='Reached person, agreed to call']

${Q:Gender A:Female}    //p[text()='Female']
${Q:Race A:Asian}    //p[text()='Asian']
${Q:Ethnicity A:Hispanic/Latino}    //p[text()='Hispanic/Latino']


${Q:Initial interview complete A: Yes}    //p[contains(.,'Yes, the interview is successfully complete')]
${Q: Willing to receive SMS A: Yes}     //span[contains(.,'receive a daily survey via SMS?')]/following::p[contains(.,'Yes')][1]
${Q: Number confirm A: Yes}    //span[contains(.,'would like to receive the SMS on?')]/following::p[contains(.,'Yes')][1]   
${Q: Initial interview complete A: No}    //p[contains(.,'No, partial interview needing call back')]
${View/Update the rest of the Contact's info}    //label[contains(.,'View/Update')]
${Q:Initial interview disposition A: Refused}    //p[contains(.,'Reached person, refused to participate')]

*** Keywords *** 

Open Contact Monitoring Form
    Click Element    ${contact_monitoring_form}
    

Convert contact to PUI using CM form
        Open All Contacts Unassigned & Open menu
        ${contact_name}    Get Contact Name
        ${contact_created}   Set Contact Name
        Search in the case list    ${contact_name}
        Select Created Case    ${contact_created}
        Click Element    ${contact_monitoring_form}
        JS Click    ${initial_interview_disposition}
        JS Click    ${race}
        JS Click    ${ethnicity}
        JS Click    ${gender}
        JS Click    ${symptom_congestion}
        JS Click    ${symptom_fatigue}
        JS Click    ${symptom_fever}
        JS Click    ${symptom_runny_nose} 
#        JS Click    ${date_of_symptomp_onset}
        ${Yesterday's date}    Yesterday's Date
        Input Text    ${date_of_symptomp_onset}   ${Yesterday's date}
        JS Click    ${date_of_symptomp_onset}
        JS Click    ${Q:Convert Contact A:Yes}
        Submit Form and Check Success

Unable to reach (CM) 
   JS Click    ${Q:Interview Disposition A:Attempted for two days and unable to reach}
   ${Mobile number}    Generate Mobile Number
   Input Text       ${Q:Home/Cell Phone}     ${Mobile number}
   Add Address
   Submit Form and Check Success 
   

Add Address
   # Select Address
   Run Keyword And Ignore Error    Input Text    ${Q:Search For Address}   ${Address}
   Click Element    ${Fisrt address}
   Sleep    15s
   # Country
   Select Dropdown   ${Q:County of residence}    ${A:County of residence}

   # Zipcode
   Scroll Element Into View    ${Q:Zipcode_normal}
   Wait Until Element Is Visible    ${Zipcode failure}    80s
   Wait Until Element Is Enabled   ${Q:Zipcode_error}
   Clear Element Text    ${Q:Zipcode_error}
   Press Keys   ${Q:Zipcode_normal}   12345     TAB
   Wait Until Element Is Visible    ${Zipcode success}     30s
  
   # State
   Select Dropdown    ${Q:State}    ${A:State}
   
   # Do not Transfer
   JS Click    ${Q:Transer Patient A: No}
   
Reached and Agreed to Call (CM)   
   JS Click    ${Q:Interview Disposition A:Reached person, agreed to call}
   JS Click    ${Q:Gender A:Female}
   JS Click    ${Q:Race A:Asian}
   JS Click    ${Q:Ethnicity A:Hispanic/Latino}
   JS Click    ${Q:Transer Patient A: No}
   Submit Form and Check Success 
    
Requires Follow-up (CM)
     JS Click    ${symptom_fever}
     JS Click    ${symptom_chill}
     JS Click    ${date_of_symptomp_onset}
     ${Yesterday's date}    Yesterday's Date
     Input Text    ${date_of_symptomp_onset}   ${Yesterday's date}
     JS Click    ${date_of_symptomp_onset}
     JS Click    ${no_convert_pui}
     JS Click    ${Q:Transer Patient A: No}
     Submit Form and Check Success
      
Receive SMS (CM)
    JS Click    ${Q:Initial interview complete A: Yes}
    JS Click    ${Q: Willing to receive SMS A: Yes} 
    JS Click    ${Q: Number confirm A: Yes}  
    JS Click    ${no_convert_pui}
    JS Click    ${Q:Transer Patient A: No}
    Submit Form and Check Success 
    
    
Partial Interview Complete (CM)
    JS Click    ${View/Update the rest of the Contact's info}
    JS Click    ${Q:Initial interview complete A: No}
    JS Click    ${no_convert_pui}
    JS Click    ${Q:Transer Patient A: No}
    Submit Form and Check Success 
    
Interview Complete (CM)
    JS Click    ${Q:Initial interview disposition A: Refused} 
    JS Click    ${Q:Initial interview complete A: Yes}    
    Sleep    5s
    JS Click    ${no_convert_pui}    
    Sleep    5s
    Submit Form and Check Success 

    


