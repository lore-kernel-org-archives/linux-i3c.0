Return-Path: <SRS0=zIxT=2G=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1014AC2D0D1
	for <linux-i3c@archiver.kernel.org>; Mon, 16 Dec 2019 18:36:10 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DBD9624650
	for <linux-i3c@archiver.kernel.org>; Mon, 16 Dec 2019 18:36:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="n8Sh09PO";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="diM2SA6u"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DBD9624650
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ogg+ukhsxW1DlVC9yzzfGABEhDpCnaXSDoxrZOHNXQU=; b=n8Sh09POrnm0cV
	qN6Y/VGhC6LPBrbaaS/XEDMBZxQjNcKgGs4U8eBxdmXe7Us82OvybjAWJjTFHL9B9Lkc0JKv4Dou/
	IkTD0Qe8SRbLPx+gZExO0cmUPS1Jv1srUqcHbzM6TTKumWNXt8HSQBCQ4X6Wi1kYXiYbp/VU9Fad9
	u7I91/QAFyZuWcx0N+9EdJvCN7YW6Klc2jgRWMXeZGg9I5KBbxr3W+3Jl3yAlZSFYStjfd0G/LFBJ
	T3ze/xFWBK+wdt+igXWj2VPV1BUJrccDfJzfx8h3FIawt/+EIzzgTUvKVBXl6UBtqe4hs+52MUzV5
	P9iuPpv2fX0vB9nHZV/w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1igvE1-0004hE-52; Mon, 16 Dec 2019 18:36:09 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ifPfo-0007mb-Ce
 for linux-i3c@lists.infradead.org; Thu, 12 Dec 2019 14:42:37 +0000
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl
 [83.86.89.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 2C2E020637;
 Thu, 12 Dec 2019 14:42:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1576161755;
 bh=ck563JxppjwUrfE3D/tbAxjKAXIW9YCI6JybTAijvFI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=diM2SA6uv924om3crOT9thcoY4Fb421uI5NehQWj7fpPAhf+gd1OZ4zhkFH9vbhop
 sGXQtfYFoHJth1IbutmDeROzPxdpvK87+0hjqKVLPPjV6pZMSAT3NY35E0Fip3ZgsN
 cJLaPPxSd2YSoFiTjaLoau+ii/PKczv7tL91N4aE=
Date: Thu, 12 Dec 2019 15:42:33 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Vitor Soares <Vitor.Soares@synopsys.com>
Subject: Re: [RFC 3/5] i3c: device: expose transfer strutures to uapi
Message-ID: <20191212144233.GA1668196@kroah.com>
References: <cover.1575977795.git.vitor.soares@synopsys.com>
 <fcc51a2758fd7920e1c0163a818fe7c12bd33765.1575977795.git.vitor.soares@synopsys.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <fcc51a2758fd7920e1c0163a818fe7c12bd33765.1575977795.git.vitor.soares@synopsys.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191212_064236_457030_DA45033F 
X-CRM114-Status: GOOD (  12.76  )
X-Mailman-Approved-At: Mon, 16 Dec 2019 10:36:06 -0800
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
Cc: Joao.Pinto@synopsys.com, arnd@arndb.de, wsa@the-dreams.de,
 bbrezillon@kernel.org, linux-kernel@vger.kernel.org, broonie@kernel.org,
 linux-i3c@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

On Tue, Dec 10, 2019 at 04:37:31PM +0100, Vitor Soares wrote:
> --- /dev/null
> +++ b/include/uapi/linux/i3c/device.h
> @@ -0,0 +1,66 @@
> +/* SPDX-License-Identifier: GPL-2.0 */

Not a valid uapi SPDX license :(


> +/*
> + * Copyright (c) 2019 Synopsys, Inc. and/or its affiliates.
> + *
> + * Author: Vitor Soares <vitor.soares@synopsys.com>
> + */
> +
> +#ifndef _UAPI_LINUX_I3C_DEVICE_H
> +#define _UAPI_LINUX_I3C_DEVICE_H
> +
> +#include <linux/types.h>
> +
> +/**
> + * enum i3c_error_code - I3C error codes
> + *
> + * These are the standard error codes as defined by the I3C specification.
> + * When -EIO is returned by the i3c_device_do_priv_xfers() or
> + * i3c_device_send_hdr_cmds() one can check the error code in
> + * &struct_i3c_priv_xfer.err or &struct i3c_hdr_cmd.err to get a better idea of
> + * what went wrong.
> + *
> + * @I3C_ERROR_UNKNOWN: unknown error, usually means the error is not I3C
> + *		       related
> + * @I3C_ERROR_M0: M0 error
> + * @I3C_ERROR_M1: M1 error
> + * @I3C_ERROR_M2: M2 error
> + */
> +enum i3c_error_code {
> +	I3C_ERROR_UNKNOWN = 0,
> +	I3C_ERROR_M0 = 1,
> +	I3C_ERROR_M1,
> +	I3C_ERROR_M2,

You have to specify all of these.

> +};
> +
> +/**
> + * enum i3c_hdr_mode - HDR mode ids
> + * @I3C_HDR_DDR: DDR mode
> + * @I3C_HDR_TSP: TSP mode
> + * @I3C_HDR_TSL: TSL mode
> + */
> +enum i3c_hdr_mode {
> +	I3C_HDR_DDR,
> +	I3C_HDR_TSP,
> +	I3C_HDR_TSL,

same here.


> +};
> +
> +/**
> + * struct i3c_priv_xfer - I3C SDR private transfer
> + * @rnw: encodes the transfer direction. true for a read, false for a write
> + * @len: transfer length in bytes of the transfer
> + * @data: input/output buffer
> + * @data.in: input buffer. Must point to a DMA-able buffer
> + * @data.out: output buffer. Must point to a DMA-able buffer
> + * @err: I3C error code
> + */
> +struct i3c_priv_xfer {
> +	u8 rnw;
> +	u16 len;
> +	union {
> +		void *in;
> +		const void *out;
> +	} data;
> +	enum i3c_error_code err;

Ick, that's a horrid user/kernel api structure that will not work at
all.

Please fix.

thanks,

greg k-h

_______________________________________________
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
