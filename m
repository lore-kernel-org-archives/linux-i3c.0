Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBFAAD65C57
	for <linux-i3c@archiver.kernel.org>; Thu, 14 Nov 2024 07:56:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IGTZYUS0iPln9jo+pL+865GZdZMiaGDQi3GYj7HNIII=; b=TTrECWNGjSVV95
	2+REN4PDSHaVbonpvlr4djWJKn0jTOu81ggKOXQlreoL532G0yYtMEVyxODeexCg/6Qhh0FYb95jK
	kbVF+1HyZRdVNZndhFW5wGLQX+nTKVFO+eWOcY6rwS9mAEWu75emZgUu+osKnRZM7ZkeycgmNMl7K
	eouZ72IVlUkvj3RdjXkCuetXsfwnwXKbEAx1KmsUCHF/1H8jIMf/SUNf1ldYF4cN96WVaX3C4czqd
	kx5m+7PTp2kv+YB+0P6bGCIoL+6Rg9blqSLLrJpx7CUokCbehHzpTjP5MoLRmFsoMmRibYwzlZMW8
	7ibsTJEbcCZaMrW30b7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tBUi3-000000098p6-263M;
	Thu, 14 Nov 2024 07:56:11 +0000
Received: from relay4-d.mail.gandi.net ([217.70.183.196])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tBUhz-000000098nq-0hwc
	for linux-i3c@lists.infradead.org;
	Thu, 14 Nov 2024 07:56:09 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id E5491E0009;
	Thu, 14 Nov 2024 07:56:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1731570963;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=HGQfzvwZ4LhS+0JRtAIg20n5NDP4Kk7Tj1CHKPaD9oo=;
	b=pWKx2in4bHm+sIZktfqAhQ4CupdFLK5L3Gn5uvJtw0MI3w1hsf8tYYugjgEf+ODeOZ0AXx
	Z5EO9CTxmDNEAVD+vyOSjBL1DQjHd7+oltYDlw8naf4Tujw/3yo4ZqMyPhdPM0GfzlfIPE
	ICzH8HR/i5XpJA5eizLzOuMYL0NvIzi2CjAOJfOpcqDK2jmquo6n73brw8GX4i8+w7g0el
	aYScFNAN6/tvHQ5id/hgjOVBiUwtpxj+MLwlSB1q5LtGwHxM48QKYXTDN4rqAOoiPo911V
	5TlA79g0w1YxlN0qpnQwF6lI00MjPzfFOsFPCZ+EVlyfiK9LB8h2d6wVSjrYSg==
Date: Thu, 14 Nov 2024 08:56:01 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Jarkko Nikula <jarkko.nikula@linux.intel.com>,
	Sanket.Goswami@amd.com, linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-acpi@vger.kernel.org
Subject: Re: [PATCH v3 2/5] i3c: master: Add ACPI support to i3c subsystem
Message-ID: <20241114075601f451d590@mail.local>
References: <20241108073323.523805-1-Shyam-sundar.S-k@amd.com>
 <20241108073323.523805-3-Shyam-sundar.S-k@amd.com>
 <ZzS1-nJMPiCp5jDi@kuha.fi.intel.com>
 <079db1b6-0f95-452e-832b-7d392e130028@amd.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <079db1b6-0f95-452e-832b-7d392e130028@amd.com>
X-GND-Sasl: alexandre.belloni@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241113_235608_299976_EBA2A003 
X-CRM114-Status: GOOD (  37.48  )
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

