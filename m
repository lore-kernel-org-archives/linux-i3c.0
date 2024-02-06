Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D17AC54764
	for <linux-i3c@archiver.kernel.org>; Mon, 19 Feb 2024 20:21:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:cc:To:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hR+8ugewkizqYzKwyyWJCDt/VGA84+hGVDE1w+Jnjtc=; b=oNi+U4CyZzsCDi
	XJxGRYLB/n4pJGUspPi65Ifz6EEkLGfoHA7X1GmNrxQkYl0QuBeTSCLrmsPRfAgXhZVzLUYP5G16j
	cqNcnDIer43RSF7joqVmx3mGqWDrYfUFecfbaPUG+HyGM4/kaTELtvkItZUk+Dch+hLG7igAS9J9N
	lAwKCb3TynpRmz7UQsd6YcfcK56trWcpypGKntHSzdsutlvdyJtzExW6EXqLxrLLJTlEdPrWQiCSS
	vFPXMaveeaGIE9FveyFZpsZ0EXUxacMTY0x81OkAvrEiHckShmjyb7exjWUe3C9z2YekiZE8tJXRq
	5n2T7GQvnA3sdg17r0kg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rcA8m-0000000C4Ou-41Mo;
	Mon, 19 Feb 2024 20:21:28 +0000
Received: from mgamail.intel.com ([198.175.65.14])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rXK2P-00000007QQ0-44Xt
	for linux-i3c@lists.infradead.org;
	Tue, 06 Feb 2024 11:54:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707220494; x=1738756494;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=huQERr2I8KInHIO2lB1YDA3403COnVXjH7Omud6kihM=;
  b=MXmzoqb2Bee+0RHEZKq9+EBHafwTOJVBArYCNpFyCLd9Zui7Hf7OTsmN
   PW1jdCKoEtrqarTcAiG3rVENf0Ar892P2KuTLtzo2YT67IM9BwvIbrR9I
   PNSWRhl3w3SLCO7fMUpgeHKhhykpIPn4/XRP1VNDo84YyLkNd9Tqzch7Q
   9P5fOa/ZMcmxyoXTqP0k7i+GT8n0kVEvAgF2i27637CuLsLO+0UfeHqOR
   U1R599+qyhChpqbVbzLyDd3WLYHAoY9Fc34Q+UxeyiVejw15YuemlisDX
   rnbp7vLUtuEKLB2onbKEcGOwRodluJhzbsjjDYj76TogwiCh718mOG05F
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10975"; a="4540213"
X-IronPort-AV: E=Sophos;i="6.05,247,1701158400"; 
   d="scan'208";a="4540213"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Feb 2024 03:54:53 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,247,1701158400"; 
   d="scan'208";a="5599711"
Received: from ijarvine-desk1.ger.corp.intel.com (HELO localhost) ([10.246.36.139])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Feb 2024 03:54:48 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Tue, 6 Feb 2024 13:54:42 +0200 (EET)
To: Frank Li <Frank.Li@nxp.com>
cc: alexandre.belloni@bootlin.com, conor.culhane@silvaco.com, 
    devicetree@vger.kernel.org, 
    Greg Kroah-Hartman <gregkh@linuxfoundation.org>, imx@lists.linux.dev, 
    Jiri Slaby <jirislaby@kernel.org>, joe@perches.com, 
    krzysztof.kozlowski+dt@linaro.org, krzysztof.kozlowski@linaro.org, 
    linux-i3c@lists.infradead.org, LKML <linux-kernel@vger.kernel.org>, 
    linux-serial <linux-serial@vger.kernel.org>, miquel.raynal@bootlin.com, 
    robh@kernel.org, zbigniew.lukwinski@linux.intel.com
Subject: Re: [PATCH v7 6/8] i3c: target: func: add tty driver
In-Reply-To: <20240205233326.552576-7-Frank.Li@nxp.com>
Message-ID: <9b5bb389-4238-0a32-5e16-3c62ea6c00e7@linux.intel.com>
References: <20240205233326.552576-1-Frank.Li@nxp.com> <20240205233326.552576-7-Frank.Li@nxp.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240206_035454_067421_F6016421 
X-CRM114-Status: GOOD (  17.88  )
X-Mailman-Approved-At: Mon, 19 Feb 2024 12:21:27 -0800
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

On Mon, 5 Feb 2024, Frank Li wrote:

