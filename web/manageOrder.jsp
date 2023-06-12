<%-- 
    Document   : orderHistory
    Created on : Mar 16, 2023, 10:30:30 PM
    Author     : User
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdnjs.cloudflare.com/ajax/libs/flowbite/1.6.4/flowbite.min.css"  rel="stylesheet" />
        <script src="https://cdn.tailwindcss.com"></script>
        <title>Your Order History</title>
    </head>
    <body>
        <c:import url="dashboard.jsp"></c:import>
            <div class="w-full my-6 flex flex-col items-center">
                <h1 class="mb-4 text-4xl font-extrabold leading-none tracking-tight text-gray-900 md:text-5xl lg:text-6xl dark:text-white">Manage Order</h1>
                <!--                                <p class="w-2/3 text-center mb-12 text-lg font-normal text-gray-500 lg:text-xl sm:px-16 xl:px-48 dark:text-gray-400">There are n new orders waiting to be processed</p>-->
            </div>
            <div>
                <form action="MainController" method="get">

                    <div class="w-full mb-12 flex flex-row justify-center items-center"> 
<!--                        <label for="default-search" class="mb-2 text-sm font-medium text-gray-900 sr-only dark:text-white"></label>-->
                        <div class="relative w-[33vw] text-sm">
                            <div class="absolute inset-y-0 left-0 flex items-center pl-3 pointer-events-none">
                                <svg aria-hidden="true" class="w-5 h-5 text-gray-500 dark:text-gray-400" fill="none" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M21 21l-6-6m2-5a7 7 0 11-14 0 7 7 0 0114 0z"></path></svg>
                            </div>
                            <input type="number" name="accID" min="1" value="${requestScope.accID}" class="block w-full p-4 pl-10 text-sm text-gray-900 border border-gray-300 rounded-lg bg-gray-50 focus:ring-blue-500 focus:border-blue-500 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500" placeholder="Search Order by Account ID">
                            <button type="submit" name="action" value="FilterOrdersByAccID" class="text-white absolute right-2.5 bottom-2.5 bg-green-700 hover:bg-green-800 focus:ring-4 focus:outline-none focus:ring-blue-300 font-medium rounded-lg text-sm px-4 py-2 dark:bg-blue-600 dark:hover:bg-blue-700 dark:focus:ring-blue-800">Search</button>
                        </div>
                    </div>
                    <div>
                </div>
                <div class="w-full mb-12 flex flex-row justify-center items-center ">
                    <!--                    <label class="block text-sm font-medium border border-gray-300 text-gray-900 dark:text-white">Status</label>-->
                    <div class="w-[33%] flex flex-row justify-center items-center border border-gray-300 text-gray-900  bg-gray-50 text-sm rounded-lg">
                    <select name="status" class="w-[90%] bg-gray-50 border-none focus:ring-blue-500 focus:border-blue-500 block p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500">
                        <option ${requestScope.status=="0"?"selected":""} value="0">Canceled</option>
                        <option ${requestScope.status=="1"?"selected":""} value="1">Processing</option>
                        <option ${requestScope.status=="2"?"selected":""} value="2">Shipping</option>
                        <option ${requestScope.status=="3"?"selected":""} value="3">Completed</option>
                        <option ${(requestScope.status=="-1"||requestScope.status==null)?"selected":""} value="-1">Status</option>
                    </select>
                    <button type="submit" name="action" value="FilterOrdersByStatus"><img src="image/icons8-funnel-50.png" width="35" height="35" alt=""/></button>
                    </div>
                </div>
                <div class="w-full mb-12 flex flex-row justify-center">
                    <div >            
                        <div date-rangepicker class="flex flex-row items-center">
                            <div class="relative">
                                <div class="absolute inset-y-0 left-0 flex items-center pl-3 pointer-events-none">
                                    <svg aria-hidden="true" class="w-5 h-5 text-gray-500 dark:text-gray-400" fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg"><path fill-rule="evenodd" d="M6 2a1 1 0 00-1 1v1H4a2 2 0 00-2 2v10a2 2 0 002 2h12a2 2 0 002-2V6a2 2 0 00-2-2h-1V3a1 1 0 10-2 0v1H7V3a1 1 0 00-1-1zm0 5a1 1 0 000 2h8a1 1 0 100-2H6z" clip-rule="evenodd"></path></svg>
                                </div>
                                <input name="dateFrom" type="text" value="${param.dateFrom}" class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full pl-10 p-2.5  dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500" placeholder="Select date start">
                            </div>
                            <span class="mx-4 text-gray-500">to</span>
                            <div class="relative">
                                <div class="absolute inset-y-0 left-0 flex items-center pl-3 pointer-events-none">
                                    <svg aria-hidden="true" class="w-5 h-5 text-gray-500 dark:text-gray-400" fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg"><path fill-rule="evenodd" d="M6 2a1 1 0 00-1 1v1H4a2 2 0 00-2 2v10a2 2 0 002 2h12a2 2 0 002-2V6a2 2 0 00-2-2h-1V3a1 1 0 10-2 0v1H7V3a1 1 0 00-1-1zm0 5a1 1 0 000 2h8a1 1 0 100-2H6z" clip-rule="evenodd"></path></svg>
                                </div>
                                <input name="dateTo" type="text" value="${param.dateTo}" class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full pl-10 p-2.5  dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500" placeholder="Select date end">
                            </div>
                            <button type="submit" name="action" value="FilterOrderHistoryByDate"><img src="image/icons8-funnel-50.png" width="35" height="35" alt=""/></button>

                        </div>
                    </div>

                </div>
            </form>
        </div>
        <c:choose>
            <c:when test="${requestScope.orderList!=null && !requestScope.orderList.isEmpty()}">

                <div class="relative overflow-x-auto shadow-md sm:rounded-lg">
                    <table class="w-full text-sm text-left text-gray-500 dark:text-gray-400">
                        <thead class="text-xs text-gray-700 uppercase bg-gray-50 dark:bg-gray-700 dark:text-gray-400">
                            <tr>
                                <th scope="col" class="px-6 py-3">
                                    Order ID
                                </th>
                                <th scope="col" class="px-6 py-3">
                                    Account ID
                                </th>
                                <th scope="col" class="px-6 py-3">
                                    Order Date 
                                </th>
                                <th scope="col" class="px-6 py-3">
                                    Ship Date
                                </th>
                                <th scope="col" class="px-6 py-3">
                                    Status
                                </th>
                                <th scope="col" class="px-6 py-3">
                                    <span class="sr-only">View Order's details</span>
                                </th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="order" items="${requestScope.orderList}">
                                <tr class="bg-white border-b dark:bg-gray-800 dark:border-gray-700 hover:bg-gray-50 dark:hover:bg-gray-600">
                            <form action="MainController" method="post">
                                <td class="px-6 py-4">
                                    ${order.getOrderID()}
                                </td>
                                <td class="px-6 py-4">
                                    ${order.getAccID()}
                                </td>
                                <th scope="row" class="px-6 py-4 font-medium text-gray-900 whitespace-nowrap dark:text-white">
                                    <fmt:formatDate pattern="dd-MM-yyyy" value="${order.getOrderDate()}"></fmt:formatDate>
                                    </th>
                                    <td class="px-6 py-4">
                                    <c:choose>
                                        <c:when test="${order.getShipDate()==null}">
                                            To be scheduled
                                        </c:when>
                                        <c:otherwise>
                                            <fmt:formatDate pattern="dd-MM-yyyy" value="${order.getShipDate()}"></fmt:formatDate>
                                        </c:otherwise>
                                    </c:choose>
                                </td>
                                <td class="px-6 py-4">
                                    ${order.getStatus()==1?"Processing":(order.getStatus()==2?"Shipping":(order.getStatus()==3?"Completed":"Canceled"))}
                                </td>
                                <td class="px-6 py-4 text-right">
                                    <button type="submit" name="action" value="ManageOrderDetails" class="text-white bg-green-700 hover:bg-green-800 focus:outline-none focus:ring-4 focus:ring-green-300 font-medium rounded-full text-sm px-5 py-2.5 text-center mr-2 mb-2 dark:bg-green-600 dark:hover:bg-green-700 dark:focus:ring-green-800">Details</button>
                                </td>
                                <input type="hidden" value="${order.getOrderID()}" name="OrderID">
                            </form>                 
                            </tr>
                        </c:forEach>
                        </tbody>

                    </table>
                </div>
            </c:when>
            <c:otherwise>
                <div>There is something wrong</div>
            </c:otherwise>

        </c:choose>

        <script src="https://cdnjs.cloudflare.com/ajax/libs/flowbite/1.6.4/flowbite.min.js"></script>
    </body>
</html>