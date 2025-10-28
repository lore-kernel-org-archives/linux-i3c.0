Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65748CCD1BF
	for <linux-i3c@archiver.kernel.org>; Tue, 28 Oct 2025 10:51:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VtSGpw8KMHNvVb2iVOtnu8v3M6lxVUK7Nj3E6mXDVVk=; b=eX7SRsdORQTfwu
	84ebo0R4pafYVpI8G0vk81rdUJsNniWt5HAKUDNjSEi8GlcptQFOxWz6M+UIP/zz2AQe6gyY+JQXr
	88vT7SLCsobq83R94b9kL/Aot8IeWveu/Kwe3MwNpVu59G10551D+hVjW3QlnypXOQVnW4JScGL2v
	S0R/8H0fMNrDqzPnuLmjKkUToAlJKfDm0/Y0ETaLC67gCjzRBW2GrLI4Pse29W8+GaUZOREXH7mxf
	M4RR2pyg0K9hqpAejCYJM8G6J2MPyRf2b+srbp0tQAs3GjZ+o+YEHrCb62LP99VRxTtCzYopz30b5
	S04OWZlKw2soqyp3fyLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDhIA-0000000FnSf-0g9h;
	Tue, 28 Oct 2025 10:51:06 +0000
Received: from mgamail.intel.com ([192.198.163.15])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDhI7-0000000FnSI-3Y49
	for linux-i3c@lists.infradead.org;
	Tue, 28 Oct 2025 10:51:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761648664; x=1793184664;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=DDhNlvzKMkJquFS7Dfuj4GY/hVUlxRX3nTDoyxMG6wI=;
  b=LkzWR2f5Wl5mBWb9NarhQwmn3BtefpC8Dfb6Bv50++U7TsFk5yClxl2x
   c/9/APQi8GVNUR251ZybV4DY+9ezXJ0gbjKtPdXhnKbgX914/SM5HejWt
   oLReQmiEO+1NqpR/mZrirxhFQ+TOjnRO7B3ZonaoWY1EQSUTjaPYqI5dp
   IzFkUqi31lUoMUYeSvhnvWRPXf+7He46AwYDAHLvnkgpClFEp+VdqAMoE
   rG4OFTPxYMWRXXPQGLAuttMQQcphodKQPvfpWSdOnaJLy7eYIH5R3Zp4Q
   4nGGMVYR15N0ntqKvvmx7MGPkCqVPYETLBm6z0B/zWSDfPs0pM9yVewF2
   A==;
X-CSE-ConnectionGUID: w8Uwn16TQ72pyO9PVsB/Bw==
X-CSE-MsgGUID: p7qqiv5fQOyk7nFyGrsozg==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="63839743"
X-IronPort-AV: E=Sophos;i="6.19,261,1754982000"; 
   d="scan'208";a="63839743"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Oct 2025 03:51:02 -0700
X-CSE-ConnectionGUID: 7/vD61a0RPifdfZOkT98bw==
X-CSE-MsgGUID: UCWqVhH5SYe9HCyiQ1fGRg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,261,1754982000"; 
   d="scan'208";a="189670343"
Received: from dalessan-mobl3.ger.corp.intel.com (HELO ashevche-desk.local) ([10.245.244.136])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Oct 2025 03:50:59 -0700
Received: from andy by ashevche-desk.local with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@intel.com>)
	id 1vDhHz-00000003Hq9-3vuo;
	Tue, 28 Oct 2025 12:50:55 +0200
Date: Tue, 28 Oct 2025 12:50:55 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Frank Li <Frank.Li@nxp.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev,
	linux-iio@vger.kernel.org, joshua.yeong@starfivetech.com,
	devicetree@vger.kernel.org, Carlos Song <carlos.song@nxp.com>,
	Adrian Fluturel <fluturel.adrian@gmail.com>
Subject: Re: [PATCH v7 5/5] iio: magnetometer: Add mmc5633 sensor
Message-ID: <aQCgD3iVOXoNr7uY@smile.fi.intel.com>
References: <20251027-i3c_ddr-v7-0-866a0ff7fc46@nxp.com>
 <20251027-i3c_ddr-v7-5-866a0ff7fc46@nxp.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251027-i3c_ddr-v7-5-866a0ff7fc46@nxp.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251028_035103_901143_CACAADAF 
X-CRM114-Status: GOOD (  28.19  )
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

On Mon, Oct 27, 2025 at 04:08:33PM -0400, Frank Li wrote:
> Add mmc5633 sensor basic support.
> - Support read 20 bits X/Y/Z magnetic.
> - Support I3C HDR mode to send start measurememt command.
> - Support I3C HDR mode to read all sensors data by one command.

...

+ time.h // for time constants

