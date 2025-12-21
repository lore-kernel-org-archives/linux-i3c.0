Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD5F4E66886
	for <linux-i3c@archiver.kernel.org>; Sun, 21 Dec 2025 19:07:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=A5YgyNsnlHUn7YktElaxFr7cmVE2AmquDHr/bCD4Wvc=; b=fPJeSHvaQwu5hp
	OH2s6SvyCMOveRewcPVKde6CFWHrXOaIZAluiES9FfP4Aqym6gPfQh+AxKhyeAsvlGD2RJN7f4QaK
	MvboQCPYqJdNA5A6xlDrUlTurE4X+65VFaSJzZTyhGjX74Jv8whqjTGhXA3wA7u3XWXBf2I+W6G1e
	wW2bWT8ERzCeo7iejteXiEhmJfINw3uQyLvH1sb40WGBCenRQeUt8J20ONP7TTgGB3S2PLoQ+r3OP
	WB4NgifxOZyavRBVvCGQuOYgrv8VRj6PCEFjSiG9cuu4EiadXXP3A8DidZKm5JEyfjHSCs13qnnNG
	KOQOnzNOaPVQV4n8GYqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXOmb-0000000CfVY-1lH4;
	Sun, 21 Dec 2025 19:07:57 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXOma-0000000CfVQ-0ppU
	for linux-i3c@lists.infradead.org;
	Sun, 21 Dec 2025 19:07:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 2C01960052;
	Sun, 21 Dec 2025 19:07:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 394FAC4CEFB;
	Sun, 21 Dec 2025 19:07:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766344074;
	bh=5qRIeksMsfEJsG09uI0wVp8Q5PSrhw5lrhG/r6Dm2Bo=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=NJdyQaQE0RKum87djB/p76VFtKzoStwkO6UQuhuJKEO51HPv4aOci1PpiVqRCfo13
	 6bqbA4/TPkTyB7oFKolG4gZTCbRxHGzpQZAR3xXaN17wp8uTA9g+HgEhCg9ewCByE/
	 BFWLAFExrSjQIiHg3jBi/ggBBxTmitBuM9Qq+tI3irDy1FeBGJULvOf4VhEWjg0vEj
	 hE9OM87+RLGyfxP67EjCP6DC4cOBQHfXN/6rKrRA7tzF+NEqnfetjiObV2AZGdJbtZ
	 nRVdWRWLA8VvW8uzvT1LeObbIP6f8E8Wbh6siljW5LWEjtgwC3/XgDT15OOnufwcb3
	 y2nIzcR+GtbZg==
Date: Sun, 21 Dec 2025 19:07:42 +0000
From: Jonathan Cameron <jic23@kernel.org>
To: kernel test robot <lkp@intel.com>
Cc: Frank Li <Frank.Li@nxp.com>, Alexandre Belloni
 <alexandre.belloni@bootlin.com>, Miquel Raynal <miquel.raynal@bootlin.com>,
 David Lechner <dlechner@baylibre.com>, Nuno =?UTF-8?B?U8Oh?=
 <nuno.sa@analog.com>, Andy Shevchenko <andy@kernel.org>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org,
 imx@lists.linux.dev, linux-iio@vger.kernel.org,
 joshua.yeong@starfivetech.com, devicetree@vger.kernel.org,
 linux@roeck-us.net, Carlos Song <carlos.song@nxp.com>, Adrian Fluturel
 <fluturel.adrian@gmail.com>
Subject: Re: [PATCH v12 2/2] iio: magnetometer: Add mmc5633 sensor
Message-ID: <20251221190742.4162108b@jic23-huawei>
In-Reply-To: <202512202141.aAwyC19D-lkp@intel.com>
References: <20251215-i3c_ddr-v12-2-1ae31225b4d9@nxp.com>
	<202512202141.aAwyC19D-lkp@intel.com>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-pc-linux-gnu)
MIME-Version: 1.0
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

On Sat, 20 Dec 2025 22:34:47 +0800
kernel test robot <lkp@intel.com> wrote:

> Hi Frank,
> 
> kernel test robot noticed the following build errors:
> 
> [auto build test ERROR on 8f0b4cce4481fb22653697cced8d0d04027cb1e8]
> 
> url:    https://github.com/intel-lab-lkp/linux/commits/Frank-Li/dt-bindings-trivial-devices-add-MEMSIC-3-axis-magnetometer/20251216-010451
> base:   8f0b4cce4481fb22653697cced8d0d04027cb1e8
> patch link:    https://lore.kernel.org/r/20251215-i3c_ddr-v12-2-1ae31225b4d9%40nxp.com
> patch subject: [PATCH v12 2/2] iio: magnetometer: Add mmc5633 sensor
> config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20251220/202512202141.aAwyC19D-lkp@intel.com/config)
> compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251220/202512202141.aAwyC19D-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202512202141.aAwyC19D-lkp@intel.com/
> 
> All errors (new ones prefixed by >>):
> 
> >> drivers/iio/magnetometer/mmc5633.c:362:2: error: cannot jump from switch statement to this case label  
>      362 |         default:
>          |         ^
>    drivers/iio/magnetometer/mmc5633.c:357:3: note: jump bypasses initialization of variable with __attribute__((cleanup))
>      357 |                 guard(mutex)(&data->mutex);
>          |                 ^
>    include/linux/cleanup.h:414:15: note: expanded from macro 'guard'
>      414 |         CLASS(_name, __UNIQUE_ID(guard))
>          |                      ^
>    include/linux/compiler.h:168:2: note: expanded from macro '__UNIQUE_ID'
>      168 |         __PASTE(__UNIQUE_ID_,                                   \
>          |         ^
>    include/linux/compiler_types.h:16:23: note: expanded from macro '__PASTE'
>       16 | #define __PASTE(a, b) ___PASTE(a, b)
>          |                       ^
>    include/linux/compiler_types.h:15:24: note: expanded from macro '___PASTE'
>       15 | #define ___PASTE(a, b) a##b
>          |                        ^
>    <scratch space>:9:1: note: expanded from here
>        9 | __UNIQUE_ID_guard_966
>          | ^
>    1 error generated.
> 
> 
> vim +362 drivers/iio/magnetometer/mmc5633.c
> 
>    343	
>    344	static int mmc5633_write_raw(struct iio_dev *indio_dev,
>    345				     struct iio_chan_spec const *chan, int val,
>    346				     int val2, long mask)
>    347	{
>    348		struct mmc5633_data *data = iio_priv(indio_dev);
>    349		int ret;
>    350	
>    351		switch (mask) {
>    352		case IIO_CHAN_INFO_SAMP_FREQ:
{
>    353			ret = mmc5633_get_samp_freq_index(data, val, val2);
>    354			if (ret < 0)
>    355				return ret;
>    356	
>    357			guard(mutex)(&data->mutex);
>    358	
>    359			return regmap_update_bits(data->regmap, MMC5633_REG_CTRL1,
>    360						  MMC5633_CTRL1_BW_MASK,
>    361						  FIELD_PREP(MMC5633_CTRL1_BW_MASK, ret));
}
Needed to add scope for the guard to apply to.
If this is all that comes up I'll fix it whilst applying.

thanks,

Jonathan

>  > 362		default:  
>    363			return -EINVAL;
>    364		}
>    365	}
>    366	
> 


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
