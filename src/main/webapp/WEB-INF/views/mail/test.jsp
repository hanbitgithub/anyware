<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>      
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
  <style>
        .transfer-demo {
            width: 640px;
            height: 400px;
            margin: 0 auto;
        }

    </style>

    
<title>Insert title here</title>
 <!-- Bootstrap CSS -->
  <link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1q8mTJOASx8j1Au+a5WDVnPi2lkFfwwEAa8hDDdjZlpLegxhjVME1fgjWPGmkzs7" crossorigin="anonymous">
  <link rel="stylesheet" type="text/css" href="resources/css/multi-select.css">
  
  
   <link rel="stylesheet" type="text/css" href="resources/css/icon_font.css" />
    <link rel="stylesheet" type="text/css" href="resources/css/jquery.transfer.css?v=0.0.3" />
</head>
<body>
 <!-- start -->
  <h1>Pre-selected-options</h1>
  <select id='pre-selected-options' multiple='multiple'>   
  
   <optgroup label='Friends'>
    <option value='1'>Yoda</option>
    <option value='2'>Obiwan</option>
  </optgroup>
  <optgroup label='Enemies'>
    <option value='3'>Palpatine</option>
    <option value='4' disabled>Darth Vader</option>
  </optgroup>
    <option value='elem_1' selected>elem 1</option>
    <option value='elem_2'>elem 2</option>
    <option value='elem_3'>elem 3</option>
    <option value='elem_4' selected>elem 4</option>
    <option value='elem_100'>elem 100</option>
  </select>
 
 
  <!-- ends -->
  <!-- jQuery -->
  <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.0.0/jquery.min.js"></script>
  <!-- Bootstrap JavaScript -->
  <script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.0.0-alpha/js/bootstrap.min.js"></script>
  <script src="resources/js/jquery.multi-select.js"></script>
  
  <script type="text/javascript">
  // run pre selected options
  $('#pre-selected-options').multiSelect();
  </script>
  
 
 
 
  <div>
        <div id="transfer3" class="transfer-demo"></div> 
    </div>
  
  <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script type="text/javascript" src="resources/js/jquery.transfer.js?v=0.0.6"></script>
  <script>
    var groupDataArray1 = [
        {
            "groupName": "China",
            "groupData": [
                {
                    "city": "Beijing",
                    "value": 122
                },
                {
                    "city": "Shanghai",
                    "value": 643
                },
                {
                    "city": "Qingdao",
                    "value": 422
                },
                {
                    "city": "Tianjin",
                    "value": 622
                }
            ]
        },
        {
            "groupName": "Japan",
            "groupData": [
                {
                    "city": "Tokyo",
                    "value": 132
                },
                {
                    "city": "Osaka",
                    "value": 112
                },
                {
                    "city": "Yokohama",
                    "value": 191
                }
            ]
        }
    ];

    var settings3 = {
        "groupDataArray": groupDataArray1,
        "groupItemName": "groupName",
        "groupArrayName": "groupData",
        "itemName": "city",
        "valueName": "value",
        "callable": function (items) {
            console.dir(items)
        }
    };

    $("#transfer3").transfer(settings3);
    
    
    // get selected items
    var items = transfer.getSelectedItems()
    console.log("Manually get selected items: %o", items);
    
    
</script>


</body>
</html>