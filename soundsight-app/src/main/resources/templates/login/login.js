
(function () {
    document.getElementById('loginForm').addEventListener('submit', function(event) {
        event.preventDefault();

        const username = document.getElementById('username1').value;
        const password = document.getElementById('password').value;

        const loginData = {
            username: username,
            password: password
        };
        console.log(loginData);

        // 将数据发送到后端验证
        fetch('http://localhost:8080/user/login', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json'
            },
            body: JSON.stringify(loginData)
        })
            .then(response => {
                return response.json();
            })
            .then(data => {
                if (data.userId) {
                    updatePhoneScreenWithNewContent();
                    setCookie("userId", data.userId, 1);
                    setCookie('username', data.username, 1);
                    setCookie('avatar', data.avatarUrl, 1);
                    location.reload();
                }
                alert(data.message);
            })
            .catch(error => {
                console.error('请求错误:', error);
                alert('登录失败，请稍后重试.');
            });
    });

    function updatePhoneScreenWithNewContent() {
        const phoneContainer = document.querySelector('.phone-screen');
        phoneContainer.innerHTML = '<iframe class="no-border" src="http://localhost:8080/qiniu/qiniu.html" height="400" width="200"></iframe>'
    }

    // 设置cookie
    function setCookie(name, value, days) {
        const date = new Date();
        date.setTime(date.getTime() + (days * 24 * 60 * 60 * 1000));
        const expires = `expires=${date.toUTCString()}`;
        document.cookie = `${name}=${value};${expires};path=/`;
    }

})();
