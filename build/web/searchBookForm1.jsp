<%-- 
    Document   : searchBookForm1
    Created on : Aug 9, 2021, 9:40:13 PM
    Author     : khangnt230
--%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Search Page</title>
    </head>
    <body>
        <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet">
        <div class="container">
            <div class="row">
                <!-- BEGIN SEARCH RESULT -->
                <div class="col-md-12">
                    <div class="grid search">
                        <div class="grid-body">
                            <div class="row">
                                <!-- BEGIN FILTERS -->
                                <div class="col-md-3">
                                    <h2 class="grid-title"><i class="fa fa-filter"></i> Filters</h2>
                                    <hr>

                                    <div class="padding"></div>

                                    <!-- search by money -->
                                    <h4>By range of money:</h4>

                                    <form action="Dispatcher" method="POST">
                                        Search By Range Of Money:<br/>
                                        Min Money <input type="text" name="txtMinMoney" value="${param.txtMinMoney}" required="required" /><br/>
                                        Max Money <input type="text" name="txtMaxMoney" value="${param.txtMaxMoney}" required="required"/><br/>
                                        <input type="submit" value="SEARCH_BY_RANGE_OF_MONEY" name="Action"/>
                                        <div class="input-group date form_date" data-link-field="dtp_input2">
                                            <button class="btn btn-primary" type="button"><i class="fa fa-search"></i></button>
                                        </div>
                                    </form>   


                                    <div class="padding"></div>

                                    <h4>By Category:</h4>
                                    <c:set var="listCategory" value="${requestScope.LIST_CATEGORY}"/>
                                    <c:if test="${not empty listCategory}">
                                        <form action="Dispatcher" method="POST">
                                            Search By Category: 
                                            <select name="categoryID">
                                                <c:forEach var="dto" items="${listCategory}">
                                                    <option value="${dto.categoryID}">${dto.categoryName}</option>
                                                </c:forEach>
                                            </select>
                                            <input type="submit" value="SEARCH_BY_CATEGORY" name="Action" />
                                        </form><br/>
                                    </c:if>
          
                                    <div class="padding"></div>
                                </div>
                                <!-- END FILTERS -->

                                <!-- BEGIN RESULT -->
                                <div class="col-md-9">
                                    <h2><i class="fa fa-file-o"></i> Result</h2>
                                    <hr>
                                    <!-- BEGIN SEARCH INPUT -->
                                    <div class="input-group">
                                        <form action="Dispatcher" method="POST">
                                            Search Book By Name: <input type="text" name="txtSearchValue" value="${param.txtSearchValue}" required="required"/>
                                            <input type="submit" value="SEARCH_BY_NAME" name="Action" />
                                        </form><br/>

                                    </div>
                                    <!-- END SEARCH INPUT -->

                                </div>
                            </div>

                            <style type="text/css">
                                body{margin-top:20px;
                                     background:#eee;
                                }

                                .btn {
                                    margin-bottom: 5px;
                                }

                                .grid {
                                    position: relative;
                                    width: 100%;
                                    background: #fff;
                                    color: #666666;
                                    border-radius: 2px;
                                    margin-bottom: 25px;
                                    box-shadow: 0px 1px 4px rgba(0, 0, 0, 0.1);
                                }

                                .grid .grid-body {
                                    padding: 15px 20px 15px 20px;
                                    font-size: 0.9em;
                                    line-height: 1.9em;
                                }

                                .search table tr td.rate {
                                    color: #f39c12;
                                    line-height: 50px;
                                }

                                .search table tr:hover {
                                    cursor: pointer;
                                }

                                .search table tr td.image {
                                    width: 50px;
                                }

                                .search table tr td img {
                                    width: 50px;
                                    height: 50px;
                                }

                                .search table tr td.rate {
                                    color: #f39c12;
                                    line-height: 50px;
                                }

                                .search table tr td.price {
                                    font-size: 1.5em;
                                    line-height: 50px;
                                }

                                .search #price1,
                                .search #price2 {
                                    display: inline;
                                    font-weight: 600;
                                }
                            </style>

                            <script type="text/javascript">

                            </script>
    </body>
</html>
