Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE6C8E67482
	for <linux-i3c@archiver.kernel.org>; Sun, 21 Dec 2025 19:13:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Dd4LPCyjnqqy8GpV2FMQ2gXvyB6IuaSm68sGbCMkOdM=; b=KCfcVuFK8JKvHp
	i2tTWCDs6//H4MCHgBD4FbCcujEVuBVKN3vAp8xWRHwvLgMa74x8OIYnDRmIhEH0L33iVO6lHH02/
	J5vu8TS2HoW4+W9mopSXz3bTtC8Fbrvz+7xgZsyQXpJ2iSURXWB72aCud7bk/cCjaFbCR2JIeqq7p
	PypjX3UTu0k0MkpJhtCmhekP+ojAi3XK41mGUkuiEVJslhLD3AwZHqneOj8p1WtB7n9hTCg+xClbv
	hG4lr0YHrGcU6516Yz8vSUwv5Sc4SOyGsoXMc2GiLeknPhdLOHnOsird/x0fbwFeSlTSyzj5Mgkvj
	gp2K3BvRejNBS+27jQjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXOrz-0000000Cfr6-44cD;
	Sun, 21 Dec 2025 19:13:32 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXOrx-0000000Cfqc-1yPb
	for linux-i3c@lists.infradead.org;
	Sun, 21 Dec 2025 19:13:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 7EB494183E;
	Sun, 21 Dec 2025 19:13:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 26950C4CEFB;
	Sun, 21 Dec 2025 19:13:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766344408;
	bh=oIyM+6Y/011fii1rlhhpcPat9VA188HJLa4bJW7bpaQ=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=M+0w4dWyUPFr18KdNyX7huN2SDMOTn5wqJmZQN6yZX0H5DPHDNpyy5m/Srh9yv5Ip
	 pEtiO8wUc5LMR38Vr1ery0zlFRCfLjqAS9qJaY1p3euMfcBEARi0ZMKVudIZWkosTN
	 v8YJZvd6U4lWyBIpM9CAC73TnpzOQEirudR3jddJLgd5r4/ocE9sDopg5pKtkSKv6p
	 5+1P885HSu2oOzhzSldDXAK2GvzOl3dnJZondxxVk29X5H9f40VdNhk+02yYqkcpef
	 b1nfArXEtvQEz82LsegykuYfKb2BxPw5/rR96fKaLt4+uKH3X2/MBE/Pls34fnor4l
	 gDAghbmIfzGag==
Date: Sun, 21 Dec 2025 19:13:16 +0000
From: Jonathan Cameron <jic23@kernel.org>
To: Frank Li <Frank.Li@nxp.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>, Miquel Raynal
 <miquel.raynal@bootlin.com>, David Lechner <dlechner@baylibre.com>, Nuno
 =?UTF-8?B?U8Oh?= <nuno.sa@analog.com>, Andy Shevchenko <andy@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, linux-i3c@lists.infradead.org,
 linux-kernel@vger.kernel.org, imx@lists.linux.dev,
 linux-iio@vger.kernel.org, joshua.yeong@starfivetech.com,
 devicetree@vger.kernel.org, linux@roeck-us.net, Carlos Song
 <carlos.song@nxp.com>, Adrian Fluturel <fluturel.adrian@gmail.com>, Andy
 Shevchenko <andriy.shevchenko@intel.com>
Subject: Re: [PATCH v12 2/2] iio: magnetometer: Add mmc5633 sensor
Message-ID: <20251221191316.7c3aa128@jic23-huawei>
In-Reply-To: <20251215-i3c_ddr-v12-2-1ae31225b4d9@nxp.com>
References: <20251215-i3c_ddr-v12-0-1ae31225b4d9@nxp.com>
	<20251215-i3c_ddr-v12-2-1ae31225b4d9@nxp.com>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251221_111329_553155_42FA3BB7 
X-CRM114-Status: GOOD (  16.46  )
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

On Mon, 15 Dec 2025 11:51:11 -0500
Frank Li <Frank.Li@nxp.com> wrote:

> Add mmc5633 sensor basic support.
> - Support read 20 bits X/Y/Z magnetic.
> - Support I3C HDR mode to send start measurememt command.
> - Support I3C HDR mode to read all sensors data by one command.
> 
> Co-developed-by: Carlos Song <carlos.song@nxp.com>
> Signed-off-by: Carlos Song <carlos.song@nxp.com>
> Co-developed-by: Adrian Fluturel <fluturel.adrian@gmail.com>
> Signed-off-by: Adrian Fluturel <fluturel.adrian@gmail.com>
> Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>
> Signed-off-by: Frank Li <Frank.Li@nxp.com>

drivers/iio/magnetometer/mmc5633.c:87:5: warning: symbol 'mmc5633_samp_freq' was not declared. Should it be static?
(I fixed up)

With that and the trivial stuff below tidied up whilst applying, applied to the togreg
branch of iio.git. I'll initially push out as testing however to let the
bots take a first look before I annoy linux-next 

Jonathan


> diff --git a/drivers/iio/magnetometer/mmc5633.c b/drivers/iio/magnetometer/mmc5633.c
> new file mode 100644
> index 0000000000000000000000000000000000000000..7b20ff3b063b026ab2ae0170fd8c021973428dea
> --- /dev/null
> +++ b/drivers/iio/magnetometer/mmc5633.c

> +static int mmc5633_write_raw(struct iio_dev *indio_dev,
> +			     struct iio_chan_spec const *chan, int val,
> +			     int val2, long mask)
> +{
> +	struct mmc5633_data *data = iio_priv(indio_dev);
> +	int ret;
> +
> +	switch (mask) {
> +	case IIO_CHAN_INFO_SAMP_FREQ:

This is the missing scope thing from the bot report.  {}
needed in a switch to define scope for local variables like the one guard()
is using under the hood.

> +		ret = mmc5633_get_samp_freq_index(data, val, val2);
> +		if (ret < 0)
> +			return ret;
> +
> +		guard(mutex)(&data->mutex);
> +
> +		return regmap_update_bits(data->regmap, MMC5633_REG_CTRL1,
> +					  MMC5633_CTRL1_BW_MASK,
> +					  FIELD_PREP(MMC5633_CTRL1_BW_MASK, ret));
> +	default:
> +		return -EINVAL;
> +	}
> +}

> +
> +static struct i2c_driver mmc5633_i2c_driver = {
> +	.driver = {
> +		.name = "mmc5633_i2c",
> +		.of_match_table = mmc5633_of_match,
> +		.pm = pm_sleep_ptr(&mmc5633_pm_ops),
> +	},
> +	.probe = mmc5633_i2c_probe,
> +	.id_table =  mmc5633_i2c_id,
Bonus space after =

> +};

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
