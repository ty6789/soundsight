{
    id: '123';
    url: 'https://example.com/video.mp4';
    type: 'sports';
    isFavorite: false;
    isLiked: false;
    userId: '1';
    username: '用户';
    avatar: '2';
    likeCount: '0';
    favoriteCount: '0';
    isFollowed: false;
    descr: "暂无简介";
    coverURL: ""
}
let currentCategory = "recommendations";  // 默认分类，你可以根据你的应用来更改这个
let videoQueue = []; // 用于存储从后端接收到的视频列表
let playHistory = {};  // 初始化为空对象
let currentIndex = {};  // 初始化为空对象
let hasRunOnce = false;  // 全局变量，用于跟踪freshAll是否已经运行过
let myFavorite = false;
let myFollow = false;
let myFans = false;
let searchVideo = false;
let curVideos = [];
let curSearchVideos = [];
let curFavoriteVideos = [];
function freshAll() {
    if (!hasRunOnce && videoData && Object.keys(videoData).length !== 0) {
        console.log(videoData);
        videoData = videoData.replace(/[\x00-\x1F\x7F-\x9F]/g, "");
        console.log(videoData);
        hasRunOnce = true;  // 更新全局变量，标记freshAll已经运行过
        playVideo(JSON.parse(videoData));
        return;
    }
    var id = getCookie('userId');
    if (!id) id = -1;
    const apiUrl = `http://soundsight.ty666.cool/video/getVideoURL?userId=`+ `${id}`+` &category=${currentCategory}`;
    fetch(apiUrl, {
        method: 'GET',
    })
        .then(response => {
            if (!response.ok) {
                throw new Error(`HTTP error! Status: ${response.status}`);
            }
            return response.json();
        })
        .then(data => {
            if (data && data.length > 0) {
                console.log(data[0].isLiked);
                console.log(data[0].isFollowed);
                console.log(data[0]);
                videoQueue = data;
                if (videoQueue.length > 0) {
                    playVideo(videoQueue.shift());
                }
            } else {
                console.log("No videos found for category:", currentCategory);
            }
        })
        .catch(error => {
            console.error("Error fetching videos:", error);
        });
}

// 在页面加载时调用freshAll方法
window.onload = freshAll;
// 获取cookie
function getCookie(name) {
    const value = `; ${document.cookie}`;
    const parts = value.split(`; ${name}=`);
    if (parts.length === 2) return parts.pop().split(';').shift();
    return null;
}
// 设置cookie
function setCookie(name, value, days) {
    const date = new Date();
    date.setTime(date.getTime() + (days * 24 * 60 * 60 * 1000));
    const expires = `expires=${date.toUTCString()}`;
    document.cookie = `${name}=${value};${expires};path=/`;
}
document.querySelector('a[href="#recommendations"]').classList.add('active');

// 获取分类列表元素，并为其添加点击事件监听器
const categoryList = document.getElementById('category-list');
categoryList.addEventListener('click', function(event) {
    event.preventDefault();  // 阻止默认的链接行为
    const clickedElement = event.target;
    if (clickedElement.tagName === 'A') {
        event.preventDefault();  // 阻止默认的链接行为

        const clickedElement = event.target;

        // 检查是否点击了列表项内的链接
        if (clickedElement.tagName === 'A') {
            // 移除之前活动链接的活动状态
            const previousActiveLink = document.querySelector('.active');
            if (previousActiveLink) {
                previousActiveLink.classList.remove('active');
            }

            // 设置新的活动链接，并更新当前分类
            clickedElement.classList.add('active');
            currentCategory = clickedElement.getAttribute('href').substring(1);  // 获取链接的href属性，并移除'#'
            console.log(currentCategory);
        }
        freshAll();
    }
});

