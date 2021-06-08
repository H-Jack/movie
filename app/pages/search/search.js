// pages/search/search.js
Page({
  data: {
    search: {
      placeholder: '找影院、找电影',
      his: ['万达', '大地影院', '华夏']
    },
    theater: [],
    movie: [],
    sj:''
  },
  onLoad: function (options) {

  },
  searchinput: function (e) {
    this.setData({
      sj:1
    })
    var that = this
    var value = e.detail.value
  //  console.log(value)
    wx.request({
      url: 'http://movie.vaiwan.com/index.php/api/v1/indexsearch',
      data: {
        searchvalue: value
      },
      method: 'POST', // OPTIONS, GET, HEAD, POST, PUT, DELETE, TRACE, CONNECT
      success: function (res) {
       // console.log(res.data);
        that.setData({
           theater:res.data.data,
           movie:res.data.movie,
           sj:0
        })
      }
    })

  },

  
  /**电影详情 */
  detail: function (e) {
    wx.navigateTo({
      url: '../movies/detail/detail',
      success: (res) => {
        // 通过eventChannel向被打开页面传送数据
        res.eventChannel.emit('detail', {
          data: this.data.movie[e.currentTarget.dataset.index]
        })
      }
    })
  },
  buy: function(){
    wx.navigateTo({
      url: '../theaterList/theaterList'
    })
  },



  onReady: function () {

  },
  onShow: function () {

  },
  onHide: function () {

  },
  onUnload: function () {

  },
  shop: function (e) {
    wx.navigateTo({
      url: '../shop/shop',
      success: (res) => {
        //   通过eventChannel向被打开页面传送数据
        res.eventChannel.emit('administratorsid', {
          data: {
            administratorsid: e.currentTarget.id,
            cinemaname: this.data.theater[e.currentTarget.dataset.index].cinemaname,
            cinemaaddress: this.data.theater[e.currentTarget.dataset.index].cinemaaddress
          }
        })
      }
    })
  }
})