<%-- 
    Document   : login
    Created on : Mar 14, 2023, 9:59:27 PM
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
        <title>Plant Shop - Login</title>
    </head>
    <body class="w-full h-full">
        <section class="bg-gray-50 dark:bg-gray-900 w-full h-full">
            <div class="flex flex-col items-center justify-center px-6 py-8 mx-auto md:h-screen lg:py-0 ">
                <div class=" w-2/3 bg-white rounded-lg shadow dark:border md:mt-0 sm:max-w-md xl:p-0 dark:bg-gray-800 dark:border-gray-700">
                    <div class="p-6 space-y-4 md:space-y-6 sm:p-8">
                        <div class="flex flex-row justify-center">
                            <a href="PlantListServlet" class="flex mr-4">
                                <img src="image/logo.png" class="mr-3" width="50" height="50" alt="Plant Shop Logo" />
                                <span class="self-center text-2xl font-semibold whitespace-nowrap dark:text-white">Plant shop</span>
                            </a>
                        </div>
                        <h1 class="text-xl font-bold leading-tight tracking-tight text-gray-900 md:text-2xl dark:text-white">
                            Sign in to your account
                        </h1>
                        <form class="space-y-4 md:space-y-6" action="MainController" method="post">
                            <div>
                                <label for="email" class="block mb-2 text-sm font-medium text-gray-900 dark:text-white">Your email</label>
                                <input type="email" name="txtemail" id="email" value="${requestScope.temail}" placeholder="email@yourCompany.com" value="${requestScope.tmpAcc.getEmail()}" class="bg-gray-50 border border-gray-300 text-gray-900 sm:text-sm rounded-lg focus:ring-primary-600 focus:border-primary-600 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500" required="">
                            </div>
                            <div>
                                <label for="password" class="block mb-2 text-sm font-medium text-gray-900 dark:text-white">Password</label>
                                <input type="password" name="txtpassword" id="password" placeholder="••••••••" class="bg-gray-50 border border-gray-300 text-gray-900 sm:text-sm rounded-lg focus:ring-primary-600 focus:border-primary-600 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500" required="">
                            </div>
                            <div class="flex items-center justify-between">
                                <div class="flex items-start">
                                    <div class="flex items-center h-5">
                                        <input id="remember" aria-describedby="remember" type="checkbox" value="rememberme" name="rememberme" class="w-4 h-4 border border-gray-300 rounded bg-gray-50 focus:ring-3 focus:ring-primary-300 dark:bg-gray-700 dark:border-gray-600 dark:focus:ring-primary-600 dark:ring-offset-gray-800">
                                    </div>
                                    <div class="ml-3 text-sm">
                                        <label for="remember" class="text-gray-500 dark:text-gray-300">Remember me</label>
                                    </div>
                                </div>
                            </div>
                            <c:if test="${requestScope.mess != null}">
                                <div class="text-sm font-medium m-12 text-red-600 dark:text-primary-500">${requestScope.mess}</div>
                            </c:if>
                            <button value="Login" name="action" type="submit" class="w-full text-white bg-green-600 hover:bg-green-700 focus:ring-4 focus:outline-none focus:ring-primary-300 font-medium rounded-lg text-sm px-5 py-2.5 text-center dark:bg-primary-600 dark:hover:bg-primary-700 dark:focus:ring-primary-800">Sign in</button>
                        
                        <p class="text-sm font-light text-gray-500 dark:text-gray-400">
                            Don’t have an account yet? 
                            <span class="font-medium text-green-600 hover:underline dark:text-primary-500">
                                <a href="MainController?action=RegisterAccount">Sign up</a>
                            </span>
                        </p>
                        </form>
                </div>
            </div>
        </section>

        <script src="https://cdnjs.cloudflare.com/ajax/libs/flowbite/1.6.4/flowbite.min.js"></script>
    </body>
</html>
