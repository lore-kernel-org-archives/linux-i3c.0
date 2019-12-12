Return-Path: <SRS0=zIxT=2G=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4588DC2D0CD
	for <linux-i3c@archiver.kernel.org>; Mon, 16 Dec 2019 18:36:10 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1E81B20733
	for <linux-i3c@archiver.kernel.org>; Mon, 16 Dec 2019 18:36:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="UkXTGFR0";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="t+w/s12W"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1E81B20733
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hoXXqDtQQ6uC5c+LgOeEYv4QpOxWrgu0xqEev6txydQ=; b=UkXTGFR0uyd5mz
	lMVKdCHXI1ilIykKIWugLbVUU5UplKKXVn67q3tntnM9GmWVZqVT5ulHfapSgPFlIHTy7GdLX7yXo
	s/40bC59luu4hMiaAzqV40iNpQvN9LehnYinG742Fy4A80QxaTpuwvVkqeGXfAlBRHxAv1fQ0Xoad
	5mZGaCAanDq9Km0e+e1F6bfdzUJNZCsQFNXtUiF23/5adPpoVCkon5sy4NzWZEZy9WeWforGWrZuA
	tXjnPF4JcSyoUL8KmVIcHtx32fwTVvxshpmlTlmOgzrXouR6GnCXqBMAKc1jxWoPY2zfDVDYaM/qg
	D0KTSGmqWeZc1FzOeS7Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1igvE1-0004hL-8n; Mon, 16 Dec 2019 18:36:09 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ifPi9-0008P0-Kn
 for linux-i3c@lists.infradead.org; Thu, 12 Dec 2019 14:45:03 +0000
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl
 [83.86.89.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id D8FE521655;
 Thu, 12 Dec 2019 14:45:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1576161901;
 bh=NAwMf3cjvdX5Di0bvRBolsXdWtk+PjPn2VPtYeOUmLg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=t+w/s12W2DMLxoBQUjb1SCe9HqFlW7MdlIe99OOSJZm0Yq24fhuUKZZ/PnpD3S7ca
 r/eUteeLUgSzIYX3J1fB4mo/KpPTk9DytudyTrXBiKVUNlmLZKlKqEM5iRbIINvQDV
 G4b5im20mKr4UF78qZEHmtNCrroHHk+KXXGGtE9g=
Date: Thu, 12 Dec 2019 15:44:59 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Vitor Soares <Vitor.Soares@synopsys.com>
Subject: Re: [RFC 5/5] i3c: add i3cdev module to expose i3c dev in /dev
Message-ID: <20191212144459.GB1668196@kroah.com>
References: <cover.1575977795.git.vitor.soares@synopsys.com>
 <f9f20eaf900ed5629dd3d824bc1e90c7e6b4a371.1575977795.git.vitor.soares@synopsys.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <f9f20eaf900ed5629dd3d824bc1e90c7e6b4a371.1575977795.git.vitor.soares@synopsys.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191212_064501_696993_119565C0 
X-CRM114-Status: UNSURE (   6.90  )
X-CRM114-Notice: Please train this message.
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

On Tue, Dec 10, 2019 at 04:37:33PM +0100, Vitor Soares wrote:
> +static int __init i3cdev_init(void)
> +{
> +	int res;
> +
> +	pr_info("i3c /dev entries driver\n");

Please remove debugging information, kernel code should be quiet unless
something goes wrong.

> +	/* Dynamically request unused major number */
> +	res = alloc_chrdev_region(&i3cdev_number, 0, N_I3C_MINORS, "i3c");

Do you really need a whole major, or will a few minors work?

thanks,

greg k-h

_______________________________________________
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