...

> +struct mmc5633_data {
> +	struct device *dev;
> +	struct i3c_device *i3cdev;
> +	struct mutex mutex; /* protect to finish one whole measurement */
> +	struct regmap *regmap;

regmap has struct device, i3c_device presumable also, and here is struct
device. Don't we have some overhead?

> +};

...

> +static const struct {
> +	int val;
> +	int val2;

No need. Just

> +} mmc5633_samp_freq[] = {

static const int mmc5633_samp_freq[][2] = {

> +	{ 1, 200000 },
> +	{ 2, 0 },
> +	{ 3, 500000 },
> +	{ 6, 600000 },
> +};

...

> +static int mmc5633_get_samp_freq_index(struct mmc5633_data *data,
> +				       int val, int val2)
> +{
> +	u32 i;

unsigned int is enough. uXX rather would suggest we use it as a such, but here
you compare with size_t and return an int.

> +
> +	for (i = 0; i < ARRAY_SIZE(mmc5633_samp_freq); i++)
> +		if (mmc5633_samp_freq[i].val == val &&
> +		    mmc5633_samp_freq[i].val2 == val2)
> +			return i;
> +	return -EINVAL;
> +}

...

> +static int mmc5633_init(struct mmc5633_data *data)
> +{
> +	unsigned int reg_id;
> +	int ret;
> +
> +	ret = regmap_read(data->regmap, MMC5633_REG_ID, &reg_id);
> +	if (ret < 0)

These ' < 0' have an explanation? Or do we expect regmap_*() return positive
numbers here? If the latter, it would be a least problem here.

> +		return dev_err_probe(data->dev, ret,
> +				     "Error reading product id\n");
> +
> +	/*
> +	 * Make sure we restore sensor characteristics, by doing
> +	 * a SET/RESET sequence, the axis polarity being naturally
> +	 * aligned after RESET.
> +	 */
> +	ret = regmap_write(data->regmap, MMC5633_REG_CTRL0, MMC5633_CTRL0_SET);
> +	if (ret < 0)
> +		return ret;

Ditto and so on...

> +	/*
> +	 * Minimum time interval between SET or RESET to other operations is
> +	 * 1ms according to Operating Timing Diagram in datasheet.
> +	 */
> +	fsleep(MMC5633_WAIT_SET_RESET_US);
> +
> +	ret = regmap_write(data->regmap, MMC5633_REG_CTRL0, MMC5633_CTRL0_RESET);
> +	if (ret < 0)
> +		return ret;
> +
> +	/* set default sampling frequency */
> +	return regmap_update_bits(data->regmap, MMC5633_REG_CTRL1,
> +				  MMC5633_CTRL1_BW_MASK,
> +				  FIELD_PREP(MMC5633_CTRL1_BW_MASK, 0));
> +}

...

> +static int mmc5633_read_measurement(struct mmc5633_data *data, int address, void *buf, size_t sz)
> +{
> +	u8 data_cmd[2], status[2];
> +	int ret, val, ready;
> +
> +	if (mmc5633_is_support_hdr(data)) {
> +		struct i3c_xfer xfers_wr_cmd[] = {
> +			{
> +				.cmd = 0x3b,
> +				.len = 2,
> +				.data.out = data_cmd,
> +			}
> +		};
> +		struct i3c_xfer xfers_rd_sta_cmd[] = {
> +			{
> +				.cmd = 0x23 | BIT(7), /* RDSTA CMD */
> +				.len = 2,
> +				.data.in = status,
> +			},
> +		};
> +		struct i3c_xfer xfers_rd_data_cmd[] = {
> +			{
> +				.cmd = 0x22 | BIT(7), /* RDLONG CMD */
> +				.len = sz,
> +				.data.in = buf,
> +			},
> +		};
> +
> +		data_cmd[0] = 0;
> +		data_cmd[1] = (address == MMC5633_TEMPERATURE) ?
> +			      MMC5633_HDR_CTRL0_MEAS_T : MMC5633_HDR_CTRL0_MEAS_M;
> +
> +		ret = i3c_device_do_xfers(data->i3cdev, xfers_wr_cmd, 1, I3C_HDR_DDR);

1 --> ARRAY_SIZE(), but TBH I do not see the point them to be an array to begin
with. Any elaboration on the data type choice?

> +		if (ret < 0)
> +			return ret;
> +
> +		ready = (address == MMC5633_TEMPERATURE) ?
> +			MMC5633_STATUS1_MEAS_T_DONE_BIT : MMC5633_STATUS1_MEAS_M_DONE_BIT;
> +		ret = read_poll_timeout(i3c_device_do_xfers, val,
> +					val ||
> +					status[0] & ready,
> +					10 * USEC_PER_MSEC,
> +					100 * 10 * USEC_PER_MSEC, 0,
> +					data->i3cdev, xfers_rd_sta_cmd, 1, I3C_HDR_DDR);
> +		if (ret) {
> +			dev_err(data->dev, "data not ready\n");
> +			return ret;
> +		}
> +		if (val) {
> +			dev_err(data->dev, "i3c transfer error\n");
> +			return val;
> +		}
> +		return i3c_device_do_xfers(data->i3cdev, xfers_rd_data_cmd, 1, I3C_HDR_DDR);
> +	}
> +
> +	/* Fallback to use SDR/I2C mode */
> +	ret = mmc5633_take_measurement(data, address);
> +	if (ret < 0)
> +		return ret;
> +
> +	if (address == MMC5633_TEMPERATURE)
> +		/*
> +		 * Put tempeature to last byte of buff to align HDR case.
> +		 * I3C will early terminate data read if previous data is not
> +		 * available.
> +		 */
> +		return regmap_bulk_read(data->regmap, MMC5633_REG_TOUT, buf + sz - 1, 1);
> +
> +	return regmap_bulk_read(data->regmap, MMC5633_REG_XOUT_L, buf, sz);
> +}

...

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

Hmm... Can't that return already an error and we just pass it to the caller?

> +		scoped_guard(mutex, &data->mutex) {
> +			ret = regmap_update_bits(data->regmap, MMC5633_REG_CTRL1,
> +						 MMC5633_CTRL1_BW_MASK,
> +						 FIELD_PREP(MMC5633_CTRL1_BW_MASK, i));
> +			if (ret)
> +				return ret;
> +		};
> +		return 0;

I didn't get why scoped_guard() is used when simple guard()() will do in
shorter all this.

		guard(mutex)(&data->mutex);

		return regmap_update_bits(data->regmap, MMC5633_REG_CTRL1,
					  MMC5633_CTRL1_BW_MASK,
					  FIELD_PREP(MMC5633_CTRL1_BW_MASK, i));

With that you may drop 'int i' part and use ret in the above.

> +	default:
> +		return -EINVAL;
> +	}
> +}

