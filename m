Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 826F7C4828E
	for <linux-i3c@archiver.kernel.org>; Sat, 27 Jan 2024 19:53:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:cc:To:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=r9QGyvgEr62oTt1WWuigzTyfHZWPZN+3dG9U0iKZPpA=; b=g6D+F/w3q5WrDh
	g+guqt0XDuK+ttYLj7oZBUqedwpYbKDKFUzfW/zFQ23ySKo1t5SBEEzzOGWburWETG0Z93xFGVEoo
	qNu7xkoFVhmsulakKXDInxk4eHIKv2ZHlhVRFZ5abWJnMyQuHZl8jCJisBjW0h/izmi1vsUSYQTeY
	hNJ0VxQfQCbtcULx2VM5IRR6LYIMndVO1eJlHleIQj3RwZ8q6ZRIhzPJvQ784MijEB87M+8246XdZ
	/1EG73y1Io/+xnDp0BnlFnJ0Yufti3Ymb8o+Olgg/rMUvBKjZR5O2x/RQBKsJpjFzUWQ7RoQWEPY9
	YrVRsxmkUn/5LCNOlxsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rTojd-000000087vT-0bw7;
	Sat, 27 Jan 2024 19:53:01 +0000
Received: from mgamail.intel.com ([192.55.52.115])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rSey9-003t9j-2k
	for linux-i3c@lists.infradead.org;
	Wed, 24 Jan 2024 15:15:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706109313; x=1737645313;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=uzQLDGWYhf9xfb4Lm9GWu2gEumrrxwpUwu6HE1AQ6n0=;
  b=CKfKiWGwxLJ/ImggqwJZZj1DS9Lzky2rl0zD5cEOI4B2SCJ5CZvudmFN
   EpGvLCVEDsP0sWmqqwV4VVcO2GPHc26vcTFqEyk/I1O+CCrj9SQZ6Xcgn
   2ZmJLOf6HyTFsP81J+s9qzzsuVAR1hvzs5MXqbU6aot/NITLumDJ95hXo
   OeHGC9vfFNyMx6YYsTQpOcd3xA77uEO0wNYFPDx0i6O1gSyQMRBlJMhXZ
   50cRkQ0VctI4+ktrR6cDH38YFKr/YJL5OMD5jsZOkzd0xaJociA1JlB9f
   yYC6V5GXn+leeVCKMW9ShoWhLPMhWkOcdD2HSPSj3NlRhk/DQAdNHdBd7
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10962"; a="401529937"
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; 
   d="scan'208";a="401529937"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jan 2024 07:15:12 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; 
   d="scan'208";a="2072375"
Received: from ijarvine-desk1.ger.corp.intel.com (HELO localhost) ([10.246.48.46])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jan 2024 07:15:06 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Wed, 24 Jan 2024 17:15:01 +0200 (EET)
To: Frank Li <Frank.Li@nxp.com>
cc: alexandre.belloni@bootlin.com, conor.culhane@silvaco.com, 
    devicetree@vger.kernel.org, gregkh@linuxfoundation.org, 
    imx@lists.linux.dev, jirislaby@kernel.org, joe@perches.com, 
    krzysztof.kozlowski+dt@linaro.org, krzysztof.kozlowski@linaro.org, 
    linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org, 
    linux-serial@vger.kernel.org, miquel.raynal@bootlin.com, robh@kernel.org, 
    zbigniew.lukwinski@linux.intel.com
Subject: Re: [PATCH v4 6/8] i3c: target: func: add tty driver
In-Reply-To: <20240123231043.3891847-7-Frank.Li@nxp.com>
Message-ID: <744bf8d6-48a3-81b4-baa8-d8c06500a971@linux.intel.com>
References: <20240123231043.3891847-1-Frank.Li@nxp.com> <20240123231043.3891847-7-Frank.Li@nxp.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240124_071513_917015_7333F7FB 
X-CRM114-Status: GOOD (  14.98  )
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

> Add tty over I3C target function driver.
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>

> diff --git a/drivers/i3c/func/tty.c b/drivers/i3c/func/tty.c
> new file mode 100644
> index 0000000000000..bad99c08be0ac
> --- /dev/null
> +++ b/drivers/i3c/func/tty.c
> @@ -0,0 +1,475 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (C) 2023 NXP
> + * Author: Frank Li <Frank.Li@nxp.com>
> + */
> +
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

Lacking #include for BIT()


> +	do {
> +		req = i3c_target_ctrl_alloc_request(func->ctrl, GFP_KERNEL);
> +		if (!req)
> +			goto err_alloc_req;
> +
> +		req->buf = (void *) (sport->buffer + offset);

Casting to void is unnecessary.

> +		req->length = rxfifo_size;
> +		req->context = sport;
> +		req->complete = i3c_target_tty_rx_complete;
> +		offset += rxfifo_size;
> +
> +		if (i3c_target_ctrl_queue(req, GFP_KERNEL))
> +			goto err_alloc_req;
> +	} while (req && (offset + rxfifo_size) < UART_XMIT_SIZE);

Extra ().

> +static void i3c_port_shutdown(struct tty_port *port)
> +{
> +	struct ttyi3c_port *sport =
> +		container_of(port, struct ttyi3c_port, port);

Just put this to a single line, nothing important is lost even on 80 char
screen.

> +static void i3c_port_destruct(struct tty_port *port)
> +{
> +	struct ttyi3c_port *sport =
> +		container_of(port, struct ttyi3c_port, port);

Ditto.

> +	if (i3c_target_ctrl_set_config(func->ctrl, func)) {
> +		dev_err(&func->dev, "failure set i3c config\n");

failed to set i3c config


> +	read_poll_timeout(i3c_target_ctrl_fifo_status, val, !val, 100, timeout, false,
> +			  sport->i3cdev->ctrl, true);
> +
> +	i3c_target_ctrl_set_status_format1(sport->i3cdev->ctrl, sport->status & (~I3C_TX_NOEMPTY));

Unnecessary ().

-- 
 i.


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
