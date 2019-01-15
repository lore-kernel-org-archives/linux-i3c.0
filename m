Return-Path: <SRS0=cIL5=PX=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 050EDC43387
	for <linux-i3c@archiver.kernel.org>; Tue, 15 Jan 2019 21:11:31 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C6EDC20859
	for <linux-i3c@archiver.kernel.org>; Tue, 15 Jan 2019 21:11:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="V/1oiHOy";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="XBiIq2Nq"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C6EDC20859
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Li027Eo2NsbQ4QmU9lMlUve1jFUeSF+kUhUglJ4Qg+A=; b=V/1oiHOyIY6Huv
	pXBKMvC8HJBha83BhIiKUhiafOkAorxLrEMotC2SSdfK1VUTN4rNaOGo0VWkQ38ZLtpyfUH6JEhmS
	hBYz77QmNLFNrGMsEJXkJzDDnpfkKMJaspb+g6BnyCWhUHJGYAsQ0sG51JRBDmg1lbSWZQV8EZBka
	h96OtYviuWXNkglIN66Da2DLnxksSC36ekSThfEhUfkGdPeQ37KCKwC0VA4h9+dnlcoblrmJOlzOR
	DVKpsvr/p7JqAVPxvOm2c4tNX1ejwrwDkitq/xFVPz0tinoTy09P7OQXj/9soQY5l6+ufXhF/2U7r
	7fUM3/UikRqeFTH3CEPw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gjVze-0004hh-Cs; Tue, 15 Jan 2019 21:11:30 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gjVzc-0004hI-88
 for linux-i3c@lists.infradead.org; Tue, 15 Jan 2019 21:11:29 +0000
Received: from bbrezillon (91-160-177-164.subs.proxad.net [91.160.177.164])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id C179D205C9;
 Tue, 15 Jan 2019 21:11:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1547586687;
 bh=t93Hy3+iq4YR/o3b+k85VeJJJR3Yz3QE8zoNAI0GfXE=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=XBiIq2NqpF92xD8UnKxQF6WX/9h2IYf9jm8kgVkniJHXb7yFrBdSQvwG8bo5pNb1I
 JnTgqqohxjEyXWDPh/GyH42+GdiOI7o8wUXaO3LQ7Q4oYFdJS/gTmd87AD+4Emh4YX
 XRUemeBbU7aDOwpT59qn4p/OCnnjUxAAuj7kbNgo=
Date: Tue, 15 Jan 2019 22:11:19 +0100
From: Boris Brezillon <bbrezillon@kernel.org>
To: Przemyslaw Gaj <pgaj@cadence.com>
Subject: Re: [PATCH v2 3/3] i3c: master: Add module author
Message-ID: <20190115221119.5a8aba9b@bbrezillon>
In-Reply-To: <2ea613df7d5d806737503fb842cdee329f2183f5.1547227861.git.pgaj@cadence.com>
References: <cover.1547227861.git.pgaj@cadence.com>
 <2ea613df7d5d806737503fb842cdee329f2183f5.1547227861.git.pgaj@cadence.com>
X-Mailer: Claws Mail 3.16.0 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190115_131128_310561_26DB23F7 
X-CRM114-Status: GOOD (  12.07  )
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
Cc: linux-i3c@lists.infradead.org, psroka@cadence.com, rafalc@cadence.com,
 vitor.soares@synopsys.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

On Fri, 11 Jan 2019 17:43:37 +0000
Przemyslaw Gaj <pgaj@cadence.com> wrote:

Please add a commit message, even a short one is better than none.

> Signed-off-by: Przemyslaw Gaj <pgaj@cadence.com>
> ---
>  drivers/i3c/master.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
> index 320d905..72b1711 100644
> --- a/drivers/i3c/master.c
> +++ b/drivers/i3c/master.c
> @@ -3,6 +3,7 @@
>   * Copyright (C) 2018 Cadence Design Systems Inc.
>   *
>   * Author: Boris Brezillon <boris.brezillon@bootlin.com>
> + * Author: Przemyslaw Gaj <pgaj@cadence.com>
>   */
>  
>  #include <linux/atomic.h>
> @@ -2885,5 +2886,6 @@ static void __exit i3c_exit(void)
>  module_exit(i3c_exit);
>  
>  MODULE_AUTHOR("Boris Brezillon <boris.brezillon@bootlin.com>");
> +MODULE_AUTHOR("Przemyslaw Gaj <pgaj@cadence.com>");
>  MODULE_DESCRIPTION("I3C core");
>  MODULE_LICENSE("GPL v2");

You should probably add an entry for this driver in MAINTAINERS.

_______________________________________________
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
