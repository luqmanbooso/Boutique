<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="header.jsp" %>
<%@ page import="java.util.List" %>
<%@ page import="com.admin.model.FAQ" %>
<%@ page import="com.admin.dao.FAQDAO" %>

 <div class="faq-wrapper">
    <div class="faq-container">
        <div class="faq-header">
            
            <h2>FAQs</h2>
        </div>

        <!-- Start of dynamic FAQ content -->
        <%
        FAQDAO faqDao = new FAQDAO();
        List<FAQ> faqList = faqDao.getAllFAQs();

        for (FAQ faq : faqList) {	
        %>
            <div class="faq-item">
                <div class="faq-question">
                    <span style="font-weight:560;"><%= faq.getQuestion() %></span> <!-- Corrected -->
                    <span class="toggle">+</span>
                </div>
                <div class="faq-answer">
                    <p><%= faq.getAnswer() %></p> <!-- Corrected -->
                </div>
            </div>
        <%
        }
        %>
        <!-- End of dynamic FAQ content -->
    </div>
</div>
    <script>
        document.querySelectorAll('.faq-question').forEach(item => {
            item.addEventListener('click', () => {
                const answer = item.nextElementSibling;
                const toggle = item.querySelector('.toggle');

                if (answer.style.display === 'block') {
                    answer.style.display = 'none';
                    toggle.innerHTML = '+';
                } else {
                    answer.style.display = 'block';
                    toggle.innerHTML = '−';
                }

                item.classList.toggle('active');
            });
        });
    </script>
<%@ include file="footer.jsp" %>
