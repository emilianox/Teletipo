getSpreadsheetByName = (filename) ->
  files = DriveApp.getFilesByName(filename)
  while files.hasNext()
    file = files.next()
    # open - undocumented function
    return SpreadsheetApp.open(file)  if file.getName() is filename
    # openById - documented but more verbose
    # return SpreadsheetApp.openById(files[i].getId());
  null

# Don's array approach - checks first column only
# With added stopping condition & correct result.
# From answer http://stackoverflow.com/a/9102463/1677912
# SpreadsheetApp.getActiveSheet().getLastRow(); a nivel de sheet
#  var ss = SpreadsheetApp.getActiveSpreadsheet();
# var sheet = ss.getSheets()[0];
# sheet.appendRow(["a man", "a plan", "panama"]); #write a nivel de sheet
getFirstEmptyRowByColumnArray =(range) ->
  values = range.getValues()
  ct = 0
  ct++  while values[ct] and values[ct][0] isnt ""
  ct + 1

###*
 * log in the spreadsheet
 * @param  {[type]} namespreadsheet [description]
 * @param  {[type]} namesheet       [description]
 * @param  {[type]} data            [description]
 * @return {[type]}                 [description]
###
saveLogInSpreadsheet = (namespreadsheet,namesheet,data) ->
  ss = getSpreadsheetByName(namespreadsheet)
  if ss is null
    ss = SpreadsheetApp.create(namespreadsheet)
    ss.insertSheet(namesheet, 1);
  SpreadsheetApp.setActiveSpreadsheet ss
  sheet = ss.getSheetByName(namesheet)
  sheet.appendRow(data)
