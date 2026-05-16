# Introduction
Just a small scraper written in LUA for me to automate collecting emails from a github profile without using any authentication.
> Downside of this is that you can't know if someone just set the target as their username or if its actually them so i implemented a confidence system which basically just takes the max amount of appearances and then makes a percentage for each email found.

# Installation
> For Linux ( LUA v5.1 )
```sh
git clone https://github.com/vlcpenguin/github-email-scraper.git
cd github-email-scraper
luarocks install copas
luarocks install luasocket
luarocks install luasec
```

# Usage
```sh
luajit main.lua <username>
```

# Example output
```sh
❯ luajit main.lua vlcpenguin
Target: vlcpenguin
Scraping... (can take up to a couple minutes on big profiles due to shit multithreading)
Getting: https://github.com/vlcpenguin?tab=repositories
Done: https://github.com/vlcpenguin?tab=repositories
Waiting for threads...
Getting: https://github.com/vlcpenguin/nekocord/commits?author=vlcpenguin
Getting: https://github.com/vlcpenguin/github-email-scraper/commits?author=vlcpenguin
Getting: https://github.com/vlcpenguin/youtube-skin/commits?author=vlcpenguin
Getting: https://github.com/vlcpenguin/uilib/commits?author=vlcpenguin
Getting: https://github.com/vlcpenguin/Personal-Website/commits?author=vlcpenguin
Done: https://github.com/vlcpenguin/github-email-scraper/commits?author=vlcpenguin
Waiting for threads...
Done: https://github.com/vlcpenguin/Personal-Website/commits?author=vlcpenguin
Waiting for threads...
Done: https://github.com/vlcpenguin/nekocord/commits?author=vlcpenguin
Waiting for threads...
Done: https://github.com/vlcpenguin/youtube-skin/commits?author=vlcpenguin
Waiting for threads...
Done: https://github.com/vlcpenguin/uilib/commits?author=vlcpenguin
Waiting for threads...
Getting: https://github.com/vlcpenguin/github-email-scraper/commit/2142ef3eb3f70a7290b29ea859b92038a09dba88.patch
Getting: https://github.com/vlcpenguin/Personal-Website/commit/22719239e4cbb11d3d2d6f873693930c92673764.patch
Getting: https://github.com/vlcpenguin/Personal-Website/commit/b75044c8bbd69d0e5d85b6199058e76e69cc9fe1.patch
Getting: https://github.com/vlcpenguin/Personal-Website/commit/97f7cc872da9237bd23d0f30ea7d8b0500116371.patch
Getting: https://github.com/vlcpenguin/Personal-Website/commit/c1f92e0e1af7f4438252df00ff981904fc076895.patch
Getting: https://github.com/vlcpenguin/Personal-Website/commit/c6fdcfde8ef02f8d8124a1434526806e1ad4f6da.patch
Getting: https://github.com/vlcpenguin/Personal-Website/commit/3d4e4f117b983e1fae6be6a6303e3cff745dc30e.patch
Getting: https://github.com/vlcpenguin/Personal-Website/commit/1d79475468d1d858ac7548f46960ba0108c2b112.patch
Getting: https://github.com/vlcpenguin/Personal-Website/commit/c84c2a3951c055dab8f8f90c10ec903ac126bf6a.patch
Getting: https://github.com/vlcpenguin/nekocord/commit/2fadfba935152407d32b392aa9155b510f796d45.patch
Getting: https://github.com/vlcpenguin/nekocord/commit/f1be11e6fecc0b2b8ebc201b45608e29237af3ba.patch
Getting: https://github.com/vlcpenguin/nekocord/commit/104c022476a3be47b2770cfe94c455d38019b412.patch
Getting: https://github.com/vlcpenguin/nekocord/commit/91c58d0d23c7c44d93bdb3fe557c5e6f921416ec.patch
Getting: https://github.com/vlcpenguin/nekocord/commit/bdfdcf4f916baf9ea4ce9693ab5a5b65034dd7a5.patch
Getting: https://github.com/vlcpenguin/nekocord/commit/2dd77a8688d91b7d6e0c51aef22f9c8363e99dad.patch
Getting: https://github.com/vlcpenguin/nekocord/commit/f006d3ea8835b17b1b6659baf43ae7febc94c2e6.patch
Getting: https://github.com/vlcpenguin/nekocord/commit/842778627df5a0d0f933febbb94ded0b8421fc1e.patch
Getting: https://github.com/vlcpenguin/nekocord/commit/9e168036c6a316a35b032e185d35691354f79759.patch
Getting: https://github.com/vlcpenguin/nekocord/commit/ee777341a0b4090c41a9acb924005d1603a1e640.patch
Getting: https://github.com/vlcpenguin/nekocord/commit/fe6a64ed7a4c4e3f9bc689ec374a5a23216da1aa.patch
Getting: https://github.com/vlcpenguin/nekocord/commit/a4b782449cc7cd755418f8224af9d3c24f13ea11.patch
Getting: https://github.com/vlcpenguin/youtube-skin/commit/ecd1467ab0ef1cf7ad4d5edb616ee7b42c1900af.patch
Getting: https://github.com/vlcpenguin/youtube-skin/commit/f427a487be0310289a2f344f793bfaadfb5ff93f.patch
Getting: https://github.com/vlcpenguin/youtube-skin/commit/f3271a8c9cf0ddd49c17dda5ac72e3fd572f451f.patch
Getting: https://github.com/vlcpenguin/youtube-skin/commit/f47a9af0b0b2484b4d67c0a1f2837b3cd6a1d04c.patch
Getting: https://github.com/vlcpenguin/youtube-skin/commit/0652b932f9528160ce384a4f576be746cd76ca47.patch
Getting: https://github.com/vlcpenguin/youtube-skin/commit/21d888410d1b2f9bd7d2e7d7856978bc15cf5c98.patch
Getting: https://github.com/vlcpenguin/youtube-skin/commit/eb7f406e6fdf10a39bd9d58fd9a2626bb330e4ba.patch
Getting: https://github.com/vlcpenguin/uilib/commit/d78880436ead7525340434125fd6101cfc7c7190.patch
Getting: https://github.com/vlcpenguin/uilib/commit/872eacff3768947399ce32981548c3462637e5bc.patch
Getting: https://github.com/vlcpenguin/uilib/commit/b450e04c7075c651bedc44cbc997491fe9375a01.patch
Getting: https://github.com/vlcpenguin/uilib/commit/cdcd30018c4f78d4437c1c6e4f75257d2093208c.patch
Getting: https://github.com/vlcpenguin/uilib/commit/cf3d137245f651b0cf003c7fa34804a2632d30f5.patch
Getting: https://github.com/vlcpenguin/uilib/commit/31235172031fd8c5bec12d68bd667353e1192f4e.patch
Getting: https://github.com/vlcpenguin/uilib/commit/0b59be0596f5bc46deaa3d07c2cd664a49e0d43f.patch
Getting: https://github.com/vlcpenguin/uilib/commit/4a4cde8f078efeb3d00e62e54861bf4aeaa2a344.patch
Getting: https://github.com/vlcpenguin/uilib/commit/258b55127ad7782222ded199df34f15cfd380aeb.patch
Getting: https://github.com/vlcpenguin/uilib/commit/55187ff340f671ea612a8b048cebdb7ec1e83892.patch
Getting: https://github.com/vlcpenguin/uilib/commit/3854c38d753185ec2e396b5358c8a11f5e5f5f79.patch
Getting: https://github.com/vlcpenguin/uilib/commit/aad0da18d11bcd0e4d9af92b5c42c40c9b7ab813.patch
Getting: https://github.com/vlcpenguin/uilib/commit/aaa79aa13b9dc5589716e54d81839a2fa6e47b2f.patch
Getting: https://github.com/vlcpenguin/uilib/commit/a199835840d7fff48f29a178958b31e6f3582423.patch
Getting: https://github.com/vlcpenguin/uilib/commit/21106285d23435d3b2668e20e3ec595e5d58adb3.patch
Getting: https://github.com/vlcpenguin/uilib/commit/d9d74de12c26b8594887ddb5fe8e6c1605a3a997.patch
Getting: https://github.com/vlcpenguin/uilib/commit/7cc6bda2a3ed6310bb2ccc72a5b876433b9d004e.patch
Getting: https://github.com/vlcpenguin/uilib/commit/9905efd5db97015ce03e0415316f607ff0327f45.patch
Getting: https://github.com/vlcpenguin/uilib/commit/53403c84c86733b514ff296ac0c90e28d50074a8.patch
Done: https://github.com/vlcpenguin/Personal-Website/commit/97f7cc872da9237bd23d0f30ea7d8b0500116371.patch
Done: https://github.com/vlcpenguin/Personal-Website/commit/22719239e4cbb11d3d2d6f873693930c92673764.patch
Done: https://github.com/vlcpenguin/nekocord/commit/104c022476a3be47b2770cfe94c455d38019b412.patch
Done: https://github.com/vlcpenguin/nekocord/commit/2fadfba935152407d32b392aa9155b510f796d45.patch
Done: https://github.com/vlcpenguin/nekocord/commit/f1be11e6fecc0b2b8ebc201b45608e29237af3ba.patch
Done: https://github.com/vlcpenguin/nekocord/commit/91c58d0d23c7c44d93bdb3fe557c5e6f921416ec.patch
Done: https://github.com/vlcpenguin/github-email-scraper/commit/2142ef3eb3f70a7290b29ea859b92038a09dba88.patch
Done: https://github.com/vlcpenguin/Personal-Website/commit/b75044c8bbd69d0e5d85b6199058e76e69cc9fe1.patch
Done: https://github.com/vlcpenguin/Personal-Website/commit/1d79475468d1d858ac7548f46960ba0108c2b112.patch
Done: https://github.com/vlcpenguin/uilib/commit/cf3d137245f651b0cf003c7fa34804a2632d30f5.patch
Done: https://github.com/vlcpenguin/uilib/commit/7cc6bda2a3ed6310bb2ccc72a5b876433b9d004e.patch
Done: https://github.com/vlcpenguin/Personal-Website/commit/c84c2a3951c055dab8f8f90c10ec903ac126bf6a.patch
Done: https://github.com/vlcpenguin/uilib/commit/53403c84c86733b514ff296ac0c90e28d50074a8.patch
Done: https://github.com/vlcpenguin/uilib/commit/9905efd5db97015ce03e0415316f607ff0327f45.patch
Done: https://github.com/vlcpenguin/nekocord/commit/842778627df5a0d0f933febbb94ded0b8421fc1e.patch
Done: https://github.com/vlcpenguin/nekocord/commit/bdfdcf4f916baf9ea4ce9693ab5a5b65034dd7a5.patch
Done: https://github.com/vlcpenguin/nekocord/commit/f006d3ea8835b17b1b6659baf43ae7febc94c2e6.patch
Done: https://github.com/vlcpenguin/nekocord/commit/9e168036c6a316a35b032e185d35691354f79759.patch
Done: https://github.com/vlcpenguin/nekocord/commit/2dd77a8688d91b7d6e0c51aef22f9c8363e99dad.patch
Done: https://github.com/vlcpenguin/Personal-Website/commit/c6fdcfde8ef02f8d8124a1434526806e1ad4f6da.patch
Done: https://github.com/vlcpenguin/uilib/commit/a199835840d7fff48f29a178958b31e6f3582423.patch
Done: https://github.com/vlcpenguin/uilib/commit/21106285d23435d3b2668e20e3ec595e5d58adb3.patch
Done: https://github.com/vlcpenguin/uilib/commit/d9d74de12c26b8594887ddb5fe8e6c1605a3a997.patch
Done: https://github.com/vlcpenguin/uilib/commit/aaa79aa13b9dc5589716e54d81839a2fa6e47b2f.patch
Done: https://github.com/vlcpenguin/nekocord/commit/fe6a64ed7a4c4e3f9bc689ec374a5a23216da1aa.patch
Done: https://github.com/vlcpenguin/nekocord/commit/ee777341a0b4090c41a9acb924005d1603a1e640.patch
Done: https://github.com/vlcpenguin/youtube-skin/commit/ecd1467ab0ef1cf7ad4d5edb616ee7b42c1900af.patch
Done: https://github.com/vlcpenguin/youtube-skin/commit/f427a487be0310289a2f344f793bfaadfb5ff93f.patch
Done: https://github.com/vlcpenguin/nekocord/commit/a4b782449cc7cd755418f8224af9d3c24f13ea11.patch
Done: https://github.com/vlcpenguin/uilib/commit/aad0da18d11bcd0e4d9af92b5c42c40c9b7ab813.patch
Done: https://github.com/vlcpenguin/uilib/commit/55187ff340f671ea612a8b048cebdb7ec1e83892.patch
Done: https://github.com/vlcpenguin/uilib/commit/258b55127ad7782222ded199df34f15cfd380aeb.patch
Done: https://github.com/vlcpenguin/uilib/commit/3854c38d753185ec2e396b5358c8a11f5e5f5f79.patch
Done: https://github.com/vlcpenguin/uilib/commit/0b59be0596f5bc46deaa3d07c2cd664a49e0d43f.patch
Done: https://github.com/vlcpenguin/uilib/commit/4a4cde8f078efeb3d00e62e54861bf4aeaa2a344.patch
Done: https://github.com/vlcpenguin/youtube-skin/commit/0652b932f9528160ce384a4f576be746cd76ca47.patch
Done: https://github.com/vlcpenguin/youtube-skin/commit/f47a9af0b0b2484b4d67c0a1f2837b3cd6a1d04c.patch
Done: https://github.com/vlcpenguin/youtube-skin/commit/f3271a8c9cf0ddd49c17dda5ac72e3fd572f451f.patch
Done: https://github.com/vlcpenguin/youtube-skin/commit/eb7f406e6fdf10a39bd9d58fd9a2626bb330e4ba.patch
Done: https://github.com/vlcpenguin/youtube-skin/commit/21d888410d1b2f9bd7d2e7d7856978bc15cf5c98.patch
Done: https://github.com/vlcpenguin/Personal-Website/commit/3d4e4f117b983e1fae6be6a6303e3cff745dc30e.patch
Done: https://github.com/vlcpenguin/uilib/commit/b450e04c7075c651bedc44cbc997491fe9375a01.patch
Done: https://github.com/vlcpenguin/uilib/commit/d78880436ead7525340434125fd6101cfc7c7190.patch
Done: https://github.com/vlcpenguin/uilib/commit/872eacff3768947399ce32981548c3462637e5bc.patch
Done: https://github.com/vlcpenguin/uilib/commit/31235172031fd8c5bec12d68bd667353e1192f4e.patch
Done: https://github.com/vlcpenguin/uilib/commit/cdcd30018c4f78d4437c1c6e4f75257d2093208c.patch
Done: https://github.com/vlcpenguin/Personal-Website/commit/c1f92e0e1af7f4438252df00ff981904fc076895.patch
234353612+vlcpenguin@users.noreply.github.com 100% confidence
```
