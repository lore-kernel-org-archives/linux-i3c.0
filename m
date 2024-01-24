Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 025B6C48285
	for <linux-i3c@archiver.kernel.org>; Sat, 27 Jan 2024 19:53:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:cc:To:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9RMKxyOsYqj8DWhVYEBISoe+ZitZwoJ1IW+SLtFFbMA=; b=0vvaCIhD/IjQeW
	QOfck/8GyFZVepXtQNzmIralIFJ1x4gZ5Gt1n4XXerluL6WUj9tI2TraptSKO2HFtsdBCCbFevUh4
	8LK0uo+3V+fC0MLjOQa32RbuYEyJ9yZoyTPgGc/z2Ptw9otHnOYb1oPZlqIcUAcQ2Pd/alTlgprea
	AZDyCQ/C9UiRmR33QMbQ5eiemH4uA3+670mQqs0EixBKtGrMp3bK4FYSqtrICGM7rAFm7yiQ7xbZQ
	R6m8zqBFVhR81JOIfFAXyFiaOPunTYYSajQ7jOa4kFwMD7nitXTnCsTDu7tThbr8HMqFVfOfRn4lt
	l09od9mxZ7kcMiXbUnuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rTojd-000000087vw-2Wda;
	Sat, 27 Jan 2024 19:53:01 +0000
Received: from mgamail.intel.com ([192.55.52.120])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rSf9i-003wLk-1l
	for linux-i3c@lists.infradead.org;
	Wed, 24 Jan 2024 15:27:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706110031; x=1737646031;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=eWgI5cQzGgxjU8IqhiNLaIrbAIei/iVfjxJTyMVtWCw=;
  b=UlzkHDtEkAKXCsRS/Keoia7DQXUQmcrUOU0R6vmviwpRIVhmOSHGyK+i
   me+FgaUA07Kup4xsVCB+mBK/iDrKgfEc+JhVcIfPCd8D0F1P931jWrF17
   oTmU8Db6dBKu7s0zotjcq3MZxwDE+LVkbX8mPzQoPluT1JgaXwdewgiIi
   voG9kD1KyIBYtt13DxgcDksfGjX6kLSk8mQ5p1SxcfbPTq6WD/YN+6XIs
   lT/gajnOLl81cD4WJCUF/02CjJ7v1dYj4/7DjZR6oiow2ggSrLXYa+dp6
   QVFnd/P/L0sZIIlYDBCR52y3nPPyQKdEpvIWV/6/DnhP8rlgajW/MuU9w
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10962"; a="400730353"
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; 
   d="scan'208";a="400730353"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jan 2024 07:27:05 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; 
   d="scan'208";a="2073769"
Received: from ijarvine-desk1.ger.corp.intel.com (HELO localhost) ([10.246.48.46])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jan 2024 07:27:00 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Wed, 24 Jan 2024 17:26:55 +0200 (EET)
To: Frank Li <Frank.Li@nxp.com>
cc: alexandre.belloni@bootlin.com, conor.culhane@silvaco.com, 
    devicetree@vger.kernel.org, 
    Greg Kroah-Hartman <gregkh@linuxfoundation.org>, imx@lists.linux.dev, 
    Jiri Slaby <jirislaby@kernel.org>, joe@perches.com, 
    krzysztof.kozlowski+dt@linaro.org, krzysztof.kozlowski@linaro.org, 
    linux-i3c@lists.infradead.org, LKML <linux-kernel@vger.kernel.org>, 
    linux-serial <linux-serial@vger.kernel.org>, miquel.raynal@bootlin.com, 
    robh@kernel.org, zbigniew.lukwinski@linux.intel.com
Subject: Re: [PATCH v4 8/8] tty: i3c: add TTY over I3C master support
In-Reply-To: <20240123231043.3891847-9-Frank.Li@nxp.com>
Message-ID: <a2716dab-8681-3bce-d0fb-b83789c51362@linux.intel.com>
References: <20240123231043.3891847-1-Frank.Li@nxp.com> <20240123231043.3891847-9-Frank.Li@nxp.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240124_072711_260452_9062CB48 
X-CRM114-Status: GOOD (  36.11  )
X-Mailman-Approved-At: Sat, 27 Jan 2024 11:52:56 -0800
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