var favoritebutton = document.querySelector('.favorite-button');
var likebutton = document.querySelector('.like-button');
var followbutton = document.querySelector('.follow-button');
let isFavorited = false;  // 初始状态
let isLiked = false;
let isFollowed = false;
function toggleFavorite() {
    if (!getCookie('userId')){
        alert("请先登录");
        return;
    }
    isFavorited = !isFavorited;
    console.log(isFavorited);
    updateFavoriteStatus();
    updateFavoriteCount();
    disableClickForDuration(1000);
    const method = isFavorited ? 'POST' : 'DELETE';
    const userId = getCookie('userId');  // 获取用户ID
    console.log(userId);
    let categoryHistory = playHistory[currentCategory] || [];
    let categoryIndex = currentIndex[currentCategory] || 0;
    categoryHistory[categoryIndex].isFavorite = isFavorited;
    const itemId = categoryHistory[categoryIndex].id;  // 获取被收藏项的ID
    const itemType = categoryHistory[categoryIndex].type;
    if (isFavorited) {
        curFavoriteVideos.push(categoryHistory[categoryIndex]);
    }else {
        // 找到数组中id和type匹配的元素的索引
        let indexToRemove = curFavoriteVideos.findIndex(video => video.id === itemId && video.type === itemType);
        // 如果找到匹配项，则从数组中删除该项
        if (indexToRemove !== -1) {
            curFavoriteVideos.splice(indexToRemove, 1);
        }
    }
    fetch('/favorite', {
        method: method,
        headers: {
            'Content-Type': 'application/json',
        },
        body: JSON.stringify({userId, itemId, itemType}),
    }).then( ()=>{
        if (myFavorite) {
            displayFavorites(curFavoriteVideos);
        }else if (searchVideo) {
            freshSearchVideos();
        }else if (currentId !== -1) {
            freshCurIdVideos();
        }
    });
 }
