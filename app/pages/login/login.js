// pages/login/login.js
Page({

  /**
   * 页面的初始数据
   */
  data: {

  },

  /**
   * 生命周期函数--监听页面加载
   */
  onLoad: function (options) {

  },

  //授权登录
  userInfoHandler(e) {
    var that = this;
    wx.getUserProfile({
      desc: '获取你的昵称、头像、地区及性别', // 声明获取用户个人信息后的用途，后续会展示在弹窗中，请谨慎填写
      success: (res) => {
        wx.setStorageSync('userinfo', res.userInfo);
        that.setData({
          userinfo: res.userInfo,
        })
        wx.login({
          success: (res) => {
            var code = res.code;
            var datax = {
              code: code,
            };
            wx.request({
              url: 'http://movie.vaiwan.com/index.php/api/v1/login',
              data: {
                data: datax,
                data2: [that.data.userinfo.avatarUrl, that.data.userinfo.nickName],
              },
              success: function (res3) {
                wx.setStorageSync('id', res3.data.id);
                var res3 = res3;
                if (res3.statusCode != 200) {
                  wx.showToast({
                    title: '登录失败',
                    icon: 'none',
                    duration: 1500
                  })
                  return;
                }
                try {
                  var obj = JSON.parse(res3.data.tokenList);
                  wx.setStorageSync('key', obj.access_token);
                  wx.setStorageSync('key2', obj.refresh_token);
                  wx.reLaunch({
                    url: '../movies/index',
                    success: function (res) {
                      wx.showToast({
                        title: '登录成功',
                        icon: 'success',
                        duration: 1500
                      })
                    }
                  })
                } catch (e) {}
              },
              fail: function (e) {
                wx.showToast({
                  title: '登录失败',
                  icon: 'none',
                  duration: 1500
                })
              }
            })
          }
        })
      }
    })
  }
})