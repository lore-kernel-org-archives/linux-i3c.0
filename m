Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2485CAC5B0
	for <linux-i3c@archiver.kernel.org>; Sat, 27 Sep 2025 18:59:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XO4uncuhmOt19wb2UE65AQksv2n5rfsqUiziShpnHu4=; b=Tq+b4Gdwta9AAW
	ZRZtkz/KqyvbU9l5n2K2KABtUJdQfmXfoYj13ayexq20rESgJ99mUf49TKWhNOwXjuWjO3U7Ag1zh
	9Pw54Kks7ALRHaiPO9Fjpf4LiKqxAJzqPYZ5Hr5Swa/E0qdihumtmhx/xpWf0rCw5rx4fgfOoCJdV
	Y10EymYPxqpGo9qSE7gTSyULDISHcGkOoX/w9wyxodbJOIRaK3xQFsttEiM0p1+8d3HLiJCvR64Ym
	WKcCZMyG2Na52NqeA5qszJWAEbyahaEMQgOTrdLOBTnA/IG9n27vJ37fsaPyHVIgRmv8MYtBmX7qf
	JTjXJYj8lgPzWez/28ZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v2a8X-0000000BqCv-1aaG;
	Sat, 27 Sep 2025 18:59:13 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v2a8U-0000000BqBH-3jdp
	for linux-i3c@lists.infradead.org;
	Sat, 27 Sep 2025 18:59:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 8ECDC449D5;
	Sat, 27 Sep 2025 18:59:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3D3E6C4CEE7;
	Sat, 27 Sep 2025 18:59:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758999548;
	bh=1OSBLp+ttR8asbRvrYHxL+vC8NOwayV1Z9SDsTwxsds=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=n1Qugc1n/7qqhn6TamTuS738XeJlrTckf1cUScCmq7GIX27zuh5Euk8VTTbhSiRFd
	 n46Avvw0lBz/09SA/+gNV30ChokxznBIE+ASVU4nci40ODmvYphyY1fax9ptgAU6NU
	 Wcoq/GwG6QUUNYE9bXFzd3d0qM1O1bsfnhf0NpJ8V8/TQLNvGzGcMtYFGiC5mF5wDg
	 arZ+IbA+8zNJo5CM0RqcyKpFKnu+qTg3+1wFOZAPnpp9da8a1j1ndTDN5VimErMxhe
	 +vXQ5B2JWNbKuDx16YHkXFMXOH1K9YNTvndQG4SypuY9JaDeqp8W1WWNYk0WLEZOa+
	 FdEeReYeLdeSQ==
Date: Sat, 27 Sep 2025 19:58:59 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: Frank Li <Frank.Li@nxp.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>, Miquel Raynal
 <miquel.raynal@bootlin.com>, David Lechner <dlechner@baylibre.com>, Nuno
 =?UTF-8?B?U8Oh?= <nuno.sa@analog.com>, Andy Shevchenko <andy@kernel.org>,
 linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org,
 imx@lists.linux.dev, linux-iio@vger.kernel.org, Carlos Song
 <carlos.song@nxp.com>
Subject: Re: [PATCH v2 4/4] iio: magnetometer: Add mmc5633 sensor
Message-ID: <20250927195859.28a6069e@jic23-huawei>
In-Reply-To: <20250924-i3c_ddr-v2-4-682a0eb32572@nxp.com>
References: <20250924-i3c_ddr-v2-0-682a0eb32572@nxp.com>
	<20250924-i3c_ddr-v2-4-682a0eb32572@nxp.com>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.50; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250927_115910_986323_51FF1708 
X-CRM114-Status: GOOD (  36.95  )
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

On Wed, 24 Sep 2025 10:30:05 -0400
Frank Li <Frank.Li@nxp.com> wrote:

> Add mmc5633 sensor basic support.
> - Support read 20 bits X/Y/Z magnetic.
> - Support I3C HDR mode to send start measurememt command.
> - Support I3C HDR mode to read all sensors data by one command.
> 
> Co-developed-by: Carlos Song <carlos.song@nxp.com>
> Signed-off-by: Carlos Song <carlos.song@nxp.com>
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
> change in v2
> - new patch
> ---
HI Frank,

Some minor comments inline,

Thanks,

Jonathan

>  drivers/iio/magnetometer/Kconfig   |  12 +
>  drivers/iio/magnetometer/Makefile  |   1 +
>  drivers/iio/magnetometer/mmc5633.c | 543 +++++++++++++++++++++++++++++++++++++
>  3 files changed, 556 insertions(+)
> 
> diff --git a/drivers/iio/magnetometer/Kconfig b/drivers/iio/magnetometer/Kconfig
> index 81b812a29044e2b0b9ff84889c21aa3ebc20be35..cfb74a4a083630678a1db1132a14264de451a31a 100644
> --- a/drivers/iio/magnetometer/Kconfig
> +++ b/drivers/iio/magnetometer/Kconfig

