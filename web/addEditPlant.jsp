<%-- 
    Document   : addEditPlant
    Created on : Mar 19, 2023, 11:24:22 PM
    Author     : User
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdnjs.cloudflare.com/ajax/libs/flowbite/1.6.4/flowbite.min.css"  rel="stylesheet" />

        <title>Plant Shop - ${param.action=="EditPlant"?"Edit Plant":"Add Plant"}</title>
    </head>
    <body>
        <c:import url="dashboard.jsp"></c:import>
            <div aria-hidden="true" class="bg-gray-50 dark:bg-gray-900 flex flex-col items-center justify-center px-6 py-8 mx-auto md:h-[90vh] lg:py-0">
                <div class="w-full my-6 flex flex-col items-center">
                    <h1 class="mb-4 text-4xl font-extrabold leading-none tracking-tight text-gray-900 md:text-5xl lg:text-6xl dark:text-white">${param.action=="EditPlant"?"Edit Plant":"Add Plant"}</h1>
                <!--                                <p class="w-2/3 text-center mb-12 text-lg font-normal text-gray-500 lg:text-xl sm:px-16 xl:px-48 dark:text-gray-400">There are n new orders waiting to be processed</p>-->
            </div>
            <div class="relative p-4 w-full max-w-2xl h-full md:h-auto">
                <!-- Modal content -->
                <div class="relative p-4 bg-white rounded-lg shadow dark:bg-gray-800 sm:p-5">
                    <!-- Modal header -->
<!--                    <div class="flex justify-between  text-center items-center pb-4 mb-4 rounded-t border-b sm:mb-5 dark:border-gray-600">
                        <h3 class="text-lg font-semibold text-gray-900 dark:text-white">
                            Update Product
                        </h3>
                    </div>-->
                    <!-- Modal body -->
                    <form action="FileUploadServlet" method="post" enctype="multipart/form-data">
                        <div class="grid gap-4 mb-4 sm:grid-cols-2">
                            <c:if test="${param.action == 'EditPlant'}">
                                <div>
                                    <label for="name" class="block mb-2 text-sm font-medium text-gray-900 dark:text-white">Plant ID</label>
                                    <input type="number" name="pid" value="${requestScope.p.getPID()}" readonly class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-primary-600 focus:border-primary-600 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-primary-500 dark:focus:border-primary-500">
                                </div>
                            </c:if>
                            <div>
                                <label class="block mb-2 text-sm font-medium text-gray-900 dark:text-white">Name</label>
                                <input type="text" name="Pname" value="${requestScope.p.getPname()}" class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-primary-600 focus:border-primary-600 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-primary-500 dark:focus:border-primary-500">
                            </div>
                            <div>
                                <label class="block mb-2 text-sm font-medium text-gray-900 dark:text-white">Price</label>
                                <input type="number" value="${requestScope.p.getPrice()}" name="Pprice" class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-primary-600 focus:border-primary-600 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-primary-500 dark:focus:border-primary-500">
                            </div>
                            <div>
                                <label class="block mb-2 text-sm font-medium text-gray-900 dark:text-white">Image Path</label>
                                <input type="text" value="${requestScope.p.getImagePath()}" name="PimagePath" class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-primary-600 focus:border-primary-600 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-primary-500 dark:focus:border-primary-500">
                            </div>
                            <div>
                                <label class="block mb-2 text-sm font-medium text-gray-900 dark:text-white">Description</label>
                                <input type="text" value="${requestScope.p.getDescription()}" name="Pdescription" class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-primary-600 focus:border-primary-600 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-primary-500 dark:focus:border-primary-500">
                            </div>
                            <div>
                                <label class="block mb-2 text-sm font-medium text-gray-900 dark:text-white">Category</label>
                                <select name="Pcategory" class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-primary-500 focus:border-primary-500 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-primary-500 dark:focus:border-primary-500">
                                    <c:forEach items="${requestScope.cate}" var="cate">
                                        <c:choose>
                                            <c:when test="${cate.getName()==requestScope.p.getCate()}">
                                                <option selected value="${cate.getName()}">${cate.getName()}</option>
                                            </c:when>
                                            <c:otherwise>
                                                <option value="${cate.getName()}">${cate.getName()}</option>
                                            </c:otherwise>
                                        </c:choose>
                                    </c:forEach>
                                </select>
                            </div>
                            <div>
                                <label class="block mb-2 text-sm font-medium text-gray-900 dark:text-white">Status</label>
                                <select name="Pstatus" class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-primary-500 focus:border-primary-500 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-primary-500 dark:focus:border-primary-500">
                                    <c:choose>
                                        <c:when test="${0==requestScope.p.getStatus()}">
                                            <option value="1">available</option>
                                            <option selected value="0">unavailable</option>
                                        </c:when>
                                        <c:otherwise>
                                            <option selected value="1">available</option>
                                            <option value="0">unavailable</option>
                                        </c:otherwise>
                                    </c:choose>
                                </select>
                            </div>
                            <div>
                                <label class="block mb-2 text-sm font-medium text-gray-900 dark:text-white">Image File</label>
                                <input type="file" name="img">
                            </div>
                        </div>
                        <div class="flex items-center space-x-4 w-full">
                            <button type="submit" name="action" value=${param.action=="EditPlant"?"UpdatePlant":"CreatePlant"} class="text-white bg-green-700 hover:bg-primary-800 focus:ring-4 focus:outline-none focus:ring-primary-300 font-medium rounded-lg text-sm px-5 py-2.5 text-center dark:bg-primary-600 dark:hover:bg-primary-700 dark:focus:ring-primary-800">
                                    ${param.action=="EditPlant"?"Update Plant":"Create Plant"}
                        </button>
                    </div>
                </form>
            </div>
        </div>
    </div>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/flowbite/1.6.4/flowbite.min.js"></script>
</body>
</html>
