Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F13B6E6F078
	for <linux-i3c@archiver.kernel.org>; Tue, 23 Dec 2025 09:31:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pvZ6teUOVd2CKNgQuZ6t5yT+DeiduZeW7Rt+aR/E834=; b=4tfSGHCmdOBi+t
	hFf1/J1NXaoqaQOTBaZ3G46Ard8m40ByB6lobdUWeaGbIWAk4XgXdCyVannIWno8FCwq9g95bp9h0
	sdNHZYkMldBSqDESkXZn0JN6UQdmGJ/MNmXv4HMJ2qEfhS8hYDah7utTU8iM2wSrX/yAEklm7fxkM
	C2H6TCzXZjXl8gl7JzGxA3oM3KA+CGKurobahh05Rv6v8MlD08mPsXVL31/6NUhQOAZ7a15HbOZNn
	L6rUfr9zgmZkVrSbMjDgclwR8fK5qJ8O2Yfy0sth+yiP2RsRP81QMpIjQgQTaO2Z1lwp9CZ3FaDLk
	A+0x2PPKujN7+eY/O7NQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXykE-0000000ElCr-2yYA;
	Tue, 23 Dec 2025 09:31:54 +0000
Received: from frasgout.his.huawei.com ([185.176.79.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXykB-0000000ElCV-1wwh
	for linux-i3c@lists.infradead.org;
	Tue, 23 Dec 2025 09:31:53 +0000
Received: from mail.maildlp.com (unknown [172.18.224.83])
	by frasgout.his.huawei.com (SkyGuard) with ESMTPS id 4db8rp02dpzJ46bZ;
	Tue, 23 Dec 2025 17:31:06 +0800 (CST)
Received: from dubpeml100005.china.huawei.com (unknown [7.214.146.113])
	by mail.maildlp.com (Postfix) with ESMTPS id E2FC64056E;
	Tue, 23 Dec 2025 17:31:44 +0800 (CST)
Received: from localhost (10.203.177.15) by dubpeml100005.china.huawei.com
 (7.214.146.113) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.36; Tue, 23 Dec
 2025 09:31:44 +0000
Date: Tue, 23 Dec 2025 09:31:42 +0000
From: Jonathan Cameron <jonathan.cameron@huawei.com>
To: kernel test robot <lkp@intel.com>
CC: Frank Li <Frank.Li@nxp.com>, <oe-kbuild-all@lists.linux.dev>, "Carlos
 Song" <carlos.song@nxp.com>, Adrian Fluturel <fluturel.adrian@gmail.com>,
	Andy Shevchenko <andriy.shevchenko@intel.com>, Alexandre Belloni
	<alexandre.belloni@bootlin.com>, <linux-i3c@lists.infradead.org>,
	<linux-iio@vger.kernel.org>
Subject: Re: [jic23-iio:testing 47/49] drivers/base/regmap/regmap-i3c.c:41:
 undefined reference to `i3c_device_do_xfers'
Message-ID: <20251223093142.00007880@huawei.com>
In-Reply-To: <20251223093037.00003f7a@huawei.com>
References: <202512230418.nu3V6Yua-lkp@intel.com>
	<20251223093037.00003f7a@huawei.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
MIME-Version: 1.0
X-Originating-IP: [10.203.177.15]
X-ClientProxiedBy: lhrpeml100011.china.huawei.com (7.191.174.247) To
 dubpeml100005.china.huawei.com (7.214.146.113)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251223_013151_847001_1FE99E53 
X-CRM114-Status: GOOD (  13.56  )
X-BeenThere: linux-i3c@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-i3c.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-i3c>,
 <mailto:linux-i3c-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-i3c/>
List-Post: <mailto:linux-i3c@lists.infradead.org>
List-Help: <mailto:linux-i3c-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-i3c>,
 <mailto:linux-i3c-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

On Tue, 23 Dec 2025 09:30:37 +0000
Jonathan Cameron <jonathan.cameron@huawei.com> wrote:

> On Tue, 23 Dec 2025 04:17:12 +0800
> kernel test robot <lkp@intel.com> wrote:
> 
> > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jic23/iio.git testing
> > head:   4e44c635ba8c281f74001d47e20bbcb7f516530c
> > commit: 6e5f6bf2e3f036e6d7466d2a3322445729ea3356 [47/49] iio: magnetometer: Add mmc5633 sensor
> > config: sparc64-randconfig-001-20251223 (https://download.01.org/0day-ci/archive/20251223/202512230418.nu3V6Yua-lkp@intel.com/config)
> > compiler: sparc64-linux-gcc (GCC) 8.5.0
> > reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251223/202512230418.nu3V6Yua-lkp@intel.com/reproduce)
> > 
> > If you fix the issue in a separate patch/commit (i.e. not just a new version of
> > the same patch/commit), kindly add following tags
> > | Reported-by: kernel test robot <lkp@intel.com>
> > | Closes: https://lore.kernel.org/oe-kbuild-all/202512230418.nu3V6Yua-lkp@intel.com/
> > 
> > All errors (new ones prefixed by >>):
> > 
> >    sparc64-linux-ld: drivers/base/regmap/regmap-i3c.o: in function `regmap_i3c_read':  
> > >> drivers/base/regmap/regmap-i3c.c:41: undefined reference to `i3c_device_do_xfers'    
> >    sparc64-linux-ld: drivers/base/regmap/regmap-i3c.o: in function `regmap_i3c_write':
> >    drivers/base/regmap/regmap-i3c.c:22: undefined reference to `i3c_device_do_xfers'
> >    sparc64-linux-ld: drivers/iio/magnetometer/mmc5633.o: in function `mmc5633_is_support_hdr':  
> > >> drivers/iio/magnetometer/mmc5633.c:193: undefined reference to `i3c_device_get_supported_xfer_mode'    
> >    sparc64-linux-ld: drivers/iio/magnetometer/mmc5633.o: in function `mmc5633_read_measurement':  
> > >> drivers/iio/magnetometer/mmc5633.c:230: undefined reference to `i3c_device_do_xfers'
> > >> sparc64-linux-ld: drivers/iio/magnetometer/mmc5633.c:237: undefined reference to `i3c_device_do_xfers'    
> >    sparc64-linux-ld: drivers/iio/magnetometer/mmc5633.c:251: undefined reference to `i3c_device_do_xfers'  
> > >> sparc64-linux-ld: drivers/iio/magnetometer/mmc5633.c:230: undefined reference to `i3c_device_do_xfers'    
> 
> Seems like we need a stub.

+CC the lists to broaden awareness.

> 
> Jonathan
> 
> 
> > 
> > Kconfig warnings: (for reference only)
> >    WARNING: unmet direct dependencies detected for CAN_DEV
> >    Depends on [n]: NETDEVICES [=n] && CAN [=y]
> >    Selected by [y]:
> >    - CAN [=y] && NET [=y]
> >    WARNING: unmet direct dependencies detected for REGMAP_I3C
> >    Depends on [n]: I3C [=n]
> >    Selected by [y]:
> >    - MMC5633 [=y] && IIO [=y] && (I2C [=y] || I3C [=n])
> > 
> > 
> > vim +41 drivers/base/regmap/regmap-i3c.c
> > 
> > 6445500b43129b Vitor Soares   2019-06-06  24  
> > 6445500b43129b Vitor Soares   2019-06-06  25  static int regmap_i3c_read(void *context,
> > 6445500b43129b Vitor Soares   2019-06-06  26  			   const void *reg, size_t reg_size,
> > 6445500b43129b Vitor Soares   2019-06-06  27  			   void *val, size_t val_size)
> > 6445500b43129b Vitor Soares   2019-06-06  28  {
> > 6445500b43129b Vitor Soares   2019-06-06  29  	struct device *dev = context;
> > 6445500b43129b Vitor Soares   2019-06-06  30  	struct i3c_device *i3c = dev_to_i3cdev(dev);
> > 79c3ae7ada0548 Frank Li       2025-10-28  31  	struct i3c_xfer xfers[2];
> > 6445500b43129b Vitor Soares   2019-06-06  32  
> > 6445500b43129b Vitor Soares   2019-06-06  33  	xfers[0].rnw = false;
> > 6445500b43129b Vitor Soares   2019-06-06  34  	xfers[0].len = reg_size;
> > 6445500b43129b Vitor Soares   2019-06-06  35  	xfers[0].data.out = reg;
> > 6445500b43129b Vitor Soares   2019-06-06  36  
> > 6445500b43129b Vitor Soares   2019-06-06  37  	xfers[1].rnw = true;
> > 6445500b43129b Vitor Soares   2019-06-06  38  	xfers[1].len = val_size;
> > 6445500b43129b Vitor Soares   2019-06-06  39  	xfers[1].data.in = val;
> > 6445500b43129b Vitor Soares   2019-06-06  40  
> > c2f2b01b74be8b Linus Torvalds 2025-12-08 @41  	return i3c_device_do_xfers(i3c, xfers, ARRAY_SIZE(xfers), I3C_SDR);
> > 6445500b43129b Vitor Soares   2019-06-06  42  }
> > 6445500b43129b Vitor Soares   2019-06-06  43  
> > 
> > :::::: The code at line 41 was first introduced by commit
> > :::::: c2f2b01b74be8b40a2173372bcd770723f87e7b2 Merge tag 'i3c/for-6.19' of git://git.kernel.org/pub/scm/linux/kernel/git/i3c/linux
> > 
> > :::::: TO: Linus Torvalds <torvalds@linux-foundation.org>
> > :::::: CC: Linus Torvalds <torvalds@linux-foundation.org>
> >   
> 


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