function toggleLike() {
    if (!getCookie('userId')){
        alert("请先登录");
        return;
    }
    isLiked = !isLiked;
    console.log(isLiked);
    updateLikedStatus();
    updateLikedCount();
    disableClickForDuration(1000);
    const method = isLiked ? 'POST' : 'DELETE';
    const userId = getCookie('userId');  // 获取用户ID
    console.log(userId);
    let categoryHistory = playHistory[currentCategory] || [];
    let categoryIndex = currentIndex[currentCategory] || 0;
    console.log(categoryIndex);
    const itemId = categoryHistory[categoryIndex].id;  // 获取被收藏项的ID
    const itemType = categoryHistory[categoryIndex].type;
    console.log(categoryHistory[categoryIndex]);
    categoryHistory[categoryIndex].isLiked = isLiked;
    fetch('/like', {
        method: method,
        headers: {
            'Content-Type': 'application/json',
        },
        body: JSON.stringify({userId, itemId, itemType}),
    }).then( ()=>{
        if (myFavorite) {
            freshFavoriteVideos();
        }else if (searchVideo) {
            freshSearchVideos();
        }else if (currentId !== -1) {
            freshCurIdVideos();
        }
    });
}
async function shareVideo() {
    let categoryHistory = playHistory[currentCategory] || [];
    let categoryIndex = currentIndex[currentCategory] || 0;
    var videoId = categoryHistory[categoryIndex].id;
    var videoType = categoryHistory[categoryIndex].type;
    var videoUrl = "http://soundsight.ty666.cool/?videoId=" + videoId + "&videoType=" + videoType;
// 检查navigator.clipboard是否可用以及是否在安全上下文中
    if (navigator.clipboard && window.isSecureContext) {
        // 尝试使用Clipboard API
        navigator.clipboard.writeText(videoUrl)
            .then(() => {
                alert('已复制视频地址到剪切板');
            })
            .catch((err) => {
                console.error('复制失败', err);
                alert('复制失败');
            });
    } else {
        // Clipboard API不可用，使用fallback方案
        const textArea = document.createElement('textarea');
        textArea.value = videoUrl;
        textArea.style.position = 'fixed'; // 防止滚动到页面底部
        textArea.style.left = '-9999px'; // 使text area不在视窗中
        textArea.style.opacity = '0'; // 设置不可见
        document.body.appendChild(textArea);
        textArea.focus();
        textArea.select();
        try {
            // 执行复制命令
            const successful = document.execCommand('copy');
            if (successful) {
                alert('已复制视频地址到剪切板');
            } else {
                throw new Error('document.execCommand failed');
            }
        } catch (err) {
            // 如果execCommand失败了，可以在这里处理错误
            console.error('复制失败', err);
            alert('复制失败');
        } finally {
            // 清理：移除临时创建的textarea
            textArea.remove();
        }
    }

}
function toggleFollow() {
    if (!getCookie('userId')){
        alert("请先登录");
        return;
    }
    isFollowed = !isFollowed;
    console.log(isFollowed);
    updateFollowStatus();
    updateFollowText();
    disableClickForDuration(1000);
    const method = isFollowed ? 'POST' : 'DELETE';
    const userId = getCookie('userId');  // 获取用户ID
    console.log(userId);
    let categoryHistory = playHistory[currentCategory] || [];
    let categoryIndex = currentIndex[currentCategory] || 0;
    console.log(categoryIndex);
    console.log(categoryHistory[categoryIndex]);
    categoryHistory[categoryIndex].isFollowed = isFollowed;
    let followed = categoryHistory[categoryIndex].userId;
    fetch('/follow', {
        method: method,
        headers: {
            'Content-Type': 'application/json',
        },
        body: JSON.stringify({userId, followed}),
    }).then( ()=>{
        if (myFavorite) {
            freshFavoriteVideos();
        }else if (searchVideo) {
            freshSearchVideos();
        }else if (myFollow) {
            findMyFollow();
        }else if (currentId !== -1) {
            freshCurIdVideos();
        }
    });
}
function updateFavoriteStatus() {
    var icon = favoritebutton.querySelector('i');
    icon.style.color = isFavorited ? 'red' : 'white';
}
function updateFavoriteCount() {
    let categoryHistory = playHistory[currentCategory] || [];
    let categoryIndex = currentIndex[currentCategory] || 0;
    let favoriteCount = categoryHistory[categoryIndex].favoriteCount;
    // 根据状态增加或减少点赞数量
    if (isFavorited) {
        favoriteCount++;
    } else {
        favoriteCount--;
    }
    categoryHistory[categoryIndex].favoriteCount = favoriteCount;
    // 更新显示数量
    document.getElementById("favorite-count").textContent = `${favoriteCount}`;
}
function updateLikedStatus() {
    var icon = likebutton.querySelector('i');
    icon.style.color = isLiked ? 'blue' : 'white';
}
function updateLikedCount() {
    let categoryHistory = playHistory[currentCategory] || [];
    let categoryIndex = currentIndex[currentCategory] || 0;
    let likeCount = categoryHistory[categoryIndex].likeCount;
    // 根据状态增加或减少点赞数量
    if (isLiked) {
        likeCount++;
    } else {
        likeCount--;
    }
    categoryHistory[categoryIndex].likeCount = likeCount;
    // 更新显示数量
    document.getElementById("like-count").textContent = `${likeCount}`;
}
function updateFollowStatus() {
    var icon = followbutton.querySelector('i');
    icon.style.color = isFollowed ? 'yellow' : 'white';
}
function updateFollowText() {
    let icon = followbutton.querySelector('i');
    let text = followbutton.querySelector('span');

    if (isFollowed) {
        icon.className = 'fas fa-user-check';  // 修改为已关注的图标
        text.textContent = '已关注';
    } else {
        icon.className = 'fas fa-user-plus';   // 修改为关注的图标
        text.textContent = '关注';
    }
}
//播放下一个视频
function playNextVideo() {
    if(videoQueue.length === 0) {
        fetchVideosFromBackend();
    } else {
        const nextUrl = videoQueue.shift();
        playVideo(nextUrl);
    }
}
//从后端查找下一个视频
function fetchVideosFromBackend() {
    var id = getCookie('userId');
    if (!id) id = -1;
    const apiUrl = `http://soundsight.ty666.cool/video/getVideoURL?userId=`+ `${id}`+` &category=${currentCategory}`;
    fetch(apiUrl, {
        method: 'GET',
    }).then(response => {
        if (!response.ok) {
            throw new Error(`HTTP error! Status: ${response.status}`);
        }
        return response.json();
    }).then(data => {
        if(data && data.length > 0) {
            console.log("Received data from backend:", data);

            // 将后端返回的视频数据转换为视频对象数组
            videoQueue = data;
            // 播放第一个视频
            const firstVideo = videoQueue.shift();
            console.log(firstVideo);
            playVideo(firstVideo);
        }
    })
        .catch(error => {
            console.error("Error fetching videos:", error);
        });

}
function prevVideo() {
    getVideoURL("prev");
}

