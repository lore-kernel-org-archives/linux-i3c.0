Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 307B0CCD187
	for <linux-i3c@archiver.kernel.org>; Sun, 12 Oct 2025 17:01:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bYMmkZj0sl+bJc6fUkjEqc/lhGwpcb01WBq4ltroQ9o=; b=3ua02MVnadu8mA
	qiYTd2OwQIrFBW+XcF3Y9Kr2ss8ddSz3EVtAyioJxlRVE0hYc10MJLS/upHxBqZJAIkG9If2fXmba
	VPIHF4N5rm8RyEvgvYY8TVoj6KFvwpo78q2F5GHOB65VMsu8PxaOgV9X2pagIdEKvEbfcuGD6PrX0
	46cfNlAKLs9jI8+BE7edT06HUPubvF3HUr+LXLT+cP9dJIxsgI62dqgyfNhVV255hc4XxBVmWtIFL
	4zMo+jejfGhRnNa5y745Jnh/jDRJR/wyTGttCwsQO3Xx+CB8A9QUTC1smLeK3OalqxGTrMNmF/+HZ
	j+No5+IwNHQIHk4GQykw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v7zRt-0000000BZ5X-3Tn9;
	Sun, 12 Oct 2025 17:01:33 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v7zRq-0000000BZ5D-3dIH
	for linux-i3c@lists.infradead.org;
	Sun, 12 Oct 2025 17:01:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id E321640455;
	Sun, 12 Oct 2025 17:01:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D16CAC4CEE7;
	Sun, 12 Oct 2025 17:01:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760288489;
	bh=K5u3yiOfDjFXa37+LYFs7qYjcwjZgMOR4ZuK/iED6As=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=bw8DY+5Pfpg1R8UcoCM122hWFKDBhgU/9yRH5uMR2xTdxsTiAHJYzlsRP3MBuKA+A
	 1vC8hsLHvHS8Y9CKurr179lLopG66hDKWRvayvIVlenefGSmSmolBu6NvD0wFa2g2P
	 tHsRtrKTcpYKgf3fhYOBTXjeSH7oyPUpYmBgxd7J4TCyAzOIaUViw03aT+zDxMQQ7R
	 2uIIGrC+43oI46R6FK5ilRpWBwiHowZmi4KWxMWqCaYfqExkzK7BBY6QXjESm/+AxQ
	 T8IiRBgRG52FACaeaTCQm5qqw76XYtgo4lbx1AhpkBuaS/geUgQiSZqeHCRHeNSlAi
	 EH8Z4I6ygOE2Q==
Date: Sun, 12 Oct 2025 18:01:19 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: Frank Li <Frank.Li@nxp.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>, Miquel Raynal
 <miquel.raynal@bootlin.com>, David Lechner <dlechner@baylibre.com>, Nuno
 =?UTF-8?B?U8Oh?= <nuno.sa@analog.com>, Andy Shevchenko <andy@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, linux-i3c@lists.infradead.org,
 linux-kernel@vger.kernel.org, imx@lists.linux.dev,
 linux-iio@vger.kernel.org, joshua.yeong@starfivetech.com,
 devicetree@vger.kernel.org, Carlos Song <carlos.song@nxp.com>, Adrian
 Fluturel <fluturel.adrian@gmail.com>
Subject: Re: [PATCH v5 5/5] iio: magnetometer: Add mmc5633 sensor
Message-ID: <20251012180119.312191fd@jic23-huawei>
In-Reply-To: <20251007-i3c_ddr-v5-5-444184f7725e@nxp.com>
References: <20251007-i3c_ddr-v5-0-444184f7725e@nxp.com>
	<20251007-i3c_ddr-v5-5-444184f7725e@nxp.com>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251012_100130_956685_993F501D 
X-CRM114-Status: GOOD (  26.57  )
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

On Tue, 07 Oct 2025 16:06:17 -0400
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
> Signed-off-by: Frank Li <Frank.Li@nxp.com>

Until now I missed the ACPI IDs that look to be almost certainly invalid.
See below.


