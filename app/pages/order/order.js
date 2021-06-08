// pages/order/order.js
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
    var token = wx.getStorageSync('key');
    if (token) {

    } else {
      wx.reLaunch({
        url: '../../login/login',
      })
    }
    var userid = wx.getStorageSync('id');
    wx.request({
      url: 'http://movie.vaiwan.com/index.php/api/v1/indexorder',
      data: {
        userid: userid
      },
      success: (res) => {
        this.setData({
          orderlist: res.data.data
        })
      }
    })
  },
  orderint: function (e) {
    var that = this;
    wx.navigateTo({
      url: '../book/book',
      success: (res) => {
        res.eventChannel.emit('orderint', {
          data: that.data.orderlist[e.currentTarget.dataset.index]
        })
      }
    })
  },

  deleteorder: function (e) {
    var userid = wx.getStorageSync('id');
    var that = this;
    wx.showModal({
      title: '取消订单',
      content: '确认要取消该订单吗？',
      success: function (res) {
        if (res.confirm) {
          wx.request({
            url: 'http://movie.vaiwan.com/index.php/api/v1/deleteorder',
            data: {
              userid,
              orderid: that.data.orderlist[e.currentTarget.dataset.index].id
            },
            success: (res) => {
              that.onLoad();
              wx.showToast({
                title: '取消成功',
                icon: 'success',
                duration: 1500
              })
            }
          })
        } else {}
      }
    })
  },

  /**
   * 生命周期函数--监听页面初次渲染完成
   */
  onReady: function () {

  },

  /**
   * 生命周期函数--监听页面显示
   */
  onShow: function () {

  },

  /**
   * 生命周期函数--监听页面隐藏
   */
  onHide: function () {

  },

  /**
   * 生命周期函数--监听页面卸载
   */
  onUnload: function () {

  },

  /**
   * 页面相关事件处理函数--监听用户下拉动作
   */
  onPullDownRefresh: function () {

  },

  /**
   * 页面上拉触底事件的处理函数
   */
  onReachBottom: function () {

  },

  /**
   * 用户点击右上角分享
   */
  onShareAppMessage: function () {

  }
})