function nextVideo() {
    getVideoURL("next");
}

function getVideoURL(direction) {
    let categoryHistory = playHistory[currentCategory] || [];
    let categoryIndex = currentIndex[currentCategory] || 0;

    let actualDirection = direction;
    if (direction === "prev" && categoryHistory.length <= 1) {
        actualDirection = "next";
    }

    if (actualDirection === "next") {
        playNextVideo();
    } else if (actualDirection === "prev" && categoryIndex > 0) {
        categoryIndex--;  // 向后移动currentIndex
        currentIndex[currentCategory] = categoryIndex;  // 更新当前分类的索引
        categoryHistory.pop();
        console.log(categoryHistory);
        player.src({ type: 'video/mp4', src: categoryHistory[categoryIndex].url });
        player.play();
        // 更新点赞图标的颜色
        fresh(categoryHistory[categoryIndex]);
    }
}

function playVideo(video) {
    addVideoToHistory(video);
    if (currentIndex[currentCategory] === undefined) {
        currentIndex[currentCategory] = 0;
    } else {
        currentIndex[currentCategory]++;  // 更新currentIndex的值
    }
    player.src({ type: 'video/mp4', src: video.url });
    player.play();
    // 更新点赞图标的颜色
    fresh(video);
}

function fresh(video) {
    updateButtonVisibility();
    isFavorited = video.isFavorite;
    isLiked = video.isLiked;
    isFollowed = video.isFollowed;
    console.log(video);
    updateFavoriteStatus();
    updateLikedStatus();
    updateFollowStatus();
    updateFollowText();
    // 更新用户头像和用户名
    document.getElementById('other-avatar').style.backgroundImage = `url(${video.avatar})`;
    document.getElementById('other-username').textContent = video.username;
    document.getElementById('like-count').textContent = `${video.likeCount || 0}`;
    document.getElementById('favorite-count').textContent = `${video.favoriteCount || 0}`;

    // 更新视频简介
    document.getElementById('comments').innerHTML = `
        <p>${video.descr || '暂无简介'}</p>  
    `;
}


function addVideoToHistory(video) {
    if (!playHistory[currentCategory]) {
        playHistory[currentCategory] = [];
    }

    playHistory[currentCategory].push(video);

    if (playHistory[currentCategory].length > 10) {
        playHistory[currentCategory].shift();
        currentIndex[currentCategory]--;  // 更新currentIndex的值
    }
}