> diff --git a/drivers/iio/magnetometer/mmc5633.c b/drivers/iio/magnetometer/mmc5633.c
> new file mode 100644
> index 0000000000000000000000000000000000000000..b1a6973ea175634bbc2247ff84488ea5393eba0e
> --- /dev/null
> +++ b/drivers/iio/magnetometer/mmc5633.c
> @@ -0,0 +1,543 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * MMC5633 - MEMSIC 3-axis Magnetic Sensor
> + *
> + * Copyright (c) 2015, Intel Corporation.
> + * Copyright (c) 2025, NXP
> + *
> + * IIO driver for MMC5633, base on mmc35240.c
> + *
Trivial but this blank line doesn't add anything, so drop it.

> + */

> +static const struct {
> +	int val;
> +	int val2;
> +} mmc5633_samp_freq[] = { {1, 200000},
> +			  {2, 0},
> +			  {3, 500000},
> +			  {6, 600000},
> +			};

Generally prefer { 1, 20000 } 
style for IIO and here I'd format this as:

static const struct {
	int val;
	int val2;
} mmc5633_samp_freq[] = {
	{ 1, 200000 },
	{ 2, 0 },
	{ 3, 500000 },
	{ 6, 600000 },
};

> +
> +static IIO_CONST_ATTR_SAMP_FREQ_AVAIL("1.2 2.0 3.5 6.6");

> +
> +static struct attribute *mmc5633_attributes[] = {
> +	&iio_const_attr_sampling_frequency_available.dev_attr.attr,
Please use the read_avail() callback and the associated masks.

That makes it available for in kernel users and generally is preferred
for new drivers.  One day I'll get rid of the defines you are using here
but it will take a while yet!

> +	NULL
> +};
> +
> +static const struct attribute_group mmc5633_attribute_group = {
> +	.attrs = mmc5633_attributes,
> +};

