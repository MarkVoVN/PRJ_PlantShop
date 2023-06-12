<%-- 
    Document   : navBar
    Created on : Mar 21, 2023, 11:36:01 PM
    Author     : User
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdnjs.cloudflare.com/ajax/libs/flowbite/1.6.4/flowbite.min.css"  rel="stylesheet" />
        <script src="https://cdn.tailwindcss.com"></script>
        <title>JSP Page</title>
    </head>
    <body>
        <header>
            <nav class="bg-white border-gray-400 px-4 lg:px-6 py-2.5 dark:bg-gray-800">
                <div class="flex flex-wrap justify-evenly items-center">
                    <div class="flex justify-start items-center">
                        <a href="PlantListServlet" class="flex mr-4">
                            <img src="image/logo.png" class="mr-3" width="50" height="50" alt="Plant Shop Logo" />
                            <span class="self-center text-2xl font-semibold whitespace-nowrap dark:text-white">Plant shop</span>
                        </a>
                    </div>
                    <div class="flex items-center lg:order-2">

                        <div class="hidden w-full md:block md:w-auto" id="navbar-default">
                            <ul class="flex flex-col p-4 mt-4 border border-gray-100 rounded-lg bg-gray-50 md:flex-row md:space-x-8 md:mt-0 md:text-sm md:font-medium md:border-0 md:bg-white dark:bg-gray-800 md:dark:bg-gray-900 dark:border-gray-700">
                                <c:choose>
                                    <c:when test="${sessionScope.acc!=null}">
                                        <li>
                                            <div class="block py-2 pl-3 pr-4 text-gray-700 rounded hover:bg-gray-100 md:hover:bg-transparent md:border-0 md:hover:text-blue-700 md:p-0 dark:text-gray-400 md:dark:hover:text-white dark:hover:bg-gray-700 dark:hover:text-white md:dark:hover:bg-transparent">
                                                <form action="MainController" method="post">
                                                    <input type="hidden" name="action" value="">
                                                    <button type="submit">Home</button>
                                                </form>
                                            </div>
                                        </li>
                                        <li>
                                            <div class="block py-2 pl-3 pr-4 text-gray-700 rounded hover:bg-gray-100 md:hover:bg-transparent md:border-0 md:hover:text-blue-700 md:p-0 dark:text-gray-400 md:dark:hover:text-white dark:hover:bg-gray-700 dark:hover:text-white md:dark:hover:bg-transparent">
                                                <form action="MainController" method="post">
                                                    <input type="hidden" name="action" value="ViewCart">
                                                    <button type="submit">Cart</button>
                                                </form>
                                            </div>
                                        </li>
                                        <li>
                                            <div class="block py-2 pl-3 pr-4 text-gray-700 rounded hover:bg-gray-100 md:hover:bg-transparent md:border-0 md:hover:text-blue-700 md:p-0 dark:text-gray-400 md:dark:hover:text-white dark:hover:bg-gray-700 dark:hover:text-white md:dark:hover:bg-transparent">
                                                <form action="MainController" method="post">
                                                    <input type="hidden" name="action" value="ViewOrderHistory">
                                                    <button type="submit">History</button>
                                                </form>
                                            </div>
                                        </li>
                                        <li>
                                            <div class="block py-2 pl-3 pr-4 text-gray-700 rounded hover:bg-gray-100 md:hover:bg-transparent md:border-0 md:hover:text-blue-700 md:p-0 dark:text-gray-400 md:dark:hover:text-white dark:hover:bg-gray-700 dark:hover:text-white md:dark:hover:bg-transparent">
                                                <form action="MainController" method="post">
                                                    <input type="hidden" name="action" value="ViewProfile">
                                                    <button type="submit">Profile</button>
                                                </form>
                                            </div>
                                        </li>
                                        <c:if test="${sessionScope.acc.getRole()==1}">
                                            <li>
                                                <div class="block py-2 pl-3 pr-4 text-gray-700 rounded hover:bg-gray-100 md:hover:bg-transparent md:border-0 md:hover:text-blue-700 md:p-0 dark:text-gray-400 md:dark:hover:text-white dark:hover:bg-gray-700 dark:hover:text-white md:dark:hover:bg-transparent">
                                                    <form action="MainController" method="post">
                                                        <input type="hidden" name="action" value="admin">
                                                        <button type="submit">Dashboard</button>
                                                    </form>
                                                </div>
                                            </li>
                                        </c:if>
                                        <li>
                                            <div class="block py-2 pl-3 pr-4 text-gray-700 rounded hover:bg-gray-100 md:hover:bg-transparent md:border-0 md:hover:text-blue-700 md:p-0 dark:text-gray-400 md:dark:hover:text-white dark:hover:bg-gray-700 dark:hover:text-white md:dark:hover:bg-transparent">
                                                <form action="MainController" method="post">
                                                    <input type="hidden" name="action" value="Logout">
                                                    <button type="submit">Logout</button>
                                                </form>
                                            </div>
                                        </li>
                                    </c:when>
                                    <c:otherwise>
                                        <li>
                                            <div class="block py-2 pl-3 pr-4 text-gray-700 rounded hover:bg-gray-100 md:hover:bg-transparent md:border-0 md:hover:text-blue-700 md:p-0 dark:text-gray-400 md:dark:hover:text-white dark:hover:bg-gray-700 dark:hover:text-white md:dark:hover:bg-transparent">
                                                <form action="MainController" method="get">
                                                    <input type="hidden" name="action" value="Login">
                                                    <button type="submit">Login</button>
                                                </form>
                                            </div>
                                        </li>
                                    </c:otherwise>
                                </c:choose>
                            </ul>
                        </div>
                    </div>
                </div>
            </nav>
        </header>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/flowbite/1.6.4/flowbite.min.js"></script>
    </body>
</html>
