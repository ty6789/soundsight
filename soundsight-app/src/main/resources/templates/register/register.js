
(function() {
    console.log("Script is loaded and running...");

    document.getElementById('registrationForm').addEventListener('submit', function(event) {
        event.preventDefault();

        const formData = new FormData(event.target);
        const username = formData.get('username');
        const password = formData.get('password');
        const confirmPassword = formData.get('confirmPassword');
        const selectedAvatar = formData.get('selectedAvatar');

        if(password !== confirmPassword) {
            alert('两次密码输入不一致，请重新输入');
            return;
        }

        const selectedPreferences = Array.from(document.querySelectorAll('.preference-item.selected'))
            .map(item => item.getAttribute('data-value'));

        const registrationData = {
            username: username,
            password: password,
            confirmPassword : confirmPassword,
            selectedAvatar: selectedAvatar, // 这里修改了属性名称
            preferences: selectedPreferences
        };
        console.log(registrationData);
        fetch('http://localhost:8080/user/register', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json'
            },
            body: JSON.stringify(registrationData)
        })
            .then(response => {
                if (response.ok) {
                    updatePhoneScreenWithNewContent();
                }
                return response.text();
            })
            .then(data => {
                alert(data);
            })
            .catch(error => {
                console.error('请求错误:', error);
            });
    });

    const avatarItems = document.querySelectorAll('.avatar-item');
    const selectedAvatarInput = document.getElementById('selectedAvatar');
    avatarItems[0].classList.add('selected');

    avatarItems.forEach((item, index) => {
        item.addEventListener('click', function() {
            console.log("Avatar clicked:", index + 1);

            // 移除所有其他头像的选中状态
            document.querySelectorAll('.avatar-item.selected').forEach(selectedItem => {
                selectedItem.classList.remove('selected');
            });

            // 为被点击的头像添加选中状态
            item.classList.add('selected');
            selectedAvatarInput.value = index + 1;
        });
    });

    const preferenceItems = document.querySelectorAll('.preference-item');

    preferenceItems.forEach(item => {
        item.addEventListener('click', function() {
            console.log("Preference clicked:", item.getAttribute('data-value'));
            item.classList.toggle('selected');
        });
    });


    document.getElementById('registrationForm').addEventListener('submit', function(event) {
        event.preventDefault();

        // 其他表单处理逻辑...

        // 获取选中的喜好
        const selectedPreferences = Array.from(document.querySelectorAll('.preference-item.selected'))
            .map(item => item.getAttribute('data-value'));

        console.log(selectedPreferences); // 输出选中的喜好，例如：["sport", "music"]

        // 你可以在这里处理或发送这些数据...
    });

    function updatePhoneScreenWithNewContent() {
        const phoneContainer = document.querySelector('.phone-screen');
        phoneContainer.innerHTML = '<iframe class="no-border" src="http://localhost:8080/qiniu/qiniu.html" height="400" width="200"></iframe>'
    }


})();



