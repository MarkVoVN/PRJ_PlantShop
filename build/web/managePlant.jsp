<%-- 
    Document   : managePlant
    Created on : Mar 19, 2023, 11:09:24 PM
    Author     : User
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdnjs.cloudflare.com/ajax/libs/flowbite/1.6.4/flowbite.min.css"  rel="stylesheet" />

        <title>Plant Shop - Manage Plants</title>
    </head>
    <body>
        <c:choose>
            <c:when test="${sessionScope.acc!=null}">
                <c:choose>
                    <c:when test="${sessionScope.acc.getRole()==1}">
<c:import url="dashboard.jsp"></c:import>
                    <div class="w-full my-6 flex flex-col items-center">
                <h1 class="mb-4 text-4xl font-extrabold leading-none tracking-tight text-gray-900 md:text-5xl lg:text-6xl dark:text-white">Manage Plant</h1>
                <!--                                <p class="w-2/3 text-center mb-12 text-lg font-normal text-gray-500 lg:text-xl sm:px-16 xl:px-48 dark:text-gray-400">There are n new orders waiting to be processed</p>-->
            </div>
                        <div class="relative overflow-x-auto shadow-md sm:rounded-lg">
                            <table class="w-full text-sm text-left text-gray-500 dark:text-gray-400">
                                <thead class="text-xs text-gray-700 uppercase bg-gray-50 dark:bg-gray-700 dark:text-gray-400">
                                    <tr>
                                        <th scope="col" class="px-6 py-3">
                                            ID
                                        </th>
                                        <th scope="col" class="px-6 py-3">
                                            Image
                                        </th>
                                        <th scope="col" class="px-6 py-3">
                                            Name
                                        </th>
                                        <th scope="col" class="px-6 py-3">
                                            Price
                                        </th>
                                        <th scope="col" class="px-6 py-3">
                                            Category
                                        </th>
                                        <th scope="col" class="px-6 py-3">
                                            Description
                                        </th>
                                        <th scope="col" class="px-6 py-3">
                                            Status
                                        </th>
                                        <th scope="col" class="px-6 py-3">
                                            <a href="MainController?action=AddPlant"><img src="https://img.icons8.com/ios/32/000000/plus-2-math.png"/></a>
                                        </th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach var="item" items="${requestScope.plantList}">
                                        <tr class="bg-white border-b dark:bg-gray-800 dark:border-gray-700 hover:bg-gray-50 dark:hover:bg-gray-600">
                                            <form action="MainController" method="post">
                                            <td class="px-6 py-4">
                                                ${item.getPID()}
                                            </td>
                                            <td class="px-6 py-4">
                                                <img src="image/${item.getImagePath()}" width="100" height="100">
                                            </td>
                                            <th scope="row" class="px-6 py-4 font-medium text-gray-900 whitespace-nowrap dark:text-white">
                                                ${item.getPname()}
                                            </th>
                                            <td class="px-6 py-4">
                                                ${item.getPrice()}
                                            </td>
                                            <td class="px-6 py-4">
                                                ${item.getCate()}
                                            </td>
                                            <td class="px-6 py-4">
                                                ${item.getDescription()}
                                            </td>
                                            <td class="px-6 py-4">
                                                ${item.getStatus()==1?"available":"unavailable"}
                                            </td>
                                            <td class="px-6 py-4 text-right">
                                                <button type="submit" name="action" value="EditPlant" class="text-white bg-green-700 hover:bg-green-800 focus:outline-none focus:ring-4 focus:ring-green-300 font-medium rounded-full text-sm px-5 py-2.5 text-center mr-2 mb-2 dark:bg-green-600 dark:hover:bg-green-700 dark:focus:ring-green-800">Edit</button>
                                            </td>
                                            <input type="hidden" value="${item.getPID()}" name="pid">
                                            </form>                 
                                        </tr>
                                        </c:forEach>
                                </tbody>
<!--                                <tfoot>
                                    <tr class="font-semibold text-gray-900 dark:text-white">
                                        <td class="px-6 py-3"></td>
                                        <th scope="row" class="px-6 py-3 text-base">Total</th>
                                        <td class="px-6 py-3">${requestScope.totalQuantity}</td>
                                        <td class="px-6 py-3">${requestScope.totalMoney}</td>
                                        <td class="px-6 py-3"><a href="MainController?action=Checkout">Checkout</a></td>
                                        <td class="px-6 py-3"></td>
                                    </tr>
                                </tfoot>-->
                            </table>
                        </div>
                    </c:when>
                    <c:otherwise>
                        <h2>Access Denied</h2>
                        <p>Only admins can access this page</p>
                        <a href="MainController?action=PlantListServlet">Home</a>
                        <a href="MainController?action=Logout">Log out</a>
                    </c:otherwise>
                </c:choose>
            </c:when>
            <c:otherwise>
                <h2>You must log in to view profile</h2>
                <a href="MainController?action=Login">Log In</a>
            </c:otherwise>
        </c:choose>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/flowbite/1.6.4/flowbite.min.js"></script>
    </body>
</html>

