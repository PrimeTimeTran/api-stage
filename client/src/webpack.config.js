var path = require('path');

module.exports = {
  output:{
    path: path.join(__dirname,'public/assets/'),
    publicPath:'assets/'
  },
  module: {
    rules: [
      {
        test: /\.(woff(2)?|ttf|eot|svg)(\?v=[0-9]\.[0-9]\.[0-9])?$/,    //to support @font-face rule
        loader: "url-loader",
        query:{
          limit:'10000',
          name:'[name].[ext]',
          outputPath:'fonts/'
          //the fonts will be emmited to public/assets/fonts/ folder
          //the fonts will be put in the DOM <style> tag as eg. @font-face{ src:url(assets/fonts/font.ttf); }
        }
      },
      {
        test: /\.css$/,
        loaders: ["style-loader","css-loader"]
      }
    ]
  }
}