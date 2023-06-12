<%-- 
    Document   : orderHistory
    Created on : Mar 16, 2023, 10:30:30 PM
    Author     : User
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdnjs.cloudflare.com/ajax/libs/flowbite/1.6.4/flowbite.min.css"  rel="stylesheet" />

        <title>Your Order History</title>
    </head>
    <body>
        <c:import url="dashboard.jsp"></c:import>
            <div class="w-full my-6 flex flex-col items-center">
                <h1 class="mb-4 text-4xl font-extrabold leading-none tracking-tight text-gray-900 md:text-5xl lg:text-6xl dark:text-white">Account Info</h1>
                <!--                                <p class="w-2/3 text-center mb-12 text-lg font-normal text-gray-500 lg:text-xl sm:px-16 xl:px-48 dark:text-gray-400">There are n new orders waiting to be processed</p>-->
            </div>
            <div class="relative overflow-x-auto shadow-md sm:rounded-lg">
                <table class="w-full text-sm text-left text-gray-500 dark:text-gray-400">
                    <thead class="text-xs text-gray-700 uppercase bg-gray-50 dark:bg-gray-700 dark:text-gray-400">
                        <tr>
                            <th scope="col" class="px-6 py-3">
                                Account ID
                            </th>
                            <th scope="col" class="px-6 py-3">
                                Full name
                            </th>
                            <th scope="col" class="px-6 py-3">
                                Email
                            </th>
                            <th scope="col" class="px-6 py-3">
                                Phone
                            </th>
                            <th scope="col" class="px-6 py-3">
                                Role
                            </th>
                            <th scope="col" class="px-6 py-3">
                                Status
                            </th>
                            <th scope="col" class="px-6 py-3">
                                <span class="sr-only">Block</span>
                            </th>
                        </tr>
                    </thead>
                    <tbody>

                        <tr class="bg-white border-b dark:bg-gray-800 dark:border-gray-700 hover:bg-gray-50 dark:hover:bg-gray-600">
                    <form action="MainController" method="post">
                        <td class="px-6 py-4">
                        ${requestScope.acc.getAccID()}
                    </td>
                    <th scope="row" class="px-6 py-4 font-medium text-gray-900 whitespace-nowrap dark:text-white">
                        ${requestScope.acc.getEmail()}
                    </th>
                    <td class="px-6 py-4">
                        ${requestScope.acc.getFullname()}
                    </td>
                    <td class="px-6 py-4">
                        ${requestScope.acc.getPhone()}
                    </td>
                    <td class="px-6 py-4">
                        ${requestScope.acc.getRole()==1?"admin":"guest"}
                    </td>
                    <td class="px-6 py-4">
                        ${requestScope.acc.getStatus()==1?"active":"blocked"}
                    </td>
                    <td class="px-6 py-4 text-right">
                        <c:if test="${requestScope.acc.getStatus()!=1}">
                        <button type="submit" name="action" value="${requestScope.acc.getStatus()==1?"BlockAccount":"UnblockAccount"}" class="text-white bg-green-700 hover:bg-green-800 focus:outline-none focus:ring-4 focus:ring-green-300 font-medium rounded-full text-sm px-5 py-2.5 text-center mr-2 mb-2 dark:bg-green-600 dark:hover:bg-green-700 dark:focus:ring-green-800">${item.getStatus()==1?"Block":"Unblock"}</button>
                        </c:if>
                    </td>
                    <input type="hidden" value="${requestScope.acc.getAccID()}" name="accID">
                </form>                 
                </tr>

                </tbody>
            </table>

            <div class="w-full my-6 flex flex-col items-center">
                <h1 class="mb-4 text-xl font-bold leading-none tracking-tight text-gray-900 md:text-5xl lg:text-6xl dark:text-white">Order History</h1>
                <!--                                <p class="w-2/3 text-center mb-12 text-lg font-normal text-gray-500 lg:text-xl sm:px-16 xl:px-48 dark:text-gray-400">There are n new orders waiting to be processed</p>-->
            </div>
            <c:choose>
                <c:when test="${requestScope.OrderHistory!=null}">

                    <div class="relative overflow-x-auto shadow-md sm:rounded-lg">
                        <table class="w-full text-sm text-left text-gray-500 dark:text-gray-400">
                            <thead class="text-xs text-gray-700 uppercase bg-gray-50 dark:bg-gray-700 dark:text-gray-400">
                                <tr>
                                    <th scope="col" class="px-6 py-3">
                                        Order ID
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
                                <c:forEach var="order" items="${requestScope.OrderHistory}">

                                    <tr class="bg-white border-b dark:bg-gray-800 dark:border-gray-700 hover:bg-gray-50 dark:hover:bg-gray-600">
                                <form action="MainController" method="post">
                                    <td class="px-6 py-4">
                                        ${order.getOrderID()}
                                    </td>
                                    <th scope="row" class="px-6 py-4 font-medium text-gray-900 whitespace-nowrap dark:text-white">
                                        ${order.getOrderDate()}
                                    </th>
                                    <td class="px-6 py-4">
                                        ${order.getShipDate()==null?"Scheduling":order.getShipDate()}
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
                <c:when test="${requestScope.OrderHistory.isEmpty()}">
                    <div>This account has never placed an Order</div>
                </c:when>
                <c:otherwise>
                    <div>Your Order History is empty, return to Homepage to add item to cart, visit Cart to checkout</div>
                </c:otherwise>

            </c:choose>

            <script src="https://cdnjs.cloudflare.com/ajax/libs/flowbite/1.6.4/flowbite.min.js"></script>
    </body>
</html>
