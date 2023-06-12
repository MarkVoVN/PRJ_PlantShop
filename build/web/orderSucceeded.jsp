<%-- 
    Document   : orderSucceeded
    Created on : Mar 16, 2023, 9:20:37 PM
    Author     : User
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdnjs.cloudflare.com/ajax/libs/flowbite/1.6.4/flowbite.min.css"  rel="stylesheet" />
        <title>Plant Shop - Order Succeeded</title>
    </head>
    <body>
        <c:import url="navBar.jsp"></c:import>
        <a href="MainController?action=">
            <div class="w-full h-full my-6 flex flex-col items-center justify-center">
            <h1 class="mb-4 text-4xl font-extrabold leading-none tracking-tight text-gray-900 md:text-5xl lg:text-6xl dark:text-white">Your Order has been placed</h1>
            <img src="image/checked.png" width="100" height="100" alt="mockup">
        </div>
        </a>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/flowbite/1.6.4/flowbite.min.js"></script>
    </body>
</html>