> Add tty over I3C target function driver.
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
> 
> Notes:
>     Change from v4 to v5
>     - remove void*
>     - include bitfield.h
>     - remove extra ()
>     - oneline for struct ttyi3c_port *sport
> 
>  drivers/i3c/Kconfig       |   3 +
>  drivers/i3c/Makefile      |   1 +
>  drivers/i3c/func/Kconfig  |   9 +
>  drivers/i3c/func/Makefile |   3 +
>  drivers/i3c/func/tty.c    | 474 ++++++++++++++++++++++++++++++++++++++
>  5 files changed, 490 insertions(+)
>  create mode 100644 drivers/i3c/func/Kconfig
>  create mode 100644 drivers/i3c/func/Makefile
>  create mode 100644 drivers/i3c/func/tty.c
> 
> diff --git a/drivers/i3c/Kconfig b/drivers/i3c/Kconfig
> index d59a7eb83d13a..fca808cda87b3 100644
> --- a/drivers/i3c/Kconfig
> +++ b/drivers/i3c/Kconfig
> @@ -48,3 +48,6 @@ config I3C_TARGET_CONFIGFS
>  	  the target function and used to bind the function with a target
>  	  controller.
>  
> +if I3C_TARGET
> +source "drivers/i3c/func/Kconfig"
> +endif # I3C_TARGET
> diff --git a/drivers/i3c/Makefile b/drivers/i3c/Makefile
> index c275aeae8970c..11f026d6876fe 100644
> --- a/drivers/i3c/Makefile
> +++ b/drivers/i3c/Makefile
> @@ -4,3 +4,4 @@ obj-$(CONFIG_I3C)		+= i3c.o
>  obj-$(CONFIG_I3C_TARGET)                += target.o
>  obj-$(CONFIG_I3C_TARGET_CONFIGFS)       += i3c-cfs.o
>  obj-$(CONFIG_I3C)		+= master/
> +obj-$(CONFIG_I3C_TARGET)	+= func/
> diff --git a/drivers/i3c/func/Kconfig b/drivers/i3c/func/Kconfig
> new file mode 100644
> index 0000000000000..7115129eb7d5a
> --- /dev/null
> +++ b/drivers/i3c/func/Kconfig
> @@ -0,0 +1,9 @@
> +# SPDX-License-Identifier: GPL-2.0
> +
> +config I3C_TARGET_FUNC_TTY
> +	tristate "I3C target tty driver"
> +	depends on I3C_TARGET
> +	help
> +	  I3C Target TTY Function Driver.
> +
> +	  General TTY over I3C target controller function drivers.
> diff --git a/drivers/i3c/func/Makefile b/drivers/i3c/func/Makefile
> new file mode 100644
> index 0000000000000..16b3b9301496b
> --- /dev/null
> +++ b/drivers/i3c/func/Makefile
> @@ -0,0 +1,3 @@
> +# SPDX-License-Identifier: GPL-2.0
> +
> +obj-$(CONFIG_I3C_TARGET_FUNC_TTY)              += tty.o
> diff --git a/drivers/i3c/func/tty.c b/drivers/i3c/func/tty.c
> new file mode 100644
> index 0000000000000..50673bfb6a003
> --- /dev/null
> +++ b/drivers/i3c/func/tty.c
> @@ -0,0 +1,474 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (C) 2023 NXP
> + * Author: Frank Li <Frank.Li@nxp.com>
> + */
> +
> +#include <linux/bitfield.h>
> +#include <linux/iopoll.h>
> +#include <linux/i3c/target.h>
> +#include <linux/serial_core.h>
> +#include <linux/slab.h>
> +#include <linux/tty_flip.h>
> +
> +static DEFINE_IDR(i3c_tty_minors);
> +
> +static struct tty_driver *i3c_tty_driver;
> +
> +#define I3C_TTY_MINORS		8
> +
> +#define I3C_TX_NOEMPTY		BIT(0)
> +#define I3C_TTY_TRANS_SIZE	16
> +#define I3C_TTY_IBI_TX		BIT(0)

This is #include <linux/bits.h>

...which will include <vdso/bits.h> that contains the actual definition.

#include <bitfield.h> is for FIELD_GET/PREP(), etc.

> +struct ttyi3c_port {
> +	struct tty_port port;
> +	int minor;
> +	struct i3c_target_func *i3cdev;
> +	struct completion txcomplete;
> +	spinlock_t xlock;
> +	void *buffer;
> +	struct work_struct work;

This file seems to also lack some includes. Please go through your 
#include in the series and add those you use.

-- 
 i.


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