function handleMenuItemClick(action) {
    const phoneContainer = document.querySelector('.phone-screen');
    switch (action) {
        case 'qiniu':
            updatePhoneScreenWithNewContent();
            break;
        case 'login':
            fetch('http://soundsight.ty666.cool/login/login.html')
                .then(response => response.text())
                .then(data => {
                    phoneContainer.innerHTML = data;
                    // 3. 在此处动态加载JavaScript脚本
                    const script = document.createElement('script');
                    script.src = 'http://soundsight.ty666.cool/login/login.js';
                    // 将脚本添加到phoneContainer中，而不是body
                    phoneContainer.appendChild(script);
                })
                .catch(error => {
                    console.error("Error loading HTML: ", error);
                });
            break;
        case 'logout':
            setCookie('userId', "", -1);
            setCookie('username', "", -1);
            setCookie('avatar', "", -1);
            location.reload();
        case 'myFavorites':
            myFavorite = true;
            searchVideo = false;
            myFollow = false;
            myFans = false;
            currentId = -1;
            fetch('http://soundsight.ty666.cool/favorite/favorite.html')
                .then(response => response.text())
                .then(data => {
                    phoneContainer.innerHTML = data;
                    displayFavorites(curFavoriteVideos);
                })
                .catch(error => {
                    console.error("Error loading HTML: ", error);
                });
            break;
        case 'register':
            fetch('http://soundsight.ty666.cool/register/register.html')
                .then(response => response.text())
                .then(data => {
                    phoneContainer.innerHTML = data;
                    // 3. 在此处动态加载JavaScript脚本
                    const script = document.createElement('script');
                    script.src = 'http://soundsight.ty666.cool/register/register.js';
                    // 将脚本添加到phoneContainer中，而不是body
                    phoneContainer.appendChild(script);
                })
                .catch(error => {
                    console.error("Error loading HTML: ", error);
                });
            break;
        case 'search':
            searchVideo = true;
            myFavorite = false;
            myFollow = false;
            myFans = false;
            currentId = -1;
            fetch('http://soundsight.ty666.cool/search/search.html')
                .then(response => response.text())
                .then(data => {
                    phoneContainer.innerHTML = data;
                    addSearch();
                })
                .catch(error => {
                    console.error("Error loading HTML: ", error);
                });
            break;
        case 'myFollow':
            myFollow = true;
            myFavorite = false;
            searchVideo = false;
            myFans = false;
            currentId = -1;
            fetch('http://soundsight.ty666.cool/follow/follow.html')
                .then(response => response.text())
                .then(data => {
                    phoneContainer.innerHTML = data;
                    findMyFollow();
                })
                .catch(error => {
                    console.error("Error loading HTML: ", error);
                });
            break;
        case 'myFans':
            myFans = true;
            myFollow = false;
            myFavorite = false;
            searchVideo = false;
            currentId = -1;
            fetch('http://soundsight.ty666.cool/follow/follow.html')
                .then(response => response.text())
                .then(data => {
                    phoneContainer.innerHTML = data;
                    findMyFans();
                })
                .catch(error => {
                    console.error("Error loading HTML: ", error);
                });
            break;
        case 'myVideos':
            myFavorite = false;
            searchVideo = false;
            myFollow = false;
            myFans = false;
            currentId = -1;
            fetch('http://soundsight.ty666.cool/favorite/favorite.html')
                .then(response => response.text())
                .then(data => {
                    phoneContainer.innerHTML = data;
                    var myid = getCookie('userId');
                    findVideoById(myid);
                })
                .catch(error => {
                    console.error("Error loading HTML: ", error);
                });
            break;
        default:
            phoneContainer.innerHTML = "<div>选择无效。</div>";
    }
}

document.addEventListener('keydown', function(event) {
    switch(event.key) {
        case 'ArrowUp':
            prevVideo();
            break;
        case 'ArrowDown':
            nextVideo();
            break;
    }
});

var usernameElement = document.getElementById('username');  // 获取用户名元素
var dropdownContent = document.getElementById('dropdownContent');


// 假设这个变量表示用户是否已登录
var userLoggedIn = false;  // 更改为 true 如果用户已登录
const userId = getCookie('userId')
if (userId) {
    // 已登录
    userLoggedIn = true;
    // ... 其他逻辑
} else {
    // 未登录
    userLoggedIn = false;
    // ... 其他逻辑
}
if (userLoggedIn) {
    document.getElementById("avatar").style.backgroundImage = 'url(' + getCookie('avatar') + ')';
    usernameElement.textContent = getCookie('username');  // 设置用户名文本
    dropdownContent.innerHTML = `
        <div class="dropdown-item" onclick="handleMenuItemClick('logout')">退出登录</div>
        <div class="dropdown-item" onclick="handleMenuItemClick('myFavorites')">我的收藏</div>
        <div class="dropdown-item" onclick="handleMenuItemClick('myFollow')">我的关注</div>
        <div class="dropdown-item" onclick="handleMenuItemClick('myFans')">我的粉丝</div>
        <div class="dropdown-item" onclick="handleMenuItemClick('search')">搜索视频</div>
        <div class="dropdown-item" onclick="handleMenuItemClick('myVideos')">我的视频</div>
        <div class="dropdown-item" onclick="handleMenuItemClick('qiniu')">七牛云</div>
    `;
} else {
    usernameElement.textContent = '未登录';  // 设置未登录文本
    dropdownContent.innerHTML = `
        <div class="dropdown-item" onclick="handleMenuItemClick('login')">登录</div>
        <div class="dropdown-item" onclick="handleMenuItemClick('register')">注册</div>
    `;
}
var dropdown = document.querySelector('.dropdown');
var arrow = document.querySelector('.arrow');

dropdown.addEventListener('mouseenter', function() {
    arrow.classList.add('arrow-rotate');
});

dropdown.addEventListener('mouseleave', function() {
    arrow.classList.remove('arrow-rotate');
});


