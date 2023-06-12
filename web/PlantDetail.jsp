<%-- 
    Document   : PlantDetail
    Created on : Mar 15, 2023, 4:26:18 PM
    Author     : User
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdnjs.cloudflare.com/ajax/libs/flowbite/1.6.4/flowbite.min.css"  rel="stylesheet" />
        <script src="https://cdn.tailwindcss.com"></script>
        <title>Plant Detail</title>
    </head>
    <body>
        <c:import url="navBar.jsp"></c:import>
        <c:choose>
            <c:when test="${requestScope.Plant!=null}">
                <div class="flex flex-row justify-center items-center bg-gray-50 w-full h-[90vh] dark:bg-gray-900">
                    <div class=" flex flex-row justify-center items-center max-w-screen-xl px-4 py-8 mx-auto lg:gap-8 xl:gap-0 lg:py-16 lg:grid-cols-12">
                        <div class="mr-auto place-self-center">
                            <h3 class="max-w-2xl mb-4 text-4xl font-extrabold tracking-tight leading-none md:text-5xl xl:text-6xl dark:text-white">${requestScope.Plant.getPname()}</h3>
                            <p class="max-w-2xl mb-6 font-light text-gray-500 lg:mb-8 md:text-lg lg:text-xl dark:text-gray-400">${requestScope.Plant.getCate()} - ${requestScope.Plant.getPrice()}<br>${requestScope.Plant.getDescription()}</p>
                            <form action="MainController" method="post">
                                <div class="flex flex-row justify-start items-center">
                            <input type="number" name="quantity" min="1" value="1" class="w-[30%] px-5 py-3 mr-3 text-base font-medium text-center text-black rounded-lg bg-primary-700 hover:bg-primary-800 focus:ring-4 focus:ring-primary-300 dark:focus:ring-primary-900">
                            <button type="submit" class="w-[30%]  mr-3 flex flex-row justify-center items-center text-base font-medium text-center text-black rounded-lg bg-white-700 hover:bg-primary-800 focus:ring-4 focus:ring-primary-300 dark:focus:ring-primary-900"><img src="https://img.icons8.com/external-tulpahn-outline-color-tulpahn/48/000000/external-add-to-cart-online-shopping-tulpahn-outline-color-tulpahn.png"/></button>
                                </div>
                            <input type="hidden" name="pid" value="${requestScope.Plant.getPID()}">
                            <input type="hidden" name="action" value="AddToCart">
                            </form>
                        </div>
                        <div class=" bg-white border border-gray-200 rounded-lg shadow lg:mt-0  lg:flex max-w-[40vw]">
                            <img src="image/${requestScope.Plant.getImagePath()}" alt="mockup">
                        </div>                
                    </div>
                </div>
            </c:when>
            <c:otherwise>
                <div>There is something wrong</div>
            </c:otherwise>
        </c:choose>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/flowbite/1.6.4/flowbite.min.js"></script>
    </body>
</html>
