<%-- 
    Document   : manageAccount
    Created on : Mar 19, 2023, 10:11:40 PM
    Author     : User
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdnjs.cloudflare.com/ajax/libs/flowbite/1.6.4/flowbite.min.css"  rel="stylesheet" />

        <title>Plant Shop - Manage Accounts</title>
    </head>
    <body>
        <h1></h1>
        <c:choose>
            <c:when test="${sessionScope.acc!=null}">
                <c:choose>
                    <c:when test="${sessionScope.acc.getRole()==1}">
                        <c:import url="dashboard.jsp"></c:import>
                            <div class="w-full my-6 flex flex-col items-center">
                                <h1 class="mb-4 text-4xl font-extrabold leading-none tracking-tight text-gray-900 md:text-5xl lg:text-6xl dark:text-white">Manage Accounts</h1>
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
                                                <span class="sr-only">Details</span>
                                            </th>
                                            <th scope="col" class="px-6 py-3">
                                                <span class="sr-only">Block</span>
                                            </th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                    <c:forEach var="item" items="${requestScope.accList}">
                                        <tr class="bg-white border-b dark:bg-gray-800 dark:border-gray-700 hover:bg-gray-50 dark:hover:bg-gray-600">
                                    <form action="MainController" method="post">
                                        <td class="px-6 py-4">
                                            ${item.getAccID()}
                                        </td>
                                        <th scope="row" class="px-6 py-4 font-medium text-gray-900 whitespace-nowrap dark:text-white">
                                            ${item.getEmail()}
                                        </th>
                                        <td class="px-6 py-4">
                                            ${item.getFullname()}
                                        </td>
                                        <td class="px-6 py-4">
                                            ${item.getPhone()}
                                        </td>
                                        <td class="px-6 py-4">
                                            ${item.getRole()==1?"admin":"guest"}
                                        </td>
                                        <td class="px-6 py-4">
                                            ${item.getStatus()==1?"active":"blocked"}
                                        </td>
                                        <td class="px-6 py-4 text-right">
                                            <button type="submit" name="action" value="manageAccountDetail" class="text-white bg-green-700 hover:bg-green-800 focus:outline-none focus:ring-4 focus:ring-green-300 font-medium rounded-full text-sm px-5 py-2.5 text-center mr-2 mb-2 dark:bg-green-600 dark:hover:bg-green-700 dark:focus:ring-green-800">Details</button>
                                        </td>
                                        <td class="px-6 py-4 text-right">
                                            <button type="submit" name="action" value="${item.getStatus()==1?"BlockAccount":"UnblockAccount"}" class="text-white bg-green-700 hover:bg-green-800 focus:outline-none focus:ring-4 focus:ring-green-300 font-medium rounded-full text-sm px-5 py-2.5 text-center mr-2 mb-2 dark:bg-green-600 dark:hover:bg-green-700 dark:focus:ring-green-800">${item.getStatus()==1?"Block":"Unblock"}</button>
                                        </td>
                                        <input type="hidden" value="${item.getAccID()}" name="accID">
                                    </form>                 
                                    </tr>
                                </c:forEach>
                                </tbody>
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