On 14/11/2024 10:03:13+0530, Shyam Sundar S K wrote:
> 
> 
> On 11/13/2024 19:51, Heikki Krogerus wrote:
> > Hi,
> > 
> > On Fri, Nov 08, 2024 at 01:03:20PM +0530, Shyam Sundar S K wrote:
> >> As of now, the I3C subsystem only has ARM-specific initialization, and
> >> there is no corresponding ACPI plumbing present. To address this, ACPI
> >> support needs to be added to both the I3C core and DW driver.
> >>
> >> Add support to get the ACPI handle from the _HID probed and parse the apci
> >> object to retrieve the slave information from BIOS.
> >>
> >> Based on the acpi object information propogated via BIOS, build the i3c
> >> board information so that the same information can be used across the
> >> driver to handle the slave requests.
> >>
> >> Co-developed-by: Sanket Goswami <Sanket.Goswami@amd.com>
> >> Signed-off-by: Sanket Goswami <Sanket.Goswami@amd.com>
> >> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
> >> ---
> >> Cc: linux-acpi@vger.kernel.org
> >>
> >>  drivers/i3c/internals.h            |  3 ++
> >>  drivers/i3c/master.c               | 84 ++++++++++++++++++++++++++++++
> >>  drivers/i3c/master/dw-i3c-master.c |  7 +++
> >>  include/linux/i3c/master.h         |  1 +
> >>  4 files changed, 95 insertions(+)
> >>
> >> diff --git a/drivers/i3c/internals.h b/drivers/i3c/internals.h
> >> index 433f6088b7ce..178bc0ebe6b6 100644
> >> --- a/drivers/i3c/internals.h
> >> +++ b/drivers/i3c/internals.h
> >> @@ -10,6 +10,9 @@
> >>  
> >>  #include <linux/i3c/master.h>
> >>  
> >> +#define I3C_GET_PID		0x08
> >> +#define I3C_GET_ADDR		0x7F
> >> +
> >>  void i3c_bus_normaluse_lock(struct i3c_bus *bus);
> >>  void i3c_bus_normaluse_unlock(struct i3c_bus *bus);
> >>  
> >> diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
> >> index 6f3eb710a75d..0ceef2aa9161 100644
> >> --- a/drivers/i3c/master.c
> >> +++ b/drivers/i3c/master.c
> >> @@ -2251,6 +2251,84 @@ static int of_i3c_master_add_dev(struct i3c_master_controller *master,
> >>  	return ret;
> >>  }
> >>  
> >> +#if IS_ENABLED(CONFIG_ACPI)
> >> +static int i3c_acpi_configure_master(struct i3c_master_controller *master)
> >> +{
> >> +	struct acpi_buffer buf = {ACPI_ALLOCATE_BUFFER, NULL};
> >> +	enum i3c_addr_slot_status addrstatus;
> >> +	struct i3c_dev_boardinfo *boardinfo;
> >> +	struct device *dev = &master->dev;
> >> +	struct fwnode_handle *fwnode;
> >> +	struct acpi_device *adev;
> >> +	u32 slv_addr, num_dev;
> >> +	acpi_status status;
> >> +	u64 val;
> >> +
> >> +	status = acpi_evaluate_object_typed(master->ahandle, "_DSD", NULL, &buf, ACPI_TYPE_PACKAGE);
> >> +	if (ACPI_FAILURE(status)) {
> >> +		dev_err(&master->dev, "Error reading _DSD:%s\n", acpi_format_exception(status));
> >> +		return -ENODEV;
> >> +	}
> > 
> > Why do you need to do that?
> > 
> >> +	num_dev = device_get_child_node_count(dev);
> >> +	if (!num_dev) {
> >> +		dev_err(&master->dev, "Error: no child node present\n");
> >> +		return -EINVAL;
> >> +	}
> > 
> > I think Jarkko already pointed out the problem with that. The whole
> > check should be dropped.
> > 
> >> +	device_for_each_child_node(dev, fwnode) {
> >> +		adev = to_acpi_device_node(fwnode);
> >> +		if (!adev)
> >> +			return -ENODEV;
> >> +
> >> +		status = acpi_evaluate_integer(adev->handle, "_ADR", NULL, &val);
> >> +		if (ACPI_FAILURE(status)) {
> >> +			dev_err(&master->dev, "Error: eval _ADR failed\n");
> >> +			return -EINVAL;
> >> +		}
> > 
> > val = acpi_device_adr(adev);
> > 
> >> +		slv_addr = val & I3C_GET_ADDR;
> >> +
> >> +		boardinfo = devm_kzalloc(dev, sizeof(*boardinfo), GFP_KERNEL);
> >> +		if (!boardinfo)
> >> +			return -ENOMEM;
> >> +
> >> +		if (slv_addr) {
> >> +			if (slv_addr > I3C_MAX_ADDR)
> >> +				return -EINVAL;
> >> +
> >> +			addrstatus = i3c_bus_get_addr_slot_status(&master->bus, slv_addr);
> >> +			if (addrstatus != I3C_ADDR_SLOT_FREE)
> >> +				return -EINVAL;
> >> +		}
> >> +
> >> +		boardinfo->static_addr = slv_addr;
> >> +		if (boardinfo->static_addr > I3C_MAX_ADDR)
> >> +			return -EINVAL;
> >> +
> >> +		addrstatus = i3c_bus_get_addr_slot_status(&master->bus,	boardinfo->static_addr);
> >> +		if (addrstatus != I3C_ADDR_SLOT_FREE)
> >> +			return -EINVAL;
> >> +
> >> +		boardinfo->pid = val >> I3C_GET_PID;
> >> +		if ((boardinfo->pid & GENMASK_ULL(63, 48)) ||
> >> +		    I3C_PID_RND_LOWER_32BITS(boardinfo->pid))
> >> +			return -EINVAL;
> >> +
> >> +		/*
> >> +		 * According to the specification, SETDASA is not supported for DIMM slaves
> >> +		 * during device discovery. Therefore, BIOS will populate same initial
> >> +		 * dynamic address as the static address.
> >> +		 */
> >> +		boardinfo->init_dyn_addr = boardinfo->static_addr;
> >> +		list_add_tail(&boardinfo->node, &master->boardinfo.i3c);
> >> +	}
> >> +
> >> +	return 0;
> >> +}
> >> +#else
> >> +static int i3c_acpi_configure_master(struct i3c_master_controller *master) { return 0; }
> >> +#endif
> > 
> > I think this code should be placed into a separate file.
> > 
> > If the goal is to add ACPI support for code that is written for DT
> > only, then I think the first thing to do before that really should be
> > to convert the existing code to use the unified device property
> > interface, and move all the DT-only parts to a separate file(s).
> > 
> 
> Thank you Jarkko and Heikki. Let me work and these remarks and come
> back with a new version.
> 
> Jarkko, will you be able to pick 1/5 and 5/5 without a separate series
> or do you want me to send one?

Please send a new series.


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
