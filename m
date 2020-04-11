Return-Path: <SRS0=aOFA=53=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8055AC2BA2B
	for <linux-i3c@archiver.kernel.org>; Sat, 11 Apr 2020 12:04:12 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4633220787
	for <linux-i3c@archiver.kernel.org>; Sat, 11 Apr 2020 12:04:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="UwLu/1U7"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4633220787
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4l2jepfqvnHRq9RDgACyklj44C+EhaLv6R+JYtXFh2o=; b=UwLu/1U7RNgS0n
	GTSnLBdKxClElPn3WUx5T6tcm6nS1ICP7vDVJEeZ5jAK3h7L3kLz6yFaqmeysu/NfgVlmnCkJbSkH
	LiTiqZTaddOqSMia7/C0nAA+IlsrLCr37m6GNgaaXj61uIhLZ/+zcp/F1BFw5lFC8ab24VahmxtOF
	+cMOmqaaiKo0thbdnryDknJ3Z9XCPu28CInKqnJlzZqOpcQ0hEyEebSQBmtJ0BXoHFzZ2FW6FCkV2
	mahCOmQwtI7/FokOGUrtTzysR/t7X1o68gF6HzUbfx7Sa0r9HHw51vM8U9k91U31H5BdQ88j1sLYv
	w98c/CMnHTfgzr8GIV+g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jNErn-0007Yb-S0; Sat, 11 Apr 2020 12:04:07 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jNErk-0007OC-8p
 for linux-i3c@lists.infradead.org; Sat, 11 Apr 2020 12:04:06 +0000
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:b93f:9fae:b276:a89a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id E43982A049C;
 Sat, 11 Apr 2020 13:03:55 +0100 (BST)
Date: Sat, 11 Apr 2020 14:03:53 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Conor Culhane <conor.culhane@silvaco.com>
Subject: Re: [PATCH] i3c: master: Add driver for Silvaco I3C Dual-Role
 Master IP
Message-ID: <20200411140353.16872a7f@collabora.com>
In-Reply-To: <20200325160047.11082-1-conor.culhane@silvaco.com>
References: <20200325160047.11082-1-conor.culhane@silvaco.com>
Organization: Collabora
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200411_050404_581201_22991C73 
X-CRM114-Status: GOOD (  26.91  )
X-BeenThere: linux-i3c@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux I3C <linux-i3c.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-i3c>,
 <mailto:linux-i3c-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-i3c/>
List-Post: <mailto:linux-i3c@lists.infradead.org>
List-Help: <mailto:linux-i3c-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-i3c>,
 <mailto:linux-i3c-request@lists.infradead.org?subject=subscribe>
Cc: linux-i3c@lists.infradead.org, bbrezillon@kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

Hi Connor,

On Wed, 25 Mar 2020 12:00:47 -0400
Conor Culhane <conor.culhane@silvaco.com> wrote:

> This driver currently supports I3C SDR transfers. I3C HDR-DDR
> transfer support may be added in the future.
> 
> Signed-off-by: Conor Culhane <conor.culhane@silvaco.com>
> ---
>  drivers/i3c/master/Kconfig          |    8 +
>  drivers/i3c/master/Makefile         |    3 +-
>  drivers/i3c/master/svc-i3c-master.c | 3801 +++++++++++++++++++++++++++

Wow, almost 4k LoC for a driver supporting only SDR tranfers. Let's see
if we can shrink that a bit.

>  3 files changed, 3811 insertions(+), 1 deletion(-)
>  create mode 100644 drivers/i3c/master/svc-i3c-master.c
> 
> diff --git a/drivers/i3c/master/Kconfig b/drivers/i3c/master/Kconfig
> index 4e80a1fcbf91..032b4de14277 100644
> --- a/drivers/i3c/master/Kconfig
> +++ b/drivers/i3c/master/Kconfig
> @@ -21,3 +21,11 @@ config DW_I3C_MASTER
>  
>  	  This driver can also be built as a module.  If so, the module
>  	  will be called dw-i3c-master.
> +
> +config SVC_I3C_MASTER
> +	tristate "Silvaco I3C Dual-Role Master driver"
> +	depends on I3C
> +	depends on HAS_IOMEM
> +	depends on !(ALPHA || PARISC)
> +	help
> +	  Support for Silvaco I3C Dual-Role Master Controller.
> diff --git a/drivers/i3c/master/Makefile b/drivers/i3c/master/Makefile
> index 7eea9e086144..e949dbd4f889 100644
> --- a/drivers/i3c/master/Makefile
> +++ b/drivers/i3c/master/Makefile
> @@ -1,3 +1,4 @@
>  # SPDX-License-Identifier: GPL-2.0-only
>  obj-$(CONFIG_CDNS_I3C_MASTER)		+= i3c-master-cdns.o
> -obj-$(CONFIG_DW_I3C_MASTER)		+= dw-i3c-master.o
> +obj-$(CONFIG_DW_I3C_MASTER)			+= dw-i3c-master.o

