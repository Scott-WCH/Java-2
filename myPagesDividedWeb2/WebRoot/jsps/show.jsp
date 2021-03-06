<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
  	<title>演示数据分页</title>
  	<link rel="stylesheet" href="<c:url value='/css/table.css' />" />
  	
  	<script type="text/javascript">
  		function sub(obj){
  			window.location.href="<c:url value='/PageServlet?page=' />"+obj.value;
  		}
  	</script>
  	
  </head>
  	
  <body>
  	 <h3>数据查询</h3>
  	 <form action="<c:url value='/PageServlet'/>" method="post">
     		ID:<input type="text" name="id" value="${person.id }"> &nbsp;
            姓名:<input type="text" name="name" value="${person.name }" > &nbsp;&nbsp;
     		<input type="submit" value="模糊查询">
 	 </form>
  
  	<h3>当前页的内容:</h3>
  	<table>
  		<tr><th>学号</th><th>姓名</th><th>地址</th><th>年龄</th></tr>
  		<c:forEach items="${result.datas}" var="map">
  			<tr>
  				<td>${map.id}</td>
  				<td>${map.name}</td>
  				<td>${map.address}</td>
  				<td>${map.age}</td>
  			</tr>
  		</c:forEach>
  	</table>
  	
  	
  	<c:if test="${result.currentPage!=1}">
  		<span class="pc">
  			<a href='<c:url value="/PageServlet?page=${result.currentPage-1}"></c:url>'>上一页</a>
  		</span>
  	</c:if>
  	
  	&nbsp;&nbsp;
  	<c:forEach begin="${showStart}" end="${showEnd}" var="idx">
		<c:if test="${idx==result.currentPage}" var="isNow">
			<span class=now>${idx}</span>
		</c:if>  		
  		<c:if test="${!isNow }">
  			<span class="pc">
  				<a href='<c:url value="/PageServlet?page=${idx}"></c:url>'>${idx}</a>
  			</span>
  		</c:if>
  		&nbsp;&nbsp;
  	</c:forEach>
  	
  	<c:if test="${result.currentPage!=result.pageCount}">
  		<span class="pc">
  			<a href="<c:url value='/PageServlet?page=${result.currentPage+1}'></c:url>">下一页</a>
  		</span>
  	</c:if>
  	<br/><br/>
  	
  	<!-- 复选框 -->
  	<select onchange="sub(this)">
  		<c:forEach begin="1" end="${result.pageCount}" var="idx">
  			<option <c:if test="${idx==result.currentPage}">selected="selected"</c:if> value="${idx}" >
  				第${idx}页
  			</option>
  		</c:forEach>
  	</select>
  	
  </body>
</html>