// 监听nav链接点击事件，更新currentCategory
document.querySelectorAll("nav a").forEach(link => {
    link.addEventListener("click", function() {
        currentCategory = this.innerText;
    });
});

let player = videojs('my-video');
player.volume(0.3);
player.on('ended', function() {
    playNextVideo();
});

function fetchFavorites() {
    console.log('函数开始');
    const userId = getCookie('userId');  // 假设你已经有了获取cookie的函数
    if (!userId) return;

    fetch(`http://soundsight.ty666.cool/video/getFavorites?userId=${userId}`)
        .then(response => {
            if (!response.ok) {
                throw new Error(`HTTP error! Status: ${response.status}`);
            }
            return response.json();
        })
        .then(data => {
            curFavoriteVideos = data;
        })
        .catch(error => {
            console.error('Error fetching favorites:', error);
        });
}
function    displayFavorites(favorites) {
    const container = document.getElementById('favorites-container');
    container.innerHTML = '';  // 清空现有内容

    favorites.forEach(favorite => {  // 删除index参数
        const videoItem = document.createElement('div');
        videoItem.className = 'video-item';
        const videoFrame = document.createElement('div');
        videoFrame.className = 'video-frame';
        const image = document.createElement('img');
        image.src = favorite.coverURL;  // 假设coverURL是视频封面的URL
        videoFrame.appendChild(image);

        const videoDescription = document.createElement('div');
        videoDescription.className = 'video-description';
        const descriptionText = document.createElement('p');
        descriptionText.textContent = favorite.descr;  // 假设description是视频描述的文本
        videoDescription.appendChild(descriptionText);

        videoItem.appendChild(videoFrame);
        videoItem.appendChild(videoDescription);

        container.appendChild(videoItem);
        // 添加click事件监听器到video-item
        videoItem.addEventListener('click', () => handleVideoItemClick(favorite));
    });
}
function addSearch() {
    const searchBox = document.getElementById('search-box');
    const searchBtn = document.getElementById('search-btn');

    // Add event listener for the button click
    searchBtn.addEventListener('click', searchFunction);

    // Add event listener for the 'Enter' key in the search box
    searchBox.addEventListener('keypress', function(e) {
        // Check if the key pressed is 'Enter'
        if (e.key === 'Enter') {
            searchFunction();
        }
    });
}

// The actual search function
function searchFunction() {
    const query = document.getElementById('search-box').value;
    console.log("Searching for:", query);

    console.log('函数开始');
    const userId = getCookie('userId');  // 假设你已经有了获取cookie的函数
    if (!userId) return;

    fetch(`http://soundsight.ty666.cool/video/search?keyWords=${query}&userId=${userId}`)
        .then(response => {
            if (!response.ok) {
                throw new Error(`HTTP error! Status: ${response.status}`);
            }
            return response.json();
        })
        .then(data => {
            curSearchVideos = data;
            displayFavorites(data);
        })
        .catch(error => {
            console.error('Error fetching favorites:', error);
        });
}
let isClickable = true;
function handleVideoItemClick(clientVideoObject) {
    if (isClickable) {
        playVideo(clientVideoObject);
    }
}
function disableClickForDuration(duration) {
    isClickable = false;
    setTimeout(() => {
        isClickable = true;
    }, duration);
}

function updateButtonVisibility() {
    if (shouldDisplayButton()) {
        followbutton.style.display = 'block';  // or 'inline-block' or whatever your preferred display value is
    } else {
        followbutton.style.display = 'none';
    }
}

