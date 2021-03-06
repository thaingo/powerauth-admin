<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<jsp:include page="header.jsp">
    <jsp:param name="pageTitle" value="PowerAuth 2.0 Admin - New Callback URL"/>
</jsp:include>

<ol class="breadcrumb">
    <li><a class="black" href="${pageContext.request.contextPath}/application/list">Applications</a></li>
    <li><a class="black" href="${pageContext.request.contextPath}/application/detail/<c:out value="${applicationId}"/>#callbacks">Application Detail</a></li>
    <li class="active">New Callback</li>
</ol>

<div class="row">
    <div class="col-sm-7">
        <div class="panel panel-default">
            <div class="panel-heading">
                <h3 class="panel-title">New Callback</h3>
            </div>
            <div class="panel-body">
                <form class="form-horizontal" method="POST" action="${pageContext.request.contextPath}/application/detail/<c:out value="${applicationId}"/>/callback/create/do.submit">
                    <div class="form-group">
                        <label for="name" class="col-sm-3 control-label">Callback Name</label>
                        <div class="col-sm-9">
                            <input type="text" id="name" name="name" class="form-control" value="${name}"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="callbackUrl" class="col-sm-3 control-label">Callback URL</label>
                        <div class="col-sm-9">
                            <input type="text" id="callbackUrl" name="callbackUrl" class="form-control" value="${callbackUrl}"/>
                        </div>
                    </div>
                    <div class="form-group text-right">
                        <div class="col-sm-9">
                            <c:if test="${not empty error}">
                                <span style="color: #c0007f; margin-left: 10px;"><c:out value="${error}"/></span>
                            </c:if>
                        </div>
                        <div class="col-sm-3">
                            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                            <input type="submit" value="Submit" class="btn btn-success"/>
                        </div>
                    </div>
                </form>
            </div>

        </div>
    </div>
    <div class="col-sm-5">
        <div class="panel panel-info">

            <div class="panel-heading">
                <h3 class="panel-title"><span class="glyphicon glyphicon-info-sign"></span> What are the callbacks?</h3>
            </div>

            <div class="panel-body">
                <p>
                    We will <span class="code">POST</span> a following JSON callback to the URL you
                    specify whenever an activation status changes.
                </p>
                <pre class="code"><code class="json">{
    "activationId": "$ACTIVATION_ID"
}</code></pre>
            </div>

        </div>
    </div>
</div>


<jsp:include page="footer.jsp"/>