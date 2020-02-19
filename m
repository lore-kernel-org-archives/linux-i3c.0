Return-Path: <SRS0=8b81=4H=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1587C3404E
	for <linux-i3c@archiver.kernel.org>; Wed, 19 Feb 2020 07:39:49 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7E7E2208E4
	for <linux-i3c@archiver.kernel.org>; Wed, 19 Feb 2020 07:39:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="VnsYiJeK";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="nbpaBGt2"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7E7E2208E4
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lQH05zyq5ZJTTn3ednvx6HtUHYNSozpzbbvgkdirn6Q=; b=VnsYiJeKlayPwZ
	iRLwo6nHnGX2tw8Ixo1cC/aWgsFzTXt3YpCNzST6l0F1Y4yWzmyDARpccPv6Rf+VpXivtxZJ6AmP1
	7HMuy8mdpCB10RQbsjJA1o4SJRoaJb3BO81HNoAmLALiRDF+MOftGzpK2/azn/SYZsxhGkQFBJKVh
	fBdSMthY4RR3ODP5AUvKJCq39ZvQjkS8erSTbirW8hrivFpYoq4T9SObTAc2ImTeiTHmlC/SvVQvP
	Ur85mx6p85VOB3DVEASeouWVKUZViTRQxH5V2bxda4ci96ySVz7T9o50KCCYav0XcQzG9i6dziyWX
	xsoizoRyc6HSWlnVD0nA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j4JxT-0005LF-DJ; Wed, 19 Feb 2020 07:39:47 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j4Jtf-0001Kt-Kj
 for linux-i3c@lists.infradead.org; Wed, 19 Feb 2020 07:35:53 +0000
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl
 [83.86.89.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id D36D52176D;
 Wed, 19 Feb 2020 07:35:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1582097750;
 bh=fX6KRM1X5Jo5RsKxZDPRp/cqOi3EYu6e+t9QUMDjriI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=nbpaBGt2aLkLH3ZuPkT6aBpFHK2ZLlle7+OW+GguJBosgroGRskPpVF9whQNGQsvI
 PEAFOezHGk/veRsnuLPNdfMdanf5cO+9GFAZGqMeIqp4prWGMMB5KEATX+Q4tEl5y7
 2QLp1KlAYcoFv+hHFmO9ZlA/wx+Poo4n4lIDq4V8=
Date: Wed, 19 Feb 2020 08:35:48 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Vitor Soares <Vitor.Soares@synopsys.com>
Subject: Re: [PATCH v3 3/5] i3c: master: add i3c_for_each_dev helper
Message-ID: <20200219073548.GA2728338@kroah.com>
References: <cover.1582069402.git.vitor.soares@synopsys.com>
 <868e5b37fd817b65e6953ed7279f5063e5fc06c5.1582069402.git.vitor.soares@synopsys.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <868e5b37fd817b65e6953ed7279f5063e5fc06c5.1582069402.git.vitor.soares@synopsys.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200218_233551_730343_402B76CD 
X-CRM114-Status: GOOD (  13.22  )
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
Cc: Jose.Abreu@synopsys.com, corbet@lwn.net, Joao.Pinto@synopsys.com,
 arnd@arndb.de, wsa@the-dreams.de, bbrezillon@kernel.org,
 linux-kernel@vger.kernel.org, broonie@kernel.org,
 linux-i3c@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

On Wed, Feb 19, 2020 at 01:20:41AM +0100, Vitor Soares wrote:
> Introduce i3c_for_each_dev(), an i3c device iterator for use by i3cdev.
> 
> Signed-off-by: Vitor Soares <vitor.soares@synopsys.com>
> ---
>  drivers/i3c/internals.h |  1 +
>  drivers/i3c/master.c    | 12 ++++++++++++
>  2 files changed, 13 insertions(+)
> 
> diff --git a/drivers/i3c/internals.h b/drivers/i3c/internals.h
> index bc062e8..a6deedf 100644
> --- a/drivers/i3c/internals.h
> +++ b/drivers/i3c/internals.h
> @@ -24,4 +24,5 @@ int i3c_dev_enable_ibi_locked(struct i3c_dev_desc *dev);
>  int i3c_dev_request_ibi_locked(struct i3c_dev_desc *dev,
>  			       const struct i3c_ibi_setup *req);
>  void i3c_dev_free_ibi_locked(struct i3c_dev_desc *dev);
> +int i3c_for_each_dev(void *data, int (*fn)(struct device *, void *));
>  #endif /* I3C_INTERNAL_H */
> diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
> index 21c4372..8e22da2 100644
> --- a/drivers/i3c/master.c
> +++ b/drivers/i3c/master.c
> @@ -2640,6 +2640,18 @@ void i3c_dev_free_ibi_locked(struct i3c_dev_desc *dev)
>  	dev->ibi = NULL;
>  }
>  
> +int i3c_for_each_dev(void *data, int (*fn)(struct device *, void *))
> +{
> +	int res;
> +
> +	mutex_lock(&i3c_core_lock);
> +	res = bus_for_each_dev(&i3c_bus_type, NULL, data, fn);
> +	mutex_unlock(&i3c_core_lock);

Ick, why the lock?  Are you _sure_ you need that?  The core should
handle any list locking issues here, right?

I don't see bus-specific-locks around other subsystem functions that do
this (like usb_for_each_dev).

thanks,

greg k-h

_______________________________________________
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