The above line doesn't have to change.

> +obj-$(CONFIG_SVC_I3C_MASTER)		+= svc-i3c-master.o
> diff --git a/drivers/i3c/master/svc-i3c-master.c b/drivers/i3c/master/svc-i3c-master.c
> new file mode 100644
> index 000000000000..5552a5aecbb1
> --- /dev/null
> +++ b/drivers/i3c/master/svc-i3c-master.c
> @@ -0,0 +1,3801 @@

...

> +
> +// Master Mode Config (MCONFIG) Register Details
> +#define I3C_MCONFIG_MSTENA_MASK 0x00000003
> +#define I3C_MCONFIG_MSTENA_SHFT 0
> +#define I3C_MCONFIG_MSTENA_DISABLE 0
> +#define I3C_MCONFIG_MSTENA_ENABLE 1
> +#define I3C_MCONFIG_MSTENA_CAPABLE 2
> +
> +#define I3C_MCONFIG_DISTO_MASK 0x00000008
> +#define I3C_MCONFIG_DISTO_SHFT 3
> +
> +#define I3C_MCONFIG_HKEEP_MASK 0x00000030
> +#define I3C_MCONFIG_HKEEP_SHFT 4
> +#define I3C_MCONFIG_HKEEP_NONE 0
> +#define I3C_MCONFIG_HKEEP_ON_CHIP 1
> +#define I3C_MCONFIG_HKEEP_EXT_SDA 2
> +#define I3C_MCONFIG_HKEEP_EXT_SDA_SCL 3
> +
> +#define I3C_MCONFIG_ODSTOP_MASK 0x00000040
> +#define I3C_MCONFIG_ODSTOP_SHFT 6
> +#define I3C_MCONFIG_PPBAUD_MASK 0x00000F00
> +#define I3C_MCONFIG_PPBAUD_SHFT 8
> +#define I3C_MCONFIG_PPLOW_MASK 0x0000F000
> +#define I3C_MCONFIG_PPLOW_SHFT 12
> +#define I3C_MCONFIG_ODBAUD_MASK 0x00FF0000
> +#define I3C_MCONFIG_ODBAUD_SHFT 16
> +#define I3C_MCONFIG_ODHPP_MASK 0x01000000
> +#define I3C_MCONFIG_ODHPP_SHFT 24
> +#define I3C_MCONFIG_SKEW_MASK 0x0E000000
> +#define I3C_MCONFIG_SKEW_SHFT 25

Either the mask or shift is wrong here (shift = 25 or mask =
0x06000000).

> +#define I3C_MCONFIG_I2CBAUD_MASK 0xF0000000
> +#define I3C_MCONFIG_I2CBAUD_SHFT 28

I'd recommend moving field descriptions next to the reg offset
definition, and I'm sure you don't need to define those _SHFT/_MASK
all the time, you could just do:

#define I3C_MCONFIG_SKEW(x)	(((x) & GENMASK(1, 0)) << 26)
#define I3C_MCONFIG_I2CBAUD(x)	((x) << 28)
...

which would make reg definitions less verbose.

