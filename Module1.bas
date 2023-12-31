Attribute VB_Name = "Module1"
Sub VBA_challenge()

'--------------------------------------------------------------------------------------------
'PART ONE - CREATE TABLE WITH FOLLOWING INFORMATION IN IT:
'Ticker
'Yearly change (from opening price at start of the year to closing price at end of that year)
'Percentage change (from opening price at start of year to closing price at end of that year)
'Total volume of stock
'--------------------------------------------------------------------------------------------

'Name the columns for the output table
Cells(1, 9).Value = "Ticker"
Cells(1, 10).Value = "Yearly Change"
Cells(1, 11).Value = "Percent Change"
Cells(1, 12).Value = "Total Stock Volume"

'Change column width to display text clearly
Columns("J").AutoFit
Columns("K").AutoFit
Columns("L").AutoFit

'Set a variable for holding the ticker name
Dim ticker_name As String

'Set a variable for holding the total volume of the ticker and set the value to 0
Dim ticker_volume_total As Double
ticker_volume_total = 0

'Set a variable for holding the opening value for a ticker
Dim opening_value As Double

'Set a variable for holding the closing vaue for a ticker
Dim closing_value As Double

'Set a variable to count the number of rows and establish the value
Dim LastRow As Long
LastRow = Cells(Rows.Count, 1).End(xlUp).Row

'Set a variable for keeping count of the number of rows for each ticker and set the value to 0
Dim row_count As Long
row_count = 0

'Set a variable to keep track of the location of each ticker name in the output table and set the value to 2
Dim output_table_row As Integer
output_table_row = 2

        'Loop through all tickers
        Dim i As Long
        For i = 2 To LastRow

        'Check if we are still within the same ticker name, if not...
         If Cells(i + 1, 1).Value <> Cells(i, 1).Value Then
    
            'Set the ticker name
            ticker_name = Cells(i, 1).Value
         
            'Print the ticker name in the ouput table
            Range("I" & output_table_row).Value = ticker_name
         
            'Add to the ticker volume total
            ticker_volume_total = ticker_volume_total + Cells(i, 7).Value
                     
            'Print the ticker volume total in the output table and format the number
            Range("L" & output_table_row).Value = ticker_volume_total
            Range("l" & output_table_row).NumberFormat = 0
            
            'Find the opening value for the ticker
            opening_value = Cells(i - row_count, 3).Value
                     
            'Find closing value for ticker
            closing_value = Cells(i, 6).Value
                     
            'Calculate yearly change and print value in output table
            yearly_change = closing_value - opening_value
            Range("J" & output_table_row).Value = yearly_change
            Range("J" & output_table_row).NumberFormat = "0.00"
           
            'Calcuate percent change, print value in the output table, and format the number
            percent_change = yearly_change / opening_value
            Range("K" & output_table_row).Value = percent_change
            Range("K" & output_table_row).NumberFormat = "0.00%"
                                 
            'Add one to the output table row
            output_table_row = output_table_row + 1
    
            'Reset the ticker total volume
            ticker_volume_total = 0
           
            'Reset row count to 0
             row_count = 0
                      
                'If the cell immediately following a row is the same brand, then...
                Else
    
                  'Add to the ticker volume total
                  ticker_volume_total = ticker_volume_total + Cells(i, 7).Value
         
                 'Add one to the row count
                  row_count = row_count + 1
              
       
           End If
           
      Next i

'---------------------------------------------------------------
'CONDITIONAL FORMAT THE YEARLY CHANGE AND PERCENT CHANGE COLUMN
'--------------------------------------------------------------

'Set a variable to count the number of rows in the output table and establish the value
Dim LastRow_table As Long
LastRow_table = Cells(Rows.Count, 1).End(xlUp).Row

           'Loop through all yearly change values
            Dim j As Long
            For j = 2 To LastRow_table
             
             'Check whether yearly change is greater than 0, if it is...
              If Cells(j, 10).Value > 0 Then
            
                    'Change the colour of the cell to green
                    Cells(j, 10).Interior.ColorIndex = 4
                    Cells(j, 11).Interior.ColorIndex = 4
            
              'Check if the yearly change is less than 0, if it is...
              ElseIf Cells(j, 10).Value < 0 Then
         
                    'Change the colour of the cell to red
                    Cells(j, 10).Interior.ColorIndex = 3
                    Cells(j, 11).Interior.ColorIndex = 3
    
               End If
               
        Next j
                          
End Sub