...

> +static int mmc5633_common_probe(struct device *dev, struct regmap *regmap,
> +				char *name, struct i3c_device *i3cdev)
> +{
> +	struct mmc5633_data *data;
> +	struct iio_dev *indio_dev;
> +	int ret;
> +
> +	indio_dev = devm_iio_device_alloc(dev, sizeof(*data));
> +	if (!indio_dev)
> +		return -ENOMEM;

> +	dev_set_drvdata(dev, indio_dev);

If you use regmap stored device this won't be needed. See below.

> +	data = iio_priv(indio_dev);
> +
> +	data->regmap = regmap;
> +	data->i3cdev = i3cdev;
> +	data->dev = dev;
> +
> +	ret = devm_mutex_init(dev, &data->mutex);
> +	if (ret)
> +		return ret;
> +
> +	indio_dev->info = &mmc5633_info;
> +	indio_dev->name = name;
> +	indio_dev->channels = mmc5633_channels;
> +	indio_dev->num_channels = ARRAY_SIZE(mmc5633_channels);
> +	indio_dev->modes = INDIO_DIRECT_MODE;
> +
> +	ret = mmc5633_init(data);
> +	if (ret < 0)
> +		return dev_err_probe(dev, ret, "mmc5633 chip init failed\n");
> +
> +	return devm_iio_device_register(dev, indio_dev);
> +}
> +
> +static int mmc5633_suspend(struct device *dev)
> +{
> +	struct mmc5633_data *data = iio_priv(dev_get_drvdata(dev));

Than regmap will be derived directly from a device.

> +	regcache_cache_only(data->regmap, true);
> +
> +	return 0;
> +}
> +
> +static int mmc5633_resume(struct device *dev)
> +{

Ditto.

> +	struct mmc5633_data *data = iio_priv(dev_get_drvdata(dev));
> +	int ret;
> +
> +	regcache_mark_dirty(data->regmap);
> +	ret = regcache_sync_region(data->regmap, MMC5633_REG_CTRL0,
> +				   MMC5633_REG_CTRL1);
> +	if (ret < 0)
> +		dev_err(dev, "Failed to restore control registers\n");
> +
> +	regcache_cache_only(data->regmap, false);
> +
> +	return 0;
> +}

...

> +	return mmc5633_common_probe(dev, regmap, client->name, NULL);

dev can be derived from regmap.

...


> +	return mmc5633_common_probe(dev, regmap, "mmc5633_i3c", i3cdev);

Ditto.

struct i3c_device doesn't have a name, does it?

-- 
With Best Regards,
Andy Shevchenko



-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
