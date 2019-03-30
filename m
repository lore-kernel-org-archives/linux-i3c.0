Return-Path: <SRS0=GBB+=SB=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E586C43381
	for <linux-i3c@archiver.kernel.org>; Sat, 30 Mar 2019 14:36:27 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 21FB4218A6
	for <linux-i3c@archiver.kernel.org>; Sat, 30 Mar 2019 14:36:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="BBK1kPDP"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 21FB4218A6
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TnJaLbHoMKFzCwx5ovoMr8QNIZOoP/m+60O9TgZI14s=; b=BBK1kPDP7yVh1L
	+qDSL0sbPEoapLbwjqQFeviobiLBFeSRrs+9Q2qM7IxUWdTD/FqxwMFJUjGNVQ05DMJAkUgw9p+F3
	EbYQfSxkYTharK/XNVQF41XWgJZwRBUok8LjAXSUx3MfgptRfnYJ4yLpYO4JqMrVBQmHUUFxxdgMr
	AQne5/3/BhNS2nB0zES+1Duye7JIzIJ8j2zc/pYdge7xOUjOxlhSfH/R67WSWixe84qgTxLRlkiEb
	InI+/2PPhQhTrMFWjXAHLSxLau3ID7uSskO3ecPGX6xgZifrPv0fH2bj0SNa9IgOSTXqEyw6XE35j
	iGQb08/d8zD4tLrLPerw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hAF5u-0007AQ-MT; Sat, 30 Mar 2019 14:36:26 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hAF5s-0007A7-4Y
 for linux-i3c@lists.infradead.org; Sat, 30 Mar 2019 14:36:25 +0000
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id AFBC52811DC;
 Sat, 30 Mar 2019 14:36:22 +0000 (GMT)
Date: Sat, 30 Mar 2019 15:36:18 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Przemyslaw Gaj <pgaj@cadence.com>
Subject: Re: [PATCH v4 1/6] i3c: add addr and lvr to i2c_dev_desc structure
Message-ID: <20190330153618.48719ee5@collabora.com>
In-Reply-To: <20190310135843.21154-2-pgaj@cadence.com>
References: <20190310135843.21154-1-pgaj@cadence.com>
 <20190310135843.21154-2-pgaj@cadence.com>
Organization: Collabora
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190330_073624_308598_7123B533 
X-CRM114-Status: GOOD (  15.23  )
X-BeenThere: linux-i3c@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: Linux I3C <linux-i3c.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-i3c>,
 <mailto:linux-i3c-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-i3c/>
List-Post: <mailto:linux-i3c@lists.infradead.org>
List-Help: <mailto:linux-i3c-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-i3c>,
 <mailto:linux-i3c-request@lists.infradead.org?subject=subscribe>
Cc: linux-i3c@lists.infradead.org, vitor.soares@synopsys.com,
 rafalc@cadence.com, agolec@cadence.com, bbrezillon@kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

On Sun, 10 Mar 2019 13:58:38 +0000
Przemyslaw Gaj <pgaj@cadence.com> wrote:

> I need to store address and lvr value for I2C devices without static definition
> in DT. This allows secondary master to transmit DEFSLVS command properly.
> 
> Signed-off-by: Przemyslaw Gaj <pgaj@cadence.com>
> ---
>  include/linux/i3c/master.h | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/include/linux/i3c/master.h b/include/linux/i3c/master.h
> index eca8337..3c27d9f 100644
> --- a/include/linux/i3c/master.h
> +++ b/include/linux/i3c/master.h
> @@ -71,6 +71,9 @@ struct i2c_dev_boardinfo {
>   * @common: common part of the I2C device descriptor
>   * @boardinfo: pointer to the boardinfo attached to this I2C device
>   * @dev: I2C device object registered to the I2C framework
> + * @addr: I2C device address
> + * @lvr: LVR (Legacy Virtual Register) needed by the I3C core to know about
> + *	 the I2C device limitations
>   *
>   * Each I2C device connected on the bus will have an i2c_dev_desc.
>   * This object is created by the core and later attached to the controller
> @@ -84,6 +87,8 @@ struct i2c_dev_desc {
>  	struct i3c_i2c_dev_desc common;
>  	const struct i2c_dev_boardinfo *boardinfo;
>  	struct i2c_client *dev;
> +	u16 addr;
> +	u8 lvr;

You also need to remove lvr from i2c_dev_boardinfo and adjust the code
to use i2c_dev_desc->addr and i2c_dev_desc->lvr in this patch, not in
patch 3.

>  };
>  
>  /**


_______________________________________________
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