function shouldDisplayButton() {
    let categoryHistory = playHistory[currentCategory] || [];
    let categoryIndex = currentIndex[currentCategory] || 0;
    return String(getCookie('userId')) !== String(categoryHistory[categoryIndex].userId);

}
function findMyFollow() {
    var userId = getCookie('userId');
    fetch('/follow/myFollow?userId=' + userId) // 替换为你的API终点
        .then(response => response.json())
        .then(data => {
            const container = document.getElementById('myFollow-container');
            container.innerHTML = '';  // 清空现有内容
            data.forEach(follower => {
                const followItem = document.createElement('div');
                followItem.className = 'follow-item';

                const img = document.createElement('img');
                img.src = follower.avatar; // 假设avatarUrl是头像的URL
                followItem.appendChild(img);

                const idText = document.createTextNode(follower.username); // 假设id是关注者的ID
                followItem.appendChild(idText);

                // 添加点击事件处理器
                followItem.addEventListener('click', () => {
                    if (isClickable) {
                        insertVideosHtml();
                        findVideoById(follower.id); // 假设id是关注者的ID
                    }
                });

                container.appendChild(followItem);
            });
        })
        .catch(error => {
            console.error('Error fetching followers:', error);
        });
}
function findMyFans() {
    var userId = getCookie('userId');
    fetch('/follow/myFans?userId=' + userId) // 替换为你的API终点
        .then(response => response.json())
        .then(data => {
            const container = document.getElementById('myFollow-container');
            container.innerHTML = '';  // 清空现有内容
            data.forEach(follower => {
                const followItem = document.createElement('div');
                followItem.className = 'follow-item';

                const img = document.createElement('img');
                img.src = follower.avatar; // 假设avatarUrl是头像的URL
                followItem.appendChild(img);

                const idText = document.createTextNode(follower.username); // 假设id是关注者的ID
                followItem.appendChild(idText);

                // 添加点击事件处理器
                followItem.addEventListener('click', () => {
                    if (isClickable) {
                        insertVideosHtml();
                        findVideoById(follower.id); // 假设id是关注者的ID
                    }
                });

                container.appendChild(followItem);
            });
        })
        .catch(error => {
            console.error('Error fetching followers:', error);
        });
}
let currentId = -1;
function findVideoById(id) {
    currentPage = 0;
    curVideos = [];
    currentId = id;
    loadMoreVideos(id);
}
function insertVideosHtml() {
    const phoneContainer = document.querySelector('.phone-screen');
    fetch('http://soundsight.ty666.cool/favorite/favorite.html')
        .then(response => response.text())
        .then(data => {
            phoneContainer.innerHTML = data;
        })
        .catch(error => {
            console.error("Error loading HTML: ", error);
        });
}

function updatePhoneScreenWithNewContent() {
    const phoneContainer = document.querySelector('.phone-screen');
    phoneContainer.innerHTML = '';
    phoneContainer.innerHTML = '<iframe class="no-border" src="http://soundsight.ty666.cool/qiniu/qiniu.html" height="400" width="200"></iframe>'
}

// 假设handleUserClick是你希望调用的函数
function handleUserClick() {
    let categoryHistory = playHistory[currentCategory] || [];
    let categoryIndex = currentIndex[currentCategory] || 0;
    insertVideosHtml();
    findVideoById(categoryHistory[categoryIndex].userId);
}

// 获取元素
var avatarElement = document.getElementById('other-avatar');
var usernameElement = document.getElementById('other-username');

// 为avatar元素添加点击事件监听器
avatarElement.addEventListener('click', handleUserClick);