> +
> +static int mmc5633_hw_set(struct mmc5633_data *data, bool set)
> +{
> +	u8 coil_bit;
> +
> +	if (set)
> +		coil_bit = MMC5633_CTRL0_SET;
> +	else
> +		coil_bit = MMC5633_CTRL0_RESET;
> +
> +	return regmap_write(data->regmap, MMC5633_REG_CTRL0, coil_bit);

This helper doesn't provide all that much value. Maybe just
call the regmap_write() inline and let the value written make
it obvious which is set and reset?

> +}
> +
> +static int mmc5633_init(struct mmc5633_data *data)
> +{
> +	unsigned int reg_id, ret;
> +
> +	ret = regmap_read(data->regmap, MMC5633_REG_ID, &reg_id);
> +	if (ret < 0)
> +		return dev_err_probe(data->dev, ret,
> +				     "Error reading product id\n");
> +
> +	/*
> +	 * make sure we restore sensor characteristics, by doing

Make

> +	 * a SET/RESET sequence, the axis polarity being naturally
> +	 * aligned after RESET

RESET.

> +	 */
> +	ret = mmc5633_hw_set(data, true);
> +	if (ret < 0)
> +		return ret;
> +
> +	usleep_range(MMC5633_WAIT_SET_RESET, MMC5633_WAIT_SET_RESET + 1);
> +
> +	ret = mmc5633_hw_set(data, false);
> +	if (ret < 0)
> +		return ret;
> +
> +	/* set default sampling frequency */
> +	ret = regmap_update_bits(data->regmap, MMC5633_REG_CTRL1,
> +				 MMC5633_CTRL1_BW_MASK,
> +				 FIELD_PREP(MMC5633_CTRL1_BW_MASK, 0));
> +	if (ret < 0)
> +		return ret;
> +
> +	return 0;

	return regmap_upate_bits()

Given regmap always returns negative for errors of 0 for success it
would be better to check if (ret) which then makes this sort of final
call look more obviously correct.


> +}
> +
> +static int mmc5633_take_measurement(struct mmc5633_data *data)
> +{
> +	unsigned int reg_status;
> +	int ret;
> +
> +	ret = regmap_write(data->regmap, MMC5633_REG_CTRL0, MMC5633_CTRL0_MEAS_M);
> +	if (ret < 0)
> +		return ret;
> +
> +	ret = regmap_read_poll_timeout(data->regmap, MMC5633_REG_STATUS1, reg_status,
> +				       reg_status & MMC5633_STATUS1_MEAS_M_DONE_BIT,
> +				       10000, 10000 * 100);
> +
Drop the blank line here to keep the error check associated with the call
> +	if (ret) {
> +		dev_err(data->dev, "data not ready\n");
> +		return -EIO;
Why not return ret
> +	}
> +
> +	return 0;
> +}
> +
> +static int mmc5633_read_measurement(struct mmc5633_data *data, void *buf, size_t sz)
> +{
> +	__le16 data_word;
> +	__le16 status;
Might as well combine on one line.

> +	int ret, val;
> +
> +	if (data->i3cdev &&
> +	    (i3c_device_get_supported_xfer_mode(data->i3cdev) & BIT(I3C_HDR_DDR))) {

I'd factor this lot out as a helper function to improve readability a little.

> +		struct i3c_xfer xfers_wr_cmd[] = {
> +			{
> +				.cmd = 0x3b,
> +				.len = 2,
> +				.data.out = &data_word,
> +			}
> +		};
> +
> +		struct i3c_xfer xfers_rd_sta_cmd[] = {
> +			{
> +				.cmd = 0x23 | BIT(7), /* RDSTA CMD */
> +				.len = 2,
> +				.data.in = &status,
> +			},
> +		};
> +
> +		struct i3c_xfer xfers_rd_data_cmd[] = {
> +			{
> +				.cmd = 0x22 | BIT(7), /* RDLONG CMD */
> +				.len = sz,
> +				.data.in = buf,
> +			},
> +		};
> +
> +		data_word = cpu_to_le16(MMC5633_HDR_CTRL0_MEAS_M << 8);

if you are shifting it by 8 bits and it's an 16 bit value, feels like it's actually not
and it's a pair of bytes. Perhaps just set the relevant byte in a u8 [2] would be clearer?
If this is how it's described on the datasheet I guess I don't mind that much.

> +
> +		ret = i3c_device_do_xfers(data->i3cdev, xfers_wr_cmd, 1, I3C_HDR_DDR);
> +		if (ret < 0)
> +			return ret;
> +
> +		ret = read_poll_timeout(i3c_device_do_xfers, val,
> +					val ||
> +					(le16_to_cpu(status) & MMC5633_STATUS1_MEAS_M_DONE_BIT),
> +					10000, 10000 * 100, 0,
> +					data->i3cdev, xfers_rd_sta_cmd, 1, I3C_HDR_DDR);
> +
> +		if (ret || val) {
> +			dev_err(data->dev, "data not ready\n");
> +			return -EIO;
Nice to return ret if it is set.  

> +		}
> +
> +		return i3c_device_do_xfers(data->i3cdev, xfers_rd_data_cmd, 1, I3C_HDR_DDR);
> +	}
> +
> +	/* Fallback to use SDR/I2C mode */
> +	ret = mmc5633_take_measurement(data);
> +	if (ret < 0)
> +		return ret;
> +
> +	return regmap_bulk_read(data->regmap, MMC5633_REG_XOUT_L, buf, sz);
> +}
> +
> +static int mmc5633_get_raw(struct mmc5633_data *data, int index, unsigned char *buf, int *val)
> +{
> +	/*
> +	 * X[19..12] X[11..4] Y[19..12] Y[11..4] Z[19..12] Z[11..4] X[3..0] Y[3..0] Z[3..0]
> +	 */
> +	*val = buf[2 * index];
> +	*val <<= 8;
> +
> +	*val |= buf[2 * index + 1];
> +	*val <<= 8;

First bit could be a get_unaligned_be16() << 8 or something like that.

> +
> +	*val |= buf[index + 6];
> +
> +	*val >>= 4;
> +
> +	return 0;
> +}
> +
> +#define MMC5633_ALL_SIZE (3 * 3 + 1) /* each channel have 3 byte and TEMP */
> +
> +static int mmc5633_read_raw(struct iio_dev *indio_dev,
> +			    struct iio_chan_spec const *chan, int *val,
> +			    int *val2, long mask)
> +{
> +	struct mmc5633_data *data = iio_priv(indio_dev);
> +	char buf[MMC5633_ALL_SIZE];
> +	unsigned int reg;
> +	int ret, i;
> +
> +	switch (mask) {
> +	case IIO_CHAN_INFO_RAW:
> +		scoped_guard(mutex, &data->mutex) {
> +			ret = mmc5633_read_measurement(data, buf, MMC5633_ALL_SIZE);
> +			if (ret < 0)
> +				return ret;
> +		}
> +
> +		ret = mmc5633_get_raw(data, chan->address, buf, val);
> +		if (ret < 0)
> +			return ret;
> +		return IIO_VAL_INT;
> +	case IIO_CHAN_INFO_SCALE:
> +		*val = 0;
> +		*val2 = 62500;
> +		return IIO_VAL_INT_PLUS_NANO;
> +	case IIO_CHAN_INFO_SAMP_FREQ:
> +		scoped_guard(mutex, &data->mutex) {
> +			ret = regmap_read(data->regmap, MMC5633_REG_CTRL1, &reg);
> +			if (ret < 0)
> +				return ret;
> +		}
> +
> +		i = FIELD_GET(MMC5633_CTRL1_BW_MASK, reg);
> +		if (i < 0 || i >= ARRAY_SIZE(mmc5633_samp_freq))

How does a FIELD_GET() give a negative?

> +			return -EINVAL;
> +
> +		*val = mmc5633_samp_freq[i].val;
> +		*val2 = mmc5633_samp_freq[i].val2;
> +		return IIO_VAL_INT_PLUS_MICRO;
> +	default:
> +		return -EINVAL;
> +	}
> +}

>
> +static const struct of_device_id mmc5633_of_match[] = {
> +	{ .compatible = "memsic,mmc5633", },
> +	{ }
> +};
> +MODULE_DEVICE_TABLE(of, mmc5633_of_match);
> +
> +static const struct i2c_device_id mmc5633_i2c_id[] = {
> +	{ "mmc5633" },
> +	{}
be consistent. I'd prefer
	{ }

> +};
> +MODULE_DEVICE_TABLE(i2c, mmc5633_i2c_id);

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
