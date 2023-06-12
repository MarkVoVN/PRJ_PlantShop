<%-- 
    Document   : cart
    Created on : Mar 16, 2023, 8:55:08 AM
    Author     : User
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdnjs.cloudflare.com/ajax/libs/flowbite/1.6.4/flowbite.min.css"  rel="stylesheet" />
        <script src="https://cdn.tailwindcss.com"></script>
        <title>PlantShop - Order Details</title>
    </head>
    <body>
<c:import url="dashboard.jsp"></c:import>
                    <div class="w-full my-6 flex flex-col items-center">
                <h1 class="mb-4 text-4xl font-extrabold leading-none tracking-tight text-gray-900 md:text-5xl lg:text-6xl dark:text-white">Order Detail</h1>
                <!--                                <p class="w-2/3 text-center mb-12 text-lg font-normal text-gray-500 lg:text-xl sm:px-16 xl:px-48 dark:text-gray-400">There are n new orders waiting to be processed</p>-->
            </div>
        <c:choose>
            <c:when test="${requestScope.orderDetails!=null && !requestScope.orderDetails.isEmpty()}">
                
<div class="relative overflow-x-auto shadow-md sm:rounded-lg">
    <table class="w-full text-sm text-left text-gray-500 dark:text-gray-400">
        <thead class="text-xs text-gray-700 uppercase bg-gray-50 dark:bg-gray-700 dark:text-gray-400">
            <tr>
                <th scope="col" class="px-6 py-3">
                    Image
                </th>
                <th scope="col" class="px-6 py-3">
                    Name
                </th>
                <th scope="col" class="px-6 py-3">
                    Quantity
                </th>
                <th scope="col" class="px-6 py-3">
                    Price
                </th>
            </tr>
        </thead>
        <tbody>
                <c:forEach var="item" items="${requestScope.orderDetails}">
                
                <tr class="bg-white border-b dark:bg-gray-800 dark:border-gray-700 hover:bg-gray-50 dark:hover:bg-gray-600">
                    <form action="MainController" method="post">
                    <td class="px-6 py-4">
                        <img src="image/${item.key.getImagePath()}" width="100" height="100">
                    </td>
                    <th scope="row" class="px-6 py-4 font-medium text-gray-900 whitespace-nowrap dark:text-white">
                        ${item.key.getPname()}
                    </th>
                    <td class="px-6 py-4">
                        <input type="number" name="quantity" value="${item.value}" disabled="true" class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500" required>
                    </td>
                    <td class="px-6 py-4">
                        ${item.key.getPrice()}
                    </td>
                    <input type="hidden" value="${item.key.getPID()}" name="pid">
                    </form>                 
                </tr>
                </c:forEach>
        </tbody>
        <tfoot>
            <tr class="font-semibold text-gray-900 dark:text-white">
                <td class="px-6 py-3"></td>
                <th scope="row" class="px-6 py-3 text-base">Total</th>
                <td class="px-6 py-3">${requestScope.totalQuantity}</td>
                <td class="px-6 py-3">${requestScope.totalMoney}</td>
            </tr>
        </tfoot>
    </table>
</div>
                <h2>Order Information</h2>
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
                            Action
                        </th>

            </tr>
        </thead>
        <tbody>
        <form action="MainController" method="post">
            
                <tr class="bg-white border-b dark:bg-gray-800 dark:border-gray-700 hover:bg-gray-50 dark:hover:bg-gray-600">
                    <th class="px-6 py-4 font-medium text-gray-900 whitespace-nowrap dark:text-white">
                        <input type="int" disabled="" name="OrderID" value="${requestScope.order.getOrderID()}" class="bg-white-700">
                    </th>
                    <th class="px-6 py-4 font-medium text-gray-900 whitespace-nowrap dark:text-white">
                        ${requestScope.order.getAccID()}
                    </th>
                    <th class="px-6 py-4 font-medium text-gray-900 whitespace-nowrap dark:text-white">
                        ${requestScope.order.getOrderDate()}
                    </th>
                    <th class="px-6 py-4 font-medium text-gray-900 whitespace-nowrap dark:text-white">
                        <input type="date" value="${order.getShipDate()}" name="shipDate" min="${requestScope.min}" ${requestScope.schedulable?"":"readonly"}>
                    </th>
                    <th class="px-6 py-4 font-medium text-gray-900 whitespace-nowrap dark:text-white">
                        ${requestScope.order.getStatus()==1?"Processing":(requestScope.order.getStatus()==2?"Shipping":(requestScope.order.getStatus()==3?"Completed":"Canceled"))}
                    </th>
                    <c:choose>
                        <c:when test="${requestScope.schedulable}">
                            <td class="px-6 py-3">
                                <input type="hidden" name="action" value="ScheduleShippingDate">
                                <input type="submit" value="Schedule">
                            </td>
                        </c:when>
                        <c:otherwise>
                            <td class="px-6 py-3">
                                Cannot reschedule
                            </td>
                        </c:otherwise>
                    </c:choose>
                </tr>
        </form>
        </tbody>
    </table>
</div>


            </c:when>
            <c:otherwise>
                <div>Your cart is empty, return to Homepage to add item</div>
            </c:otherwise>
                
        </c:choose>

        <script src="https://cdnjs.cloudflare.com/ajax/libs/flowbite/1.6.4/flowbite.min.js"></script>
    </body>
</html>
