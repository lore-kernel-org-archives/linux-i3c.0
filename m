Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42A7AE668B6
	for <linux-i3c@archiver.kernel.org>; Sat, 20 Dec 2025 14:35:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UZ9pE4G7pNN+Di4zUzUijeBIVUFngwJPXpL6dL5lKlU=; b=Qqgn+B9Zd9RUr/
	UDWyhKADIavNR1qv8taQCQQj2ICti4wcIerCkoZhim5EsHQYxYIeRpC8f2fndJ4ozYCMhw36yAjiK
	aoyeSQmKtN/sB4gcUnynix7XGtKB+fenmnJnFoXsG0OIRYksPdS6AjHvilotcQItP8k8959j/g0BN
	5JE03plvBC3CFdjdHxHukJINdCup4Q7KqYzb9eyYm4Asev1ZUaPECfsJg2PvGspTKh4iNVSUfJLOk
	uvSS6biQJnYY/8UZtefwiYjHhUTub+sH8RBrAt5f9YgKeotAKnJK/YXLxiEQcFu/SlvdhNx9VXn+R
	+IKB+FqmDvzYKgzUJuiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWy3A-0000000BemN-3zwh;
	Sat, 20 Dec 2025 14:35:16 +0000
Received: from mgamail.intel.com ([192.198.163.8])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWy38-0000000Beli-1uCx
	for linux-i3c@lists.infradead.org;
	Sat, 20 Dec 2025 14:35:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766241314; x=1797777314;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=WM/il7ZMre39u/faJj3qK3pSI2dS3NEYI7+2+0W3exQ=;
  b=N2B7Ph/Zw4XaDnkjL1Yf5dM7HX98tSetJembKounqEA2QtgF8DrbHdZ7
   SEDOoZeslhXrtBVWpQjL4rSeIU7GjHrnnJ162u+LhIjNsaDTLZkWB/ShZ
   UxQummcqaktRMpdBPUgAua+MZn1Vjv9p0AzhlfyHl11afeCYpfRwUWjEf
   lUSTt/gYngDzrL0lw7JDzH3kLVgSV7OYfEavdTrg8sc8KQwIoKPWHQ0fV
   qGVCAMkuK/rB+v1bt9NHWZIC8MxPXNxW/GFaQh/9kG6QGdesdm2vnU0VL
   6TQyPNKvIlGhp+cNslC0QjkMHpAlN351VCId0LONI7F6vUwEetHabPFQB
   w==;
X-CSE-ConnectionGUID: ZrDGmBVMQDSUaeC/TsAqSg==
X-CSE-MsgGUID: zdfSVl0ZS8uyf+NhPILcMA==
X-IronPort-AV: E=McAfee;i="6800,10657,11648"; a="85760176"
X-IronPort-AV: E=Sophos;i="6.21,164,1763452800"; 
   d="scan'208";a="85760176"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Dec 2025 06:35:12 -0800
X-CSE-ConnectionGUID: hWrhJhBLT62i1i8dmPvNBw==
X-CSE-MsgGUID: 2kf2E3v1ThCIfiZO94rSYw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,164,1763452800"; 
   d="scan'208";a="236526229"
Received: from lkp-server01.sh.intel.com (HELO 0d09efa1b85f) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 20 Dec 2025 06:35:07 -0800
Received: from kbuild by 0d09efa1b85f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vWy2z-000000004eL-0Zah;
	Sat, 20 Dec 2025 14:35:05 +0000
Date: Sat, 20 Dec 2025 22:34:47 +0800
From: kernel test robot <lkp@intel.com>
To: Frank Li <Frank.Li@nxp.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org,
	imx@lists.linux.dev, linux-iio@vger.kernel.org,
	joshua.yeong@starfivetech.com, devicetree@vger.kernel.org,
	linux@roeck-us.net, Frank Li <Frank.Li@nxp.com>,
	Carlos Song <carlos.song@nxp.com>,
	Adrian Fluturel <fluturel.adrian@gmail.com>
Subject: Re: [PATCH v12 2/2] iio: magnetometer: Add mmc5633 sensor
Message-ID: <202512202141.aAwyC19D-lkp@intel.com>
References: <20251215-i3c_ddr-v12-2-1ae31225b4d9@nxp.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251215-i3c_ddr-v12-2-1ae31225b4d9@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251220_063514_596173_A15B08E7 
X-CRM114-Status: UNSURE (   8.77  )
X-CRM114-Notice: Please train this message.
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

Hi Frank,

kernel test robot noticed the following build errors:

[auto build test ERROR on 8f0b4cce4481fb22653697cced8d0d04027cb1e8]

url:    https://github.com/intel-lab-lkp/linux/commits/Frank-Li/dt-bindings-trivial-devices-add-MEMSIC-3-axis-magnetometer/20251216-010451
base:   8f0b4cce4481fb22653697cced8d0d04027cb1e8
patch link:    https://lore.kernel.org/r/20251215-i3c_ddr-v12-2-1ae31225b4d9%40nxp.com
patch subject: [PATCH v12 2/2] iio: magnetometer: Add mmc5633 sensor
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20251220/202512202141.aAwyC19D-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251220/202512202141.aAwyC19D-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512202141.aAwyC19D-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/iio/magnetometer/mmc5633.c:362:2: error: cannot jump from switch statement to this case label
     362 |         default:
         |         ^
   drivers/iio/magnetometer/mmc5633.c:357:3: note: jump bypasses initialization of variable with __attribute__((cleanup))
     357 |                 guard(mutex)(&data->mutex);
         |                 ^
   include/linux/cleanup.h:414:15: note: expanded from macro 'guard'
     414 |         CLASS(_name, __UNIQUE_ID(guard))
         |                      ^
   include/linux/compiler.h:168:2: note: expanded from macro '__UNIQUE_ID'
     168 |         __PASTE(__UNIQUE_ID_,                                   \
         |         ^
   include/linux/compiler_types.h:16:23: note: expanded from macro '__PASTE'
      16 | #define __PASTE(a, b) ___PASTE(a, b)
         |                       ^
   include/linux/compiler_types.h:15:24: note: expanded from macro '___PASTE'
      15 | #define ___PASTE(a, b) a##b
         |                        ^
   <scratch space>:9:1: note: expanded from here
       9 | __UNIQUE_ID_guard_966
         | ^
   1 error generated.


vim +362 drivers/iio/magnetometer/mmc5633.c

   343	
   344	static int mmc5633_write_raw(struct iio_dev *indio_dev,
   345				     struct iio_chan_spec const *chan, int val,
   346				     int val2, long mask)
   347	{
   348		struct mmc5633_data *data = iio_priv(indio_dev);
   349		int ret;
   350	
   351		switch (mask) {
   352		case IIO_CHAN_INFO_SAMP_FREQ:
   353			ret = mmc5633_get_samp_freq_index(data, val, val2);
   354			if (ret < 0)
   355				return ret;
   356	
   357			guard(mutex)(&data->mutex);
   358	
   359			return regmap_update_bits(data->regmap, MMC5633_REG_CTRL1,
   360						  MMC5633_CTRL1_BW_MASK,
   361						  FIELD_PREP(MMC5633_CTRL1_BW_MASK, ret));
 > 362		default:
   363			return -EINVAL;
   364		}
   365	}
   366	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
