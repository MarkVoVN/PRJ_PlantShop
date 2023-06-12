<%-- 
    Document   : registerAccount
    Created on : Mar 16, 2023, 11:22:23 PM
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
        <title>Plant Shop - Profile</title>
    </head>
    <body>
        <c:import url="navBar.jsp"></c:import>
        <c:choose>
            <c:when test="${sessionScope.acc!=null}">
                <section class="bg-gray-50 dark:bg-gray-900">
                    <div class="flex flex-col items-center justify-center px-6 py-8 mx-auto md:h-[90vh] lg:py-0">
                        <div class="w-full bg-white rounded-lg shadow dark:border md:mt-0 sm:max-w-md xl:p-0 dark:bg-gray-800 dark:border-gray-700">
                            <div class="p-6 space-y-4 md:space-y-6 sm:p-8">
                                <h1 class="text-xl font-bold leading-tight tracking-tight text-gray-900 md:text-2xl dark:text-white">
                                    Profile
                                </h1>
                                <form class="space-y-4 md:space-y-6" action="MainController" method="post">
                                    <div>
                                        <label class="block mb-2 text-sm font-medium text-gray-900 dark:text-white">Your email</label>
                                        <input type="email" name="email" value="${sessionScope.acc.getEmail()}" class="bg-gray-50 border border-gray-300 text-gray-900 sm:text-sm rounded-lg focus:ring-primary-600 focus:border-primary-600 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500" placeholder="name@company.com" required="">
                                    </div>
                                    <div class="flex flex row justify-between">
                                        <div class="w-[45%]">
                                            <label class="block mb-2 text-sm font-medium text-gray-900 dark:text-white">Full Name</label>
                                            <input type="text" name="fullName" value="${sessionScope.acc.getFullname()}" class="bg-gray-50 border border-gray-300 text-gray-900 sm:text-sm rounded-lg focus:ring-primary-600 focus:border-primary-600 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500" placeholder="Nguyen Van A" required="">
                                        </div>
                                        <div class="w-[45%]">
                                            <label class="block mb-2 text-sm font-medium text-gray-900 dark:text-white">Phone Number</label>
                                            <input type="tel" name="phoneNumber" value="${sessionScope.acc.getPhone()}" class="bg-gray-50 border border-gray-300 text-gray-900 sm:text-sm rounded-lg focus:ring-primary-600 focus:border-primary-600 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500" placeholder="" required="">
                                        </div>
                                    </div>
                                    <c:if test="${requestScope.mess != null}">
                                        <div class="text-sm font-medium m-12 text-black-600 dark:text-primary-500 text-center">${requestScope.mess}</div>
                                    </c:if>
                                    <div class="flex flex row justify-between">
                                        <button name="action" value="UpdateAccount" type="submit" class="w-[45%] text-white bg-green-600 hover:bg-green-700 focus:ring-4 focus:outline-none focus:ring-primary-300 font-medium rounded-lg text-sm px-5 py-2.5 text-center dark:bg-primary-600 dark:hover:bg-primary-700 dark:focus:ring-primary-800">Save</button>
                                        <a href="MainController?action=Logout" class="w-[45%] text-white bg-red-600 hover:bg-red-700 focus:ring-4 focus:outline-none focus:ring-primary-300 font-medium rounded-lg text-sm px-5 py-2.5 text-center dark:bg-primary-600 dark:hover:bg-primary-700 dark:focus:ring-primary-800">Logout</a>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </section>
            </c:when>
            <c:otherwise>
                <h2>You must log in to view profile</h2>
                <a href="MainController?action=Login">Log In</a>
            </c:otherwise>
        </c:choose>

        <script src="https://cdnjs.cloudflare.com/ajax/libs/flowbite/1.6.4/flowbite.min.js"></script>

    </body>
</html>
