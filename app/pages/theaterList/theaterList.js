var util = require('../../utils/util.js');
var weekday = util.getWeek(3);
Page({
  data: {
    activeIndex: 0,
    weekday: weekday,
    currentCity: '',
    theater: [],
    theday: 0,
  },
  onLoad: function (options) {
    var that = this;
    wx.request({
      url: 'http://movie.vaiwan.com/index.php/api/v1/indexaddress',
      success: function (res) {
        that.setData({
          theater: res.data.data
        })
      }
    })
  },
  selectDate: function (e) {
    var moviesinginlist = this.data.weekday;
    var todaysingin = [];
    for (var a = 0; a < moviesinginlist.length; a++) {
      if (moviesinginlist[a].status == e.currentTarget.id) {
        todaysingin.push(moviesinginlist[a]);
      }
    }
    var theday = e.currentTarget.id
    this.setData({
      theday: theday,
    })
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