// 为username元素添加点击事件监听器
usernameElement.addEventListener('click', handleUserClick);
function freshCurIdVideos() {
    let categoryHistory = playHistory[currentCategory] || [];
    let categoryIndex = currentIndex[currentCategory] || 0;
    var targetId = categoryHistory[categoryIndex].id;
    var targetType = categoryHistory[categoryIndex].type;
    let foundVideo = curVideos.find(video => video.id === targetId && video.type === targetType);
    if (foundVideo) {
        foundVideo.isFavorite = categoryHistory[categoryIndex].isFavorite;
        foundVideo.isLiked = categoryHistory[categoryIndex].isLiked;
        foundVideo.isFollowed = categoryHistory[categoryIndex].isFollowed;
        foundVideo.likeCount = categoryHistory[categoryIndex].likeCount;
        foundVideo.favoriteCount = categoryHistory[categoryIndex].favoriteCount;
    }
}
function freshSearchVideos() {
    let categoryHistory = playHistory[currentCategory] || [];
    let categoryIndex = currentIndex[currentCategory] || 0;
    var targetId = categoryHistory[categoryIndex].id;
    var targetType = categoryHistory[categoryIndex].type;
    let foundVideo = curSearchVideos.find(video => video.id === targetId && video.type === targetType);
    if (foundVideo) {
        foundVideo.isFavorite = categoryHistory[categoryIndex].isFavorite;
        foundVideo.isLiked = categoryHistory[categoryIndex].isLiked;
        foundVideo.isFollowed = categoryHistory[categoryIndex].isFollowed;
        foundVideo.likeCount = categoryHistory[categoryIndex].likeCount;
        foundVideo.favoriteCount = categoryHistory[categoryIndex].favoriteCount;
    }
}
function freshFavoriteVideos() {
    let categoryHistory = playHistory[currentCategory] || [];
    let categoryIndex = currentIndex[currentCategory] || 0;
    var targetId = categoryHistory[categoryIndex].id;
    var targetType = categoryHistory[categoryIndex].type;
    let foundVideo = curFavoriteVideos.find(video => video.id === targetId && video.type === targetType);
    if (foundVideo) {
        foundVideo.isFavorite = categoryHistory[categoryIndex].isFavorite;
        foundVideo.isLiked = categoryHistory[categoryIndex].isLiked;
        foundVideo.isFollowed = categoryHistory[categoryIndex].isFollowed;
        foundVideo.likeCount = categoryHistory[categoryIndex].likeCount;
        foundVideo.favoriteCount = categoryHistory[categoryIndex].favoriteCount;
    }
}
document.addEventListener('DOMContentLoaded', (event) => {
    fetchFavorites();
});
let currentPage = 0;
const pageSize = 5; // 假设每页加载10个项目
function addFavorites(newFavorites) {
    const container = document.getElementById('favorites-container');
    console.log("增加中...");
    console.log(newFavorites);
    // 只添加新的favorite items，而不是替换整个容器的innerHTML
    newFavorites.forEach(video => {
        const videoItem = document.createElement('div');
        videoItem.className = 'video-item';
        const videoFrame = document.createElement('div');
        videoFrame.className = 'video-frame';
        const image = document.createElement('img');
        image.src = video.coverURL;  // 假设coverURL是视频封面的URL
        videoFrame.appendChild(image);

        const videoDescription = document.createElement('div');
        videoDescription.className = 'video-description';
        const descriptionText = document.createElement('p');
        descriptionText.textContent = video.descr;  // 假设descr是视频描述的文本
        videoDescription.appendChild(descriptionText);

        videoItem.appendChild(videoFrame);
        videoItem.appendChild(videoDescription);

        container.appendChild(videoItem); // 这里不会清除现有的内容
        // 添加click事件监听器到video-item
        videoItem.addEventListener('click', () => handleVideoItemClick(video));
    });
}
let isLoading = false; // 这个变量用来跟踪加载状态
// 这个函数将用于加载更多数据，而不是重新加载所有数据
function loadMoreVideos(id) {
    if (isLoading) {
        return; // 如果正在加载中，就不继续进行新的加载
    }

    isLoading = true; // 开始加载，将加载状态设为true
    var myId = getCookie('userId');
    fetch(`http://soundsight.ty666.cool/video/findVideoById?id=${id}&myId=${myId}&page=${currentPage}&size=${pageSize}`)
        .then(response => {
            if (!response.ok) {
                throw new Error(`HTTP error! Status: ${response.status}`);
            }
            return response.json();
        })
        .then(newData => {
            curVideos.push(...newData); // 更新curVideos数组
            addFavorites(newData); // 只显示新加载的数据
            currentPage++; // 更新页码
            isLoading = false; // 加载完成，将加载状态设为false
        })
        .catch(error => {
            console.error('Error fetching videos:', error);
            isLoading = false; // 加载完成，将加载状态设为false
        });
}

// 获取滚动容器元素
const phoneScreen = document.querySelector('.phone-screen');

// 在滚动容器元素上添加滚动事件监听器
phoneScreen.addEventListener('scroll', () => {
    const bottomReached = phoneScreen.scrollHeight - phoneScreen.scrollTop - phoneScreen.clientHeight < 100;
    console.log(`底部接近: ${bottomReached}`); // 这会告诉我们是否真的接近底部
    console.log(`Scroll Height: ${phoneScreen.scrollHeight}`);
    console.log(`Scroll Top: ${phoneScreen.scrollTop}`);
    console.log(`Client Height: ${phoneScreen.clientHeight}`);
    if (bottomReached && currentId !== -1) {
        // 已接近或到达底部，可以加载更多内容
        loadMoreVideos(currentId);
    }
});