> +
> +// Master Mode Control (MCTRL) Register Details
> +#define I3C_MCTRL_REQUEST_MASK 0x00000007
> +#define I3C_MCTRL_REQUEST_SHFT 0
> +#define I3C_MCTRL_REQUEST_NONE 0
> +#define I3C_MCTRL_REQUEST_START_ADDR 1
> +#define I3C_MCTRL_REQUEST_STOP 2
> +#define I3C_MCTRL_REQUEST_IBI_ACKNACK 3
> +#define I3C_MCTRL_REQUEST_PROC_DAA 4
> +#define I3C_MCTRL_REQUEST_RESERVED 5
> +#define I3C_MCTRL_REQUEST_FORCE_EXIT 6
> +#define I3C_MCTRL_REQUEST_AUTO_IBI 7
> +
> +#define I3C_MCTRL_TYPE_MASK 0x00000030

Please use GENMASK() for masks and BIT() for bits.

...

> +
> +/*
> + * I3C Master Enable
> + *
> + * The following enumerated values are used to specify the I3C master
> + * enable when setting the configuration \ref I3C_CTRL_CFG_MASTER_ENABLE
> + * through the svcI3cControlSet() API function.
> + */
> +enum svc_i3c_master_enable_e {
> +	I3C_MASTER_DISABLE, // I3C Master disabled
> +	I3C_MASTER_ENABLE, // I3C Master enabled
> +	I3C_MASTER_CAPABLE // I3C Master capable

No C++ comments in kernel drivers.

> +

And you can drop this blank line (applies to the whole driver).

> +};

> +
> +/*
> + * Common Command Codes
> + *
> + * Enumerates the Common Command Codes (CCC) defined in the MIPI
> + * I3C Specification. Broadcast CCC's are sent to all devices on
> + * the bus using the broadcast address while Direct CCC's are sent
> + * to specific devices using the dynamic/static device address.
> + */
> +enum svc_i3c_ccc_e {
> +	I3C_CCC_B_ENEC = 0x00,
> +	I3C_CCC_B_DISEC = 0x01,
> +	I3C_CCC_B_ENTAS0 = 0x02,
> +	I3C_CCC_B_ENTAS1 = 0x03,
> +	I3C_CCC_B_ENTAS2 = 0x04,
> +	I3C_CCC_B_ENTAS3 = 0x05,
> +	I3C_CCC_B_RSTDAA = 0x06,
> +	I3C_CCC_B_ENTDAA = 0x07,
> +	I3C_CCC_B_DEFSLVS = 0x08,
> +	I3C_CCC_B_SETMWL = 0x09,
> +	I3C_CCC_B_SETMRL = 0x0a,
> +	I3C_CCC_B_ENTTM = 0x0b,
> +	I3C_CCC_B_ENTHDR0 = 0x20,
> +	I3C_CCC_B_ENTHDR1 = 0x21,
> +	I3C_CCC_B_ENTHDR2 = 0x22,
> +	I3C_CCC_B_ENTHDR3 = 0x23,
> +	I3C_CCC_B_ENTHDR4 = 0x24,
> +	I3C_CCC_B_ENTHDR5 = 0x25,
> +	I3C_CCC_B_ENTHDR6 = 0x26,
> +	I3C_CCC_B_ENTHDR7 = 0x27,
> +	I3C_CCC_B_SETXTIME = 0x28,
> +	I3C_CCC_D_ENEC = 0x80,
> +	I3C_CCC_D_DISEC = 0x81,
> +	I3C_CCC_D_ENTAS0 = 0x82,
> +	I3C_CCC_D_ENTAS1 = 0x83,
> +	I3C_CCC_D_ENTAS2 = 0x84,
> +	I3C_CCC_D_ENTAS3 = 0x85,
> +	I3C_CCC_D_RSTDAA = 0x86,
> +	I3C_CCC_D_SETDASA = 0x87,
> +	I3C_CCC_D_SETNEWDA = 0x88,
> +	I3C_CCC_D_SETMWL = 0x89,
> +	I3C_CCC_D_SETMRL = 0x8a,
> +	I3C_CCC_D_GETMWL = 0x8b,
> +	I3C_CCC_D_GETMRL = 0x8c,
> +	I3C_CCC_D_GETPID = 0x8d,
> +	I3C_CCC_D_GETBCR = 0x8e,
> +	I3C_CCC_D_GETDCR = 0x8f,
> +	I3C_CCC_D_GETSTATUS = 0x90,
> +	I3C_CCC_D_GETACCMST = 0x91,
> +	I3C_CCC_D_SETBRGTGT = 0x93,
> +	I3C_CCC_D_GETMXDS = 0x94,
> +	I3C_CCC_D_GETHDRCAP = 0x95,
> +	I3C_CCC_D_SETXTIME = 0x98,
> +	I3C_CCC_D_GETXTIME = 0x99
> +
> +};

