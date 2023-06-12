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
        <title>PlantShop - Reorder</title>
    </head>
    <body>
        <c:import url="navBar.jsp"></c:import>
        <h2>CART CONTENT</h2>
        <c:choose>
            <c:when test="${requestScope.reorderInfo!=null && !requestScope.reorderInfo.isEmpty()}">
                
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
                
                <th scope="col" class="px-6 py-3">
                    <span class="sr-only">Edit</span>
                </th>
                <th scope="col" class="px-6 py-3">
                    <span class="sr-only">Delete</span>
                </th>
            </tr>
        </thead>
        <tbody>
                <c:forEach var="item" items="${requestScope.reorderInfo}">
                
                <tr class="bg-white border-b dark:bg-gray-800 dark:border-gray-700 hover:bg-gray-50 dark:hover:bg-gray-600">
                    <form action="MainController" method="post">
                    <td class="px-6 py-4">
                        <img src="image/${item.key.getImagePath()}" width="100" height="100">
                    </td>
                    <th scope="row" class="px-6 py-4 font-medium text-gray-900 whitespace-nowrap dark:text-white">
                        ${item.key.getPname()}
                    </th>
                    <td class="px-6 py-4">
                        <input type="number" name="quantity" value="${item.value}" class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500" required>
                    </td>
                    <td class="px-6 py-4">
                        ${item.key.getPrice()}
                    </td>
                    <td class="px-6 py-4 text-right">
                        <button type="submit" name="action" value="UpdateItemFromReorder" class="text-white bg-green-700 hover:bg-green-800 focus:outline-none focus:ring-4 focus:ring-green-300 font-medium rounded-full text-sm px-5 py-2.5 text-center mr-2 mb-2 dark:bg-green-600 dark:hover:bg-green-700 dark:focus:ring-green-800">Update</button>
                    </td>
                    <td class="px-6 py-4 text-right">
                        <button type="submit" name="action" value="DeleteItemFromReorder" class="text-white bg-red-700 hover:bg-red-800 focus:outline-none focus:ring-4 focus:ring-red-300 font-medium rounded-full text-sm px-5 py-2.5 text-center mr-2 mb-2 dark:bg-red-600 dark:hover:bg-red-700 dark:focus:ring-red-900">Delete</button>
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
                <td class="px-6 py-3"><a href="MainController?action=CheckoutReorder">Reorder</a></td>
                <td class="px-6 py-3"></td>
            </tr>
        </tfoot>
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