On Tue, 23 Jan 2024, Frank Li wrote:

> In typical embedded Linux systems, UART consoles require at least two pins,
> TX and RX. In scenarios where I2C/I3C devices like sensors or PMICs are
> present, we can save these two pins by using this driver. Pins is crucial
> resources, especially in small chip packages.
> 
> This introduces support for using the I3C bus to transfer console tty data,
> effectively replacing the need for dedicated UART pins. This not only
> conserves valuable pin resources but also facilitates testing of I3C's
> advanced features, including early termination, in-band interrupt (IBI)
> support, and the creation of more complex data patterns. Additionally,
> it aids in identifying and addressing issues within the I3C controller
> driver.
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
> 
> Notes:
>     Notes:
>         Version number use i3c target patches.
>         Change from v3 to v4
>         - add static at i3c_remove()
>         Change v2
>         - using system_unbound_wq working queue
>         - fixed accoring to Jiri Slaby's comments
>     
>         Change before send with i3c target support
>     
>         Change from v4 to v5
>         - send in i3c improvememtn patches.
>     
>         Change from v2 to v4
>         - none
>     
>         Change from v1 to v2
>         - update commit message.
>         - using goto for err handle
>         - using one working queue for all tty-i3c device
>         - fixed typo found by js
>         - update kconfig help
>         - using kfifo
>     
>         Still below items not be fixed (according to Jiri Slaby's comments)
>         - rxwork thread: need trigger from two position.
>         - common thread queue: need some suggestion
> 
>  drivers/tty/Kconfig   |  13 ++
>  drivers/tty/Makefile  |   1 +
>  drivers/tty/i3c_tty.c | 426 ++++++++++++++++++++++++++++++++++++++++++
>  3 files changed, 440 insertions(+)
>  create mode 100644 drivers/tty/i3c_tty.c
> 
> diff --git a/drivers/tty/Kconfig b/drivers/tty/Kconfig
> index 5646dc6242cd9..9ab4cd480e9f8 100644
> --- a/drivers/tty/Kconfig
> +++ b/drivers/tty/Kconfig
> @@ -412,6 +412,19 @@ config RPMSG_TTY
>  	  To compile this driver as a module, choose M here: the module will be
>  	  called rpmsg_tty.
>  
> +config I3C_TTY
> +	tristate "TTY over I3C"
> +	depends on I3C
> +	help
> +	  Select this option to use TTY over I3C master controller.
> +
> +	  This makes it possible for user-space programs to send and receive
> +	  data as a standard tty protocol. I3C provide relatively higher data
> +	  transfer rate and less pin numbers, SDA/SCL are shared with other
> +	  devices.
> +
> +	  If unsure, say N
> +
>  endif # TTY
>  
>  source "drivers/tty/serdev/Kconfig"
> diff --git a/drivers/tty/Makefile b/drivers/tty/Makefile
> index 07aca5184a55d..f329f9c7d308a 100644
> --- a/drivers/tty/Makefile
> +++ b/drivers/tty/Makefile
> @@ -27,5 +27,6 @@ obj-$(CONFIG_GOLDFISH_TTY)	+= goldfish.o
>  obj-$(CONFIG_MIPS_EJTAG_FDC_TTY) += mips_ejtag_fdc.o
>  obj-$(CONFIG_VCC)		+= vcc.o
>  obj-$(CONFIG_RPMSG_TTY)		+= rpmsg_tty.o
> +obj-$(CONFIG_I3C_TTY)		+= i3c_tty.o
>  
>  obj-y += ipwireless/
> diff --git a/drivers/tty/i3c_tty.c b/drivers/tty/i3c_tty.c
> new file mode 100644
> index 0000000000000..8f4e87dfa01cd
> --- /dev/null
> +++ b/drivers/tty/i3c_tty.c
> @@ -0,0 +1,426 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright 2023 NXP.
> + *
> + * Author: Frank Li <Frank.Li@nxp.com>
> + */
> +
> +#include <linux/delay.h>
> +#include <linux/kernel.h>
> +#include <linux/mod_devicetable.h>
> +#include <linux/module.h>
> +#include <linux/i3c/device.h>
> +#include <linux/i3c/master.h>
> +#include <linux/slab.h>
> +#include <linux/console.h>
> +#include <linux/serial_core.h>
> +#include <linux/interrupt.h>

Do you need this header.

> +#include <linux/workqueue.h>
> +#include <linux/tty_flip.h>
> +
> +static DEFINE_IDR(i3c_tty_minors);
> +static DEFINE_MUTEX(i3c_tty_minors_lock);
> +
> +static struct tty_driver *i3c_tty_driver;
> +
> +#define I3C_TTY_MINORS		8
> +#define I3C_TTY_TRANS_SIZE	16
> +#define I3C_TTY_RX_STOP		0
> +#define I3C_TTY_RETRY		20
> +#define I3C_TTY_YIELD_US	100
> +
> +struct ttyi3c_port {
> +	struct tty_port port;

Missing #include

> +	int minor;
> +	spinlock_t xlock; /* protect xmit */

Missing #include

> +	u8 tx_buff[I3C_TTY_TRANS_SIZE];
> +	u8 rx_buff[I3C_TTY_TRANS_SIZE];
> +	struct i3c_device *i3cdev;
> +	struct work_struct txwork;
> +	struct work_struct rxwork;
> +	struct completion txcomplete;

Missing #include

> +	unsigned long status;
> +	u32 buf_overrun;
> +};

> +static void i3c_port_shutdown(struct tty_port *port)
> +{
> +	struct ttyi3c_port *sport =
> +		container_of(port, struct ttyi3c_port, port);

On one line.

> +
> +	i3c_device_disable_ibi(sport->i3cdev);
> +	tty_port_free_xmit_buf(port);
> +}
> +
> +static void i3c_port_destruct(struct tty_port *port)
> +{
> +	struct ttyi3c_port *sport =
> +		container_of(port, struct ttyi3c_port, port);

Ditto.

> +static void tty_i3c_rxwork(struct work_struct *work)
> +{
> +	struct ttyi3c_port *sport = container_of(work, struct ttyi3c_port, rxwork);
> +	struct i3c_priv_xfer xfers;
> +	u32 retry = I3C_TTY_RETRY;
> +	u16 status = BIT(0);

Unnecessary initialization.

> +	int ret;
> +
> +	memset(&xfers, 0, sizeof(xfers));
> +	xfers.data.in = sport->rx_buff;
> +	xfers.len = I3C_TTY_TRANS_SIZE;
> +	xfers.rnw = 1;
> +
> +	do {
> +		if (test_bit(I3C_TTY_RX_STOP, &sport->status))
> +			break;
> +
> +		i3c_device_do_priv_xfers(sport->i3cdev, &xfers, 1);
> +
> +		if (xfers.actual_len) {
> +			ret = tty_insert_flip_string(&sport->port, sport->rx_buff,
> +						     xfers.actual_len);
> +			if (ret < xfers.actual_len)
> +				sport->buf_overrun++;
> +
> +			retry = I3C_TTY_RETRY;
> +			continue;
> +		}
> +
> +		status = BIT(0);

Can this BIT(0) be named with a #define?

> +		i3c_device_getstatus_format1(sport->i3cdev, &status);
> +		/*
> +		 * Target side needs some time to fill data into fifo. Target side may not
> +		 * have hardware update status in real time. Software update status always
> +		 * needs some delays.
> +		 *
> +		 * Generally, target side have circular buffer in memory, it will be moved
> +		 * into FIFO by CPU or DMA. 'status' just show if circular buffer empty. But
> +		 * there are gap, especially CPU have not response irq to fill FIFO in time.
> +		 * So xfers.actual will be zero, wait for little time to avoid flood
> +		 * transfer in i3c bus.
> +		 */
> +		usleep_range(I3C_TTY_YIELD_US, 10 * I3C_TTY_YIELD_US);
> +		retry--;
> +
> +	} while (retry && (status & BIT(0)));

Name with define?


-- 
 i.


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
