<%-- 
    Document   : index
    Created on : Feb 8, 2023, 10:49:52 AM
    Author     : User
--%>

<%@page import="Obj.Account"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Obj.Plant"%>
<%@page import="MyDAO.PlantDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdnjs.cloudflare.com/ajax/libs/flowbite/1.6.4/flowbite.min.css"  rel="stylesheet" />
        <script src="https://cdn.tailwindcss.com"></script>
        <title>Plant Shop - Home</title>
    </head>
    <body>
        <c:import url="navBar.jsp"></c:import>
            <div class="w-full mt-20 flex flex-col items-center">
                <h1 class="mb-4 text-4xl font-extrabold leading-none tracking-tight text-gray-900 md:text-5xl lg:text-6xl dark:text-white">Browse out extensive collections</h1>
                <p class="w-2/3 mb-12 text-lg font-normal text-gray-500 lg:text-xl sm:px-16 xl:px-48 dark:text-gray-400">"Buying plants is a matter of trust in tomorrow." - Audrey Hepburn</p>

                <form class="w-1/2 mb-20" action="MainController" method="post">
                    <div class="flex">
                        <label for="search-dropdown" class="mb-2 text-sm font-medium text-gray-900 sr-only dark:text-white">Search</label>
                        <select name="searchBy" class="flex-shrink-0 z-10 inline-flex items-center py-2.5 px-4 text-sm font-medium text-center text-gray-900 bg-gray-100 border border-gray-300 rounded-l-lg hover:bg-gray-200 focus:ring-4 focus:outline-none focus:ring-gray-100 dark:bg-gray-700 dark:hover:bg-gray-600 dark:focus:ring-gray-700 dark:text-white dark:border-gray-600">
                            <option ${requestScope.searchBy!="Category"?"selected":""} value="Name" class="inline-flex w-full px-4 py-2 hover:bg-gray-100 dark:hover:bg-gray-600 dark:hover:text-white">
                                Name
                            </option>
                            <option ${requestScope.searchBy=="Category"?"selected":""} value="Category" class="inline-flex w-full px-4 py-2 hover:bg-gray-100 dark:hover:bg-gray-600 dark:hover:text-white">
                                Category
                            </option>
                        </select>
                        <div class="relative w-full">
                            <input type="text" name="keyword" id="search-dropdown" value="${requestScope.keyword}" placeholder="Search the name of plant you want" class="block p-2.5 w-full z-20 text-sm text-gray-900 bg-gray-50 rounded-r-lg border-l-gray-50 border-l-2 border border-gray-300 focus:ring-blue-500 focus:border-blue-500 dark:bg-gray-700 dark:border-l-gray-700  dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:border-blue-500">
                            <button type="submit" name="action" value="Search" class="absolute top-0 right-0 p-2.5 text-sm font-medium text-white bg-blue-700 rounded-r-lg border border-blue-700 hover:bg-blue-800 focus:ring-4 focus:outline-none focus:ring-blue-300 dark:bg-blue-600 dark:hover:bg-blue-700 dark:focus:ring-blue-800">
                                <svg aria-hidden="true" class="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M21 21l-6-6m2-5a7 7 0 11-14 0 7 7 0 0114 0z"></path></svg>
                                <span class="sr-only">Search</span>
                            </button>
                        </div>
                    </div>
                </form>

            </div>


        <c:choose>
            <c:when test="${requestScope.plantList==null}">

            </c:when>
            <c:when test="${requestScope.plantList.isEmpty()}">

            </c:when>
            <c:otherwise>
                <div class="flex flex-row flex-wrap justify-center items-start gap-20">
                    <c:forEach items="${requestScope.plantList}" var="p">

                        <div class="w-[15vw] bg-white border border-gray-200 rounded-lg shadow dark:bg-gray-800 dark:border-gray-700">
                            <a href="MainController?action=ViewPlantDetail&pID=${p.getPID()}">
                                <img class="rounded-t-lg object-cover" src="image/${p.getImagePath()}" alt="" />
                            </a>
                            <div class="p-5">
                                <a href="MainController?action=ViewPlantDetail&pID=${p.getPID()}">
                                    <h5 class="mb-2 text-2xl font-bold tracking-tight text-gray-900 dark:text-white">${p.getPname()}</h5>
                                </a>
                                <p class="mb-3 font-normal text-gray-700 dark:text-gray-400">${p.getCate()} - ${p.getPrice()}</p>
                                <a href="MainController?action=AddToCart&pid=${p.getPID()}" class="inline-flex items-center px-3 py-2 text-sm font-medium text-center text-white bg-blue-700 rounded-lg hover:bg-blue-800 focus:ring-4 focus:outline-none focus:ring-blue-300 dark:bg-blue-600 dark:hover:bg-blue-700 dark:focus:ring-blue-800">
                                    Add to Cart
                                    <svg aria-hidden="true" class="w-4 h-4 ml-2 -mr-1" fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg"><path fill-rule="evenodd" d="M10.293 3.293a1 1 0 011.414 0l6 6a1 1 0 010 1.414l-6 6a1 1 0 01-1.414-1.414L14.586 11H3a1 1 0 110-2h11.586l-4.293-4.293a1 1 0 010-1.414z" clip-rule="evenodd"></path></svg>
                                </a>
                            </div>
                        </div>

                    </c:forEach>

                </div>
            </c:otherwise>
        </c:choose>

        <script src="https://cdnjs.cloudflare.com/ajax/libs/flowbite/1.6.4/flowbite.min.js"></script>
    </body>
</html>