> ---
> Change in V4
> - use { 1, 2000 }
> - Add _US for timeout
> - Use GEN_MASK for MMC5633_CTRL1_BW_MASK
> - Use { } for terminator.
> - remove !!
> - fix mix tab and space
> - add mmc5603 (merge https://lore.kernel.org/all/20251003000731.22927-1-fluturel.adrian@gmail.com/)
> - add tempature measure support
> 
> Change in v3
> - remove mmc5633_hw_set
> - make -> Make
> - change indention for mmc5633_samp_freq
> - use u8 arrary to handle dword data
> - get_unaligned_be16() to get raw data
> - add helper function to check if i3c support hdr
> - use read_avail() callback
> 
> change in v2
> - new patch

> diff --git a/drivers/iio/magnetometer/mmc5633.c b/drivers/iio/magnetometer/mmc5633.c
> new file mode 100644
> index 0000000000000000000000000000000000000000..9b04cba6dbf633b7e0d136629a5aebffd072a68d
> --- /dev/null
> +++ b/drivers/iio/magnetometer/mmc5633.c


> +static int mmc5633_write_raw(struct iio_dev *indio_dev,
> +			     struct iio_chan_spec const *chan, int val,
> +			     int val2, long mask)
> +{
> +	struct mmc5633_data *data = iio_priv(indio_dev);
> +	int i, ret;
> +
> +	switch (mask) {
> +	case IIO_CHAN_INFO_SAMP_FREQ:
> +		i = mmc5633_get_samp_freq_index(data, val, val2);
> +		if (i < 0)
> +			return -EINVAL;
> +
> +		scoped_guard(mutex, &data->mutex) {
> +			ret = regmap_update_bits(data->regmap, MMC5633_REG_CTRL1,
> +						 MMC5633_CTRL1_BW_MASK,
> +						 FIELD_PREP(MMC5633_CTRL1_BW_MASK, i));
> +			if (ret)
> +				return ret;
> +		};
> +		return ret;

Trivial but to get here it must be 0 so make that apparent via
		return 0;
Then everyone can see the 'good' exit really easily.

> +	default:
> +		return -EINVAL;
> +	}
> +}

> +static const struct i2c_device_id mmc5633_i2c_id[] = {
> +	{ "mmc5603" },
> +	{ "mmc5633" },
> +	{ }
> +};
> +MODULE_DEVICE_TABLE(i2c, mmc5633_i2c_id);
> +
> +static const struct acpi_device_id mmc5633_acpi_match[] = {

Guess I missed these in previous versions. Sorry about that!

Where do these come from? 

MMC is not a registered PNP ID according to
https://uefi.org/PNP_ID_List?pnp_search=mmc

So are these in the wild? If they are provide the DSDT snippet
and a reference for where.  Also add a comment after the ID to provide
one device on which it is used.

ACPI IDs can take two valid forms. (1)   A 4 letter prefix that is
a registered ACPI ID.  e.g. HISI is the HiSilicon one I use for
the day job. And 4 digits that must be unique.  Typically each company
has a tracker for this and a process to get one assigned.
(2) A 3 letter PNP ID.  Similar otherwise.  Memsic has neither
unless issued very recently. 

So if these turn up on a device that uses ACPI either the manufacturer
of that should get MEMSIC to follow process to get an ID or use their
own.  It's common to find random sensors with IDs from device manufacturers
for this reason.  Here NXP could use their own ID for example.
They have a registered PNP ID which is the obvious NXP.  To do that
though you need to make sure you get a unique ID.



> +	{ "MMC5603", 0 },
> +	{ "mmc5633", 0 },
> +	{ }
> +};
> +MODULE_DEVICE_TABLE(acpi, mmc5633_acpi_match);
> +
> +static struct i2c_driver mmc5633_i2c_driver = {
> +	.driver = {
> +		.name = "mmc5633_i2c",
> +		.of_match_table = mmc5633_of_match,
> +		.acpi_match_table = mmc5633_acpi_match,
> +		.pm = pm_sleep_ptr(&mmc5633_pm_ops),
> +	},
> +	.probe = mmc5633_i2c_probe,
> +	.id_table =  mmc5633_i2c_id,

Really trivial but there is a extra space after the =


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
