<%-- 
    Document   : admin
    Created on : Mar 15, 2023, 10:04:09 AM
    Author     : User
--%>

<%@page import="Obj.Account"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdnjs.cloudflare.com/ajax/libs/flowbite/1.6.4/flowbite.min.css"  rel="stylesheet" />
        <script src="https://cdn.tailwindcss.com"></script>
        <title>Plant Shop - Admin</title>
    </head>
    <body>
        <c:choose>
            <c:when test="${sessionScope.acc!=null}">
                <c:choose>
                    <c:when test="${sessionScope.acc.getRole()==1}">
                        <c:import url="dashboard.jsp"></c:import>
                            <div class="w-full my-6 flex flex-col items-center">
                                <h1 class="mb-4 text-4xl font-extrabold leading-none tracking-tight text-gray-900 md:text-5xl lg:text-6xl dark:text-white">This is Admin Page</h1>
                                <p class="w-2/3 text-center mb-12 text-lg font-normal text-gray-500 lg:text-xl sm:px-16 xl:px-48 dark:text-gray-400">There are n new orders waiting to be processed</p>
                            </div>
                    </c:when>
                    <c:otherwise>
                        <div class="w-full my-6 flex flex-col items-center">
                            <h1 class="mb-4 text-4xl font-extrabold leading-none tracking-tight text-gray-900 md:text-5xl lg:text-6xl dark:text-white">Access Denied<</h1>
                            <p class="w-2/3 mb-12 text-lg font-normal text-gray-500 lg:text-xl sm:px-16 xl:px-48 dark:text-gray-400">Only admins can access this page</p>
                            <a href="MainController?action=PlantListServlet">Home</a>
                            <a href="MainController?action=Logout">Log out</a>
                        </div>


                    </c:otherwise>
                </c:choose>
            </c:when>
            <c:otherwise>
                <div class="w-full my-6 flex flex-col items-center">
                    <h1 class="mb-4 text-4xl font-extrabold leading-none tracking-tight text-gray-900 md:text-5xl lg:text-6xl dark:text-white">You must log in to access this page<</h1>
                    <p class="w-2/3 mb-12 text-lg font-normal text-gray-500 lg:text-xl sm:px-16 xl:px-48 dark:text-gray-400"><a href="MainController?action=Login">Log In</a></p>
                                
                </div>
                

            </c:otherwise>
        </c:choose>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/flowbite/1.6.4/flowbite.min.js"></script>
    </body>
</html>
