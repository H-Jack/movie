Page({
  onShow() {
    const userinfo = wx.getStorageSync("userinfo");
    this.setData({ userinfo })

  },
  order:function(){
    wx.navigateTo({
        url:'../order/order',
    })
  }
})