You're basically redefining what's defined by the core [1]. Please don't
do that.


> +
> +/*
> + * Vendor specified I3C slave device ID
> + */
> +struct __attribute__((__packed__)) svc_i3c_vendor_slv_id_s {
> +	u16 part; // Part ID
> +	u8 instance; // Instance ID
> +	u16 extra; // Extra, vendor specified field
> +};

Just __packed at the end of the struct:

struct svc_i3c_vendor_slv_id_s {
	u16 part; // Part ID
	u8 instance; // Instance ID
	u16 extra; // Extra, vendor specified field
} __packed;

> +
> +/*
> + * I3C Slave Device Id
> + *
> + */
> +struct svc_i3c_slv_id_s {
> +	u16 manuf_id; // Manufacturer ID
> +	u8 rand_id_flag; // Random(1) or Vendor Fixed(0) ID
> +
> +	union {
> +		u32 rand_id; // if randomId == 1
> +		struct __attribute__((__packed__))

Hm, this packed shouldn't be needed since the struct definition already
has it.

> +		svc_i3c_vendor_slv_id_s vend_id; // if randomId == 0
> +	};
> +};
> +
> +/*
> + * Bus Characteristics Register Masks
> + */
> +#define I3C_BCR_SPEED_LIMIT_MASK 0x01 // BCR Speed limit bit mask
> +#define I3C_BCR_IBI_REQ_CAPABLE_MASK 0x02 // BCR IBI capable bit mask
> +#define I3C_BCR_IBI_PAYLOAD_MASK 0x04 // BCR IBI payload bit mask
> +#define I3C_BCR_OFFLINE_CAPABLE_MASK 0x08 // BCR Offline capable bit mask
> +#define I3C_BCR_BRIDGE_DEVICE_MASK 0x10 // BCR Bridge device bit mask
> +#define I3C_BCR_HDR_CAPABLE_MASK 0x20 // BCR HDR capable bit mask
> +#define I3C_BCR_DEVICE_ROLE_MASK 0xC0 // BCR Device role bit mask
> +#define I3C_BCR_DEVICE_ROLE_MASTER 0x40 // BCR Device role master


You can drop all those comments. they don't bring any value to the
definition name. Same goes for all those comments where you basically
repeat what the variable/field/macro name already tells us :-P.

> +/*
> + * I3C Master Driver Control Block
> + *
> + * Specific to Linux only, this is the control block for the Silvco I3C
> + * Dual-Role master driver. Provides an abstraction above the hardware
> + * specific device control block.
> + */
> +struct svc_i3c_master {
> +	struct i3c_master_controller base; // I3C master controller
> +	spinlock_t access_lock; /* Device access_lock */
> +
> +	// IBI Control Block:
> +	struct {
> +		unsigned int num_ibi_devices;
> +		struct i3c_dev_desc **dev_desc;
> +		spinlock_t lock; /* spinlock */
> +	} ibi;
> +
> +	void __iomem *regs; // Base address for the I3C DRM register map
> +
> +	struct clk *pclk; // Main/system clock clock
> +	struct clk *fclk_i3c; // I3C peripheral clock
> +	struct clk *clk_slow_12_5; // Fixed 12.5 MHz clock
> +
> +	u32 i3c_pp_clk_div;
> +	u32 i3c_od_clk_div;
> +	u32 i2c_clk_div;
> +
> +	fp_event_handler_t event_handler; // func ptr to handler callback
> +
> +	struct svc_i3c_dev_s *p_dev; // Pointer to HAL device control block

Not sure what this is, but please note that we don't accept HALs in the
kernel. If that's what this driver is (a wrapper around a HAL), please
redesign it to access registers directly. I didn't go through the rest
of the driver, but it looks like there are a lot of unnecessary
indirection, and getting rid of those indirections should help shrink
the driver. 

> +
> +	struct completion daa_complete; // completion for daa process.
> +}; 

Regards,

Boris

_______________________________________________
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
